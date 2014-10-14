# encoding: utf-8
require 'common/format'


=begin

= ChampionshipsController

  - version:  4.00.532
  - author:   Leega

=end
class ChampionshipsController < ApplicationController
  # Supermaster FIN championship ranking data display manager
  #
  def supermaster_fin
    # TODO Find current FIN season
    current_season = Season.find(142)
    
    @title = current_season.get_full_name
  end
  #-- -------------------------------------------------------------------------
  #++

  # CSI Regional Emilia Romagna championship ranking data display manager
  #
  def regional_er_csi
    # TODO Find current CSI season
    current_season = Season.find(131)
    
    @title = current_season.get_full_name

    championship_calculator = ChampionshipRankingCalculator.new( current_season )
    @championship_ranking = championship_calculator.get_season_ranking 
  end
  #-- -------------------------------------------------------------------------
  #++

  # Past seasons championships ranking data display manager
  # for CSI regional ER championships (closed seasons)
  #
  def history_regional_er_csi
    current_season_type = SeasonType.find_by_code('MASCSI')
    
    @title = I18n.t('championships.history_title') + ' ' + current_season_type.get_full_name     

    championship_history_manager = ChampionshipHistoryManager.new( current_season_type )
    @championship_history_manager = championship_history_manager.get_season_ranking_history 
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
end
