class MeetingSession < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :meeting
  belongs_to :swimming_pool
  belongs_to :day_part_type
  validates_associated :meeting
  # [Steve, 20131028] Cannot enable validation on :swimming_pool, since it can be null
  # [Steve, 20131028] Cannot enable validation on :day_part_type, since it can be null

  has_one  :pool_type,   :through => :swimming_pool
  has_one  :season,      :through => :meeting
  has_one  :season_type, :through => :meeting

  has_many :meeting_events, :dependent => :delete_all
  has_many :meeting_programs, :through => :meeting_events, :dependent => :delete_all
  has_many :meeting_individual_results, :through => :meeting_programs, :dependent => :delete_all
  # TODO Add other has_many relationships only when needed

  validates_presence_of :session_order
  validates_length_of   :session_order, :within => 1..2, :allow_nil => false

  validates_presence_of :scheduled_date

  validates_presence_of :description
  validates_length_of :description, :maximum => 100, :allow_nil => false


  scope :sort_meeting_session_by_user,          lambda { |dir| order("users.name #{dir.to_s}, meeting_sessions.scheduled_date #{dir.to_s}") }
  scope :sort_meeting_session_by_meeting,       lambda { |dir| order("meetings.description #{dir.to_s}, meeting_sessions.session_order #{dir.to_s}") }
  scope :sort_meeting_session_by_swimming_pool, lambda { |dir| order("swimming_pools.nick_name #{dir.to_s}, meeting_sessions.scheduled_date #{dir.to_s}") }


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------
  #++

  # Computes a shorter description for the name associated with this data
  def get_full_name
    "#{get_meeting_name} (#{Format.a_date( self.scheduled_date )})"
  end

  # Computes a shorter description for the name associated with this data
  def get_order_with_date
    "n.#{self.session_order} (#{Format.a_date( self.scheduled_date )})"
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    "#{get_meeting_verbose_name} (#{session_order} @ #{Format.a_date( self.scheduled_date )})"
  end

  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------

  # Retrieves the Meeting short name
  def get_meeting_name
    self.meeting ? self.meeting.get_short_name() : '?'
  end

  # Retrieves the Meeting verbose name
  def get_meeting_verbose_name
    self.meeting ? self.meeting.get_verbose_name() : '?'
  end
  # ----------------------------------------------------------------------------

end
