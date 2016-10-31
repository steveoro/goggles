#
# R/O RESTful API controller
#
class Api::V1::SwimmersController < Api::BaseController

  respond_to :json

  before_action :ensure_format
  #-- -------------------------------------------------------------------------
  #++

  # Returns a JSON-encoded Array of all the rows.
  # Each array element is a JSON-encoded hash of a single row.
  # The keys of the Hash are the attributes as string.
  #
  # The returned set when no querying/filtering parameter is provided  is
  # capped to return 20 rows max.
  # XXX [Steve, 2016107] Note that we cannot cap the limit of the query
  # when seeking a specified value, since the actual search result may well lay
  # beyond the limit set.
  #
  # === Additional params:
  # - 'q':    a matching (sub)string for the Swimmer.complete_name
  #
  def index
# DEBUG
#    puts "\r\n**** Api::V1::SwimmersController #index ****"
#    puts "- PARAMS: " << params.inspect
    if params['q']
      filter = "%#{params['q']}%"
      @swimmers = Swimmer.where( ["complete_name LIKE ?", filter] )
          .order( :complete_name )
    else
      @swimmers = Swimmer.order( :complete_name ).limit(20)
    end
# DEBUG
#    puts "- returning #{ @swimmers.size } result..."
    render status: 200, json: @swimmers
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
    render status: 200, json: Swimmer.find(params[:id])
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
