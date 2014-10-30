# encoding: utf-8
require 'common/format'


=begin

= ChampionshipsController

  - version:  4.00.532
  - author:   Leega

=end
class ChampionshipsController < ApplicationController
  # Parse parameters:
  before_filter :verify_parameter_regional_er_csi, except: [:ranking_supermaster_fin, :calendar_supermaster_fin, :history_supermaster_fin]
  before_filter :verify_parameter_supermaster_fin, except: [:ranking_regional_er_csi, :calendar_regional_er_csi, :history_regional_er_csi]
  #-- -------------------------------------------------------------------------
  #++

  # CSI Regional Emilia Romagna championship ranking data display manager
  #
  def ranking_regional_er_csi
    @title = I18n.t('championships.team_ranking') + ' ' + @season.get_full_name

    championship_calculator = ChampionshipRankingCalculator.new( @season )
    @championship_ranking = championship_calculator.get_season_ranking 
  end
  #-- -------------------------------------------------------------------------
  #++

  # Season calendar for a given regonal er CSI season
  #
  def calendar_regional_er_csi
    @title = I18n.t('championships.calendar') + ' ' + @season.get_full_name
    
    # Collect calendarDAO for each season meetings
    @season_meetings_calendar = []
    @season.meetings.sort_by_date.each do |meeting|
      @season_meetings_calendar << CalendarDAO.new( meeting )
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Past seasons championships ranking data display manager
  # for CSI regional ER championships (closed seasons)
  #
  def history_regional_er_csi
    @title = I18n.t('championships.history_title') + ' ' + @season_type.get_full_name     

    championship_history_manager = ChampionshipHistoryManager.new( @season_type )
    @championship_history_manager = championship_history_manager.get_season_ranking_history
    @seasons_hall_of_fame = championship_history_manager.get_season_hall_of_fame
  end

  # Supermaster FIN championship ranking data display manager
  #
  def ranking_supermaster_fin
    @title = @season.get_full_name
  end
  #-- -------------------------------------------------------------------------
  #++

  # Season calendar for a given supermaster season
  #
  def calendar_supermaster_fin
    @title = I18n.t('championships.calendar') + ' ' + @season.get_full_name     
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
    set_season_type( 'MASFIN' )
    unless ( @season_type )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to(:back) and return
    end

    # TODO Find current FIN season
    @current_season_id = 142
    
    # Use given season or, in no selection, current one 
    season_id = ( params[:id] ? params[:id].to_i : @current_season_id )

    set_season( season_id )
    unless ( @season )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to(:back) and return
    end
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
    set_season_type( 'MASCSI' )
    unless ( @season_type )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to(:back) and return
    end

    # TODO Find current CSI season
    @current_season_id = 141
    
    # Use given season or, in no selection, current one 
    season_id = ( params[:id] ? params[:id].to_i : @current_season_id )

    set_season( season_id )
    unless ( @season )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to(:back) and return
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
  end
  #-- -------------------------------------------------------------------------
  #++
end
