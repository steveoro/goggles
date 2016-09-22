# encoding: utf-8


=begin

= Api::V2::SessionsController

  - version:  2.02.63
  - author:   Steve A.

  Override/upgrade for Devise::SessionsController

  Allows session creation/destruction via API session tokens using the simple_token_authentication gem.

=end
class Api::V2::SessionsController < Devise::SessionsController
  # define which model will act as token authenticatable
  acts_as_token_authentication_handler_for User

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  respond_to :json
  skip_before_action :verify_authenticity_token, if: :json_request?

  # Ok result status
  RESULT_OK = 'ok'

  # Ok result status
  RESULT_ERROR = 'error'
  #-- -------------------------------------------------------------------------
  #++

  # Log-in parameter retrieval & log-in for an API session.
  #
  # After a successful login, all protected requests must pass the user e-mail and
  # the auth. token either as parameters (:user_email, :user_token) or as
  # additional request headers (i.e.: "X-User-Email: dude@example.com",
  # "X-User-Token: whatever_the_token_is").
  #
  # === Params:
  #
  # - 'u' => the user's e-mail.
  # - 'p' => the user's password.
  #
  # === Returns (in JSON format):
  #
  # - 'result'  => result status; either one of the strings "ok", "error" or "signup".
  # - 'token'   => a (string) session authorization token, returned only when status is "ok"; nil otherwise.
  # - 'user'    => the user instance as a JSON object in case of a successful login or nil otherwise.
  # - 'message' => a verbose log-in / error message.
  #
  #
  # === Sample cURL usage:
  #
  # - Creates a new session, logging-in and returning the token:
  #
  #   On the local debug server:
  #
  #       $ curl --include --request POST 'http://localhost:3000/api/v2/sessions/create?u=my.user@whatever.com&p=whatever_the_password_is'
  #
  #   On the production server:
  #
  #       $ curl --include --request POST 'http://master-goggles.org/api/v2/sessions/create?u=my.user@whatever.com&p=whatever_the_password_is'
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
      render( status: 406, json: { result: RESULT_ERROR, message: I18n.t("api.errors.request_must_be_json") } )
      return
    end

    # Fetch params
    email = params['u']
    password = params['p']
    unless email.presence && password.presence
      render( status: 400, json: { result: RESULT_ERROR, message: I18n.t("api.errors.request_must_contain_user_and_password") } )
      return
    end

    # Authentication for an existing user:
    user = User.find_for_database_authentication( email: email ) if email.presence
    if user
      if user.valid_password?( password )
        sign_in( user )
# DEBUG
#        puts "\r\n- user: #{ user.inspect }"
#        puts "\r\n- authentication_token...: '#{ user.authentication_token }'"
#        puts "- params['t']............: '#{ params['t'] }'"
        # FIXME was: user.reset_authentication_token!
#        user.authentication_token = nil
#        user.save!
        render(
          status: :ok,    # 200 status code
          json: {
            result:     RESULT_OK,
            token:      user.authentication_token,
            user_name:  user.name,
            message:    I18n.t("api.log_in_successful")
          }
        )
      else
        render( status: 401, json: { result: RESULT_ERROR, message: I18n.t("api.errors.invalid_password") } )
      end
    # User not found:
    else
      render( status: 401, json: { result: RESULT_ERROR, message: I18n.t("api.errors.invalid_user") } )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Log-out from an API session.
  #
  # === Params:
  #
  # - 't' => the authentication token of the API session.
  #
  # === Returns (in JSON format):
  #
  # - 'result'  => result status; either one of the strings "ok" or "error".
  # - 'message' => a log-out or error message.
  #
  def destroy
# DEBUG
#    puts "\r\n********** session#destroy ********"
#    puts "\r\n- PARAMS: #{ params.inspect }"
    # Validations
    if request.format != :json
      render( status: 406, json: { result: RESULT_ERROR, message: I18n.t("api.errors.request_must_be_json") } )
      return
    end

    # Fetch params
    user = User.find_for_database_authentication( authentication_token: params['t'] ) if params['t'].presence

    # Do not confuse users with nil tokens for session holders:
    if user && params['t'] && ( user.authentication_token == params['t'] )
# DEBUG
#      puts "\r\n- user: #{ user.inspect }"
#      puts "\r\n- authentication_token...: '#{ user.authentication_token }'"
#      puts "- params['t']............: '#{ params['t'] }'"
      user.reload
      user.authentication_token = nil
      user.save!
      render( status: :ok, json: { result: RESULT_OK, message: I18n.t("api.log_out_successful") } )
      return
    end
    render( status: 404, json: { result: RESULT_ERROR, message: I18n.t("api.errors.invalid_token") } )
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
