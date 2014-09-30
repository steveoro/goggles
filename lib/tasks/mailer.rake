# encoding: utf-8

=begin

= Mailer Helper tasks

  - Goggles framework vers.:  4.00.531
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
      involved_users = User.community_newsletter_readers
      puts "Generating mail queue for a maximum of #{ involved_users.size } user(s)..."
      tot_generated_jobs = 0

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
