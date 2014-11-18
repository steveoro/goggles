# encoding: utf-8

=begin

= Meeting_stat
  - Goggles framework vers.:  4.00.175.20140210
  - author: Leega

 Utility class to get meeting stats from meeting results.

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
class MeetingStat

  attr_accessor :swimmer_male_count,         :swimmer_female_count, 
                :result_male_count,          :result_female_count,
                :disqualified_male_count,    :disqualified_female_count, 
                :oldest_male_swimmers,       :oldest_female_swimmers,   
                :best_standard_male_scores,  :best_standard_female_scores, 
                :worst_standard_male_scores, :worst_standard_female_scores

  # Creates a new instance.
  # Note the ascending precision of the parameters, which allows to skip
  # the rarely used ones.
  #
  def initialize( meeting = nil )
    set_meeting(meeting)
  end

  # Clears the cached results. This method is useful only if the same TokenExtractor
  # instance is used to tokenize different source texts.
  #
  def clear()
    @meeting = nil
    self.swimmer_male_count = 0
    self.swimmer_female_count = 0
    self.result_male_count = 0
    self.result_female_count = 0
    self.disqualified_male_count = 0
    self.disqualified_female_count = 0
    self.oldest_male_swimmers = []
    self.oldest_female_swimmers = []
    self.best_standard_male_scores = []
    self.best_standard_female_scores = []
    self.worst_standard_male_scores = []    
    self.worst_standard_female_scores = []    
    self
  end
  # ---------------------------------------------------------------------------

  def set_meeting( meeting )
    # Meeting exist. Calculate stats
    if meeting.instance_of?( Meeting ) && (meeting.are_results_acquired || meeting.meeting_individual_results.count > 0)
      @meeting = meeting
      self.swimmer_male_count = self.class.get_swimmer_count(meeting, :is_male)
      self.swimmer_female_count = self.class.get_swimmer_count(meeting, :is_female)
      self.result_male_count = self.class.get_result_count(meeting, :is_male)
      self.result_female_count = self.class.get_result_count(meeting, :is_female)
      self.disqualified_male_count = self.class.get_disqualified_count(meeting, :is_male)
      self.disqualified_female_count = self.class.get_disqualified_count(meeting, :is_female)
      self.oldest_male_swimmers = self.class.get_oldest_swimmers(meeting, :is_male, 3)
      self.oldest_female_swimmers = self.class.get_oldest_swimmers(meeting, :is_female, 3)
      self.best_standard_male_scores = self.class.get_best_standard_scores(meeting, :is_male, 3)
      self.best_standard_female_scores = self.class.get_best_standard_scores(meeting, :is_female, 3)
      self.worst_standard_male_scores = self.class.get_worst_standard_scores(meeting, :is_male, 3)
      self.worst_standard_female_scores = self.class.get_worst_standard_scores(meeting, :is_female, 3)
      
      #TODO Complete field calc
    else
      # The meeting does not exist. Clear all fields
      clear
    end
    
    self
  end

  def get_meeting
    @meeting
  end

  # Statistic calculation for the meeting swimmer count
  # swimmers are intended the physical distinct swimmers swam in the meeting
  #
  def self.get_swimmer_count( meeting, scope_name = :is_male )
    meeting.swimmers.send(scope_name.to_sym).uniq.count   
  end
  # ---------------------------------------------------------------------------
  
  # Statistic calculation for the meeting results count
  # Results are intended the distinct results swam in the meeting
  #
  def self.get_result_count( meeting, scope_name = :is_male )
    meeting.meeting_individual_results.send(scope_name.to_sym).count
  end
  # ---------------------------------------------------------------------------
  
  # Statistic calculation for the meeting disqualified count
  # Disqualified are intended the results in the meeting with is_disqualified attribute set to true
  #
  def self.get_disqualified_count( meeting, scope_name = :is_male )
    meeting.meeting_individual_results.send(scope_name.to_sym).where(:is_disqualified).count
  end
  # ---------------------------------------------------------------------------

  # Statistic calculation of the oldest swimmers has swam in the meeting
  #
  def self.get_oldest_swimmers( meeting, scope_name = :is_male, swimmer_num = 3 )
    meeting.swimmers.send(scope_name.to_sym).order(:year_of_birth).uniq.limit(swimmer_num)
  end
  # ---------------------------------------------------------------------------

  # Statistic calculation of the best results swam in the meeting
  # Best results are intended evaluating the standard (FIN) points not 0
  # Assumes the standard (FIN) pints are always calculated
  #
  def self.get_best_standard_scores( meeting, scope_name = :is_male, score_num = 3 )
    meeting.meeting_individual_results.is_valid.send(scope_name.to_sym).where('standard_points > 0').order('standard_points DESC').first(score_num)
  end
  # ---------------------------------------------------------------------------

  # Statistic calculation of the worst results swam in the meeting
  # Worst results are intended evaluating the standard (FIN) points not 0
  # Assumes the standard (FIN) pints are always calculated
  #
  def self.get_worst_standard_scores( meeting, scope_name = :is_male, score_num = 3 )
    meeting.meeting_individual_results.is_valid.send(scope_name.to_sym).where('standard_points > 0').order('standard_points ASC').limit(score_num)
  end
  # ---------------------------------------------------------------------------

  # Sum male and female swimmer count
  #
  def swimmer_count
    swimmer_male_count + swimmer_female_count
  end
  # ---------------------------------------------------------------------------
  
  # Sum male and female result count
  #
  def result_count
    result_male_count + result_female_count
  end  
  
  # Sum male and female disqualified count
  #
  def disqualified_count
    disqualified_male_count + disqualified_female_count
  end  
end
