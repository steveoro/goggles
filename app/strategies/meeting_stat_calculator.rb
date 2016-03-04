# encoding: utf-8

=begin

= MeetingStatCalculator
  - Goggles framework vers.:  4.00.857
  - author: Leega

 Utility class to calculate meeting stats from meeting results or entries.

=== Members:
 - <tt>:swimmer_male_count</tt> => Count of male swimmers with result

=end
class MeetingStatCalculator
  # These must be initialized on creation:
  attr_reader :meeting

  # Creates a new instance.
  # Note the ascending precision of the parameters, which allows to skip
  # the rarely used ones.
  #
  def initialize( meeting )
    unless meeting && meeting.instance_of?( Meeting )
      raise ArgumentError.new("Meeting stat needs a valid meeting")
    end

    @meeting       = meeting
    @meeting_stats = MeetingStatDAO.new( meeting ) 
  end

  def get_meeting
    @meeting
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
  # ---------------------------------------------------------------------------


  # Meeting entries methods
  # Those methods are based on meeting entries
  # Intended for stats on meeting without results
  # or to know entries stats

  # Statistic calculation for the team count
  # Temas are intended the distinct team with entries in the meeting
  #
  def get_enetered_teams_count()
    @meeting.meeting_entries.includes(:team).select('teams.id').uniq.count    
  end
  # ---------------------------------------------------------------------------
  
  # Statistic calculation for the meeting entries count
  # Entries are intended the distinct entries for the meeting
  #
  def get_entries_count( scope_name = :is_male )
    @meeting.meeting_entries.send(scope_name.to_sym).count
  end

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

  # Statistic calculation for the team count
  # Temas are intended the distinct team with results in the meeting
  #
  def get_teams_count()
    @meeting.teams.uniq.count
  end

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


  # General stats calculation
  #
  def calculate( bests = 3, worsts = 1, oldests = 1, teams = true )
    # Entry-based
    if has_entries?
      @meeting_stats.ent_swimmers_male_count   = get_entered_swimmers_count(:is_male)
      @meeting_stats.ent_swimmers_female_count = get_entered_swimmers_count(:is_female)
      @meeting_stats.entries_male_count        = get_entries_count(:is_male)
      @meeting_stats.entries_female_count      = get_entries_count(:is_female)
      @meeting_stats.ent_team_count            = get_entered_teams_count()
    end
  
    # Result-based
    if has_results?
      @meeting_stats.swimmers_male_count    = get_swimmers_count(:is_male)
      @meeting_stats.swimmers_female_count  = get_swimmers_count(:is_female)
      @meeting_stats.results_male_count     = get_results_count(:is_male)
      @meeting_stats.results_female_count   = get_results_count(:is_female)
      @meeting_stats.teams_count            = get_teams_count()
      @meeting_stats.oldest_male_swimmers   = get_oldest_swimmers(:is_male, oldests )
      @meeting_stats.oldest_female_swimmers = get_oldest_swimmers(:is_female, oldests )
  
      # Score-based
      @meeting_stats.dsqs_male_count         = get_disqualifieds_count(:is_male)
      @meeting_stats.dsqs_female_count       = get_disqualifieds_count(:is_female)
      @meeting_stats.average_male_score      = get_average(:is_male)
      @meeting_stats.average_female_score    = get_average(:is_female)
      @meeting_stats.average_total_score     = get_average(:has_points)
      @meeting_stats.over_1000_count         = get_over_target_count(1000)
      @meeting_stats.over_950_count          = get_over_target_count(950) - @meeting_stats.over_1000_count
      @meeting_stats.over_900_count          = get_over_target_count(900) - @meeting_stats.over_950_count 
      @meeting_stats.best_std_male_scores    = get_best_standard_scores(:is_male, bests )
      @meeting_stats.best_std_female_scores  = get_best_standard_scores(:is_female, bests )
      @meeting_stats.worst_std_male_scores   = get_worst_standard_scores(:is_male, worsts )
      @meeting_stats.worst_std_female_scores = get_worst_standard_scores(:is_female, worsts )
    end
    
    calculate_teams if teams
    
    @meeting_stats    
  end
  # ---------------------------------------------------------------------------


  # Team stats calculation
  #
  def calculate_teams
    @meeting.teams.uniq.each do |team|
      team_stat = @meeting_stats.new_team( team )

      # Entry-based
      if has_entries?
        team_stat.male_swimmers   = get_team_entered_swimmers_count( team, :is_male )
        team_stat.female_swimmers = get_team_entered_swimmers_count( team, :is_female )
        team_stat.males_entries   = get_team_entries_count( team, :is_male )
        team_stat.females_entries = get_team_entries_count( team, :is_female )
      end

      # Result-based
      if has_results?
        
      end
      
      @meeting_stats.teams << team_stat 
    end
    @meeting_stats.teams
  end  
  # ---------------------------------------------------------------------------
end
