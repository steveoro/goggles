class DataImportMeetingSession < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :data_import_session
  validates_associated  :data_import_session

  belongs_to :meeting_session, :foreign_key => "conflicting_meeting_session_id"

  validates_presence_of :import_text

  belongs_to :data_import_meeting
  belongs_to :meeting
  belongs_to :swimming_pool
  validates_associated :data_import_meeting
  validates_associated :meeting
  validates_associated :swimming_pool

  has_many :meeting_programs
  has_many :data_import_meeting_programs

  has_many :meeting_individual_results, :through => :meeting_programs
  has_many :data_import_meeting_individual_results, :through => :data_import_meeting_programs
  # TODO Add other has_many relationships only when needed

  validates_presence_of :session_order
  validates_length_of   :session_order, :within => 1..2, :allow_nil => false

  validates_presence_of :scheduled_date

  validates_presence_of :description
  validates_length_of :description, :maximum => 100, :allow_nil => false


  scope :sort_data_import_meeting_session_by_user,          lambda { |dir| order("users.name #{dir.to_s}, data_import_meeting_sessions.scheduled_date #{dir.to_s}") }
  scope :sort_data_import_meeting_session_by_meeting,       lambda { |dir| order("meetings.description #{dir.to_s}, data_import_meeting_sessions.session_order #{dir.to_s}") }
  scope :sort_data_import_meeting_session_by_swimming_pool, lambda { |dir| order("swimming_pools.nick_name #{dir.to_s}, data_import_meeting_sessions.scheduled_date #{dir.to_s}") }
  # ---------------------------------------------------------------------------


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------
  #++


  # Computes a verbose or formal description for the row data "conflicting" with the current import data row
  def get_verbose_conflicting_row
    if ( self.conflicting_meeting_session_id.to_i > 0 )
      begin
        conflicting_row = MeetingSession.find( conflicting_meeting_session_id )
        "(ID:#{conflicting_meeting_session_id}) #{conflicting_row.get_verbose_name}"
      rescue
        "(ID:#{conflicting_meeting_session_id}) <#{I18n.t(:unable_to_retrieve_row_data, :scope =>[:activerecord, :errors] )}>"
      end
    else
      ''
    end
  end
  # ---------------------------------------------------------------------------

  # Computes a shorter description for the name associated with this data
  def get_full_name
    "#{get_meeting_name} (#{Format.a_date( self.scheduled_date )})"
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
    self.meeting ? self.meeting.get_short_name() : (self.data_import_meeting ? self.data_import_meeting.get_short_name() : '?')
  end

  # Retrieves the Meeting verbose name
  def get_meeting_verbose_name
    self.meeting ? self.meeting.get_verbose_name() : (self.data_import_meeting ? self.data_import_meeting.get_verbose_name() : '?')
  end
  # ----------------------------------------------------------------------------

end
