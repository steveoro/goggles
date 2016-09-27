#
# R/O RESTful API controller
#
class Api::V1::RecordsController < Api::BaseController

  respond_to :json

  before_action :ensure_format
  #-- -------------------------------------------------------------------------
  #++


  # Returns a JSON-encoded Array of all the IndividualRecord found, filtered by
  # SeasonType#id.
  # Returned rows will be 'global' records (not for teams, nor swimmers or seasons).
  #
  # Each array element is a JSON-encoded hash of a single row of IndividualRecord.
  # The keys of the Hash are the attributes as string.
  #
  # === Required params:
  # - 'id': the matching IndividualRecord#season_type_id, searched among the generic records
  #         (not team- or swimmer- or season- related)
  #
  def for_season_type
    @records = IndividualRecord.for_season_type( params[:id] ) if params[:id]
    render status: 200, json: @records
  end
  #-- -------------------------------------------------------------------------
  #++

  # Returns a JSON-encoded Array of all the IndividualRecord found, filtered by
  # FederationType#id.
  # Returned rows will be 'global' records (not for teams, nor swimmers or seasons).
  #
  # Each array element is a JSON-encoded hash of a single row of IndividualRecord.
  # The keys of the Hash are the attributes as string.
  #
  # === Required params:
  # - 'id': the matching IndividualRecord#federation_id, searched among the generic records
  #         (not team- or swimmer- or season- related)
  #
  def for_federation
    @records = IndividualRecord.for_federation( params[:id] ) if params[:id]
    render status: 200, json: @records
  end
  #-- -------------------------------------------------------------------------
  #++

  # Returns a JSON-encoded Hash of all the IndividualRecord found, filtered by
  # Team#id.
  # Returned rows will have is_team_record = true.
  #
  # Each array element is a JSON-encoded hash of a single row of IndividualRecord.
  # The keys of the Hash are the attributes as string.
  #
  # === Required params:
  # - 'id': the matching IndividualRecord#team_id
  #
  def for_team
    @records = IndividualRecord.for_team( params[:id] ) if params[:id]
    render status: 200, json: @records
  end
  #-- -------------------------------------------------------------------------
  #++

  # Returns a JSON-encoded Hash of all the IndividualRecord found, filtered by
  # Swimmer#id and collected by looping on all MeetingIndividualResult.
  #
  # The returned rows will be the best results obtained by the specified swimmer_id and
  # categorized in the RecordCollection as 'generic' records (code: 'FOR').
  #
  # Each array element is a JSON-encoded hash of a single row of IndividualRecord.
  # The keys of the Hash are the attributes as string.
  #
  # === Required params:
  # - 'id': the matching Swimmer#id
  #
  def for_swimmer
    if params[:id] && (swimmer = Swimmer.find_by_id(params[:id]))
      collector = RecordCollector.new( swimmer: swimmer )
      collection = collector.full_scan do |this, pool_code, event_code, category_code, gender_code|
        this.collect_from_results_having( pool_code, event_code, category_code, gender_code, 'FOR' )
      end
      # Return just the list of rows:
      @records = collection.map{ |key, row| row }
    end
    render status: 200, json: ( @records ? @records : [] )
  end
  #-- -------------------------------------------------------------------------
  #++

  # Counts the records for each federation/season_type for a specified Swimmer.
  #
  # Returns a JSON-encoded array of Hash instances, each one storing a different season_type_id
  # and its corresponding total count of all the existing IndividualRecord found for the specified
  # Swimmer#id.
  #
  # The resulting Array will have the structure:
  #
  #   [
  #     {
  #       +season_type_id+ : <currently processed season_type_id>
  #       +total+ : <total number of season_type/federation records found for the swimmer_id parameter>
  #     },
  #     # [...1 hash for each defined season type...]
  #   ]
  #
  # === Required params:
  # - 'id': the matching IndividualRecord#swimmer_id
  #
  def count_records_for_swimmer
    @total = 0
    result_array = SeasonType.all.distinct.map(&:id).map do |id|
      {
        season_type_id: id,
        total: IndividualRecord.for_season_type(id).where( swimmer_id: params[:id] ).count
      }
    end
    render status: 200, json: result_array
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
