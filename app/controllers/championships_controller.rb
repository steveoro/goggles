# encoding: utf-8
require 'common/format'


=begin

= ChampionshipsController

  - version:  6.340
  - author:   Leega, Steve A.

=end
class ChampionshipsController < ApplicationController
  # Parse parameters according to current user *BEFORE* everything else:
  before_action :verify_parameter_regional_er_csi, only: [
      :ranking_regional_er_csi, :printout_ranking_regional_csi,
      :calendar_regional_er_csi, :event_ranking_regional_er_csi,
      :individual_rank_regional_er_csi, :printout_indi_ranking_csi,
      :rules_regional_er_csi, :history_regional_er_csi, :records_regional_er_csi
  ]
  before_action :verify_parameter_regional_er_uisp, only: [
      :ranking_regional_er_uisp, :calendar_regional_er_uisp, :rules_regional_er_uisp,
      :history_regional_er_uisp
  ]
  before_action :verify_parameter_supermaster_fin, only: [
      :ranking_supermaster_fin, :calendar_supermaster_fin, :rules_supermaster_fin,
      :history_supermaster_fin
  ]
  # At this point, we assume the basic parameter are set and we can impose the
  # setting of the Team ID also:
  before_action :set_team, only: [
      :ranking_regional_er_csi,
      :event_ranking_regional_er_csi,
      :individual_rank_regional_er_csi, :printout_indi_ranking_csi
  ]
  #-- -------------------------------------------------------------------------
  #++

  # Season calendar for a given regonal er CSI season
  #
  def calendar_regional_er_csi
    @title = I18n.t('championships.calendar') + ' ' + @season.get_full_name

    @calendarMeetingPicker = CalendarMeetingPicker.new( nil, nil, @season )
    @calendarDAO = @calendarMeetingPicker.pick_meetings( 'ASC', false, current_user)
    @meetings = @calendarDAO.get_meetings

    # TODO Maybe add a schema with events by meeting
    #          50SL 100SL 200SL 400SL 800SL 50FA...
    # 1a prova  X                 X
    # 2a prova        X     X
    # 3a prova                                X
    # ...
  end


  # CSI Regional Emilia Romagna championship ranking data display manager
  #
  def ranking_regional_er_csi
    @title = "#{ I18n.t('championships.team_ranking') } #{ @season.get_full_name }"
    championship_calculator = ChampionshipRankingCalculator.new( @season )
    @championship_ranking = championship_calculator.get_season_ranking
    @ranking_updated_at = if @season.meeting_individual_results.exists?
      @season.meeting_individual_results.select( "meeting_individual_results.updated_at" ).order(:updated_at).last.updated_at.to_i
    else
      0
    end
  end


  # Prepares the PDF report using the ChampionshipRankingRegionalCSILayout for the
  # current CSI Championship.
  #
  def printout_ranking_regional_csi
    championship_calculator = ChampionshipRankingCalculator.new( @season )
    @championship_dao = championship_calculator.get_season_ranking
                                                    # == OPTIONS setup + RENDERING phase ==
    base_filename = "champ_ranking_#{ @season.id }"
    filename = create_unique_filename( base_filename ) + '.pdf'
    options = {
      report_title:         "#{ I18n.t('championships.team_ranking') } #{ @season.get_full_name }",
      meta_info_subject:    'CSI regional championship ranking report',
      meta_info_keywords:   "Goggles, #{base_filename}'",
      championship_dao:     @championship_dao
    }
    send_data(                                      # == Render layout & send data:
        ChampionshipRankingRegionalCSILayout.render( options ),
        type: 'application/pdf',
        filename: filename
    )
  end


  # Season rules viewer for a given regonal er CSI season
  #
  def rules_regional_er_csi
    @title = I18n.t('championships.rules') + ' ' + @season.get_full_name
  end


  # Past seasons championships ranking data display manager
  # for CSI regional ER championships (closed seasons)
  #
  def history_regional_er_csi
    @title = I18n.t('championships.history_title') + ' ' + @season_type.get_full_name

    championship_history_manager = ChampionshipHistoryManager.new( @season_type )
    @championship_history_manager = championship_history_manager.get_season_ranking_history
    @seasons_hall_of_fame = championship_history_manager.get_season_hall_of_fame
    @history_updated_at = @championship_history_manager.max{ |n,p| n[:max_updated_at] <=> p[:max_updated_at] }[:max_updated_at]
  end


  # Seasonal event ranking (gender, category, evet_type)
  # for CSI regional ER championships
  #
  def event_ranking_regional_er_csi
    @title = I18n.t('championships.event_ranking') + ' ' + @season_type.get_full_name
    # Check for different event types and categories for the season and manage updates for the cache:

    @event_types    = EventType.for_season( @season.id ).are_not_relays.distinct.sort_by_style
    @category_types = @season.category_types.are_not_relays.sort_by_age

    @ranking_updated_at = @season.meeting_individual_results.exists? ?
      @season.meeting_individual_results.select( "meeting_individual_results.updated_at" ).order(:updated_at).last.updated_at.to_i :
      0

    timing_converter = TimingCourseConverter.new( @season )

    # Calculate ranking for each event/category/gender types
    @season_ranking = []
    GenderType.individual_only.sort_by_courtesy.each do |gender_type|
      gender_ranking = {}
      gender_ranking[:gender_type] = gender_type
      gender_ranking[:categories] = []
      @category_types.each do |category_type|
        category_ranking = {}
        category_ranking[:category_type] = category_type
        category_ranking[:events] = []
        @event_types.each do |event_type|
          event_ranking = {}
          event_ranking[:event_type] = event_type
          event_ranking[:mirs] = []

          # Find out total events in championship (season), count and swam
          # [Steve, 20170912] *** See note above *** Old implementation was:
          # event_ranking[:event_count] = @season.event_types.where(['event_types.code = ?', event_type.code]).count
          # event_ranking[:event_swam]  = @season.event_types.where(['event_types.code = ? and meetings.are_results_acquired', event_type.code]).count
          event_ranking[:event_count] = EventType.for_season( @season.id ).where(['event_types.code = ?', event_type.code]).count
          event_ranking[:event_swam]  = EventType.for_season( @season.id ).where(['event_types.code = ? and meetings.are_results_acquired', event_type.code]).count

          #best_result = @season.meeting_individual_results.is_valid.for_gender_type(gender_type).for_category_type(category_type).for_event_type(event_type).sort_by_timing.first
          #top_timing = Timing.new(best_result.minutes, best_result.seconds, best_result.hundreds) if best_result
          @season.meeting_individual_results.is_valid.for_gender_type(gender_type).for_category_type(category_type).for_event_type(event_type).sort_by_timing.each do |mir|
            # Skip swimmers already ranked
            if not event_ranking[:mirs].any?{ |collected_mir| collected_mir.swimmer_id == mir.swimmer_id and collected_mir.pool_type.id == mir.pool_type.id }
              # Convert 50 meters to 25 meters timing
              if mir.pool_type.code == '50' and timing_converter.is_conversion_possible?( mir.gender_type, mir.event_type )
                time_converted = timing_converter.convert_time_to_short( mir.get_timing_instance, mir.gender_type, mir.event_type )
                mir.minutes  = time_converted.minutes
                mir.seconds  = time_converted.seconds
                mir.hundreds = time_converted.hundreds
              end
              event_ranking[:mirs] << mir
            end
          end
          event_ranking[:mirs].sort!{|p,n| p.get_timing_instance.to_hundreds <=> n.get_timing_instance.to_hundreds }

          # Remove duplicated swimmer entry (due to conversions from 50 to 25)
          event_ranking[:mirs].each do |mir|
            duplicate = event_ranking[:mirs].index{ |collected_mir| collected_mir.swimmer_id == mir.swimmer_id and collected_mir.id != mir.id }
            event_ranking[:mirs].delete_at( duplicate ) if duplicate
          end

          # Trim to 15 results
          event_ranking[:mirs] = event_ranking[:mirs].take(15)

          category_ranking[:events] << event_ranking
        end
        gender_ranking[:categories] << category_ranking
      end
      @season_ranking << gender_ranking
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Seasonal individual ranking
  # for CSI regional ER championships
  #
  def individual_rank_regional_er_csi
    @title = I18n.t('championships.individual_rank') + ' ' + @season_type.get_full_name

    @category_types = @season.category_types.are_not_relays.is_divided.sort_by_age

    # Decides what kind of calculation for the season
    # TODO store it on DB using calculation formulas
    case @season.id
    when 141 # CSI 2014/2015
      # Balanced individual ranking
      @individual_ranking = BalancedIndividualRankingDAO.new( @season )
    when 151 # CSI 2015/2016
      # Enhance individual ranking
      @individual_ranking = EnhanceIndividualRankingDAO.new( @season )
    else # 161.. and over (CSI 2016/2017, ...)
      # Enhance individual ranking
      @individual_ranking = EnhanceIndividualRankingDAO.new( @season )
    end

    # Manage updates for cache
    @ranking_updated_at = @season.meeting_individual_results.exists? ?
      @season.meeting_individual_results.select( "meeting_individual_results.updated_at" ).order(:updated_at).last.updated_at.to_i :
      0
  end


  # PDF rendering for the CSI seasonal individual ranking.
  #
  def printout_indi_ranking_csi
    title = I18n.t('championships.individual_rank') + ' ' + @season_type.get_full_name

    @category_types = @season.category_types.are_not_relays.is_divided.sort_by_age

    # Decides what kind of calculation for the season
    # TODO store it on DB using calculation formulas
    case @season.id
    when 141 # CSI 2014/2015
      # Balanced individual ranking
      @individual_ranking = BalancedIndividualRankingDAO.new( @season )
    when 151 # CSI 2015/2016
      # Enhance individual ranking
      @individual_ranking = EnhanceIndividualRankingDAO.new( @season )
    else # 161.. and over (CSI 2016/2017, ...)
      # Enhance individual ranking
      @individual_ranking = EnhanceIndividualRankingDAO.new( @season )
    end

    # == OPTIONS setup + RENDERING phase ==
    base_filename = I18n.t('championships.individual_rank').gsub(' ', '_').underscore
    filename = create_unique_filename( base_filename ) + '.pdf'
    options = {
      report_title:         title,
      meta_info_subject:    'csi championship individual rankings printout',
      meta_info_keywords:   "Goggles, #{ base_filename }'",
      season:               @season,
      ranking:              @individual_ranking,
      categoriy_types:      @category_types
    }
    send_data(                                      # == Render layout & send data:
        ChampionshipIndiRankingCSILayout.render( options ),
        type: 'application/pdf',
        filename: filename
    )
  end
  #-- -------------------------------------------------------------------------
  #++


  # CSI regional ER all times records
  # CSI ER Regional records doesn't need category split or join
  #
  def records_regional_er_csi
    @title = I18n.t('championships.records') + ' ' + @season_type.get_full_name

    # Prepare record DAO
    @recordDAO = RecordX4DAO.new( @season_type, RecordType.find_by_code( 'FOR' ) )

    # Add records
    IndividualRecord.
     #joins(:swimmer, :category_type, :gender_type, :pool_type, :event_type, [meeting_individual_result: [meeting_program: [meeting_event: [meeting_session: :meeting]]]], season: :season_type).
     joins(:record_type, season: :season_type).
     #includes(:swimmer, :category_type, :gender_type, :pool_type, :event_type, :meeting_individual_result).
     #for_season_type( @season_type.id ).where( gender_type: 1, pool_type: 1 ).limit(50).
     where("record_types.code = 'FOR' and season_types.code = 'MASCSI'", ).#where( gender_type: 1, pool_type: 1 ).
     includes(:swimmer, :category_type, :gender_type, :pool_type, :event_type, [meeting_individual_result: [meeting_program: [meeting_event: [meeting_session: :meeting]]]]).
     each do |record|
      # TODO
      # Manage the fucking 50 specials...
      if !record.category_type.is_undivided
        @recordDAO.add_record(
         record.meeting_individual_result,
         record.category_type,
         record.pool_type,
         record.gender_type,
         record.event_type,
         record.swimmer
        )
        @max_updated_at = record.updated_at if @max_updated_at.nil? || @max_updated_at < record.updated_at
      end
    end

    @highlight_swimmer_id = current_user.swimmer_id if current_user
  end
  #-- -------------------------------------------------------------------------
  #++


  # Season calendar for a given fin supermaster season
  #
  def calendar_supermaster_fin
    @title = I18n.t('championships.calendar') + ' ' + @season.get_full_name

    @calendarMeetingPicker = CalendarMeetingPicker.new( nil, nil, @season )
    @calendarDAO = @calendarMeetingPicker.pick_meetings( 'DESC', false, current_user)

    # TODO
    # Calculate the current page according to the position of meetings
    # for current date
    @meetings = @calendarDAO.get_paginated_meetings( params[:page] || 1 )
  end
  #-- -------------------------------------------------------------------------
  #++

  # Supermaster FIN championship ranking data display manager
  #
  def ranking_supermaster_fin
    @title = @season.get_full_name
  end
  #-- -------------------------------------------------------------------------
  #++

  # Supermaster FIN championship rules viewer
  #
  def rules_supermaster_fin
    @title = @season.get_full_name
  end
  #-- -------------------------------------------------------------------------
  #++

  # Past seasons championships ranking data display manager
  # for FIN supermaster championships (closed seasons)
  #
  def history_supermaster_fin
    @title = I18n.t('championships.history_title') + ' ' + @season_type.get_full_name

    #championship_history_manager = ChampionshipHistoryManager.new( current_season_type )
    #@championship_history_manager = championship_history_manager.get_season_ranking_history
  end
  #-- -------------------------------------------------------------------------
  #++


  # Season calendar for a given regional er uisp season
  #
  def calendar_regional_er_uisp
    @title = I18n.t('championships.calendar') + ' ' + @season.get_full_name
  end
  #-- -------------------------------------------------------------------------
  #++

  # Supermaster FIN championship ranking data display manager
  #
  def ranking_regional_er_uisp
    @title = @season.get_full_name
  end
  #-- -------------------------------------------------------------------------
  #++

  # Supermaster FIN championship rules viewer
  #
  def rules_regional_er_uisp
    @title = @season.get_full_name
  end
  #-- -------------------------------------------------------------------------
  #++

  # Past seasons championships ranking data display manager
  # for FIN supermaster championships (closed seasons)
  #
  def history_regional_er_uisp
    @title = I18n.t('championships.history_title') + ' ' + @season_type.get_full_name

    #championship_history_manager = ChampionshipHistoryManager.new( current_season_type )
    #@championship_history_manager = championship_history_manager.get_season_ranking_history
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Verifies that a season id is provided as parameter; otherwise
  # use the current season according to chosen season type
  # Assigns the @season instance.
  # Use for FIN supermaster
  #
  # == Params:
  # id: the season id to be processed by most of the methods (see before filter above)
  #
  def verify_parameter_supermaster_fin
    prepare_parameters( 'MASFIN' )
  end

  # Verifies that a season id is provided as parameter; otherwise
  # use the current season according to chosen season type
  # Assigns the @season instance.
  # Use for CSI regional er
  #
  # == Params:
  # id: the season id to be processed by most of the methods (see before filter above)
  #
  def verify_parameter_regional_er_csi
    prepare_parameters( 'MASCSI' )
  end

  # Verifies that a season id is provided as parameter; otherwise
  # use the current season according to chosen season type
  # Assigns the @season instance.
  # Use for UISP regional er
  #
  # == Params:
  # id: the season id to be processed by most of the methods (see before filter above)
  #
  def verify_parameter_regional_er_uisp
    prepare_parameters( 'MASUISP' )
  end
  #-- -------------------------------------------------------------------------
  #++

  # Verifies that a season id is provided as parameter; otherwise
  # use the current season according to chosen season type
  # Assigns the @season instance.
  # Use for CSI regional er
  #
  # == Params:
  # id: the season id to be processed by most of the methods (see before filter above)
  #
  def prepare_parameters( season_type_code )
    set_season_type( season_type_code )
    @season = Season.find_by_id( params[:id] )

    # We can either set the season with the default current one, according to the
    # season type code specified, or we can specify directly a Season :id; in this
    # case, we must check that the season exists & has the same type specified by
    # the parameter:
    is_correct_season = if params[:id].present?
      # The tuple season & season_type must be correct:
      @season_type.present? && @season.present? && (@season.season_type.id == @season_type.id)
    else
      # In this case, we'll default to the current season for this type:
      @season_type.present?
    end

    unless ( is_correct_season )
# DEBUG
#      puts "\r\n- prepare_parameters(#{season_type_code}): NO @season_type"
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_back( fallback_location: root_path ) and return
    end

    # Use the specified season :id or default to the current one:
    unless ( @season )
      # Find current season when no direct Season.id is specified:
      @current_season_id = Season.get_last_season_by_type( @season_type.code ).id
      set_season( @current_season_id )

      # Last check regarding the existance of the Season (in case we had to use the current one):
      unless ( @season )
# DEBUG
#        puts "\r\n- prepare_parameters(#{season_type_code}): NO @season; params[:id]: '#{params[:id]}', season_id: #{ season_id }, @current_season_id: #{ @current_season_id }"
        flash[:error] = I18n.t(:invalid_action_request)
        redirect_back( fallback_location: root_path ) and return
      end
    end
  end


  # Verifiy if user is logged and associated to a swimmer and sets preselection
  # of team
  # Assumes season_type already assigned
  #
  def set_team
    # Find preselected team if user logged in and associated to a swimmer
    # and the team associated to actual season_type
    if current_user && current_user.swimmer
      swimmer = current_user.swimmer
      @team = swimmer.teams.joins(:badges).where(['badges.season_id = ?', @season.id]).first
    end
  end


  # Sets season type instance
  #
  # Params:
  # season_type_code: the code of the season type to process
  #
  def set_season_type( season_type_code )
    @season_type = SeasonType.find_by_code(season_type_code)
  end


  # Sets season instance
  #
  # Params:
  # season_id: the season id to be processed by most of the methods (see before filter above)
  #
  def set_season( season_id )
    @season = Season.find_by_id( season_id )
    # Verify coherent season_type:
    ( @season && (@season.season_type_id == @season_type.id) ? @season : nil )
  end
  #-- -------------------------------------------------------------------------
  #++
end
