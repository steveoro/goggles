# encoding: utf-8
require 'common/format'


=begin

= RecordsController

  - version:  4.00.365
  - author:   Steve A.

=end
class RecordsController < ApplicationController


  # Collects individual records grouped by SeasonType.
  #
  # Dual-phase action: 
  # - Phase 1: GET => renders search form
  # - Phase 2: XHR GET => renders AJAX grid with result, expects parameter:
  #            - params[:season_type][:id] => the season_types.id for the filtering
  #
  def for_season_type
    # AJAX call? Parse parameter and retrieve records range:
    if request.xhr?
      @title = I18n.t('records.season_type_title')
      season_type = SeasonType.find_by_id( params[:season_type][:id] ) if params[:season_type] && params[:season_type][:id]
      collector = if season_type
        records = IndividualRecord.for_federation( season_type.id )
        # [Steve, 20140723] 'Must always specify the filtering type for the RecordCollector,
        # especially when we pre-load the list of records: 
        RecordCollector.new( list: records, season_type: season_type )
      else
        RecordCollector.new()
      end
      @grid_builder = RecordGridBuilder.new( collector )
    else
      @title = I18n.t('records.season_type_search_title')
    end
    # Respond according to requested format (GET request => .html, AJAX request => .js)
    respond_to do |format|
      format.html
      format.js
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Collects individual records/best results for a specified Team.
  #
  # Dual-phase action: 
  # - Phase 1: GET => renders search form
  # - Phase 2: XHR GET => renders AJAX grid with result, expects parameter:
  #            - params[:team][:id] => the teams.id for the filtering
  #
  def for_team
    # AJAX call? Parse parameter and retrieve records range:
    if request.xhr?
      @title = I18n.t('records.team_title')
      team = Team.find_by_id( params[:team][:id] ) if params[:team] && params[:team][:id]
      collector = if team
        records = IndividualRecord.for_team( team.id )
        # [Steve, 20140723] 'Must always specify the filtering type for the RecordCollector,
        # especially when we pre-load the list of records: 
        RecordCollector.new( list: records, team: team )
      else
        RecordCollector.new()
      end
      @grid_builder = RecordGridBuilder.new( collector )
    else
      @title = I18n.t('records.team_search_title')
    end
    # Respond according to requested format (GET request => .html, AJAX request => .js)
    respond_to do |format|
      format.html
      format.js
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Collects individual records/best results for a specified Swimmer.
  #
  # Dual-phase action: 
  # - Phase 1: GET => renders search form
  # - Phase 2: XHR GET => renders AJAX grid with result, expects parameter:
  #            - params[:swimmer][:id] => the swimmers.id for the filtering
  #
  def for_swimmer
    # AJAX call? Parse parameter and retrieve records range:
    if request.xhr?
      @title = I18n.t('records.swimmer_title')
      swimmer = Swimmer.find_by_id( params[:swimmer][:id] ) if params[:swimmer] && params[:swimmer][:id]
      collector = RecordCollector.new( swimmer: swimmer )
      collector.full_scan do |this, pool_code, event_code, category_code, gender_code|
        this.collect_from_results_having( pool_code, event_code, category_code, gender_code )
      end if swimmer
      @grid_builder = RecordGridBuilder.new( collector )
    else
      @title = I18n.t('records.swimmer_search_title')
    end
    # Respond according to requested format (GET request => .html, AJAX request => .js)
    respond_to do |format|
      format.html
      format.js
    end
  end
  #-- -------------------------------------------------------------------------
  #++


# FIXME ***************** THIS IS USED IN swimmers/radio, to pre-filter records by team
# TODO REFACTOR this:

  # Same as action <tt>for_team</tt>, but works only for Ajax requests and
  # without search header.
  #
  # Allows the direct passage of the search parameters, so that the result
  # grids can be displayed directly without issuing a search with the form.
  # The rendering works as in the <tt>for_everything</tt> action, using an internal
  # Ajax call to update the page after the data collection phase is through.
  #
  # == Parameters:
  #
  # - [:team_id] => the team id for the search
  # - [:swimmer_id] => the swimmer id to be highlighted on the grid, if any
  #
  def show_for_team
# DEBUG
    logger.debug "\r\n\r\n!! ------ #{self.class.name}.show_for_team() -----"
    @team_id = params[:team_id].to_i
    @preselected_swimmer_id = params[:swimmer_id]
    team = Team.find_by_id( @team_id )

    if ( @team_id > 0 && team )                     # Validate parameters before proceeding
      @title = "#{team.get_full_name} -- #{I18n.t('records.team_title')}"
                                                    # Was an AJAX call?
      if request.xhr?
# DEBUG
#        logger.debug "\r\nparams = #{params.inspect}\r\n"

# TODO REWRITE & TEST PERFORMANCE USING fill_hash_with_1_query_per_record_type()

        prepare_events_and_category_variables()
        where_cond = ['(meeting_individual_results.team_id = ?)', @team_id]

        all_records = MeetingIndividualResult.includes(
          :season, :event_type, :category_type, :gender_type, :pool_type
        ).is_valid.where( where_cond ).select(
          'meeting_program_id, swimmer_id, min(minutes*6000 + seconds*100 + hundreds) as timing, event_types.code, category_types.code, gender_types.code, pool_types.code'
        ).group(
          'event_types.code, category_types.code, gender_types.code, pool_types.code'
        )
                                                    # This will partition and distribute all records into the destination member variables:
        distribute_all_records_to_destination_member_variables( all_records )
        render( :partial => 'records_4x_grid' )
      end
    else
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( root_path() ) and return
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Prepares the 2 member variables @events (lists of all events)
  # and @category_short_names (list of all category short names) plus
  # the gender limit for the rendering, if any.
  #
  def prepare_events_and_category_variables( swimmer = nil )
    @only_gender = ( swimmer ?
                     swimmer.gender_type_id :       # This will disable the rendering of the grids for the opposite gender type 
                     0                              # This will set no gender limit for the rendering
    )
    @events = EventType.order(:style_order).are_not_relays
    @preselected_swimmer_id  ||= 0                  # Clear preselected swimmer id if not defined
    categories = CategoryType.are_not_relays.group( 'season_types.code, category_types.code' ).includes(
      :season_type
    ).having(
      [ 'season_types.code = ?', 'MASFINA' ]
    ).sort
    @category_short_names = categories.collect{ |r| r.short_name }
    @category_codes = categories.collect{ |r| r.code }
  end
  # ----------------------------------------------------------------------------


  # Given a list of meeting_individual_results, compiles and retuns an hash-matrix
  # with event_type ids as row keys and category short names as column keys.
  #
  def distribute_records_to_matrix( event_types_array, category_short_names_list, ind_result_records_list )
    result_hash_matrix = {}                         # Init the result hash:
# DEBUG
#    logger.debug "\r\nresult_hash_matrix.class.name: #{result_hash_matrix.class.name}"
    event_types_array.each do |event_type|
      result_hash_matrix.merge!({ event_type.id => {} })
      category_short_names_list.each do |cat_short_name|
        result_hash_matrix[ event_type.id ].merge!({ cat_short_name => nil })
      end
    end
# DEBUG
#    logger.debug "result_hash_matrix.keys: #{result_hash_matrix.keys.inspect}"
                                                    # Fill the result hash
    ind_result_records_list.each do |ind_result|
      cat_short_name  = ind_result.category_type.short_name
      event_type_key = ind_result.event_type.id
      result_hash_matrix[ event_type_key ].merge!({ cat_short_name => ind_result })
    end
    result_hash_matrix
  end


  # Prepares the 4 member variables containing all records specified as parameter
  # (<tt>all_records</tt>, array of MeetingIndividualResult rows), separated
  # according to the gender and pool type of each single row.
  #
  # The 4 member variables updated are:
  # - @f25mt_rec_hash
  # - @f50mt_rec_hash
  # - @m25mt_rec_hash
  # - @m50mt_rec_hash
  #
  def distribute_all_records_to_destination_member_variables( all_records )
                                                    # Partition records in GenderType::FEMALE_ID vs. GenderType::MALE_ID -- prevent also orphan rows to be included:
    f_records, m_records = all_records.partition{ |ind_result| ind_result.gender_type && (ind_result.gender_type.id == GenderType::FEMALE_ID) }
                                                    # Partition records in PoolType::MT25_ID vs. PoolType::MT50_ID -- prevent also orphan rows to be included:
    f25mt_rec_list = f_records.reject{ |ind_result| ind_result.pool_type.nil? || (ind_result.pool_type && ind_result.pool_type.id != PoolType::MT25_ID) }
    f50mt_rec_list = f_records.reject{ |ind_result| ind_result.pool_type.nil? || (ind_result.pool_type && ind_result.pool_type.id != PoolType::MT50_ID) }
    m25mt_rec_list = m_records.reject{ |ind_result| ind_result.pool_type.nil? || (ind_result.pool_type && ind_result.pool_type.id != PoolType::MT25_ID) }
    m50mt_rec_list = m_records.reject{ |ind_result| ind_result.pool_type.nil? || (ind_result.pool_type && ind_result.pool_type.id != PoolType::MT50_ID) }

    @f25mt_rec_hash = distribute_records_to_matrix( @events, @category_short_names, f25mt_rec_list )
    @f50mt_rec_hash = distribute_records_to_matrix( @events, @category_short_names, f50mt_rec_list )
    @m25mt_rec_hash = distribute_records_to_matrix( @events, @category_short_names, m25mt_rec_list )
    @m50mt_rec_hash = distribute_records_to_matrix( @events, @category_short_names, m50mt_rec_list )
  end
  # ----------------------------------------------------------------------------


  # Returns an hash of record rows that can be used to fill one of the 4 member variables
  # that are used to render the main view, according to the parameters specified.
  # The result hash has the format:
  #
  # {
  #   :event_type_code => { :category_type_id_or_code => MeetingIndividualResult row }
  # }
  #
  # The best individual result record chosen is the first one on the list, even
  # if there are more than 1 result having the same timing.
  #
  # The 4 member data variables that are used to render the 4 data
  # grids are:
  #
  # - @f25mt_rec_hash => female, 25mt pool, best record timings
  # - @f50mt_rec_hash => female, 50mt pool, best record timings
  # - @m25mt_rec_hash => male, 25mt pool, best record timings
  # - @m50mt_rec_hash => male, 50mt pool, best record timings
  #
  def fill_hash_with_1_query_per_record_type( event_types_array, category_type_ids_or_codes_list,
                                              gender_type_id, pool_type_id,
                                              meeting_id = nil, swimmer_id = nil,
                                              team_id = nil )
    result_hash_matrix = {}                         # Init the result hash:
# DEBUG
#    logger.debug "\r\nresult_hash_matrix.class.name: #{result_hash_matrix.class.name}"
    event_types_array.each do |event_type|
      result_hash_matrix.merge!({ event_type.id => {} })

      category_type_ids_or_codes_list.each do |category_type_id_or_code|
        result_hash_matrix[ event_type.id ].merge!(
          {
            category_type_id_or_code => MeetingIndividualResult.get_records_for(
              event_type.code,
              category_type_id_or_code,
              gender_type_id,
              pool_type_id,
              meeting_id,
              swimmer_id,
              team_id
            ).first
          }
        )
      end
    end
    result_hash_matrix
  end
  # ----------------------------------------------------------------------------


  # @deprecated: outperformed by #fill_hash_with_1_query_per_record_type 
  #
  # Returns an hash of record rows that can be used to fill one of the 4 member variables
  # that are used to render the main view, according to the parameters specified.
  # The result hash has the format:
  #
  # {
  #   :event_type_code => { :category_type_code => MeetingIndividualResult row }
  # }
  #
  # The best individual result record chosen is the first one on the list, even
  # if there are more than 1 result having the same timing.
  #
  # The 4 member data variables that are used to render the 4 data
  # grids are:
  #
  # - @f25mt_rec_hash => female, 25mt pool, best record timings
  # - @f50mt_rec_hash => female, 50mt pool, best record timings
  # - @m25mt_rec_hash => male, 25mt pool, best record timings
  # - @m50mt_rec_hash => male, 50mt pool, best record timings
  #
  def fill_hash_with_only_1_query( event_types_array, category_codes_list,
                                   gender_type_id, pool_type_id )
    result_hash_matrix = {}                         # Init the result hash:
    mir_list = MeetingIndividualResult.is_valid.includes(
      :season, :event_type, :category_type, :gender_type, :pool_type
    ).where([
      "gender_types.id = ? AND pool_types.id = ?",
      gender_type_id, pool_type_id
    ]).order(
      "event_types.code, category_types.code, minutes ASC, seconds ASC, hundreds ASC"
    )

    event_types_array.each do |event_type|
      result_hash_matrix.merge!({ event_type.id => {} })
      category_codes_list.each do |category_code|
        best_record = mir_list.detect{ |mir|        # Find the first one in the list for which the conditions are true:
          (mir.event_type.id == event_type.id) &&
          (mir.category_type.code == category_code)
        }
        result_hash_matrix[ event_type.id ].merge!(
          { category_code => best_record }
        )
      end
    end
    result_hash_matrix
  end
  # ----------------------------------------------------------------------------
end
