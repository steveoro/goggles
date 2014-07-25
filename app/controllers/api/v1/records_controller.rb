#
# R/O RESTful API controller
#
class Api::V1::RecordsController < ApplicationController

  respond_to :json

  before_filter :ensure_format
  # ---------------------------------------------------------------------------


  # Returns a JSON-encoded Array of all the IndividualRecord found, filtered by
  # SeasonType#id.
  # Returned rows will have is_team_record = false.
  #
  # Each array element is a JSON-encoded hash of a single row.
  # The keys of the Hash are the attributes as string.
  #
  # === Required params:
  # - 'id': the matching IndividualRecord#season_type_id
  #
  def for_season_type
    @records = IndividualRecord.for_season_type( params[:id] ) if params[:id]
    respond_with( @records )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns a JSON-encoded Hash of all the IndividualRecord found, filtered by
  # Team#id.
  # Returned rows will have is_team_record = true.
  #
  # Each array element is a JSON-encoded hash of a single row.
  # The keys of the Hash are the attributes as string.
  #
  # === Required params:
  # - 'id': the matching IndividualRecord#team_id
  #
  def for_team
    @records = IndividualRecord.for_team( params[:id] ) if params[:id]
    respond_with( @records )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns a JSON-encoded Hash of all the IndividualRecord found, filtered by
  # Swimmer#id and collected by looping on all MeetingIndividualResult.
  # Returned rows will be the best results obtained by the specified swimmer_id.
  #
  # Each array element is a JSON-encoded hash of a single row.
  # The keys of the Hash are the attributes as string.
  #
  # === Required params:
  # - 'id': the matching Swimmer#id
  #
  def for_swimmer
    if params[:id] && (swimmer = Swimmer.find_by_id(params[:id]))
      collector = RecordCollector.new( swimmer: swimmer )
      collection = collector.full_scan do |this, pool_code, event_code, category_code, gender_code|
        this.collect_from_results_having( pool_code, event_code, category_code, gender_code )
      end
      # Return just the list of rows:
      @records = collection.map{ |key, row| row }
    end
    respond_with( @records ? @records : [] )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns a JSON-encoded Hash astoring the count of all existing IndividualRecord found
  # for the specified Swimmer#id.
  #
  # The resulting Hash will have the structure:
  #
  #     {
  #       +total+ : <total number of records found for the swimmer_id parameter>
  #     }
  #
  # === Required params:
  # - 'id': the matching IndividualRecord#swimmer_id
  #
  def count_records_for_swimmer
    @total = 0
    if params[:id] && (swimmer = Swimmer.find_by_id(params[:id]))
      collector = RecordCollector.new( swimmer: swimmer )
      collection = collector.full_scan do |this, pool_code, event_code, category_code, gender_code|
        this.collect_from_records_having( pool_code, event_code, category_code, gender_code )
      end
      @total = collection.count
    end
    respond_with( { total: @total } )
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
end
