# encoding: utf-8

=begin

= Mailer Helper tasks

  - Goggles framework vers.:  4.00.559
  - author: Steve A.

  (ASSUMES TO BE rakeD inside Rails.root)

=end
namespace :mailer do
  namespace :job do

    desc <<-DESC
Generates the mailing job for a "data-update" newsletter, regarding the specified
meetings.

Options: [meetings=<id_1>[,<id_2>,...] ]

  - 'meetings'  => a comma-separated list of Meeting IDs, for which the data
                   (either result or starting-list) has been updated.

DESC
    task :data_update do |t|
      puts "\r\n*** Mailer::job::data_update ***\r\n"
      puts "Requiring Rails environment to allow usage of any Model..."
      require 'rails/all'
      require File.join( Rails.root.to_s, 'config/environment' )
      meeting_ids   = ENV.include?("meetings") ? ENV["meetings"].to_s.split(',') : nil
      meeting_ids   = meeting_ids.map{ |id| id.to_i } if meeting_ids
      meeting_array = Meeting.where( id: meeting_ids )
      involved_users = User.data_updates_newsletter_readers
      puts "Generating mail queue for a total of #{ involved_users.size } user(s)..."

      involved_users.each_with_index do |user, index|
        puts "Processing #{user}, (#{index+1}/#{involved_users.size})..."
        NewsletterMailer.delay( queue: 'mailing' ).data_updates_mail( user, meeting_array )
      end
    end
    #-- -----------------------------------------------------------------------
    #++


    desc <<-DESC
Generates the mailing job for a "community" newsletter, regarding the unread
news-feed rows for each user that has enabled the newsletter.

DESC
    task :community do |t|
      puts "\r\n*** Mailer::job::community ***\r\n"
      puts "Requiring Rails environment to allow usage of any Model..."
      require 'rails/all'
      require File.join( Rails.root.to_s, 'config/environment' )
      involved_users = User.community_newsletter_readers
      puts "Generating mail queue for a maximum of #{ involved_users.size } user(s)..."
      tot_generated_jobs = 0

      # We need to generate also unread newsfeed for pending friendships without any newsfeed.
      # (It may happen, depending on use-cases.)
      # First, get the list of pending friend requests for which we can generate
      # a notification:
      users_with_pending_friendships = []
      User.all.each{ |user| users_with_pending_friendships += user.pending_invited }
      users_with_pending_friendships.select!{ |user| involved_users.include?( user ) }

      # Second, remove from the list all users that have at least an unread newsfeed row
      # (we don't care what type of newsfeed it is, we just want to process all
      # the users that do not have any pending notification and for whose we can generate one).
      # This will give us a list of all the users that do NOT have any pending newsfeed:
      users_with_pending_friendships.select! do |user|
        NewsFeed.unread.where( user_id: user.id ).count == 0  # Keep only users WITHOUT unread (pending) newsfeed
      end
      # (If a user has a pending newsfeed, it will be treated more below)

      # Force locale for NewsFeed generation to 'it-IT'
      I18n.locale = :it
      # Avoid duplication:
      users_with_pending_friendships = users_with_pending_friendships.uniq

      # Last, generate a pending-invitation newsfeed notification row, so that we may
      # also deliver an email about it:
      users_with_pending_friendships.each_with_index do |user, index|
        puts "Adding missing NewsFeed row for #{user}, (users #{index+1}/#{users_with_pending_friendships.size}..."
        user.pending_invited_by.each do |swimming_buddy|
          puts "==> #{user}, buddy: #{swimming_buddy}... (#{I18n.t('newsfeed.invite_title')})"
          NewsFeed.create_social_feed(
            user.id,
            swimming_buddy.id,
            I18n.t('newsfeed.invite_title'),
            I18n.t('newsfeed.invite_body').gsub("{SWIMMER_NAME}", swimming_buddy.get_full_name)
          )
        end
      end

      # Finally, loop on all unread newsfeed and generate a notification mail:
      involved_users.each_with_index do |user, index|
        unread_newsfeed = NewsFeed.unread.where( user_id: user.id )
        if unread_newsfeed.size > 0
          puts "Processing #{user}, (users #{index+1}/#{involved_users.size}, found #{unread_newsfeed.size} unread news)..."
          NewsletterMailer.delay( queue: 'mailing' ).community_mail( user, unread_newsfeed )
          tot_generated_jobs += 1
        end
      end
      puts "Total jobs generated: #{tot_generated_jobs}."
    end
    #-- -----------------------------------------------------------------------
    #++


# TODO Achievements mailing

# TODO Generic Application mailing => must define contents somehow on a text file to be read by rake task

  end
  #-- -------------------------------------------------------------------------
  #++
end
