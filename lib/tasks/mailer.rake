# encoding: utf-8

=begin

= Mailer Helper tasks

  - Goggles framework vers.:  4.00.625
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

      # Force locale for NewsFeed generation to 'it-IT'
      I18n.locale = :it

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
      puts "\r\nGenerating mail queue for a possible maximum of #{ involved_users.size } user(s)..."
      tot_generated_jobs = 0

      # We need to generate also unread newsfeed for pending friendships without
      # and without any newsfeed. (It may happen, depending on use-cases.)
      # Let's get the list of pending friend requests for which we can generate
      # a notification:
      additional_notifiable_users = involved_users.select do |user|
        # To be selected, a user must satisfy the condition:
        # 0) Have the newsletter enabled
        # 1) Have a friendship pending
        # 2) Be WITHOUT any other newsletter-notifiable activity
        user.pending_invited &&
        NewsFeed.newsletter_activities.where( user_id: user.id ).none?
      end
      additional_notifiable_users.uniq!
      # (If a user has already a newsletter-notifiable activity, it will be selected below)

      # Force locale for NewsFeed generation to 'it-IT'
      I18n.locale = :it

      # Last, generate a pending-invitation newsfeed notification row, so that we may
      # also deliver an email about it (with the loop more down below):
      additional_notifiable_users.each_with_index do |user, index|
        puts "Checking for missing NewsFeed row for #{user}, users #{index+1}/#{additional_notifiable_users.size}."
        user.pending_invited_by.each do |swimming_buddy|
          puts "==> #{user}, buddy: #{swimming_buddy}... (#{I18n.t('newsfeed.invite_title')})"
          NewsFeed.create_social_feed(
            user.id,
            swimming_buddy.id,
            I18n.t('newsfeed.invite_title'),
            I18n.t('newsfeed.invite_body').gsub("{SWIMMER_NAME}", swimming_buddy.get_full_name),
            false # (This is no 'temp/achievement' kind of feed, so we'll generate a newsletter mail until it is read)
          )
        end
      end

      # Finally, loop on all involved users and generate a newsletter e-mail only for
      # those users that may need to receive one:
      puts "\r\nGenerating actual mailer jobs..."
      involved_users.each_with_index do |user, index|
        newsletter_feeds = NewsFeed.newsletter_activities.where( user_id: user.id )
        if newsletter_feeds.size > 0
          puts "Processing #{user}, (users #{index+1}/#{involved_users.size}) found #{newsletter_feeds.size} notifiable news..."
          NewsletterMailer.delay( queue: 'mailing' ).community_mail( user, newsletter_feeds )
          tot_generated_jobs += 1
        end
      end
      puts "Total jobs generated: #{tot_generated_jobs} / #{ involved_users.size } total users (with newsletter enabled)."
    end
    #-- -----------------------------------------------------------------------
    #++


# TODO Achievements mailing

# TODO Generic Application mailing => must define contents somehow on a text file to be read by rake task

  end
  #-- -------------------------------------------------------------------------
  #++
end
