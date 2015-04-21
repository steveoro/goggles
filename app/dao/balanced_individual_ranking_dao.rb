# encoding: utf-8

=begin

= BalancedIndividualRankingDAO

  - Goggles framework vers.:  4.00.777
  - author: Leega

 DAO class containing the structure for balanced individual ranking rendering.
 Balanced individual ranking (BIR) is a method adopted by csi 2014-2015 season
 in which individual scores are calculated considering placement, seasonal ranking
 and special bonuses

=end
class BalancedIndividualRankingDAO
  
  # Manage the seasonal event ranking best performance
  class SeasonalEventBestDAO
    # These must be initialized on creation:
    attr_reader :season

    # These can be edited later on:
    #attr_accessor :event_type, :rank, :rank_points, :event_bonus_points, season_ranking_points
    #-- -------------------------------------------------------------------------
    #++
  
    # Creates a new instance from a ameeting_indivudla_result.
    #
    def initialize( season )
      unless season
        raise ArgumentError.new("Balanced individual ranking seasonal event best manager needs a season")
      end
      @season = season
    end
    #-- -------------------------------------------------------------------------
    #++
  end

  class BIREventScoreDAO
    # These must be initialized on creation:
    #attr_reader :meeting

    # These can be edited later on:
    attr_accessor :event_type, :rank, :rank_points, :event_bonus_points, :season_ranking_points
    #-- -------------------------------------------------------------------------
    #++
  
    # Creates a new instance from a ameeting_indivudla_result.
    #
    def initialize( meeting_individual_result )
      unless meeting_individual_result
        raise ArgumentError.new("Balanced individual ranking event score needs a meeting individual result")
      end

      @event_type            = meeting_individual_result.event_type
      @rank                  = meeting_individual_result.rank
      @rank_points           = meeting_individual_result.meeting_individual_points
      @event_bonus           = 0
      @season_ranking_points = 0
      
      # Check if result is valid
      # This should be tested before initialize the DAO
      if ! meeting_individual_result.is_out_of_race && ! meeting_individual_result.is_disqualified
        # Find out event bonus
        # TODO store information on DB
        @event_bonus = 8 if @event_type.code = '800SL'
        @event_bonus = 4 if @event_type.code = '400SL'
        @event_bonus = 4 if @event_type.code = '200MI'
        @event_bonus = 4 if @event_type.code = '100FA'
        
        # Calculate season ranking points
      end        
    end
    #-- -------------------------------------------------------------------------
    #++
    
    # Get the total points for the event
    def get_total_points
      @rank_points + @event_bonus + @season_ranking_points
    end
    #-- -------------------------------------------------------------------------
    #++
  end

  # These must be initialized on creation:
  attr_reader :season
  #-- -------------------------------------------------------------------------
  #++

  # Creates a new instance.
  #
  # Needs to  be sure team_scores is an instance of TeamScoreDAO
  # to perform correcto sorting
  #
  def initialize( season )
    unless season
      raise ArgumentError.new("Balanced individual ranking needs a season")
    end
    @season     = season
  end
  #-- -------------------------------------------------------------------------
  #++
end
