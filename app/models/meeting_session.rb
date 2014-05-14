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


  scope :sort_meeting_session_by_user,          ->(dir) { order("users.name #{dir.to_s}, meeting_sessions.scheduled_date #{dir.to_s}") }
  scope :sort_meeting_session_by_meeting,       ->(dir) { order("meetings.description #{dir.to_s}, meeting_sessions.session_order #{dir.to_s}") }
  scope :sort_meeting_session_by_swimming_pool, ->(dir) { order("swimming_pools.nick_name #{dir.to_s}, meeting_sessions.scheduled_date #{dir.to_s}") }


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------
  #++

  # Computes a short description for the meeting session comprehensive of short day part and event list
  # Eg MNG: 200SL, 100FA, 50DO, 4x50MX
  #
  def get_short_name
    "#{self.day_part_type.i18n_short}: #{self.get_short_events}"
  end

  # Computes a full description for the meeting session comprehensive of date, day part and event list
  # Eg 25/05/2014 MORINING: 200SL, 100FA, 50DO, 4x50MX
  #
  def get_full_name
    "#{self.get_scheduled_date} #{self.day_part_type.i18n_description}: #{self.get_short_events} #{self.description}"
  end

  # Computes a full description for the meeting session comprehensive of date, day part, time schedule and event list
  # Eg 25/05/2014 MORINING (8.30) 9.30: 200SL, 100FA, 50DO, 4x50MX
  #
  def get_verbose_name
    #"#{get_meeting_verbose_name} (#{session_order} @ #{Format.a_date( self.scheduled_date )})"
    "#{self.get_scheduled_date} #{self.day_part_type.i18n_description} (#{self.get_warm_up_time}) #{self.get_begin_time}: #{self.get_short_events} #{self.description}"    
  end
  # ----------------------------------------------------------------------------

  # Retrieve the scheduled date for the session, if any
  # If no scheduled date defined returns international 'To be defined'
  #
  def get_scheduled_date
    self.scheduled_date ? Format.a_date(self.scheduled_date) : I18n.t( :to_be_defined )
  end

  # Retrieve the warm_up time for the session, if any
  # If no warm_up time defined returns international 'nd'
  #
  def get_warm_up_time
    self.warm_up_time ? Format.a_time(self.warm_up_time) : I18n.t( :not_disponible )
  end

  # Retrieve the begin time for the session, if any
  # If no begin time defined returns international 'nd'
  #
  def get_begin_time
    self.begin_time ? Format.a_time(self.begin_time) : I18n.t( :not_disponible )
  end
  # ----------------------------------------------------------------------------

  # Retrieves the Meeting session swimming pool length in meters, or 0 if any
  # Eg 50
  #
  def get_pool_length_in_meters
    self.swimming_pool ? self.swimming_pool.get_pool_length_in_meters : 0
  end

  # Retrieves the Meeting session swimming pool lane number, or 0 if any
  # Eg 8
  #
  def get_pool_lanes_number
    self.swimming_pool ? self.swimming_pool.get_pool_lanes_number : 0
  end

  # Compose the swimming pool attributes (lanes_numebr x length_in_meters)
  # If not set returns (?)
  # Eg (8x50)
  #
  def get_pool_attributes
    self.swimming_pool ? self.swimming_pool.get_pool_attributes : '(?)'
  end

  # Retrieves the Meeting session swimming pool full description
  # Eg Comunale Reggio Emilia (8x50)
  #
  def get_pool_full_description
    self.swimming_pool ? "#{self.swimming_pool.name} #{self.swimming_pool.city.name} #{self.get_pool_attributes}" : I18n.t( :to_be_defined )
  end
  # ----------------------------------------------------------------------------

  # Computes a shorter description for the name associated with this data
  # Used by import steps to identify session
  #
  def get_order_with_date
    "n.#{self.session_order} (#{self.get_scheduled_date})"
  end
  # ----------------------------------------------------------------------------

  # Retrieves the user name associated with this instance
  #
  def user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------

  # Retrieves the Meeting short name
  # Used by import steps to identify session
  #
  def get_meeting_name
    self.meeting ? self.meeting.get_short_name() : '?'
  end

  # Retrieves the Meeting verbose name
  # Used by import steps to identify session
  #
  def get_meeting_verbose_name
    self.meeting ? self.meeting.get_verbose_name() : '?'
  end
  # ----------------------------------------------------------------------------
  
  # Retrieves the meeting event list, comma separated
  # Eg 200SL, 100FA, 50DO, 4x50MX
  #
  def get_short_events
    #self.meeting_events.count > 0 ? self.meeting_events.event_types.i18n_short.join('--').gsub(' ','').gsub('--', ', ') : 'To be defined...'
    self.meeting_events.count > 0 ? self.meeting_events.includes(:event_type).joins(:event_type).collect{ |row| row.event_type.i18n_short }.join('--').gsub(' ','').gsub('--', ', ') : 'To be defined...'
  end
  # ----------------------------------------------------------------------------
  
end
