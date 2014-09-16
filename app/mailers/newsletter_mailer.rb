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
  # - meeting_array: when not nil, is assumed to be an array of meetings for which the results have been updated
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
end
#-- ---------------------------------------------------------------------------
#++
