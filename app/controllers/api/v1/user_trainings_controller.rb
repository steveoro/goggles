#
# RESTful API controller
#
class Api::V1::UserTrainingsController < ApplicationController

  respond_to :json

  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!                # Devise "standard" HTTP log-in strategy
  before_filter :ensure_format
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
      @user_trainings = UserTraining.where( user_id: params[:user_id] ).order('updated_at DESC')
    else
      @user_trainings = UserTraining.order('updated_at DESC').all
    end
    respond_with( @user_trainings )
  end


  # Returns a JSON-encoded Hash with the attributes defined for the selected row.
  # The keys of the Hash are the attributes as string.
  #
  # === Additional params:
  # - id: the UserTraining.id
  #
  def show
    respond_with( @user_training = UserTraining.find(params[:id]) )
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
    respond_with( @user_training = UserTraining.create(params[:user_training]) )
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
    respond_with( @user_training = UserTraining.find(params[:id]) )
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
    is_ok = row && row.update_attributes( params[:user_training] )
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
