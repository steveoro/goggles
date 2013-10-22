class DataImportMeetingProgram < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :data_import_session
  validates_associated  :data_import_session

  belongs_to :meeting_program, :foreign_key => "conflicting_meeting_program_id"

  validates_presence_of :import_text

  belongs_to :meeting_session
  belongs_to :data_import_meeting_session
  belongs_to :category_type
  belongs_to :gender_type
  belongs_to :event_type
  belongs_to :heat_type

  validates_associated :meeting_session
  validates_associated :data_import_meeting_session
  validates_associated :category_type
  validates_associated :gender_type
  validates_associated :event_type
  validates_associated :heat_type

  has_many :meeting_individual_results
  has_many :data_import_meeting_individual_results

  has_many :meeting_relay_results
  has_many :data_import_meeting_relay_results

  has_many :meeting_relay_swimmers
  has_many :data_import_meeting_relay_swimmers
  # TODO Add other has_many relationships only when needed

  validates_presence_of :event_order
  validates_length_of   :event_order, :within => 1..3, :allow_nil => false
                                                    # Base timing (may not be available)
  validates_length_of       :minutes, :maximum => 3
  validates_numericality_of :minutes
  validates_length_of       :seconds, :maximum => 2
  validates_numericality_of :seconds
  validates_length_of       :hundreds, :maximum => 2
  validates_numericality_of :hundreds

# FIXME:
  scope :only_relays,     includes(:event_type).where('event_types.is_a_relay' => true)
  scope :are_not_relays,  includes(:event_type).where('event_types.is_a_relay' => false)

  scope :sort_data_import_meeting_program_by_user,            lambda { |dir| order("users.name #{dir.to_s}, meeting_sessions.scheduled_date #{dir.to_s}, data_import_meeting_programs.event_order #{dir.to_s}") }
  scope :sort_data_import_meeting_program_by_meeting_session, lambda { |dir| order("meeting_sessions.scheduled_date #{dir.to_s}, data_import_meeting_programs.event_order #{dir.to_s}") }
  scope :sort_data_import_meeting_program_by_event_type,      lambda { |dir| order("event_types.code #{dir.to_s}, meeting_sessions.scheduled_date #{dir.to_s}, data_import_meeting_programs.event_order #{dir.to_s}") }
  scope :sort_data_import_meeting_program_by_category_type,   lambda { |dir| order("category_types.code #{dir.to_s}") }
  scope :sort_data_import_meeting_program_by_gender_type,     lambda { |dir| order("gender_type.code #{dir.to_s}") }
  # ---------------------------------------------------------------------------


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------


  # Computes a verbose or formal description for the row data "conflicting" with the current import data row
  def get_verbose_conflicting_row
    if ( self.conflicting_meeting_program_id.to_i > 0 )
      begin
        conflicting_row = MeetingProgram.find( conflicting_meeting_program_id )
        "(ID:#{conflicting_meeting_program_id}) #{conflicting_row.get_verbose_name}"
      rescue
        "(ID:#{conflicting_meeting_program_id}) <#{I18n.t(:unable_to_retrieve_row_data, :scope =>[:activerecord, :errors] )}>"
      end
    else
      ''
    end
  end
  # ---------------------------------------------------------------------------


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
    self.meeting_session ? self.meeting_session.scheduled_date : (self.data_import_meeting_session ? self.data_import_meeting_session.scheduled_date : '?')
  end

  # Retrieves the Meeting Session short name (includes Meeting name)
  def get_meeting_session_name
    self.meeting_session ? self.meeting_session.get_full_name() : (self.data_import_meeting_session ? self.data_import_meeting_session.get_full_name() : '?')
  end

  # Retrieves the Meeting Session verbose name (includes Meeting name)
  def get_meeting_session_verbose_name
    self.meeting_session ? self.meeting_session.get_verbose_name() : (self.data_import_meeting_session ? self.data_import_meeting_session.get_verbose_name() : '?')
  end
  # ----------------------------------------------------------------------------

end
