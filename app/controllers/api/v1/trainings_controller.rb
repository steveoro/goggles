#
# RESTful API controller
#
class Api::V1::TrainingsController < ApplicationController

  respond_to :json

  before_filter :ensure_format
  #-- -------------------------------------------------------------------------
  #++

  # Returns a JSON-encoded Array of all the rows.
  # Each array element is a JSON-encoded hash of a single row.
  # The keys of the Hash are the attributes as string.
  #
  # === Additional params:
  # - 'title_like':    a matching (sub)string for the Training.title
  #
  def index
    # (This uses Squeel DSL syntax for where clauses)
    if params[:title_like]
      filter = "%#{params[:title_like]}%"
      @trainings = Training.where( ["title LIKE ?", filter] )
          .order( 'updated_at DESC', 'title' )
    else
      @trainings = Training.order( :title )
    end
    respond_with( @trainings )
  end
  #-- -------------------------------------------------------------------------
  #++

  # Returns a JSON-encoded hash of the specified row data.
  # The keys of the Hash are the attributes as string.
  #
  # === Params:
  # - id: the Training.id
  #
  def show
    respond_with( @training = Training.find(params[:id]) )
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
