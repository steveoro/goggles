require 'wrappers/timing'


class UserResult < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :swimmer
  belongs_to :category_type
  belongs_to :pool_type
  belongs_to :event_type
  belongs_to :meeting_individual_result
  validates_associated :swimmer
  validates_associated :category_type
  validates_associated :pool_type
  validates_associated :event_type
  validates_associated :meeting_individual_result

  belongs_to :disqualification_code_type
                                                    # Duplicate (shortcut) reference that may be filled-in at a later stage:
  validates_presence_of     :description
  validates_length_of       :description, :within => 1..60, :allow_nil => false

  validates_presence_of     :standard_points
  validates_numericality_of :standard_points
  validates_presence_of     :meeting_points
  validates_numericality_of :meeting_points

  validates_presence_of     :rank
  validates_length_of       :rank, :within => 1..5, :allow_nil => false
  validates_numericality_of :rank

  validates_presence_of     :is_disqualified

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


  scope :sort_meeting_individual_result_by_user,          lambda { |dir| order("users.name #{dir.to_s}, meetings.description #{dir.to_s}, swimmers.last_name #{dir.to_s}, swimmers.first_name #{dir.to_s}") }
  scope :sort_meeting_individual_result_by_category_type, lambda { |dir| order("category_types.code #{dir.to_s},swimmers.last_name #{dir.to_s}, swimmers.first_name #{dir.to_s}") }
  scope :sort_meeting_individual_result_by_swimmer,       lambda { |dir| order("swimmers.last_name #{dir.to_s}, swimmers.first_name #{dir.to_s}, meeting_individual_results.rank #{dir.to_s}") }


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
    "#{get_scheduled_date} #{get_event_type}: #{rank}) #{swimmer.get_full_name}, #{get_timing}"
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    "#{description}: #{rank}) #{swimmer.get_verbose_name}), #{minutes}'#{seconds}""#{hundreds}"
  end

  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------

  # Retrieves the localized Event Type code
  def get_event_type
    self.event_type ? self.event_type.i18n_short : '?'
  end

  # Retrieves the scheduled_date of this result
  def get_scheduled_date
    self.event_date ? Format.a_date(self.event_date) : '?'
  end
  # ----------------------------------------------------------------------------

end
