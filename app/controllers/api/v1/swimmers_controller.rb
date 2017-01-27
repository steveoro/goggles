#
# R/O RESTful API controller
#
class Api::V1::SwimmersController < Api::BaseController

  respond_to :json

  before_action :ensure_format
  # Require authorization before invoking any of this controller's actions:
  before_action :authenticate_user_from_token!, only: [:tag_for_user]
  #-- -------------------------------------------------------------------------
  #++

  # Returns a JSON-encoded Array of all the rows.
  # Each array element is a JSON-encoded hash of a single row.
  # The keys of the Hash are the attributes as string.
  #
  # The returned set when no querying/filtering parameter is provided  is
  # capped to return 20 rows max.
  #
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


  # Tags/Untags a specific Swimmer id for the current_user.
  # (JSON format) PUT-only action.
  #
  # === Params:
  # - id: the Swimmer.id to be tagged/untagged for the current_user.
  #
  def tag_for_user
    swimmer = Swimmer.find_by_id( params[:id] )
    # Meeting found?
    if swimmer && current_user
      # Swimmer already tagged?
      if swimmer.tags_by_user_list.include?( "u#{ current_user.id }" )
        swimmer.tags_by_user_list.remove( "u#{ current_user.id }" )
      else
        swimmer.tags_by_user_list.add( "u#{ current_user.id }" )
      end
      # Save and return result:
      if swimmer.save
        render( status: :ok, json: { success: true } ) and return
      else
        render( status: 422, json: { success: false, error: "Error during save!" } )
      end
    end
    render( status: 422, json: { success: false, error: "Invalid parameters!" } )
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
