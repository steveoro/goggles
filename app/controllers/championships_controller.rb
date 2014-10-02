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
    # TODO Use description of current FIN season
    @title = 'CSI - Circuito regionale master Emilia Romagna 2014-2015'    
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
