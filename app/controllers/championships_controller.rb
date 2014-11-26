# encoding: utf-8
require 'common/format'


=begin

= ChampionshipsController

  - version:  4.00.532
  - author:   Leega

=end
class ChampionshipsController < ApplicationController
  # Parse parameters:
  before_filter :verify_parameter_regional_er_csi,  only: [:ranking_regional_er_csi, :calendar_regional_er_csi, :event_ranking_regional_er_csi, :individual_rank_regional_er_csi, :rules_regional_er_csi, :history_regional_er_csi]
  before_filter :verify_parameter_regional_er_uisp, only: [:ranking_regional_er_uisp, :calendar_regional_er_uisp, :rules_regional_er_uisp, :history_regional_er_uisp]
  before_filter :verify_parameter_supermaster_fin,  only: [:ranking_supermaster_fin, :calendar_supermaster_fin, :rules_supermaster_fin, :history_supermaster_fin]
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
    
    # TODO Maybe add a schema with events by meeting
    #          50SL 100SL 200SL 400SL 800SL 50FA...
    # 1a prova  X                 X
    # 2a prova        X     X
    # 3a prova                                X
    # ...
  end
  #-- -------------------------------------------------------------------------
  #++

  # CSI Regional Emilia Romagna championship ranking data display manager
  #
  def ranking_regional_er_csi
    @title = I18n.t('championships.team_ranking') + ' ' + @season.get_full_name

    championship_calculator = ChampionshipRankingCalculator.new( @season )
    @championship_ranking = championship_calculator.get_season_ranking
    set_team
  end
  #-- -------------------------------------------------------------------------
  #++

  # Season rules viewer for a given regonal er CSI season
  #
  def rules_regional_er_csi
    @title = I18n.t('championships.rules') + ' ' + @season.get_full_name
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
    @history_updated_at = @championship_history_manager.max{ |n,p| n[:max_updated_at] <=> p[:max_updated_at] }[:max_updated_at]
  end

  # Seasonal event ranking (gender, category, evet_type)
  # for CSI regional ER championships
  #
  def event_ranking_regional_er_csi
    @title = I18n.t('championships.event_ranking') + ' ' + @season_type.get_full_name
    
    # Check for different event types for the season
    
    # Check for different categories for the season
    @category_types = @season.category_types      
  end

  # Seasonal individual ranking
  # for CSI regional ER championships
  #
  def individual_rank_regional_er_csi
    @title = I18n.t('championships.individual_rank') + ' ' + @season_type.get_full_name     
  end


  # Season calendar for a given fin supermaster season
  #
  def calendar_supermaster_fin
    @title = I18n.t('championships.calendar') + ' ' + @season.get_full_name     
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

  # Verifies that a season id is provided as parameter; otherwise
  # use the current season according to chosen season type 
  # Assigns the @season instance.
  # Use for UISP regional er
  #
  # == Params:
  # id: the season id to be processed by most of the methods (see before filter above)
  #
  def verify_parameter_regional_er_uisp
    set_season_type( 'MASUISP' )
    unless ( @season_type )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to(:back) and return
    end

    # TODO Find current UISP season
    @current_season_id = 145
    
    # Use given season or, in no selection, current one 
    season_id = ( params[:id] ? params[:id].to_i : @current_season_id )

    set_season( season_id )
    unless ( @season )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to(:back) and return
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
      @team = swimmer.teams.joins(:seasons).where(['seasons.season_type_id = ?', @season_type.id]).uniq.first
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
