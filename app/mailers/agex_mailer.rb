=begin

= AgexMailer

  - version:  4.00.495
  - author:   Steve A.

  Mailer base custom class for the Agex framework.
=end
class AgexMailer < ActionMailer::Base

  # Internal Mailer address for the "From" field of the e-mails. Usually something like "no-reply@fasar.software.it"
  #
  default :from => "AgeX Mailer <no-reply@#{ ENV['HOSTNAME'] }>"


  # "Exception intercepted" message.
  # Sends to one of the admins a notification e-mail about an error intercepted.
  #
  # == Params:
  #
  # - user: the current_user instance
  # - error_description: the error message or description
  # - error_backtrace: an array of string rows describing the current error backtrace
  #
  def exception_mail( user, error_description, error_backtrace )
    admin = Admin.find_by_name('steve')
    @admin_name  = admin.name
    @user_name   = user.name if user.respond_to?(:name)
    @description = error_description
    @backtrace   = error_backtrace
    @host = ENV['HOSTNAME']

    mail(
      subject: "[#{AGEX_APP_NAME}@#{@host}] AgexMailer EXCEPTION: '#{error_description}'.",
      to:      admin.email,
      date:    Time.now
    )
  end
  #-- -------------------------------------------------------------------------
  #++

  # Action notify message.
  # Sends to one of the admins a notification e-mail about a specific
  # action carried out by a user.
  #
  # == Params:
  #
  # - user: the current_user instance
  # - action_name: the action name performed by the user
  # - action_description: a more verbose string description for the action carried out by the user
  #
  def action_notify_mail( user, action_name, action_description )
    admin = Admin.find_by_name('steve')
    @user_name = user.name if user.respond_to?(:name)
    @action_name = action_name
    @description = action_description
    @host = ENV['HOSTNAME']

    mail(
      subject: "[#{AGEX_APP_NAME}@#{@host}] AgexMailer action '#{action_name}'",
      to:      admin.email,
      date:    Time.now
    )
  end
  #-- -------------------------------------------------------------------------
  #++

  # Report abuse message.
  # Sends to one of the admins a notification e-mail about a possible abuse report,
  # notified by a user against another user.
  #
  # == Params:
  #
  # - user_sender: the current_user instance or the sender of the message
  # - user_involved: the user instance reported for possible abuse
  # - entity_name: name of the table or entity that has been abused by the user_involved (i.e.: 'swimming_pool_reviews')
  # - entity_id: ID of the entity row created by the user_involved (i.e., the ID of the review row reported for abuse)
  # - entity_title: title or specific value describing the entity row created by the user_involved (i.e., the title of the review)
  #
  def report_abuse_mail( user_sender, user_involved, entity_name, entity_id, entity_title )
    admin = Admin.find_by_name('steve')
    @user_sender   = user_sender
    @user_involved = user_involved
    @entity_name   = entity_name
    @entity_id     = entity_id
    @entity_title  = entity_title
    @host = ENV['HOSTNAME']

    mail(
      subject: "[#{AGEX_APP_NAME}@#{@host}] Abuse report for '#{entity_name}', ID:#{entity_id}",
      to:      admin.email,
      date:    Time.now
    )
  end
end
#-- ---------------------------------------------------------------------------
#++
