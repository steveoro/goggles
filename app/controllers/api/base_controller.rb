# encoding: utf-8


=begin

= Api::BaseController

  - version:  6.343
  - author:   Steve A.

  Base API v2 controller.

=end
class Api::BaseController < ActionController::API
  include ActionController::MimeResponds

  acts_as_token_authentication_handler_for User,
    fallback: false,
    if: ->(controller) { controller.user_token_authenticable? }


  protected


  # Makes sure that the format for the request is an accepted one.
  def ensure_format
    unless request.format.json?
      render( status: 406, json: { success: false, message: I18n.t("api.errors.request_must_be_json") } )
      return
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns true if  and  does:
  # - the current (sibling) controller does actually respond to JSON
  # - a User instance exists associated with the required key parameter for the API (the +email+ field)
  # - the found User instance responds to token_authenticable?
  #
  def user_token_authenticable?
    # This ensures the token can be used only for JSON requests:
    return false unless request.format.json?
    return false if tokenized_user_identifier.blank?

    # `nil` is still a falsy value, but we want a strictly boolean field here
    tokenized_user.try(:authentication_token?) || false
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Returns the first User instance matched by the identifier or nil when not found.
  #
  def tokenized_user
    User.where( email: tokenized_user_identifier.to_s ).first
  end

  # Returns the user indetifier parameter requested by the API.
  #
  def tokenized_user_identifier
    # Customize this based on Simple Token Authentication settings
    request.headers['X-User-Email'] || params[:user_email]
  end
  #-- -------------------------------------------------------------------------
  #++
end
