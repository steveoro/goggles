#
# RESTful API controller
#
class Api::V1::UserTrainingsController < Api::BaseController

  respond_to :json

  # Require authorization before invoking any of this controller's actions:
  before_action :authenticate_user_from_token!
  before_action :ensure_format
  #-- -------------------------------------------------------------------------
  #++

  # Returns a JSON-encoded Array of all the available rows.
  # Each array element is a JSON-encoded hash of a single row.
  # The keys of the Hash are the attributes as string.
  #
  # === Additional params:
  # - user_id:  the user_id owner of the UserTraining rows
  #
  def index
    # (This uses Squeel DSL syntax for where clauses)
    if params[:user_id]
      @user_trainings = UserTraining.where( user_id: params[:user_id] )
          .order('updated_at DESC')
    else
      @user_trainings = UserTraining.order('updated_at DESC').all
    end
    render status: 200, json: @user_trainings
  end


  # Returns a JSON-encoded Hash with the attributes defined for the selected row.
  # The keys of the Hash are the attributes as string.
  #
  # === Additional params:
  # - id: the UserTraining.id
  #
  def show
    render status: 200, json: UserTraining.find(params[:id])
  end
  #-- -------------------------------------------------------------------------
  #++

  # Creates a news-feed row for a specific user.
  # (JSON format) POST-only action.
  #
  # === Params:
  # - :user_training => the attributes for the row to be created.
  #
  def create
    is_ok = true
    begin
      @user_training = UserTraining.create!( user_training_params )
    rescue
      is_ok = false
    end
    render( status: (is_ok ? 201 : 422), json: @user_training )
  end
  #-- -------------------------------------------------------------------------
  #++

  # Returns a JSON-encoded hash of the specified row data.
  # The keys of the Hash are the attributes as string.
  #
  # === Params:
  # - id: the UserTraining.id
  #
  def edit
    render json: UserTraining.find(params[:id])
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
    row = UserTraining.find_by_id( params[:id] )
    is_ok = row && row.update_attributes( user_training_params )
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
    row = UserTraining.find_by_id( params[:id] )
    # Keep in mind that destroy will return the destroyed row if it successful:
    is_ok = ( row && row.destroy ? true : false )
    render( status: (is_ok ? :ok : 422), json: { success: is_ok } )
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Strong parameters checking for mass-assignment of a UserTraining instance.
  # Returns the whitelisted, filtered params Hash.
  def user_training_params
    params
      .require( :user_training )
      .permit(
        :description,
        :user_id,
        user_training_rows_attributes: [
          :part_order,
          :group_id, :group_times, :group_start_and_rest, :group_pause,
          :times, :distance, :start_and_rest, :pause,
          :user_training_id, :exercise_id, :training_step_type_id,
          :arm_aux_type_id, :kick_aux_type_id, :body_aux_type_id, :breath_aux_type_id
        ],
        user_training_story_attributes: [
          :swam_date, :total_training_time, :notes,
          :user_training_id, :swimming_pool_id, :swimmer_level_type_id
        ]
      )
  end
  #-- -------------------------------------------------------------------------
  #++
end
