# encoding: utf-8
require 'common/format'


=begin

= RecordsController

  - version:  6.002
  - author:   Steve A.

=end
class RecordsController < ApplicationController

  # Collects individual records grouped by SeasonType (classified as 'generic').
  #
  # Dual-phase action:
  # - Phase 1: GET => renders search form
  # - Phase 2: XHR GET => renders AJAX grid with result, expects parameter:
  #            - params[:season_type][:id] => the season_types.id for the filtering
  #
  def for_season_type
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name} -----"
#    logger.debug "> #{params.inspect}"
#    logger.debug "> #{request.inspect}\r\n\r\n=====================================================\r\n\r\n"
    # AJAX call? Parse parameter and retrieve records range:
    if request.xhr?
      # Check if we have also a possibile swimmer parameter to highlight his/her results:
      # (This is used by the swimmers_controller#radio tab, to show an highlighted swimmer
      #  among the Team records)
      @highlight_swimmer = Swimmer.find_by_id( params[:highlight_swimmer_id] ) if params[:highlight_swimmer_id]
      season_type = SeasonType.find_by_id( params[:season_type][:id] ) if params[:season_type] && params[:season_type][:id]
      @title = I18n.t('records.season_type_title') + (season_type ? " (#{season_type.short_name})" : '')
      collector = if season_type
        records = IndividualRecord.for_season_type( season_type.id )
        # [Steve, 20140723] 'Must always specify the filtering type for the RecordCollector,
        # especially when we pre-load the list of records:
        RecordCollector.new( list: records, record_type_code: 'FOR', season_type: season_type, swimmer: @highlight_swimmer )
      else
        RecordCollector.new( record_type_code: 'FOR' )
      end
      @grid_builder = RecordGridBuilder.new( collector, 'FOR' )
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


  # Collects individual records/best results for a specified Team (classified as 'for teams').
  #
  # Dual-phase action:
  # - Phase 1: GET => renders search form
  # - Phase 2: XHR GET => renders AJAX grid with result, expects parameter:
  #            - params[:team][:id] => the teams.id for the filtering
  #
  def for_team
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name} -----"
#    logger.debug "> #{params.inspect}\r\n\r\n=====================================================\r\n\r\n"
    # AJAX call? Parse parameter and retrieve records range:
    if request.xhr? && params['team'] && params['team']['id']
      # Check if we have also a possibile swimmer parameter to highlight his/her results:
      # (This is used by the swimmers_controller#radio tab, to show an highlighted swimmer
      #  among the Team records)
      @highlight_swimmer = Swimmer.find_by_id( params['highlight_swimmer_id'] ) if params['highlight_swimmer_id']
      team = Team.find_by_id( params['team']['id'] )
      logger.debug "> @highlight_swimmer: #{@highlight_swimmer.inspect}"
      logger.debug "> team: #{team.inspect}"
      @title = team ? "#{ I18n.t('records.team_title') } (#{team.decorate.get_linked_name})".html_safe : I18n.t('records.team_title')
      collector = if team
        records = IndividualRecord.for_team( team.id )
# DEBUG
#        logger.debug "> Tot. records found: #{records.size}\r\n\r\n"
        # [Steve, 20140723] 'Must always specify the filtering type for the RecordCollector,
        # especially when we pre-load the list of records:
        RecordCollector.new( list: records, record_type_code: 'TTB', team: team, swimmer: @highlight_swimmer )
      else
# DEBUG
#        logger.debug "> NO TEAM!\r\n\r\n"
        RecordCollector.new( record_type_code: 'TTB' )
      end
      @grid_builder = RecordGridBuilder.new( collector, 'TTB' )
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


  # Collects individual records/best results for a specified Swimmer (but classified as 'generic').
  #
  # Dual-phase action:
  # - Phase 1: GET => renders search form
  # - Phase 2: XHR GET => renders AJAX grid with result, expects parameter:
  #            - params[:swimmer][:id] => the swimmers.id for the filtering
  #
  def for_swimmer
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name} -----"
#    logger.debug "> #{params.inspect}"
#    logger.debug "> #{request.inspect}\r\n\r\n=====================================================\r\n\r\n"
    # AJAX call? Parse parameter and retrieve records range:
    if request.xhr? && params['swimmer'] && params['swimmer']['id']
      swimmer = Swimmer.find_by_id( params['swimmer']['id'] )
      collector = RecordCollector.new( swimmer: swimmer, record_type_code: 'FOR' )
      collector.full_scan do |this, pool_code, event_code, category_code, gender_code|
        this.collect_from_results_having( pool_code, event_code, category_code, gender_code, 'FOR' )
      end if swimmer
      @title = swimmer ? "#{ I18n.t('records.swimmer_title') } (#{swimmer.get_full_name})" : I18n.t('records.swimmer_title')
      @grid_builder = RecordGridBuilder.new( collector, 'FOR' )
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


# FIXME this has not been used yet: (view removed or missing) -- check it out and then remove it, if everything is ok

  # Collects individual personal bests for a specified Swimmer.
  #
  # Dual-phase action:
  # - Phase 1: GET => renders search form
  # - Phase 2: XHR GET => renders AJAX grid with result, expects parameter:
  #            - params[:swimmer][:id] => the swimmers.id for the filtering
  #
  # def for_personal_best
    # # AJAX call? Parse parameter and retrieve records range:
    # if request.xhr? && params['swimmer'] && params['swimmer']['id']
      # swimmer = Swimmer.find_by_id( params['swimmer']['id'] )
      # collector = PersonalBestCollector.new( swimmer: swimmer )
#
      # if swimmer
        # # Collect personal bests
        # collector.full_scan do |this, events_by_pool_type|
          # this.collect_from_all_category_results_having( events_by_pool_type, 'SPB' )
        # end
        # # Collect last result
        # collector.full_scan do |this, events_by_pool_type|
          # this.collect_last_results_having( events_by_pool_type, 'SLP' )
        # end
        # # Collect seasonal bests
        # current_season = Season.get_last_season_by_type( 'MASFIN' )
        # collector.set_start_date( current_season.begin_date )
        # collector.set_end_date( current_season.end_date )
        # collector.full_scan do |this, events_by_pool_type|
          # this.collect_from_all_category_results_having( events_by_pool_type, 'SSB' )
        # end
      # end
#
      # @title = I18n.t('records.swimmer_title') + (swimmer ? " (#{swimmer.get_full_name})" : '')
      # @grid_builder = PersonalBestGridBuilder.new( collector )
    # else
      # @title = I18n.t('records.swimmer_search_title')
    # end
    # # Respond according to requested format (GET request => .html, AJAX request => .js)
    # respond_to do |format|
      # format.html
      # format.js
    # end
  # end
  #-- -------------------------------------------------------------------------
  #++
end
