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
    # TODO Use description of current FIN season
    @title = 'FIN - Circuito italiano supermaster 2014-2015'
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
  #
  def history
    @title = I18n.t('championships.history_title')    
  end
  #-- -------------------------------------------------------------------------
  #++
end
