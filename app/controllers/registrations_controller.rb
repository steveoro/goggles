# encoding: utf-8
=begin

= RegistrationsController

  - version:  1.00.001
  - author:   Steve A.

  Subclasses the Devise controller to log user registration actions.
=end
class RegistrationsController < Devise::RegistrationsController

  after_filter :user_registration_path, :log_registration


  private


  def log_registration
    if request.post?                                # === POST: ===
      log_action(
        "created/signed-up a new User",
        "Params: #{params.inspect}\r\n\r\nUpdated users total: #{User.count}\r\n\r\nCurrent user instance: #{current_user.inspect}"
      )
    elsif request.delete?                           # === DELETE: ===
      log_action(
        "deleted an existing User",
        "Params: #{params.inspect}\r\n\r\nUpdated users total: #{User.count}\r\n\r\nCurrent user instance: #{current_user.inspect}"
      )
    end
  end

end
