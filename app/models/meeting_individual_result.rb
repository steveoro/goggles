class MeetingIndividualResult < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :meeting_program
  belongs_to :entry_time_type
  validates_associated :meeting_program

  has_one  :meeting_event,    :through => :meeting_program
  has_one  :meeting_session,  :through => :meeting_program
  has_one  :meeting,          :through => :meeting_program
  has_one  :season,           :through => :meeting_program

  has_one  :pool_type,      :through => :meeting_program
  has_one  :season_type,    :through => :meeting_program
  has_one  :event_type,     :through => :meeting_program
  has_one  :category_type,  :through => :meeting_program
  has_one  :gender_type,    :through => :meeting_program
                                                    # These reference fields may be filled-in later (thus not validated upon creation):
  belongs_to :swimmer
  belongs_to :team
  belongs_to :team_affiliation
  belongs_to :badge
  belongs_to :disqualification_code_type

  validates_associated :swimmer
  validates_associated :team
  validates_associated :team_affiliation
  validates_associated :badge
  validates_associated :disqualification_code_type

  validates_presence_of     :rank
  validates_length_of       :rank, :within => 1..4, :allow_nil => false
  validates_numericality_of :rank

  validates_presence_of     :standard_points
  validates_numericality_of :standard_points
  validates_presence_of     :meeting_individual_points
  validates_numericality_of :meeting_individual_points
  validates_presence_of     :goggle_cup_points
  validates_numericality_of :goggle_cup_points
  validates_presence_of     :team_points
  validates_numericality_of :team_points

  validates_presence_of     :reaction_time
  validates_numericality_of :reaction_time
  validates_presence_of     :minutes
  validates_length_of       :minutes, :within => 1..3, :allow_nil => false
  validates_numericality_of :minutes
  validates_presence_of     :seconds
  validates_length_of       :seconds, :within => 1..2, :allow_nil => false
  validates_numericality_of :seconds
  validates_presence_of     :hundreds
  validates_length_of       :hundreds, :within => 1..2, :allow_nil => false
  validates_numericality_of :hundreds


  scope :is_valid, -> { where(is_out_of_race: false, is_disqualified: false) }

  scope :sort_meeting_individual_result_by_user,          lambda { |dir| order("users.name #{dir.to_s}, meeting_programs.meeting_session_id #{dir.to_s}, swimmers.last_name #{dir.to_s}, swimmers.first_name #{dir.to_s}") }
  scope :sort_meeting_individual_result_by_meeting,       lambda { |dir| order("meeting_programs.meeting_session_id #{dir.to_s}, swimmers.last_name #{dir.to_s}, swimmers.first_name #{dir.to_s}") }
  scope :sort_meeting_individual_result_by_swimmer,       lambda { |dir| order("swimmers.last_name #{dir.to_s}, swimmers.first_name #{dir.to_s}, meeting_individual_results.rank #{dir.to_s}") }
  scope :sort_meeting_individual_result_by_team,          lambda { |dir| order("teams.name #{dir.to_s}, swimmers.last_name #{dir.to_s}, swimmers.first_name #{dir.to_s}") }
  scope :sort_meeting_individual_result_by_badge,         lambda { |dir| order("badges.number #{dir.to_s}") }


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------
  #++

  # Returns just the formatted timing information
  def get_timing
    "#{minutes}'" + sprintf("%02.0f", seconds) + "\"" + sprintf("%02.0f", hundreds)
  end

  # Computes a shorter description for the name associated with this data
  def get_full_name
    "#{get_scheduled_date} #{get_event_type}: #{rank}) #{get_athlete_name}, #{get_timing}"
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    "#{get_meeting_program_verbose_name}: #{rank}) #{get_athlete_name} (#{get_year_of_birth}), #{get_timing}"
  end

  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------

  # Check if this result is valid for the ranking system.
  def is_valid_for_ranking
    (!self.is_out_of_race) && (!self.is_disqualified)
  end

  # Retrieves the associated Swimmer full name
  def get_athlete_name
    self.swimmer ? self.swimmer.get_full_name() : '?'
  end

  # Retrieves the associated Swimmer's year_of_birth
  def get_year_of_birth
    self.swimmer ? self.swimmer.year_of_birth : '?'
  end

  # Retrieves the associated Team full name
  def get_team_name
    self.team ? self.team.get_full_name() : '?'
  end

  # Retrieves the localized Event Type code
  def get_event_type
    self.meeting_program ? self.meeting_program.event_type.i18n_short : '?'
  end

  # Retrieves the scheduled_date of this result
  def get_scheduled_date                            # The following ActiveRecord chain is granted in existence by validation assertions: (even the first check could be avoided)
    self.meeting_program ? self.meeting_program.meeting_session.scheduled_date : '?'
  end

  # Retrieves the Meeting Program short name
  def get_meeting_program_name
    self.meeting_program ? self.meeting_program.get_full_name() : '?'
  end

  # Retrieves the Meeting Program verbose name
  def get_meeting_program_verbose_name
    self.meeting_program ? self.meeting_program.get_verbose_name() : '?'
  end
  # ----------------------------------------------------------------------------


  # Counts the query results for a specified <tt>meeting_id</tt>, <tt>team_id</tt> and
  # minimum result score.
  #
  def self.count_team_results_for( meeting_id, team_id, min_meeting_score )
    self.includes(:meeting).where(
      [ 'meetings.id = ? AND meeting_individual_results.team_id = ? AND ' +
        'meeting_individual_results.meeting_individual_points >= ?',
        meeting_id, team_id, min_meeting_score ]
    ).count
  end


  # Counts the query results for a specified <tt>meeting_id</tt>, <tt>team_id</tt> and <tt>rank</tt>.
  #
  def self.count_team_ranks_for( meeting_id, team_id, rank )
    self.includes(:meeting).where(
      [ 'meetings.id = ? AND meeting_individual_results.team_id = ? AND ' +
        'meeting_individual_results.rank = ? AND ' +
        'meeting_individual_results.meeting_individual_points > 0',
        meeting_id, team_id, rank ]
    ).count
  end
  # ----------------------------------------------------------------------------

end
