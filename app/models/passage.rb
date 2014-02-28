require 'wrappers/timing'


class Passage < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :meeting_entry
  belongs_to :swimmer
  belongs_to :team
  belongs_to :passage_type
  validates_associated :meeting_entry
  validates_associated :swimmer
  validates_associated :team
  validates_associated :passage_type

  has_one :meeting, :through => :meeting_entry
  has_one :meeting_program, :through => :meeting_entry
  has_one :badge, :through => :meeting_entry

  # Leega: probably useful has_one :event_type, :through => ...

  validates_presence_of     :minutes
  validates_length_of       :minutes, :within => 1..3, :allow_nil => false, :default => 0
  validates_numericality_of :minutes
  validates_presence_of     :seconds
  validates_length_of       :seconds, :within => 1..2, :allow_nil => false
  validates_numericality_of :seconds
  validates_presence_of     :hundreds
  validates_length_of       :hundreds, :within => 1..2, :allow_nil => false
  validates_numericality_of :hundreds


  scope :sort_passage_by_user,       lambda { |dir| order("users.name #{dir.to_s}, swimmer_id #{dir.to_s}") }
#  scope :sort_passage_by_program,    lambda { |dir| order("meeting_programs.begin_time #{dir.to_s}, swimmer.last_name #{dir.to_s}, swimmer.first_name #{dir.to_s}") }
#  scope :sort_passage_by_swimmer,    lambda { |dir| order("swimmer.last_name #{dir.to_s}, swimmer.first_name #{dir.to_s}") }
#  scope :sort_passage_by_type,       lambda { |dir| order("passage_types.code #{dir.to_s}, swimmer.last_name #{dir.to_s}, swimmer.first_name #{dir.to_s}") }


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------
  #++

  # Returns just the formatted timing information
  def get_timing
    "#{minutes}'" + sprintf("%02.0f", seconds) + "\"" + sprintf("%02.0f", hundreds)
  end

  # Returns a new Timing class instance initialized with the timing data from this row
  def get_timing_instance
    Timing.new( hundreds, seconds, minutes )
  end

  # Computes a shorter description for the name associated with this data
  def get_full_name
    "#{get_swimmer_full_name}, #{get_event_type}: #{get_timing}"
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    "#{get_badge_code} #{get_swimmer_full_name}, #{get_scheduled_date} #{get_event_type}: #{get_timing}"
  end

  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------

  # Retrieves the associated Swimmer full name
  def get_swimmer_full_name
    self.swimmer ? self.swimmer.get_full_name : '?'
  end

  # Retrieves the associated Badge number
  def get_badge_code
    self.badge ? self.badge.number : '?'
  end

  # Retrieves the localized Event Type code
  def get_event_type
    self.meeting_program ? self.meeting_program.event_type.i18n_short : '?'
  end

  # Retrieves the scheduled_date of this result
  def get_scheduled_date                            # The following ActiveRecord chain is granted in existence by validation assertions: (even the first check could be avoided)
    self.meeting_program ? self.meeting_program.meeting_session.scheduled_date : '?'
    # [Steve, 20130710]
    # Provided the "has_one :meeting_session, :through => :meeting_program" above, this should also work:
    # => return meeting_session.scheduled_date
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

end
