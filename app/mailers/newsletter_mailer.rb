=begin

= AgexMailer

  - version:  4.00.541
  - author:   Steve A.

  Custom mailer for all the Goggles newsletter types.
=end
class NewsletterMailer < ActionMailer::Base

  # Hostname shown as mail sender domain (ENV['HOSTNAME'] is not good, because it uses the local IP)
  HOSTNAME = Goggles::Application.config.action_mailer.default_url_options[:host]

  # Internal Mailer address for the "From" field of the e-mails. Usually something like "no-reply@fasar.software.it"
  #
  default :from => "Goggles Mailer <no-reply@#{ HOSTNAME }>"


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
    @host  = HOSTNAME
    @meeting_array = meeting_array
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
    @host  = HOSTNAME
    @achievements_array = achievements_array
    mail(
      subject: "[#{AGEX_APP_NAME}@#{@host}] #{I18n.t('newsletter_mailer.achievements.generic_title')}",
      to:      user.email,
      date:    Time.now
    )
  end
  #-- -------------------------------------------------------------------------
  #++

  # Generates an e-mail regarding any generic application updates or usable for any
  # hand-made report or newsletter.
  #
  # == Params:
  #
  # - user: the current_user instance
  # - contents: the actual contents of the mail body; rendered as html_safe.
  #
  def application_mail( user, contents )
    @user  = user
    @host  = HOSTNAME
    @contents = contents
    mail(
      subject: "[#{AGEX_APP_NAME}@#{@host}] #{I18n.t('newsletter_mailer.application.generic_title')}",
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
    @host  = HOSTNAME
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
