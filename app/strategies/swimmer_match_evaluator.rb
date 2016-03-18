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
  
  
end
