=begin

= AgexMailer

  - version:  6.044
  - author:   Steve A.

  Custom mailer for all the Goggles newsletter types.
=end
class NewsletterMailer < ActionMailer::Base

  # Hostname shown as mail sender domain (ENV['HOSTNAME'] is not good, because it uses the local IP)
  #HOSTNAME = ::Goggles::Application.config.action_mailer.default_url_options[:host]

  # Internal Mailer address for the "From" field of the e-mails. Usually something like "no-reply@fasar.software.it"
  #
  default from: "Goggles Mailer <no-reply@#{ GogglesCore::AppConstants::WEB_MAIN_DOMAIN_NAME }>"


  # Generates a custom e-mail message, given text and contents.
  # HTML format only.
  #
  # == Params:
  #
  # - user: the current_user instance
  # - subject: the email (additional) title
  # - title: the email (additional) title
  # - contents: the text contents.
  #
  def custom_mail( user, subject, title, contents )
    @user  = user
    @host = GogglesCore::AppConstants::WEB_MAIN_DOMAIN_NAME
    @contents = contents
    @title = title
    mail(
      subject: "[#{ GogglesCore::AppConstants::WEB_APP_NAME }@#{ @host }] #{ subject }",
      to:      user.email,
      date:    Time.now
    )
  end
  #-- -------------------------------------------------------------------------
  #++


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
    @host = GogglesCore::AppConstants::WEB_MAIN_DOMAIN_NAME
    @meeting_array = meeting_array
    mail(
      subject: "[#{GogglesCore::AppConstants::WEB_APP_NAME}@#{@host}] #{I18n.t('newsletter_mailer.data_updates.generic_title')}",
      to:      user.email,
      date:    Time.now
    )
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- ---------------------------------------------------------------------------
#++
