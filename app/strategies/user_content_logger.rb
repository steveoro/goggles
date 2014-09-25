# encoding: utf-8


=begin

= UserContentLogger

  - Goggles framework vers.:  4.00.521
  - author: Steve A.

  Generic strategy/service class dedicated to log each user-created
  content on the site.

  Typical usage involves declaring callback filters directly on the
  models like this:

    class SwimmingPoolReview < ActiveRecord::Base

      before_destroy  UserContentLogger.new( 'SwimmingPoolReview' )

      # [... snip ...]

    end

  Remember to don't abuse the usage of this class, since it may slow
  down considerably the whole application.

=end
class UserContentLogger

  # Creates a new instance, storing the Model name to which this
  # instance it refers to.
  #
  # The name must be a String (not +nil+). No checks are performed to verify
  # that the +model_name+ corresponds to an actual Model class.
  #
  def initialize( model_name )
    raise ArgumentError.new("UserContentLogger requires at least a model name as a parameter!") unless model_name.instance_of?(String)
    @model_name = model_name
  end
  #-- -------------------------------------------------------------------------
  #++

  # Callback for when a new row from the #model is created
  def after_create( record )
    # TODO log the action, the instance and the linked user, if available
    AgexMailer.action_notify_mail(
      record.respond_to?( :user ) ? record.user : nil,
      "#{@model_name} create",
      "PLACEHOLDER for SQL log"
    ).deliver
  end

  # Callback for when a new row from the #model is saved/updated
  def after_save( record )
    # TODO log the action, the instance and the linked user, if available
    AgexMailer.action_notify_mail(
      record.respond_to?( :user ) ? record.user : nil,
      "#{@model_name} updated",
      "PLACEHOLDER for SQL log"
    ).deliver
  end

  # Callback for when a new row from the #model is destroyed
  def before_destroy( record )
    # TODO log the action, the instance and the linked user, if available
    AgexMailer.action_notify_mail(
      record.respond_to?( :user ) ? record.user : nil,
      "#{@model_name} DESTROYED",
      "PLACEHOLDER for SQL log"
    ).deliver
  end
  #-- -------------------------------------------------------------------------
  #++
end
