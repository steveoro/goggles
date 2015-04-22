# encoding: utf-8

=begin

= BalancedIndividualRankingDAO

  - Goggles framework vers.:  4.00.777
  - author: Leega

 DAO class containing the structure for balanced individual ranking rendering.
 Balanced individual ranking (BIR) is a method adopted by csi 2014-2015 season
 in which individual scores are calculated considering placement, seasonal ranking
 and special bonuses
 For each swimmer involved in season the DAO provides a collection of meeting results
 (the championship takes) 

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
    attr_accessor :event_date, :event_type, 
                  :rank, :event_points, 
                  :ranking_points
    #-- -------------------------------------------------------------------------
    #++
  
    # Creates a new instance from a ameeting_indivudla_result.
    #
    def initialize( meeting_individual_result )
      unless meeting_individual_result && meeting_indivudla_result.instance_of( MeetingIndividualResults )
        raise ArgumentError.new("Balanced individual ranking event score needs a meeting individual result")
      end

      @event_date     = meeting_individual_result.meeting_session.scheduled_date
      @event_type     = meeting_individual_result.event_type
      @rank           = meeting_individual_result.rank
      @event_points   = meeting_individual_result.meeting_individual_points
      @ranking_points = 0
      
      # TODO Calculate season ranking points
    end
    #-- -------------------------------------------------------------------------
    #++
    
    # Get the total points for the event
    def get_total_points
      @event_points + @ranking_points
    end
    #-- -------------------------------------------------------------------------
    #++
  end

  class BIRMeetingScoreDAO
    # These must be initialized on creation:
    attr_reader :meeting

    # These can be edited later on:
    attr_accessor :header_date, 
                  :event_bonus_points, :medal_bonus_points,
                  :event_points, :ranking_points, 
                  :event_results 
    #-- -------------------------------------------------------------------------
    #++
  
    # Creates a new instance from a ameeting_indivudla_result.
    #
    def initialize( meeting, meeting_individual_results )
      unless meeting && meeting.instance_of( Meetings )
        raise ArgumentError.new("Balanced individual ranking meeting score needs a meeting")
      end

      @meeting            = meeting
      @header_date        = meeting.header_date
      @event_bonus_points = 0
      @medal_bonus_points = 0
      @event_points       = 0
      @ranking_points     = 0
      
      @event_results = []
      rank_first     = 0
      rank_second    = 0
      rank_third     = 0
      meeting_individual_results.each do |meeting_individual_result|
        @event_results << BIREventScoreDAO.new( meeting_individual_result )
        
        # Store each rank for rank bonus
        rank_first  = rank_first + 1 if meeting_individual_result.rank == 1
        rank_second = rank_second + 1 if meeting_individual_result.rank == 2
        rank_third  = rank_third + 1 if meeting_individual_result.rank == 3

        # Find out event bonus
        # TODO store bonus information on DB
        @event_bonus_points = 8 if @event_bonus_points < 8 && meeting_individual_result.event_type.code = '800SL'
        @event_bonus_points = 4 if @event_bonus_points < 4 && meeting_individual_result.event_type.code = '400SL'
        @event_bonus_points = 4 if @event_bonus_points < 4 && meeting_individual_result.event_type.code = '200MI'
        @event_bonus_points = 4 if @event_bonus_points < 4 && meeting_individual_result.event_type.code = '100FA'        
      end
      
      # Find out rank bonus
      @rank_bonus_points = 10 if @event_bonus_points < 10 && rank_first >= 2
      @rank_bonus_points = 8 if @event_bonus_points < 8 && rank_first == 1 && rank_second >= 1
      @rank_bonus_points = 6 if @event_bonus_points < 6 && rank_first == 1 && rank_third >= 1
      @rank_bonus_points = 4 if @event_bonus_points < 4 && rank_second >= 2
      @rank_bonus_points = 2 if @event_bonus_points < 2 && rank_second == 1 && rank_third >= 1
      @rank_bonus_points = 1 if @event_bonus_points < 1 && rank_third >= 2
      
      # Find out best event points
      event_total_points = 0
      @event_results.each do |event_result|
        if event_result.get_total_points > event_total_points
          event_total_points = event_result.get_total_points
          @event_points   = event_result.event_points
          @ranking_points = event_result.ranking_points
        end
      end
    end
    #-- -------------------------------------------------------------------------
    #++
  end

  # Each swimmer has a gender and a category
  # Each swimmer has a collection of meetings (results)
  class BIRSwimmerScoreDAO
    # These must be initialized on creation:
    attr_reader :swimmer

    # These can be edited later on:
    attr_accessor :category_type, :gender_type, :meetings 
    #-- -------------------------------------------------------------------------
    #++
  
    # Creates a new instance from a ameeting_indivudla_result.
    #
    def initialize( swimmer, season )
      unless swimmer && swimmer.instance_of( Swimmers )
        raise ArgumentError.new( "Balanced individual ranking swimmer needs a swimmer" )
      end
      unless season && season.instance_of( Seasons )
        raise ArgumentError.new( "Balanced individual ranking swimmer needs a season" )
      end

      @swimmer       = swimmer
      @gender_type   = swimmer.gender_type
      @category_type = swimmer.get_category_type_for_season( season.season_id )
      @meetings      = [] 
      
      # Search meetings for he swimmer in the season
      season.meetings.each do |meeting|
        meeting_individual_results = meeting.meeting_individual_results.is_valid.where(["meeting_individual_results.swimmer_id = ?", @swimmer.id])
        if meeting_individual_results.count > 0
          # The swimmer has results for that meeting
          @meetings << BIRMeetingScoreDAO.new( meeting, meeting_individual_results )
        end
      end
    end
    #-- -------------------------------------------------------------------------
    #++
  end

  # These must be initialized on creation:
  attr_reader :season
  #-- -------------------------------------------------------------------------
  #++

  # These can be edited later on:
  attr_accessor :swimmers 

  # Creates a new instance.
  #
  # Needs to  be sure team_scores is an instance of TeamScoreDAO
  # to perform correcto sorting
  #
  def initialize( season )
    unless season && season.instance_of( Seasons )
      raise ArgumentError.new("Balanced individual ranking needs a season")
    end
    @season = season
    @swimmers = []
    
    # Search swimmers for the season
    season.swimmers.each do |swimmer|
      @swimmer << BIRSwimmerScoreDAO.new( swimmer, season )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
