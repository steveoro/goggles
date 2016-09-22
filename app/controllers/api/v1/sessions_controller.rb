class Api::V1::SessionsController < Devise::SessionsController
  # define which model will act as token authenticatable
  acts_as_token_authentication_handler_for User

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  respond_to :json
  skip_before_action :verify_authenticity_token, if: :json_request?


  # Log-in parameter retrieval & log-in for an API session.
  #
  # After a successful login, all protected requests must pass the user e-mail and
  # the auth. token either as parameters (:user_email, :user_token) or as
  # additional request headers (i.e.: "X-User-Email: dude@example.com",
  # "X-User-Token: whatever_the_token_is").
  #
  # === Params:
  #
  # - :user_email     => the user's e-mail.
  # - :user_password  => the user's password.
  #
  # === Returns (in JSON format):
  #
  # - :success        => success flag (true/false).
  # - :user_name      => user's name.
  # - :user_token     => session authorization token.
  # - :message        => a log-in / error message.
  #
  # === Sample cURL usage:
  #
  # - Creates a new session, logging-in and returning the token:
  #
  # > curl -i -H "Accept: application/json" \
  #           "http://localhost:3000/api/v1/sessions/create?user_email=steve.alloro@whatever.com&user_password=whatever_the_password_is"
  #
  # - Samples of API GETs having the token (after signing-in):
  #
  # > curl -i -H "Accept: application/json" \
  #           -H "X-User-Email: steve.alloro@whatever.com" \
  #           -H "X-User-Token: whatever_the_token_is" \
  #           "http://localhost:3000/exercises/json_list?id=1"
  #
  # > curl -i -H "Accept: application/json" \
  #           "http://localhost:3000/exercises/json_list?id=1&user_email=steve.alloro@whatever.com&user_token=whatever_the_token_is"
  #
  def create
    # Validations
    if request.format != :json
      render( status: 406, json: { success: false, message: I18n.t(:api_request_must_be_json) } )
      return
    end

    # Fetch params
    email = params[:user_email]
    password = params[:user_password]
    user = User.find_for_database_authentication( email: email ) if email.presence

    if email.nil? or password.nil?
      render( status: 400, json: { success: false, message: I18n.t(:api_request_must_contain_user_and_password) } )
      return
    end

    # Authentication
    if user
      if user.valid_password?( password )
        # FIXME was: user.reset_authentication_token!
#        user.authentication_token = nil
#        user.save!
        sign_in( user )
        render(
          status: :ok,    # 200 status code
          json: {
            success:    true,
            user_name:  user.name,
            user_token: user.authentication_token,
            message:    I18n.t(:log_in_successful)
          }
        )
      else
        render( status: 401, json: { success: false, message: I18n.t(:invalid_user) } )
      end
    else
      render( status: 401, json: { success: false, message: I18n.t(:invalid_user) } )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Log-out from an API session.
  #
  # === Params:
  #
  # - :user_token => the authentication token of the API session.
  #
  # === Returns (in JSON format):
  #
  # - :success    => success flag (true/false).
  # - :message    => a log-out or error message.
  #
  def destroy
    # Validations
    if request.format != :json
      render( status: 406, json: { success: false, message: I18n.t(:api_request_must_be_json) } )
      return
    end

    # Fetch params
    user = User.find_for_database_authentication( authentication_token: params[:user_token] )

    if user.nil?
      render( status: 404, json: { success: false, message: I18n.t(:invalid_token) } )
    else
      user.reload
      user.authentication_token = nil
      user.save!
      render( status: :ok, json: { success: true, message: I18n.t(:log_out_successful) } )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Returns true if the request format is JSON
  def json_request?
    request.format.json?
  end


  # Override for Devise::SessionController#respond_to_on_destroy, since here we
  # handle only JSON POST requests.
  #
  def respond_to_on_destroy
    # [Steve, 20160502] Original Devise implementation follows:
    # We actually need to hardcode this as Rails default responder doesn't
    # support returning empty response on GET request
#    respond_to do |format|
#      format.all { head :no_content }
#      format.any(*navigational_formats) { redirect_to after_sign_out_path_for(resource_name) }
#    end
  end
end
