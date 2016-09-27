#
# RESTful API controller
#
class Api::V1::PassagesController < Api::BaseController

  respond_to :json

  # Require authorization before invoking any of this controller's actions:
  before_action :authenticate_user_from_token!
  before_action :ensure_format
  #-- -------------------------------------------------------------------------
  #++

  # Returns a JSON-encoded Array of all the selected rows.
  # Each array element is a JSON-encoded hash of a single row.
  # The keys of the Hash are the attributes as string.
  #
  # === Additional params:
  # - meeting_id: the Meeting.id for passage filtering
  # - team_id:    the Team.id for passage filtering
  #
  def index
    if params[:meeting_id] && params[:team_id]
      @passages = Passage.includes(:team, :meeting).where(
        'meetings.id' => params[:meeting_id],
        'teams.id' => params[:team_id]
      ).to_a
    else
      @passages = []
    end
    render status: 200, json: @passages
  end


  # Returns a JSON-encoded Hash with the attributes defined for the selected row.
  # The keys of the Hash are the attributes as string.
  #
  # === Additional params:
  # - id: the Passage.id
  #
  def show
    render status: 200, json: Passage.find(params[:id])
  end
  #-- -------------------------------------------------------------------------
  #++

  # Creates a news-feed row for a specific user.
  # (JSON format) POST-only action.
  #
  # === Params:
  # - :passage => the attributes for the row to be created.
  #
  def create
    is_ok = true
    begin
      @passage = Passage.create!( passage_params )
    rescue
      is_ok = false
    end
    render( status: (is_ok ? 201 : 422), json: @passage )
  end
  #-- -------------------------------------------------------------------------
  #++

  # Returns a JSON-encoded hash of the specified row data.
  # The keys of the Hash are the attributes as string.
  #
  # === Params:
  # - id: the Passage.id
  #
  def edit
    render json: Passage.find(params[:id])
  end
  #-- -------------------------------------------------------------------------
  #++

  # Updates a specific row.
  # (JSON format) PUT-only action.
  #
  # === Params:
  # - id: the id of the row to be updated.
  #
  def update
    row = Passage.find_by_id( params[:id] )
    is_ok = row && row.update_attributes( passage_params )
    render( status: (is_ok ? :ok : 400), json: { success: is_ok } )
  end
  #-- -------------------------------------------------------------------------
  #++

  # Deletes a specific row.
  # (JSON format) DELETE-only action.
  #
  # === Params:
  # - id: the id of the row to be deleted.
  #
  def destroy
    row = Passage.find_by_id( params[:id] )
    # Keep in mind that destroy will return the destroyed row if it successful:
    is_ok = ( row && row.destroy ? true : false )
    render( status: (is_ok ? :ok : 422), json: { success: is_ok } )
  end
  #-- -------------------------------------------------------------------------
  #++


  protected


  # Makes sure that the format for the request is an accepted one.
  def ensure_format
    unless request.xhr? || request.format.json?
      render( status: 406, json: { success: false, message: I18n.t(:api_request_must_be_json) } )
      return
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Strong parameters checking for mass-assignment of a Passage instance.
  # Returns the whitelisted, filtered params Hash.
  def passage_params
    params
      .require( :passage )
      .permit(
        :user_id,
        :passage_type_id,
        :swimmer_id,
        :team_id,
        :meeting_program_id,
        :meeting_entry_id,
        :meeting_individual_result_id,
        :minutes_from_start, :seconds_from_start, :hundreds_from_start,
        :is_native_from_start,
        :reaction_time, :position,
        :minutes, :seconds, :hundreds,
        :breath_number, :stroke_cycles,
        :not_swam_part_seconds,
        :not_swam_part_hundreds,
        :not_swam_kick_number
      )
  end
  #-- -------------------------------------------------------------------------
  #++
end
