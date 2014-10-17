# encoding: utf-8
require 'common/format'


=begin

= ChampionshipsController

  - version:  4.00.532
  - author:   Leega

=end
class ChampionshipsController < ApplicationController
  # Parse parameters:
  before_filter :verify_parameter, except: [:history_regional_er_csi, :history_supermaster_fin]
  #-- -------------------------------------------------------------------------
  #++

  # Supermaster FIN championship ranking data display manager
  #
  def supermaster_fin
    @title = @season.get_full_name
  end
  #-- -------------------------------------------------------------------------
  #++

  # CSI Regional Emilia Romagna championship ranking data display manager
  #
  def regional_er_csi
    @title = @season.get_full_name

    championship_calculator = ChampionshipRankingCalculator.new( @season )
    @championship_ranking = championship_calculator.get_season_ranking 
  end
  #-- -------------------------------------------------------------------------
  #++

  # Past seasons championships ranking data display manager
  # for CSI regional ER championships (closed seasons)
  #
  def history_regional_er_csi
    # TODO Use the current season
    #current_season_type = @season.season_type
    current_season_type = SeasonType.find_by_code('MASCSI')
    
    @title = I18n.t('championships.history_title') + ' ' + current_season_type.get_full_name     

    championship_history_manager = ChampionshipHistoryManager.new( current_season_type )
    @championship_history_manager = championship_history_manager.get_season_ranking_history
    @seasons_hall_of_fame = championship_history_manager.get_season_hall_of_fame
  end
  #-- -------------------------------------------------------------------------
  #++

  # Past seasons championships ranking data display manager
  # for FIN supermaster championships (closed seasons)
  #
  def history_supermaster_fin
    current_season_type = SeasonType.find_by_code('MASFIN')
    
    @title = I18n.t('championships.history_title') + ' ' + current_season_type.get_full_name     

    #championship_history_manager = ChampionshipHistoryManager.new( current_season_type )
    #@championship_history_manager = championship_history_manager.get_season_ranking_history 
  end
  #-- -------------------------------------------------------------------------
  #++

  private


  # Verifies that a season id is provided as parameter; otherwise
  # use the current season according to chosen season type 
  # Assigns the @season instance.
  #
  # == Params:
  # id: the season id to be processed by most of the methods (see before filter above)
  #
  def verify_parameter
    set_season
    unless ( @season )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to(:back) and return
    end
  end

  # Verifies that a swimmer id is provided as a parameter to this controller.
  # Assigns the @swimmer instance when successful.
  #
  # == Controller Params:
  # id: the swimmer id to be processed by most of the methods (see before filter above)
  #
  def set_season
    # TODO Find current FIN season
    # TODO Find current CSI season
    # Maybe we should set season type by the menu item chosen
    #season_id = params[:id].to_i
    season_id = 131
    
    @season = Season.find_by_id( season_id )
  end
  #-- -------------------------------------------------------------------------
  #++
end
