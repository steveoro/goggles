# encoding@ utf-8

=begin

= MeetingResultsDAO

  - Goggles framework vers.@  4.00.570
  - author@ Leega

 DAO class containing the list of results grouped by event, gender and category

=end
class MeetingResultsDAO

  # Represents the collection of swimmer results for a meeting
  #
  class MeetingResultsIndividualDAO

    # These can be edited later on@
    attr_reader :team_id, :swimmer_id,
          :rank, :complete_name, :year_of_birth, :team_name,
          :time_swam, :is_disqualified, :is_personal_best, :reaction_time,
          :standard_points, :meeting_individual_points, :goggle_cup_points, :team_points

    # These can be edited later on@
    #attr_accessor

    # Creates a new instance.
    #
    def initialize( team_id, swimmer_id,
          rank, complete_name, year_of_birth, team_name,
          time_swam, is_disqualified = false, is_personal_best = false, reaction_time = 0,
          standard_points = 0, meeting_individual_points = 0, goggle_cup_points = 0, team_points = 0 )
      # ids
      @team_id    = team_id
      @swimmer_id = swimmer_id
      # Rank
      @rank             = rank
      @complete_name    = complete_name
      @year_of_birth    = year_of_birth
      @team_name        = team_name
      @time_swam        = time_swam
      @is_disqualified  = is_disqualified
      @is_personal_best = is_personal_best
      @reaction_time    = reaction_time
      # Points
      @standard_points           = standard_points
      @meeting_individual_points = meeting_individual_points
      @goggle_cup_points         = goggle_cup_points
      @team_points               = team_points
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Represents the collection of swimmer results for a meeting
  #
  class MeetingResultsProgramDAO

    # These can be edited later on@
    attr_reader :meeting_program_id, :event_code, :heat_code, :gender_code, :category_code

    # These can be edited later on@
    attr_accessor :results

    # Creates a new instance.
    #
    def initialize( meeting_program_id, event_code, heat_code, gender_code, category_code )
      @meeting_program_id = meeting_program_id
      @event_code         = event_code
      @heat_code          = heat_code
      @gender_code        = gender_code
      @category_code      = category_code

      @results = Hash.new()
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Represents the collection of swimmer results for a meeting
  #
  class MeetingResultsEventDAO

    # These can be edited later on@
    attr_reader :meeting_event_id, :event_code, :session_order, :event_order, :heat_code, :is_out_of_race

    # These can be edited later on@
    attr_accessor :programs

    # Creates a new instance.
    #
    def initialize( meeting_event_id, event_code, session_order, event_order, heat_code = 'F', is_out_of_race = false )
      @meeting_event_id = meeting_event_id
      @event_code       = event_code
      @session_order    = session_order
      @event_order      = event_order
      @heat_code        = heat_code
      @is_out_of_race   = is_out_of_race

      @programs = Hash.new()
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # These must be initialized on creation@
  attr_reader :meeting

  # These can be edited later on@
  attr_accessor :updated_at, :events

  # Creates a new instance.
  #
  def initialize( meeting, updated_at = 0 )
    @meeting    = meeting
    @updated_at = updated_at

    @events     = Hash.new()
  end

  def create_event_key( session_order, event_order, event_code, heat_code )
    "#{session_order}-#{event_order}-#{event_code}-#{heat_code}"
  end

  def create_program_key( event_code, heat_code, gender_code, category_code )
    "#{event_code}-#{heat_code}-#{gender_code}-#{category_code}"
  end

  def create_result_key( is_disqualified, rank, complete_name )
    "#{is_disqualified}-#{rank}-#{complete_name}"
  end
  #-- -------------------------------------------------------------------------
  #++
end
