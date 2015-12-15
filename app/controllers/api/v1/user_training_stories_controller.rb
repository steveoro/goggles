#
# RESTful API controller
#
class Api::V1::UserTrainingStoriesController < ApplicationController

  respond_to :json

  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!                # Devise "standard" HTTP log-in strategy
  before_filter :ensure_format
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
      @user_training_story = UserTrainingStory.where{ swam_date.like filter }.order('swam_date DESC', 'updated_at DESC')
    else
      @user_training_story = UserTrainingStory.order('swam_date DESC', 'updated_at DESC')
    end
    respond_with( @user_training_story )
  end


  # Returns a JSON-encoded Hash with the attributes defined for the selected row.
  # The keys of the Hash are the attributes as string.
  #
  # === Additional params:
  # - id: the UserTrainingStory.id
  #
  def show
    respond_with( @user_training_story = UserTrainingStory.find(params[:id]) )
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
    respond_with( @user_training_story = UserTrainingStory.create(params[:user_training_story]) )
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
    respond_with( @user_training_story = UserTrainingStory.find(params[:id]) )
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
    is_ok = row && row.update_attributes( params[:user_training_story] )
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
end
