require 'wrappers/timing'
#require 'timing_gettable'
#require 'timing_validatable'


class Passage < ActiveRecord::Base
  include SwimmerRelatable
  include TimingGettable
  include TimingValidatable

  belongs_to :user                                  # [Steve, 20120212] Do not validate associated user!

  belongs_to :meeting_program
  belongs_to :passage_type
  belongs_to :team
  validates_associated :meeting_program
  validates_associated :passage_type
  validates_associated :team

  belongs_to :meeting_entry
  belongs_to :meeting_individual_result

  has_one :meeting,         through: :meeting_program
  has_one :event_type,      through: :meeting_program
#  has_one :badge,           through: :meeting_entry

  validates_presence_of     :minutes_from_start
  validates_length_of       :minutes_from_start, within: 1..3, allow_nil: false
  validates_numericality_of :minutes_from_start
  validates_presence_of     :seconds_from_start
  validates_length_of       :seconds_from_start, within: 1..2, allow_nil: false
  validates_numericality_of :seconds_from_start
  validates_presence_of     :hundreds_from_start
  validates_length_of       :hundreds_from_start, within: 1..2, allow_nil: false
  validates_numericality_of :hundreds_from_start
  #validates_presence_of     :reaction_time
  #validates_numericality_of :reaction_time
  #validates_presence_of     :stroke_cycles
  #validates_length_of       :stroke_cycles, within: 1..3, allow_nil: true
  #validates_numericality_of :stroke_cycles
  #validates_presence_of     :breath_number
  #validates_length_of       :breath_number, within: 1..3, allow_nil: true
  #validates_numericality_of :breath_number
  #validates_presence_of     :position
  #validates_length_of       :position, within: 1..4, allow_nil: true
  #validates_numericality_of :position
  #validates_presence_of     :not_swam_kick_number
  #validates_length_of       :not_swam_kick_number, within: 1..3, allow_nil: true
  #validates_numericality_of :not_swam_kick_number
  #validates_presence_of     :not_swam_part_seconds
  #validates_length_of       :not_swam_part_seconds, within: 1..2, allow_nil: true
  #validates_numericality_of :not_swam_part_seconds
  #validates_presence_of     :not_swam_part_hundreds
  #validates_length_of       :not_swam_part_hundreds, within: 1..2, allow_nil: true
  #validates_numericality_of :not_swam_part_hundreds

  scope :sort_by_user,       ->(dir) { order("users.name #{dir.to_s}, swimmer_id #{dir.to_s}") }
#  scope :sort_by_program,    ->(dir) { order("meeting_programs.begin_time #{dir.to_s}, swimmers.last_name #{dir.to_s}, swimmers.first_name #{dir.to_s}") }
#  scope :sort_by_swimmer,    ->(dir) { order("swimmers.last_name #{dir.to_s}, swimmers.first_name #{dir.to_s}") }
#  scope :sort_by_type,       ->(dir) { order("passage_types.code #{dir.to_s}, swimmers.last_name #{dir.to_s}, swimmers.first_name #{dir.to_s}") }


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------


  # Computes a shorter description for the name associated with this data
  def get_short_name
    "#{get_passage_distance}: #{get_timing}"
  end

  # Computes a full description for the name associated with this data
  def get_full_name
    "#{get_event_type}, #{get_passage_distance}: #{get_timing}"
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    "#{get_swimmer_full_name} - #{get_scheduled_date} #{get_event_type}, #{get_passage_distance}: #{get_timing}"
  end

  # Retrieves the user name associated with this instance
  def get_user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------

  # Retrieves the associated Swimmer full name
  def get_swimmer_full_name
    self.swimmer ? self.swimmer.get_full_name : '?'
  end

  ## Retrieves the associated Badge number
  #def get_badge_code
  #  self.badge ? self.badge.number : '?'
  #end

  # Retrieves the distance swam in the passage
  def get_passage_distance
    self.passage_type.length_in_meters
  end

  # Retrieves the localized Event Type code
  def get_event_type
    self.meeting_program ? self.meeting_program.event_type.i18n_short : '?'
  end

  # Retrieves the scheduled_date of this result
  def get_scheduled_date                            # The following ActiveRecord chain is granted in existence by validation assertions: (even the first check could be avoided)
    self.meeting_program ? self.meeting_program.meeting_session.scheduled_date : '?'
    # [Steve, 20130710]
    # Provided the "has_one :meeting_session, through: :meeting_program" above, this should also work:
    # => return meeting_session.scheduled_date
  end
  # ----------------------------------------------------------------------------

end
