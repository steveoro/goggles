#
# == ChampionshipHistoryManager
#
# Strategy Pattern implementation for Championship history management
#
# @author   Leega
# @version  4.00.550
#
class ChampionshipHistoryManager

  # Initialization
  #
  def initialize
  end
  #-- --------------------------------------------------------------------------
  #++

  # Get closed seasons
  # 
  def get_closed_seasons
    @closed_seasons ||= retrieve_closed_seasons
  end
  #-- --------------------------------------------------------------------------
  #++
  

  private

  # Retrieves season closed
  # The season closed are those with... ?!?
  # TODO Decide where a season is closed. Should be different from season end date
  #      Has to indicate where season championship is over. 
  #      Maybe should store closed championship final ranking in a delegate structure
  #
  def retrieve_closed_seasons
    Season.where(['end_date < ?', Date.today]).sort_season_by_begin_date('DESC')
  end
  #-- --------------------------------------------------------------------------
  #++
end
