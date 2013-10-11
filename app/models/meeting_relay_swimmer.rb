class MeetingRelaySwimmer < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :meeting_program
  belongs_to :swimmer
  belongs_to :badge
  belongs_to :stroke_type

  validates_associated :meeting_program
  validates_associated :swimmer
  validates_associated :badge
  validates_associated :stroke_type

  validates_presence_of     :relay_order
  validates_length_of       :relay_order, :maximum => 1, :allow_nil => false
  validates_numericality_of :relay_order


  scope :sort_meeting_relay_swimmer_by_user,            lambda { |dir| order("users.name #{dir.to_s}") }
  scope :sort_meeting_relay_swimmer_by_swimmer_name,    lambda { |dir| order("swimmer.last_name #{dir.to_s}, swimmer.first_name #{dir.to_s}") }
  scope :sort_meeting_relay_swimmer_by_badge,           lambda { |dir| order("badge.number #{dir.to_s}") }
  scope :sort_meeting_relay_swimmer_by_stroke_type,     lambda { |dir| order("stroke_type.code #{dir.to_s}") }


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------
  #++

  # Computes a shorter description for the name associated with this data
  def get_full_name
    "#{get_event_type}: #{relay_order}, #{get_swimmer_name}"
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    "#{get_event_type}: #{relay_order} (#{get_stroke_type}) #{get_swimmer_name}"
  end

  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------

  # Retrieves the localized Event Type code
  def get_event_type
    self.meeting_program ? self.meeting_program.event_type.i18n_short : '?'
  end

  # Retrieves the Meeting Relay Swimmer name
  def get_swimmer_name
    self.swimmer ? self.swimmer.get_full_name() : '?'
  end

  # Retrieves the localized Stroke Type code
  def get_stroke_type
    self.stroke_type ? self.stroke_type.i18n_short : '?'
  end
  # ----------------------------------------------------------------------------
end
