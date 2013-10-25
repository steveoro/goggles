class MeetingProgram < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :meeting_event
  belongs_to :category_type
  belongs_to :gender_type
  belongs_to :pool_type
  belongs_to :time_standard
  validates_associated :meeting_event
  validates_associated :category_type
  validates_associated :gender_type
  validates_associated :pool_type
  validates_associated :time_standard

  has_many :meeting_individual_results
  has_many :meeting_relay_results
  has_many :meeting_relay_swimmers
  # TODO Add other has_many relationships only when needed

  has_one  :meeting,          :through => :meeting_event
  has_one  :event_type,       :through => :meeting_event
  has_one  :meeting_session,  :through => :meeting_event
  has_one  :pool_type,        :through => :meeting_event
  has_one  :season_type,      :through => :meeting_event
  has_one  :stroke_type,      :through => :event_type

  validates_presence_of :event_order
  validates_length_of   :event_order, :within => 1..3, :allow_nil => false

  scope :only_relays,     includes(:event_type).where('event_types.is_a_relay' => true)
  scope :are_not_relays,  includes(:event_type).where('event_types.is_a_relay' => false)

  scope :sort_meeting_program_by_user,            lambda { |dir| order("users.name #{dir.to_s}, meeting_sessions.scheduled_date #{dir.to_s}, meeting_programs.event_order #{dir.to_s}") }
  scope :sort_meeting_program_by_event_type,      lambda { |dir| order("event_types.code #{dir.to_s}") }
  scope :sort_meeting_program_by_category_type,   lambda { |dir| order("category_types.code #{dir.to_s}") }
  scope :sort_meeting_program_by_gender_type,     lambda { |dir| order("gender_type.code #{dir.to_s}") }


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------


  # Returns just the formatted timing information
  def get_timing
    "#{minutes}'" + sprintf("%02.0f", seconds) + "\"." + sprintf("%02.0f", hundreds)
  end

  # Computes a short description of just the event name for this row, without dates.
  def get_event_name
    "(#{event_order}) #{event_type.i18n_short} #{get_category_type_code} #{gender_type.code}"
  end

  # Computes a verbose description of just the event name for this row, without dates.
  def get_verbose_event_name
    "(#{I18n.t(:event)} #{event_order}) #{event_type.i18n_description} #{get_category_type_name} #{gender_type.i18n_description}"
  end

  # Computes the shortest description for the name associated with this data
  def get_short_name
    "(#{get_scheduled_date}, #{event_order}) #{event_type.i18n_short} #{get_category_type_code} #{gender_type.code}"
  end

  # Computes a shorter description for the name associated with this data
  def get_full_name
    "#{get_meeting_session_name} #{get_event_name}"
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    "#{get_meeting_session_verbose_name} #{get_event_name}"
  end

  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------

  # Retrieves the Category Type code
  def get_category_type_code
    self.category_type ? self.category_type.code : '?'
  end

  # Retrieves the Category Type short name
  def get_category_type_name
    self.category_type ? self.category_type.short_name : '?'
  end

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
