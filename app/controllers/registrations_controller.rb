# encoding: utf-8

class RegistrationsController < Devise::RegistrationsController

  after_filter :user_registration_path, :log_sign_up


  private


  def log_sign_up
    if request.post?                                # === POST: ===
      log_action(
        "signed-up a new User",
        "Params: #{params.inspect}\r\n\r\nUpdated users total: #{User.count}\r\n\r\nCurrent user instance: #{current_user.inspect}"
      )
    end
  end

end
