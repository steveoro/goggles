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
  # == Params:
  # An instance of season_type
  #
  def initialize( season_type )
    @season_type = season_type
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
  
  # Get stored ranking for the given sesason
  #
  # Parameters
  # rank_position => Number of rank positions to save (default first 3)
  # 
  def get_season_ranking_history( rank_position = 3 )
    @seasons_ranking_history ||= retrieve_season_ranking_history(rank_position)
  end
  #-- --------------------------------------------------------------------------
  #++


  private

  # Retrieves season closed
  # The season closed are those with... ?!?
  # TODO Decide where a season is closed. Should be different from season end date
  #      Has to indicate where season championship is over. 
  #      Maybe should store closed championship final ranking in a delegate structure
  # TODO Make it a scope of season
  #
  def retrieve_closed_seasons
    @season_type.seasons.where(['end_date < ?', Date.today]).sort_season_by_begin_date('DESC')
  end
  #-- --------------------------------------------------------------------------
  #++
  
  # Retrieves closed season ranking history
  # and stores in an array of hashes
  # with season and ranking keys
  #
  # Parameters
  # rank_position => Number of rank positions to save
  #
  def retrieve_season_ranking_history( rank_position )
    seasons_ranking_history = []
    get_closed_seasons if not @closed_seasons
    
    @closed_seasons.each do |season|
      season_ranking_history = Hash.new
      season_ranking_history[:season] = season
      season_ranking_history[:ranking] = season.computed_season_ranking.includes(:team).sort_by_rank.limit(rank_position)
      seasons_ranking_history << season_ranking_history 
    end
    seasons_ranking_history 
  end
  #-- --------------------------------------------------------------------------
  #++
end
