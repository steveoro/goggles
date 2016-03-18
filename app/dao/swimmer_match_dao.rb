# encoding: utf-8

=begin

= SwimmerMatchDAO
  - Goggles framework vers.:  4.00.859.20160312
  - author: Leega

 Utility class to get swimmer "match" data.

=== Members:
 - <tt>:swimmer_male_count</tt> => Count of male swimmers with result
 - <tt>:result_male_count_count</tt> => Count of male total results 
 - <tt>:oldest_male_swimmer</tt> => Oldest male swimmer with result 
 - <tt>:disqualified_male_count</tt> => Count of male disqualified results
 - <tt>:swimmer_female_count</tt> => Count of male swimmers with result
 - <tt>:result_female_count</tt> => Count of male total results
 - <tt>:oldest_female_swimmer</tt> => Oldest male swimmer with result 
 - <tt>:disqualified_female_count</tt> => Count of female disqualified results

=end
class SwimmerMatchDAO
  class SwimmerMatchProgramDAO
    # These must be initialized on creation:
    #attr_reader
  
    # These can be edited later on:
    attr_accessor :description, :locale_result, :visitor_result 

    # Creates a new instance.
    # Note the ascending precision of the parameters, which allows to skip
    # the rarely used ones.
    #
    def initialize( description = nil )
      @description     = description
      @locale_result   = nil
      @visitor_result  = nil
    end
    
    # Gets the description of the match result
    # If no alternative description returns the locale result one
    def get_description
      if @description
        @description
      else
        if @locale_result
          @locale_result.get_full_name
        else
          '?'
        end
      end
    end
  end
  # ---------------------------------------------------------------------------

  # These must be initialized on creation:
  attr_reader :locale, :visitor

  # These can be edited later on:
  attr_accessor :wons, :losses, :neutrals

  # Creates a new instance.
  # Note the ascending precision of the parameters, which allows to skip
  # the rarely used ones.
  #
  def initialize
    @locale   = nil
    @visitor  = nil
    @wons     = []
    @losses   = []
    @neutrals = []
  end
  # ---------------------------------------------------------------------------

  # Sets the locale swimmer
  # 
  def set_locale( locale_swimmer )
    @locale = locale_swimmer if locale_swimmer && locale_swimmer.instance_of?( Swimmer )
  end
  # ---------------------------------------------------------------------------

  # Sets the visitor swimmer
  # 
  def set_visitor( visitor_swimmer )
    @visitor = visitor_swimmer if visitor_swimmer && visitor_swimmer.instance_of?( Swimmer )
  end
  # ---------------------------------------------------------------------------

  # Gets the locale swimmer
  # 
  def get_locale
    @locale
  end
  # ---------------------------------------------------------------------------

  # Gets the locale swimmer
  # 
  def get_visitor
    @visitor
  end
  # ---------------------------------------------------------------------------

  # Gets the wons matches count
  # 
  def get_wons_count
    @wons.size
  end
  # ---------------------------------------------------------------------------

  # Gets the losses matches count
  # 
  def get_losses_count
    @losses.size
  end
  # ---------------------------------------------------------------------------

  # Gets the neutrals matches count
  # 
  def get_neutrals_count
    @neutrals.size
  end
  # ---------------------------------------------------------------------------

  # Gets the total matches count
  # 
  def get_matches_count
    get_wons_count + get_losses_count + get_neutrals_count 
  end
  # ---------------------------------------------------------------------------
  
  # Add a couple of results in the appropriate collection
  #   If locale better than visitor add to the wons
  #   if locale worst than visitor add to the losses
  #   else add to the neutrals
  # Returns the matche count
  #
  # If locale result already present, nothing done
  #
  # If results not valid nothing is done and returns -1
  #
  def add_match( locale_result, visitor_result, description = nil )
    # Check if results are valids
    if locale_result && 
     locale_result.instance_of?( MeetingIndividualResult ) &&
     locale_result.swimmer == @locale &&
     visitor_result && 
     visitor_result.instance_of?( MeetingIndividualResult ) &&
     visitor_result.swimmer == @visitor
      locale_timing  = locale_result.is_disqualified ? 999999999999 : locale_result.get_timing_instance.to_hundreds
      visitor_timing = visitor_result.is_disqualified ? 999999999999 : visitor_result.get_timing_instance.to_hundreds

      match = SwimmerMatchProgramDAO.new( description )
      match.locale_result = locale_result
      match.visitor_result = visitor_result
      
      # Verify reults timing
      # locale better than visitor
      if locale_timing < visitor_timing
        matches = add_match_to_collection( match, @wons )
      elsif locale_timing > visitor_timing
        matches = add_match_to_collection( match, @losses )
      else
        matches = add_match_to_collection( match, @neutrals )
      end
      matches > 0 ? get_matches_count : matches 
    else
      -1
    end
  end
  
  private
  
  # Adds a program DAO to a give collection
  # Retruns 0 if already present
  # Returns the collectyion matches number if added
  #
  def add_match_to_collection( match, collection )
    if collection.rindex{ |e| e.locale_result == match.locale_result && e.visitor_result == match.visitor_result }
      0
    else
      collection << match
      collection.count
    end 
  end
end
