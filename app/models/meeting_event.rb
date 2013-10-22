class MeetingEvent < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :meeting_session
  belongs_to :event_type
  belongs_to :heat_type
  validates_associated :meeting_session
  validates_associated :event_type
  validates_associated :heat_type

  validates_presence_of :event_order
  validates_length_of   :event_order, :within => 1..3, :allow_nil => false


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------

  # Computes a shorter description for the name associated with this data
  def get_full_name
    "#{get_meeting_session_name} (#{get_scheduled_date})"
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    "#{get_meeting_session_verbose_name} (#{event_order} @ #{get_scheduled_date})"
  end

  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------

  # Retrieves the Meeting Session scheduled_date
  def get_scheduled_date
    self.meeting_session ? self.meeting_session.scheduled_date : '?'
  end

  # Retrieves the Meeting Session short name (includes Meeting name)
  def get_meeting_session_name
    self.meeting_session ? self.meeting_session.get_full_name() : '?'
  end

  # Retrieves the Meeting Session verbose name (includes Meeting name)
  def get_meeting_session_verbose_name
    self.meeting_session ? self.meeting_session.get_verbose_name() : '?'
  end
  # ----------------------------------------------------------------------------
end
