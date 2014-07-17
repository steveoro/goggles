# encoding: utf-8
require 'common/format'


=begin

= RecordsController

  - version:  4.00.355
  - author:   Steve A.

=end
class RecordsController < ApplicationController


  # Collect individual records grouped by FederationType.
  #
  def for_federation
    # AJAX call? Parse parameter and retrieve records range:
    if request.xhr?
      @title = I18n.t('records.federation_title')
      records = IndividualRecord.for_federation( params[:federation_type][:id] ) if params[:federation_type] && params[:federation_type][:id]
      @collector = RecordCollector.new( list: records )
    else
      @title = I18n.t('records.federation_search_title')
    end
    # Respond according to requested format (GET request => .html, AJAX request => .js)
    respond_to do |format|
      format.html
      format.js
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Collect individual records among everything that has been inserted but just
  # for the selected season_type_id.
  # This computes an "all-time" best chart for everyone associated to the specified
  # team_id, in every event type ever inserted, according to the latest data available.
  #
  def OLD_for_season_type
# DEBUG
    logger.debug "\r\n\r\n!! ------ #{self.class.name}.for_season_type() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    if request.xhr?                                 # Was an AJAX call? Parse parameter and retrieve records range:
      season_type_id  = params[:season_type][:season_type_id].to_i if params[:season_type]
      year            = params[:year].to_i
#      logger.debug "year: #{year}, season_type_id: #{season_type_id}"
      season_type = SeasonType.find_by_id( season_type_id )

      if ( season_type_id > 0 && season_type )       # Validate parameters before proceeding

# TODO REWRITE & TEST PERFORMANCE USING fill_hash_with_1_query_per_record_type()

        @title = "#{season_type.description} -- #{I18n.t('records.season_type_title')}"
        prepare_events_and_category_variables()
        if (year > 0)
          where_cond = [
            '(season_types.id = ?) AND (YEAR(seasons.begin_date) <= ?) AND (YEAR(seasons.end_date) >= ?)',
            season_type_id, year, year
          ]
        else
          where_cond = [ '(season_types.id = ?)', season_type_id ]
        end

        all_records = MeetingIndividualResult.includes(
          :season, :season_type, :event_type, :category_type, :gender_type, :pool_type
        ).is_valid.where( where_cond ).select(
          'meeting_program_id, swimmer_id, min(minutes*6000 + seconds*100 + hundreds) as timing, event_types.code, category_types.code, gender_types.code, pool_types.code'
        ).group(
          'event_types.code, category_types.code, gender_types.code, pool_types.code'
        )
                                                    # This will partition and distribute all records into the destination member variables:
        distribute_all_records_to_destination_member_variables( all_records )
      else
        flash[:error] = I18n.t(:invalid_action_request)
        redirect_to( root_path() ) and return
      end
    end
                                                    # Respond according to requested format:
    respond_to do |format|
      format.html
      format.js
    end
  end


  # Collect individual records among everything that has been inserted but just
  # for the selected swimmer_id.
  # This computes an "all-time" best chart for the specified swimmer_id, in every
  # event type ever inserted, according to the latest data available.
  #
  def OLD_for_swimmer
# DEBUG
    logger.debug "\r\n\r\n!! ------ #{self.class.name}.for_swimmer() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    if request.xhr?                                 # Was an AJAX call? Parse parameter and retrieve records range:
      season_id   = params[:season][:season_id].to_i if params[:season]
      swimmer_id  = params[:swimmer][:swimmer_id].to_i if params[:swimmer]
#      logger.debug "season_id: #{season_id}, swimmer_id #{swimmer_id}"
      swimmer = Swimmer.find_by_id( swimmer_id )

      if ( swimmer_id > 0 && swimmer )              # Validate parameters before proceeding

# TODO REWRITE & TEST PERFORMANCE USING fill_hash_with_1_query_per_record_type()

        @title = "#{swimmer.get_full_name} -- #{I18n.t('records.swimmer_title')}"
        prepare_events_and_category_variables( swimmer )
        if (season_id > 0)
          where_cond = ['(meeting_individual_results.swimmer_id = ?) AND (seasons.id = ?)', swimmer_id, season_id]
        else
          where_cond = ['(meeting_individual_results.swimmer_id = ?)', swimmer_id]
        end
  
        all_records = MeetingIndividualResult.includes(
          :season, :event_type, :category_type, :gender_type, :pool_type
        ).is_valid.where( where_cond ).select(
          'meeting_program_id, swimmer_id, min(minutes*6000 + seconds*100 + hundreds) as timing, event_types.code, category_types.code, gender_types.code, pool_types.code'
        ).group(
          'event_types.code, category_types.code, gender_types.code, pool_types.code'
        )
                                                    # This will partition and distribute all records into the destination member variables:
        distribute_all_records_to_destination_member_variables( all_records )
      else
        flash[:error] = I18n.t(:invalid_action_request)
        redirect_to( root_path() ) and return
      end
    end
                                                    # Respond according to requested format:
    respond_to do |format|
      format.html
      format.js
    end
  end


  # Collect individual records among everything that has been inserted but just
  # for the selected team_id.
  # This computes an "all-time" best chart for everyone associated to the specified
  # team_id, in every event type ever inserted, according to the latest data available.
  #
  def OLD_for_team
# DEBUG
    logger.debug "\r\n\r\n!! ------ #{self.class.name}.for_team() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    if request.xhr?                                 # Was an AJAX call? Parse parameter and retrieve records range:
      season_id = params[:season][:season_id].to_i if params[:season]
      team_id   = params[:team][:team_id].to_i if params[:team]
#      logger.debug "season_id: #{season_id}, team_id: #{team_id}"
      team = Team.find_by_id( team_id )

      if ( team_id > 0 && team )                    # Validate parameters before proceeding

# TODO REWRITE & TEST PERFORMANCE USING fill_hash_with_1_query_per_record_type()

        @title = "#{team.get_full_name} -- #{I18n.t('records.team_title')}"
        prepare_events_and_category_variables()
        if (season_id > 0)
          where_cond = ['(meeting_individual_results.team_id = ?) AND (seasons.id = ?)', team_id, season_id]
        else
          where_cond = ['(meeting_individual_results.team_id = ?)', team_id]
        end
  
        all_records = MeetingIndividualResult.includes(
          :season, :event_type, :category_type, :gender_type, :pool_type
        ).is_valid.where( where_cond ).select(
          'meeting_program_id, swimmer_id, min(minutes*6000 + seconds*100 + hundreds) as timing, event_types.code, category_types.code, gender_types.code, pool_types.code'
        ).group(
          'event_types.code, category_types.code, gender_types.code, pool_types.code'
        )
                                                    # This will partition and distribute all records into the destination member variables:
        distribute_all_records_to_destination_member_variables( all_records )
      else
        flash[:error] = I18n.t(:invalid_action_request)
        redirect_to( root_path() ) and return
      end
    end
                                                    # Respond according to requested format:
    respond_to do |format|
      format.html
      format.js
    end
  end
  # ----------------------------------------------------------------------------


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
