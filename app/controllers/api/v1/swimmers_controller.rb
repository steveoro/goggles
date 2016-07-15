#
# R/O RESTful API controller
#
class Api::V1::SwimmersController < ApplicationController

  respond_to :json

  before_filter :ensure_format
  #-- -------------------------------------------------------------------------
  #++

  # Returns a JSON-encoded Array of all the rows.
  # Each array element is a JSON-encoded hash of a single row.
  # The keys of the Hash are the attributes as string.
  #
  # This action is not restricted by authorization because is capped to
  # return 20 rows max.
  #
  # === Additional params:
  # - 'q':    a matching (sub)string for the Swimmer.complete_name
  #
  def index
# DEBUG
#    puts "\r\n**** Api::V1::SwimmersController #index ****"
#    puts "- PARAMS: " << params.inspect
    # (This uses Squeel DSL syntax for where clauses)
    if params['q']
      filter = "%#{params['q']}%"
      @swimmers = Swimmer.where( ["complete_name LIKE ?", filter] )
          .order( :complete_name ).limit(20)
    else
      @swimmers = Swimmer.order( :complete_name ).limit(20)
    end
    puts "- returning #{ @swimmers.size } result..."
    respond_with( @swimmers )
  end
  #-- -------------------------------------------------------------------------
  #++

  # Returns a JSON-encoded hash of the specified row data.
  # The keys of the Hash are the attributes as string.
  #
  # === Params:
  # - id: the Swimmer.id
  #
  def show
    respond_with( @swimmer = Swimmer.find(params[:id]) )
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
