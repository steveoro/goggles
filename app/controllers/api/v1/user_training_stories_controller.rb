#
# RESTful API controller
#
class Api::V1::UserTrainingStoriesController < Api::BaseController

  respond_to :json

  # Require authorization before invoking any of this controller's actions:
  before_action :authenticate_user_from_token!
  before_action :ensure_format
  #-- -------------------------------------------------------------------------
  #++

  # Returns a JSON-encoded Array of all the rows.
  # Each array element is a JSON-encoded hash of a single row.
  # The keys of the Hash are the attributes as string.
  #
  # === Additional params:
  # - 'swam_date_like': a matching (sub)string for the UserTrainingStory.swam_date
  #
  def index
    # (This uses Squeel DSL syntax for where clauses)
    if params[:swam_date_like]
      filter = "%#{params[:swam_date_like]}%"
      @user_training_story = UserTrainingStory
          .where( ["swam_date LIKE ?", filter] )
          .order( 'swam_date DESC', 'updated_at DESC' )
    else
      @user_training_story = UserTrainingStory.order( 'swam_date DESC', 'updated_at DESC' )
    end
    render status: 200, json: @user_training_story
  end


  # Returns a JSON-encoded Hash with the attributes defined for the selected row.
  # The keys of the Hash are the attributes as string.
  #
  # === Additional params:
  # - id: the UserTrainingStory.id
  #
  def show
    render status: 200, json: UserTrainingStory.find(params[:id])
  end
  #-- -------------------------------------------------------------------------
  #++

  # Creates a news-feed row for a specific user.
  # (JSON format) POST-only action.
  #
  # === Params:
  # - :user_training_story => the attributes for the row to be created.
  #
  def create
    is_ok = true
    begin
      @user_training_story = UserTrainingStory.create!( user_training_story_params )
    rescue
      is_ok = false
    end
    render( status: (is_ok ? 201 : 422), json: @user_training_story )
  end
  #-- -------------------------------------------------------------------------
  #++

  # Returns a JSON-encoded hash of the specified row data.
  # The keys of the Hash are the attributes as string.
  #
  # === Params:
  # - id: the UserTrainingStory.id
  #
  def edit
    render json: UserTrainingStory.find(params[:id])
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
    row = UserTrainingStory.find_by_id( params[:id] )
    is_ok = row && row.update_attributes( user_training_story_params )
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
    row = UserTrainingStory.find_by_id( params[:id] )
    # Keep in mind that destroy will return the destroyed row if it successful:
    is_ok = ( row && row.destroy ? true : false )
    render( status: (is_ok ? :ok : 422), json: { success: is_ok } )
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Strong parameters checking for mass-assignment of a UserTrainingStory instance.
  # Returns the whitelisted, filtered params Hash.
  def user_training_story_params
    params
      .require( :user_training_story )
      .permit(
        :swam_date, :total_training_time, :notes,
        :user_training_id, :swimming_pool_id, :swimmer_level_type_id
      )
  end
  #-- -------------------------------------------------------------------------
  #++
end
