# encoding: utf-8

=begin

= SwimmerMatchEvaluator
  - Goggles framework vers.:  4.00.857
  - author: Leega

 Utility class to evaluate swimmers match
 A swimmers match is a meeting program in which the target swimmers have competed
 Return data in SwimmerMatchDAO format
 Locale swimmer is the swimmer who request the evaluation
 Visitor swimmer is the target swimmer to be evaluated 

=end
class SwimmerMatchEvaluator
  # These must be initialized on creation:
  attr_reader :locale_swimmer

  # These can be edited later on:
  attr_accessor :visitor_swimmer 

  # Creates a new instance.
  # Note the ascending precision of the parameters, which allows to skip
  # the rarely used ones.
  #
  def initialize( locale_swimmer )
    unless locale_swimmer && locale_swimmer.instance_of?( Swimmer )
      raise ArgumentError.new("Swimmer match evaluation needs a valid locale swimmer")
    end

    @locale_swimmer  = locale_swimmer 
    @visitor_swimmer = nil 
  end
  
  # Sets the target visitor swimmer
  # The visitor swimmer shuld be of the same gender of locale
  # and the year of birth difference should be < 5
  #
  # Returns true if visitor swimmer set
  #
  def set_visitor( visitor_swimmer )
    if visitor_swimmer && 
     visitor_swimmer.instance_of?( Swimmer ) &&
     visitor_swimmer.gender_type == @locale_swimmer.gender_type &&
     (visitor_swimmer.year_of_birth - @locale_swimmer.year_of_birth).abs < 5  
      @visitor_swimmer = visitor_swimmer
      true
    else
      false
    end
  end

  # Search if locale and visitor swimmer has ever swam in the
  # same meeting_program
  #
  def has_matches?( visitor_swimmer = @visitor_swimmer )
    @locale_swimmer.meeting_programs.count > 0 &&
     visitor_swimmer && visitor_swimmer.id &&
     @locale_swimmer.meeting_programs.where(['exists (select 1 from meeting_individual_results mir join swimmers s on s.id = mir.swimmer_id where s.id = ? and mir.meeting_program_id = meeting_programs.id)', visitor_swimmer.id]).count > 0
  end
  
  # Search if locale and visitor swimmer has ever swam in the
  # same meeting_program for a given event type
  #
  def has_matches_on_event?( event_type, visitor_swimmer = @visitor_swimmer )
    @locale_swimmer.meeting_programs.count > 0 &&
     visitor_swimmer && visitor_swimmer.id &&
     @locale_swimmer.meeting_programs.includes( :meeting_event ).where(['meeting_events.event_type_id = ? and exists (select 1 from meeting_individual_results mir join swimmers s on s.id = mir.swimmer_id where s.id = ? and mir.meeting_program_id = meeting_programs.id)', event_type.id, visitor_swimmer.id]).count > 0
  end
  
  # Scan for meeting_programs in which locale and visitor are
  # all present
  #
  def get_matches
    @locale_swimmer.meeting_programs.includes( :meeting, :event_type ).where(['exists (select 1 from meeting_individual_results mir join swimmers s on s.id = mir.swimmer_id where s.id = ? and mir.meeting_program_id = meeting_programs.id)', @visitor_swimmer.id]) if has_matches?
  end
  
  # Scan for meeting_programs in which locale and visitor are
  # all present for given event_types
  #
  def get_matches_for_event( event_type )
    
  end
end
