#
# R/O RESTful API controller
#
class Api::V1::MeetingsController < ApplicationController

  respond_to :json

  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!                # Devise "standard" HTTP log-in strategy
  before_filter :ensure_format
  # ---------------------------------------------------------------------------


  # Returns a JSON-encoded Array of all the rows.
  # Each array element is a JSON-encoded hash of a single row.
  # The keys of the Hash are the attributes as string.
  #
  # === Additional params:
  # - 'code_like': a matching (sub)string for the Meeting.code
  # - 'header_year': the exact Meeting.header_year
  #
  def index
    # (This uses Squeel DSL syntax for where clauses)
    if params[:code_like]                           
      filter = "%#{params[:code_like]}%"
      @teams = Meeting.where{ code.like filter }.order(:header_date)
    else
      @teams = Meeting.order(:header_date)
    end
    if params[:header_year]
      filter = params[:header_year].to_i
      @teams = @teams.where{ header_year == filter }.order(:header_date)
    end
    respond_with( @teams )
  end


  # Returns a JSON-encoded hash of the specified row data.
  # The keys of the Hash are the attributes as string.
  #
  # === Params:
  # - id: the Meeting.id
  #
  def show
    respond_with( @team = Meeting.find(params[:id]) )
  end
  # ---------------------------------------------------------------------------


  protected


  # Makes sure that the format for the request is an accepted one.
  def ensure_format
    unless request.xhr? || request.format.json?
      render( status: 406, json: { success: false, message: I18n.t(:api_request_must_be_json) } )
      return
    end
  end
end
