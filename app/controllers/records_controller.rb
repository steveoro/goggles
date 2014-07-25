# encoding: utf-8
require 'common/format'


=begin

= RecordsController

  - version:  4.00.369
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
      # Check if we have also a possibile swimmer parameter to highlight his/her results:
      # (This is used by the swimmers_controller#radio tab, to show an highlighted swimmer
      #  among the Team records)
      @highlight_swimmer = Swimmer.find_by_id( params[:highlight_swimmer_id] ) if params[:highlight_swimmer_id]
      season_type = SeasonType.find_by_id( params[:season_type][:id] ) if params[:season_type] && params[:season_type][:id]
      @title = I18n.t('records.season_type_title') + (season_type ? " (#{season_type.short_name})" : '')
      collector = if season_type
        records = IndividualRecord.for_federation( season_type.id )
        # [Steve, 20140723] 'Must always specify the filtering type for the RecordCollector,
        # especially when we pre-load the list of records: 
        RecordCollector.new( list: records, season_type: season_type, swimmer: @highlight_swimmer )
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
# DEBUG
    logger.debug "\r\n\r\n!! ------ #{self.class.name} -----"
    logger.debug "> #{params.inspect}"
    # AJAX call? Parse parameter and retrieve records range:
    if request.xhr?
      # Check if we have also a possibile swimmer parameter to highlight his/her results:
      # (This is used by the swimmers_controller#radio tab, to show an highlighted swimmer
      #  among the Team records)
      @highlight_swimmer = Swimmer.find_by_id( params['highlight_swimmer_id'] ) if params['highlight_swimmer_id']
      team = Team.find_by_id( params[:team][:id] ) if params[:team] && params[:team][:id]
      logger.debug "> @highlight_swimmer: #{@highlight_swimmer.inspect}"
      logger.debug "> team: #{team.inspect}"
      @title = I18n.t('records.team_title') + (team ? " (#{team.get_full_name})" : '')
      collector = if team
        records = IndividualRecord.for_team( team.id )
        # [Steve, 20140723] 'Must always specify the filtering type for the RecordCollector,
        # especially when we pre-load the list of records: 
        RecordCollector.new( list: records, team: team, swimmer: @highlight_swimmer )
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
      swimmer = Swimmer.find_by_id( params[:swimmer][:id] ) if params[:swimmer] && params[:swimmer][:id]
      collector = RecordCollector.new( swimmer: swimmer )
      collector.full_scan do |this, pool_code, event_code, category_code, gender_code|
        this.collect_from_results_having( pool_code, event_code, category_code, gender_code )
      end if swimmer
      @title = I18n.t('records.swimmer_title') + (swimmer ? " (#{swimmer.get_full_name})" : '')
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
end
