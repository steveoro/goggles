# encoding: utf-8

=begin

= MeetingStatDAO
  - Goggles framework vers.:  4.00.175.20140210
  - author: Leega

 Utility class to get meeting stats from meeting results or entries.

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
class MeetingStatDAO
  class TeamMeetingStatDAO
    # These must be initialized on creation:
    attr_reader :team
  
    # These can be edited later on:
    attr_accessor :male_entries,      :female_entries, 
                  :male_results,      :female_results,
                  :male_swimmers,     :female_swimmers,
                  :male_ent_swimmers, :female_ent_swimmers,
                  :male_best,         :female_best,
                  :male_worst,        :female_worst,
                  :male_average,      :female_average

    # Creates a new instance.
    # Note the ascending precision of the parameters, which allows to skip
    # the rarely used ones.
    #
    def initialize( team )
      unless team && team.instance_of?( Team )
        raise ArgumentError.new("Team meeting stat needs a valid team")
      end
  
      @team                = team
      @male_entries        = 0
      @female_entries      = 0
      @male_ent_swimmers   = 0
      @female_ent_swimmers = 0
      @male_results        = 0
      @female_results      = 0
      @male_swimmers       = 0
      @female_swimmers     = 0
      @male_best           = 0
      @male_worst          = 0
      @male_average        = 0
      @female_best         = 0
      @female_worst        = 0
      @female_average      = 0
    end
    
    def get_entries_count
      @male_entries + @female_entries
    end
    
    def get_results_count
      @male_results + @female_results
    end
    
    def get_swimmers_count
      @male_swimmers + @female_swimmers
    end
  end
  # ---------------------------------------------------------------------------

  # These must be initialized on creation:
  attr_reader :meeting

  # These can be edited later on:
  attr_accessor :generals, :teams, :categories, :events

  # Creates a new instance.
  # Note the ascending precision of the parameters, which allows to skip
  # the rarely used ones.
  #
  def initialize( meeting )
    unless meeting && meeting.instance_of?( Meeting )
      raise ArgumentError.new("Meeting stat needs a valid meeting")
    end

    @meeting    = meeting
    @generals   = prepare_generals
    @teams      = []
    @categories = []
    @events     = []
  end
  # ---------------------------------------------------------------------------

  def get_meeting
    @meeting
  end
  # ---------------------------------------------------------------------------

  # Sum male and female entered swimmers count
  #
  def get_entered_swimmers_count
    @generals[:ent_swimmers_male_count] + @generals[:ent_swimmers_female_count]
  end
  
  # Sum male and female entries count
  #
  def get_entries_count
    @generals[:entries_male_count] + @generals[:entries_female_count]
  end  
  # ---------------------------------------------------------------------------


  # Sum male and female swimmers count
  #
  def get_swimmers_count
    @generals[:swimmers_male_count] + @generals[:swimmers_female_count]
  end
  
  # Sum male and female results count
  #
  def get_results_count
    @generals[:results_male_count] + @generals[:results_female_count]
  end  
  
  # Sum male and female disqualified count
  #
  def get_disqualifieds_count
    @generals[:dsqs_male_count] + @generals[:dsqs_female_count] 
  end  
  # ---------------------------------------------------------------------------

  # Sum male and female disqualified count
  #
  def new_team( team )
    TeamMeetingStatDAO.new( team )
  end
  # ---------------------------------------------------------------------------
  
  # Create a team hash with entry data
  #
  def get_team_entries
    teams_array = []
    @meeting.teams.uniq.each do |team|
      team_hash = {}
      team_hash[:team] = team
      team_hash[:males] = @meeting.meeting_entries.for_team(team).is_female.includes(:swimmers).select('swimmers.id').uniq.count
      team_hash[:females] = @meeting.meeting_entries.for_team(team).is_male.includes(:swimmers).select('swimmers.id').uniq.count
      team_hash[:males_entries] = @meeting.meeting_entries.for_team(team).is_male.count
      team_hash[:females_entries] = @meeting.meeting_entries.for_team(team).is_female.count
      teams_array << team_hash 
    end
    teams_array
  end  
  # ---------------------------------------------------------------------------

  private
  
  def prepare_generals
    generals = Hash.new
    generals[:ent_swimmers_male_count]   = 0
    generals[:ent_swimmers_female_count] = 0
    generals[:entries_male_count]        = 0
    generals[:entries_female_count]      = 0
    generals[:ent_team_count]            = 0

    # Result-based
    generals[:swimmers_male_count]    = 0
    generals[:swimmers_female_count]  = 0
    generals[:results_male_count]     = 0
    generals[:results_female_count]   = 0
    generals[:teams_count]            = 0
    generals[:oldest_male_swimmers]   = []
    generals[:oldest_female_swimmers] = []

    # Score-based
    generals[:dsqs_male_count]         = 0
    generals[:dsqs_female_count]       = 0
    generals[:average_male_score]      = 0
    generals[:average_female_score]    = 0
    generals[:average_total_score]     = 0
    generals[:over_1000_count]         = 0
    generals[:over_950_count]          = 0
    generals[:over_900_count]          = 0
    generals[:best_std_male_scores]    = []
    generals[:best_std_female_scores]  = []
    generals[:worst_std_male_scores]   = []    
    generals[:worst_std_female_scores] = []
    
    generals    
  end

  
  # Override standard one using hash elements keys as methods
  #
  def method_missing( method, *args )
    key_name = method.to_s
    
    # Remove = for setter requests
    if key_name.end_with?('=')
      key_name.chop!
    end

    # Remove get/set for requests
    if key_name.start_with?('get_') || key_name.start_with?('set_') 
      key_name.slice!(0..3)
    end
     
    @generals.has_key?( key_name.to_sym ) ? @generals[key_name.to_sym] : BasicObject.send( :method_missing, method, *args )  
  end  
  # ---------------------------------------------------------------------------
end
