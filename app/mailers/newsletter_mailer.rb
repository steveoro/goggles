=begin

= AgexMailer

  - version:  4.00.495
  - author:   Steve A.

  Custom mailer for all the Goggles newsletter types.
=end
class NewsletterMailer < ActionMailer::Base

  # Internal Mailer address for the "From" field of the e-mails. Usually something like "no-reply@fasar.software.it"
  #
  default :from => "Goggles Mailer <no-reply@#{ ENV['HOSTNAME'] }>"


  # Generates a mailing message signaling a "data update" to a user.
  #
  # == Params:
  #
  # - user: the current_user instance
  # - meeting_array: when not nil, is assumed to be an array of Meeting rows for which the results have been updated
  #   (No checks are made here to make sure that is actually the case or if its a random collection of Meetings)
  #
  def data_updates_mail( user, meeting_array = nil )
    @user  = user
    @meeting_array = meeting_array
    @host  = ENV['HOSTNAME']
    mail(
      subject: "[#{AGEX_APP_NAME}@#{@host}] #{I18n.t('newsletter_mailer.data_updates.generic_title')}",
      to:      user.email,
      date:    Time.now
    )
  end
  #-- -------------------------------------------------------------------------
  #++

  # Generates an e-mail about any Achievement row triggered recently by the user.
  # This mailing action should be performed only weekly or monthly. 
  #
  # == Params:
  #
  # - user: the current_user instance
  # - achievements_array: when not nil, is assumed to be an array of Achievement rows recently triggered by the user.
  #   (No checks are made here to make sure that is actually the case or if its a random collection of Achievements)
  #
  def achievements_mail( user, achievements_array = nil )
    @user  = user
    @achievements_array = achievements_array
    @host  = ENV['HOSTNAME']
    mail(
      subject: "[#{AGEX_APP_NAME}@#{@host}] #{I18n.t('newsletter_mailer.achievements.generic_title')}",
      to:      user.email,
      date:    Time.now
    )
  end
  #-- -------------------------------------------------------------------------
  #++

  # Generates an e-mail about missed user updates or special community messages
  # This mailing action should be performed only weekly or monthly. 
  #
  # == Params:
  #
  # - user: the current_user instance
  # - newsfeed_array: when not nil, is assumed to be an array of NewsFeed rows currently unread by the user
  #   (No checks are made here to make sure that is actually the case or if its a random collection of NewsFeeds)
  #
  def community_mail( user, newsfeed_array = nil )
    @user  = user
    @newsfeed_array = newsfeed_array
    @host  = ENV['HOSTNAME']
    mail(
      subject: "[#{AGEX_APP_NAME}@#{@host}] #{I18n.t('newsletter_mailer.community.generic_title')}",
      to:      user.email,
      date:    Time.now
    )
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- ---------------------------------------------------------------------------
#++
