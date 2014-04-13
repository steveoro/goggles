require 'wrappers/timing'
require 'timing_gettable'
require 'timing_validatable'


class Passage < ActiveRecord::Base
  include TimingGettable
  include TimingValidatable

  belongs_to :user                                  # [Steve, 20120212] Do not validate associated user!

  belongs_to :meeting_entry
  belongs_to :swimmer
  belongs_to :team
  belongs_to :passage_type
  validates_associated :meeting_entry
  validates_associated :swimmer
  validates_associated :team
  validates_associated :passage_type

  has_one :meeting,         :through => :meeting_entry
  has_one :meeting_program, :through => :meeting_entry
  has_one :badge,           :through => :meeting_entry
  has_one :event_type,      :through => :meeting_entry

  scope :sort_by_user,       ->(dir) { order("users.name #{dir.to_s}, swimmer_id #{dir.to_s}") }
#  scope :sort_by_program,    ->(dir) { order("meeting_programs.begin_time #{dir.to_s}, swimmers.last_name #{dir.to_s}, swimmers.first_name #{dir.to_s}") }
#  scope :sort_by_swimmer,    ->(dir) { order("swimmers.last_name #{dir.to_s}, swimmers.first_name #{dir.to_s}") }
#  scope :sort_by_type,       ->(dir) { order("passage_types.code #{dir.to_s}, swimmers.last_name #{dir.to_s}, swimmers.first_name #{dir.to_s}") }


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------


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
