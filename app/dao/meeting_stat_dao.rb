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
  # These must be initialized on creation:
  attr_reader :meeting

  # These can be edited later on:
  attr_accessor :meeting_stats

  # Creates a new instance.
  # Note the ascending precision of the parameters, which allows to skip
  # the rarely used ones.
  #
  def initialize( meeting )
    unless meeting && meeting.instance_of?( Meeting )
      raise ArgumentError.new("Meeting stat needs a valid meeting")
    end

    @meeting = meeting
    clear
  end

  # Clears the cached results. This method is useful only if the same V2::TokenExtractor
  # instance is used to tokenize different source texts.
  #
  def clear()
    @meeting_stats = Hash.new
    
    # Entry-based
    @meeting_stats[:ent_swimmers_male_count]   = 0
    @meeting_stats[:ent_swimmers_female_count] = 0
    @meeting_stats[:entries_male_count]        = 0
    @meeting_stats[:entries_female_count]      = 0
    @meeting_stats[:ent_team_count]            = 0

    # Result-based
    @meeting_stats[:swimmers_male_count]    = 0
    @meeting_stats[:swimmers_female_count]  = 0
    @meeting_stats[:results_male_count]     = 0
    @meeting_stats[:results_female_count]   = 0
    @meeting_stats[:teams_count]            = 0
    @meeting_stats[:oldest_male_swimmers]   = []
    @meeting_stats[:oldest_female_swimmers] = []

    # Score-based
    @meeting_stats[:dsqs_male_count]         = 0
    @meeting_stats[:dsqs_female_count]       = 0
    @meeting_stats[:average_male_score]      = 0
    @meeting_stats[:average_female_score]    = 0
    @meeting_stats[:average_total_score]     = 0
    @meeting_stats[:over_1000_count]         = 0
    @meeting_stats[:over_950_count]          = 0
    @meeting_stats[:over_900_count]          = 0
    @meeting_stats[:best_std_male_scores]    = []
    @meeting_stats[:best_std_female_scores]  = []
    @meeting_stats[:worst_std_male_scores]   = []    
    @meeting_stats[:worst_std_female_scores] = []    

    # Partials
    @meeting_stats[:teams]      = []    
    @meeting_stats[:events]     = []    
    @meeting_stats[:catgeories] = []    
  end
  # ---------------------------------------------------------------------------

  # Verify if meeting has results
  # Meeting should have are_results_acquired flag set to true
  # and some meeting_individual_results
  # and more than one team partecipating
  #
  def has_results?()
    (( @meeting.are_results_acquired || @meeting.meeting_individual_results.count > 0 ) && @meeting.teams.uniq.count > 1 )
  end

  # Verify if meeting has entries
  # Meeting should have some meeting_entries
  # and more than one entered team
  #
  def has_entries?()
    ( @meeting.meeting_entries.count > 0 && @meeting.meeting_entries.includes(:team).select('teams.id').uniq.count > 1 )
  end

  def calculate( bests = 3, worsts = 1, oldests = 1 )
    # Entry-based
    if has_entries?
      @meeting_stats[:ent_swimmers_male_count]   = get_entered_swimmers_count(:is_male)
      @meeting_stats[:ent_swimmers_female_count] = get_entered_swimmers_count(:is_female)
      @meeting_stats[:entries_male_count]        = get_entries_count(:is_male)
      @meeting_stats[:entries_female_count]      = get_entries_count(:is_female)
      @meeting_stats[:ent_team_count]            = 0
    end
  
    # Result-based
    if has_results?
      @meeting_stats[:swimmers_male_count]    = get_swimmer_count(:is_male)
      @meeting_stats[:swimmers_female_count]  = get_swimmer_count(:is_female)
      @meeting_stats[:results_male_count]     = get_result_count(:is_male)
      @meeting_stats[:results_female_count]   = get_result_count(:is_female)
      @meeting_stats[:teams_count]            = get_teams_count()
      @meeting_stats[:oldest_male_swimmers]   = get_oldest_swimmers(:is_male, oldests )
      @meeting_stats[:oldest_female_swimmers] = get_oldest_swimmers(:is_female, oldests )
  
      # Score-based
      @meeting_stats[:dsqs_male_count]         = get_disqualified_count(:is_male)
      @meeting_stats[:dsqs_female_count]       = get_disqualified_count(:is_female)
      @meeting_stats[:average_male_score]      = get_average(:is_male)
      @meeting_stats[:average_female_score]    = get_average(:is_female)
      @meeting_stats[:average_total_score]     = get_average(:has_points)
      @meeting_stats[:over_1000_count]         = get_over_target_count(1000)
      @meeting_stats[:over_950_count]          = get_over_target_count(950) - @meeting_stats[:over_1000_count]
      @meeting_stats[:over_900_count]          = get_over_target_count(900) - @meeting_stats[:over_950_count] 
      @meeting_stats[:best_std_male_scores]    = get_best_standard_scores(:is_male, bests )
      @meeting_stats[:best_std_female_scores]  = get_best_standard_scores(:is_female, bests )
      @meeting_stats[:worst_std_male_scores]   = get_worst_standard_scores(:is_male, worsts )
      @meeting_stats[:worst_std_female_scores] = get_worst_standard_scores(:is_female, worsts )
  
      # Partials
      @meeting_stats[:teams]      = []    
      @meeting_stats[:events]     = []    
      @meeting_stats[:catgeories] = []
    end
  end

  def get_meeting
    @meeting
  end
  # ---------------------------------------------------------------------------


  # Meeting entries methods
  # Those methods are based on meeting entries
  # Intended for stats on meeting without results
  # or to know entries stats

  # Statistic calculation for the meeting entries count
  # Entries are intended the distinct entries for the meeting
  #
  def get_entries_count( scope_name = :is_male )
    @meeting.meeting_entries.send(scope_name.to_sym).count
  end
  # ---------------------------------------------------------------------------

  # Statistic calculation for the meeting entries count for a given team
  # Entries are intended the distinct entries for the meeting
  #
  def get_team_entries_count( team, scope_name = :is_male )
    @meeting.meeting_entries.for_team(team).send(scope_name.to_sym).count
  end
  # ---------------------------------------------------------------------------

  # Statistic calculation for the meeting entries swimmer count
  # swimmers are intended the physical distinct swimmers entered the meeting
  #
  def get_entered_swimmers_count( scope_name = :is_male )
    @meeting.meeting_entries.send(scope_name.to_sym).includes(:swimmers).select('swimmers.id').uniq.count    
  end

  # Statistic calculation for the meeting entries swimmer count for a given team
  # swimmers are intended the physical distinct swimmers entered the meeting
  #
  def get_team_entered_swimmers_count( team, scope_name = :is_male )
    @meeting.meeting_entries.for_team(team).send(scope_name.to_sym).includes(:swimmers).select('swimmers.id').uniq.count    
  end
  # ---------------------------------------------------------------------------
  

  # Meeting result methods
  # Those methods are based on meeting results
  # Intended for stats on meeting with results

  # Statistic calculation for the meeting swimmer count
  # swimmers are intended the physical distinct swimmers swam in the meeting
  #
  def get_swimmers_count( scope_name = :is_male )
    @meeting.swimmers.send(scope_name.to_sym).uniq.count    
  end
  # ---------------------------------------------------------------------------
  
  # Statistic calculation for the meeting results count
  # Results are intended the distinct results swam in the meeting
  #
  def get_results_count( scope_name = :is_male )
    @meeting.meeting_individual_results.send(scope_name.to_sym).count
  end
  # ---------------------------------------------------------------------------

  # Statistic calculation for the team count
  # Temas are intended the distinct team with results in the meeting
  #
  def get_teams_count()
    @meeting.teams.uniq.count
  end
  
  # Statistic calculation for the meeting disqualified count
  # Disqualified are intended the results in the meeting with is_disqualified attribute set to true
  #
  def get_disqualifieds_count( scope_name = :is_male )
    @meeting.meeting_individual_results.send(scope_name.to_sym).where(:is_disqualified).count
  end
  # ---------------------------------------------------------------------------

  # Statistic calculation for the over target result count
  # The target is intended as the standard points to beat
  #
  def get_over_target_count( target = 900 )
    @meeting.meeting_individual_results.where(['standard_points >= ?', target]).count
  end
  # ---------------------------------------------------------------------------

  # Statistic calculation for the meeting average standard points
  # Average is calculated considering only > 0 standard point results
  #
  def get_average( scope_name = :is_male )
    result_count = @meeting.meeting_individual_results.send(scope_name.to_sym).has_points.count
    if result_count > 0
      standard_points_sum = @meeting.meeting_individual_results.send(scope_name.to_sym).sum(:standard_points)
      (standard_points_sum / result_count).round(2)
    else
      result_count
    end
  end
  # ---------------------------------------------------------------------------


  # Statistic calculation of the oldest swimmers has swam in the meeting
  #
  def get_oldest_swimmers( scope_name = :is_male, swimmer_num = 3 )
    @meeting.swimmers.send(scope_name.to_sym).order(:year_of_birth).uniq.limit(swimmer_num)
  end
  # ---------------------------------------------------------------------------

  # Statistic calculation of the best results swam in the meeting
  # Best results are intended evaluating the standard (FIN) points not 0
  # Assumes the standard (FIN) pints are always calculated
  #
  def get_best_standard_scores( scope_name = :is_male, score_num = 3 )
    @meeting.meeting_individual_results.is_valid.send(scope_name.to_sym).has_points.order('standard_points DESC').first(score_num)
  end
  # ---------------------------------------------------------------------------

  # Statistic calculation of the worst results swam in the meeting
  # Worst results are intended evaluating the standard (FIN) points not 0
  # Assumes the standard (FIN) pints are always calculated
  #
  def get_worst_standard_scores( scope_name = :is_male, score_num = 3 )
    @meeting.meeting_individual_results.is_valid.send(scope_name.to_sym).has_points.order('standard_points ASC').limit(score_num)
  end
  # ---------------------------------------------------------------------------

  # Sum male and female swimmer count
  #
  def swimmers_count
    @meeting_stats[:swimmers_male_count] + @meeting_stats[:swimmers_female_count]
  end
  # ---------------------------------------------------------------------------
  
  # Sum male and female result count
  #
  def results_count
    @meeting_stats[:results_male_count] + @meeting_stats[:results_female_count]
  end  
  
  # Sum male and female disqualified count
  #
  def disqualifieds_count
    @meeting_stats[:dsqs_male_count] + @meeting_stats[:dsqs_female_count] 
  end  

  
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

end
