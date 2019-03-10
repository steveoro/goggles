require 'wrappers/timing'

#
# == RelaySwimmersCombiner
#
# Pattern to find out available relay swimmer 
# and combine them into possible relays for a given meeting relay
# Available relay swimmers are those reserved for relays in the given meeting relay
# 
#
# @author   Leega
# @version  6.093
#
class RelaySwimmersCombiner

  # These must be initialized on creation:
  attr_reader :team, :meeting_event

  # These can be edited later on:
  attr_accessor :default_points 

  # Initialization
  #
  def initialize( team, meeting_event )
    @team          = team
    @meeting_event = meeting_event
    @meeting       = @meeting_event.meeting_session.meeting
    @relay_type    = @meeting_event.event_type
    @pool_type     = @meeting_event.meeting_session.pool_type
    @relay_phases  = get_event_types
        
    @default_points      = 700

    @male_swimmers   = []
    @female_swimmers = []
  end
  #-- --------------------------------------------------------------------------
  #++
  
  # Retreive given gender type swimmers from reservations
  #
  def retreive_swimmers( gender_type_id = 1 )
    @meeting_event.meeting_relay_reservations.joins(:swimmer).where(["meeting_relay_reservations.is_doing_this and swimmers.gender_type_id = ?", gender_type_id]).select(:swimmer_id).map{|e|e.swimmer_id}
  end
  #-- --------------------------------------------------------------------------
  #++

  # Find swimmer suggested time
  # Assumes tha a swimmer has a valid badge for the meeting
  #
  def find_suggested_time( swimmer, badge, use_default = false, phase = 0 )
    event_type = @relay_phases[phase][0]
    
    # Check for suggested time (searche usimg method set on badge prefernces)
    best_finder = SwimmerPersonalBestFinder.new( swimmer )
    suggested_time = best_finder.get_entry_best_timing(
      badge,
      @meeting,
      event_type,
      @pool_type,
      true # convert_pool_type
    )
    
    # If non suggested time found and should use default, calculate default
    if suggested_time == nil && use_default
      score_calculation = ScoreCalculator.new( @meeting.season, swimmer.gender_type, badge.category_type, @pool_type, event_type )
      suggested_time = score_calculation.get_fin_timing( @default_points )
    end
    suggested_time
  end
  #-- --------------------------------------------------------------------------
  #++

  # Check out swimmer's suggested times for all relay phases
  #
  def load_phases_suggested_times( swimmer_id )
    swimmer        = Swimmer.find( swimmer_id )
    badge          = swimmer.badges.where( season_id: @meeting.season_id ).first
    swimmer_phases = []
    
    # Cicle all relay phases
    @relay_phases.each_with_index do |phase,index|
      swimmer_phases << find_suggested_time( swimmer, badge, use_default = phase[1], index )
    end
    swimmer_phases
  end
  #-- --------------------------------------------------------------------------
  #++
  
  # Creates swimmer elements matrix
  # Each row contains swimmer_id, age at 31/12, gender_type, suggested time for each distinct relay phase
  #
  def create_swimmers_matrix()
    
  end

  private
  
  # Find the phases event_types for given relay event
  # Returns an array withe event_type and use_defualt settings for suggested time scan
  #
  def get_event_types
    phase_distance    = @relay_type.phase_length_in_meters
    phase_stroke_code = @relay_type.stroke_type.code
    event_types       = []
     
    case phase_stroke_code
    when 'MX'
      event_types << [EventType.find_by_code("#{phase_distance.to_s}DO"), false] 
      event_types << [EventType.find_by_code("#{phase_distance.to_s}RA"), false]
      event_types << [EventType.find_by_code("#{phase_distance.to_s}FA"), false]
      event_types << [EventType.find_by_code("#{phase_distance.to_s}SL"), true]
    else
      event_types << [EventType.find_by_code("#{phase_distance.to_s}#{phase_stroke_code}"), true] 
    end
    
    event_types     
  end
  #-- --------------------------------------------------------------------------
  #++
  
end
