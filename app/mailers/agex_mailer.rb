=begin
  
= AgexMailer

  - version:  3.03.06.20130328
  - author:   Steve A.

  Mailer base custom class for the Agex framework.
=end
class AgexMailer < ActionMailer::Base

  # Internal Mailer address for the "From" field of the e-mails. Usually something like "no-reply@fasar.software.it"
  #
  AGEX_ADMIN_EMAIL = "AgeX Mailer <fasar.software@email.it>"

  default :from => AGEX_ADMIN_EMAIL


  # "Exception intercepted" message.
  #
  def exception_mail( admin_name, user_name, error_description, error_backtrace )
    @admin_name  = admin_name
    @user_name   = user_name
    @description = error_description
    @backtrace   = error_backtrace
    @host = ENV['HOSTNAME']

    mail(
      :to => AGEX_ADMIN_EMAIL,
      :subject => "[#{AGEX_APP_NAME}@#{@host}] AgexMailer EXCEPTION: '#{error_description}'.",
      :date => Time.now
    )
  end
  # ---------------------------------------------------------------------------


  # Action notify message.
  #
  def action_notify_mail( user_name, action_name, action_description )
    @user_name = user_name
    @action_name = action_name
    @description = action_description
    @host = ENV['HOSTNAME']

    mail(
      :to => AGEX_ADMIN_EMAIL,
      :subject => "[#{AGEX_APP_NAME}@#{@host}] AgexMailer action '#{action_name}'",
      :date => Time.now
    )
  end
# -----------------------------------------------------------------------------


  # Report abuse message.
  #
  def report_abuse_mail( user_sender, user_involved, entity_name, entity_id, entity_title )
    @user_sender = user_sender
    @user_involved = user_involved
    @entity_name = entity_name
    @entity_id = entity_id
    @entity_title = entity_title
    @host = ENV['HOSTNAME']

    mail(
      :to => AGEX_ADMIN_EMAIL,
      :subject => "[#{AGEX_APP_NAME}@#{@host}] Abuse report for '#{entity_name}', ID:#{entity_id}",
      :date => Time.now
    )
  end
end
# -----------------------------------------------------------------------------
