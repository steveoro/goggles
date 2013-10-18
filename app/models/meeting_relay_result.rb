class MeetingRelayResult < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :meeting_program
  belongs_to :team
  belongs_to :result_type

  validates_associated :meeting_program
  validates_associated :team
  validates_associated :result_type

# TODO for this helper a 3-chain-through vs. meeting_relay_swimmers is needed:
#  has_many :swimmers, :through => :meeting_program

  has_one  :meeting_session,  :through => :meeting_program
  has_one  :meeting,          :through => :meeting_program

  belongs_to :disqualification_code_type

  validates_presence_of     :rank
  validates_length_of       :rank, :within => 1..4, :allow_nil => false
  validates_numericality_of :rank

  validates_presence_of     :standard_points
  validates_numericality_of :standard_points
  validates_presence_of     :meeting_points
  validates_numericality_of :meeting_points

  validates_presence_of     :minutes
  validates_length_of       :minutes, :within => 1..3, :allow_nil => false
  validates_numericality_of :minutes
  validates_presence_of     :seconds
  validates_length_of       :seconds, :within => 1..2, :allow_nil => false
  validates_numericality_of :seconds
  validates_presence_of     :hundreds
  validates_length_of       :hundreds, :within => 1..2, :allow_nil => false
  validates_numericality_of :hundreds


  scope :is_valid_for_score,  where( :is_out_of_race => false, :is_disqualified => false )

  scope :sort_meeting_relay_result_by_user,           lambda { |dir| order("users.name #{dir.to_s}, meeting_program_id #{dir.to_s}, rank #{dir.to_s}") }
  scope :sort_meeting_relay_result_by_meeting_relay,  lambda { |dir| order("meeting_program_id #{dir.to_s}, rank #{dir.to_s}") }
  scope :sort_meeting_relay_result_by_result_type,    lambda { |dir| order("result_type.code #{dir.to_s}, rank #{dir.to_s}") }


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------
  #++

  # Returns just the formatted timing information
  def get_timing
    "#{minutes}'" + sprintf("%02.0f", seconds) + "\"." + sprintf("%02.0f", hundreds)
  end

  # Computes a shorter description for the name associated with this data
  def get_full_name
    "#{get_scheduled_date}, #{get_event_type}: #{rank}) #{get_team_name}, #{get_timing}"
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    "#{get_meeting_program_verbose_name}: #{rank}) #{get_team_name}, #{get_timing}"
  end

  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------

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
    self.meeting_program ? self.meeting_program.get_scheduled_date() : '?'
  end

  # Retrieves the Meeting Program short name
  def get_meeting_program_name
    self.meeting_program ? self.meeting_program.get_meeting_program_name() : '?'
  end

  # Retrieves the Meeting Program verbose name
  def get_meeting_program_verbose_name
    self.meeting_program ? self.meeting_program.get_meeting_program_verbose_name() : '?'
  end
  # ----------------------------------------------------------------------------
end
