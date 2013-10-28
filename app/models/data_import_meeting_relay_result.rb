class DataImportMeetingRelayResult < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :data_import_session
  validates_associated  :data_import_session

  belongs_to :meeting_relay_result, :foreign_key => "conflicting_meeting_relay_result_id"

  validates_presence_of :import_text

  belongs_to :data_import_meeting_program
  belongs_to :meeting_program

  belongs_to :data_import_team
  belongs_to :team

  belongs_to :team_affiliation
  belongs_to :disqualification_code_type
  belongs_to :entry_time_type

  validates_associated :entry_time_type

  validates_presence_of     :relay_header
  validates_length_of       :relay_header, :within => 1..60, :allow_nil => false

  validates_presence_of     :rank
  validates_length_of       :rank, :within => 1..4, :allow_nil => false
  validates_numericality_of :rank

  validates_presence_of     :standard_points
  validates_numericality_of :standard_points
  validates_presence_of     :meeting_points
  validates_numericality_of :meeting_points

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


  scope :is_valid_for_score,  where( :is_out_of_race => false, :is_disqualified => false )

  scope :sort_data_import_meeting_relay_result_by_user,                 lambda { |dir| order("users.name #{dir.to_s}, meeting_program_id #{dir.to_s}") }

  scope :sort_data_import_meeting_relay_result_by_meeting,              lambda { |dir| order("meeting_program_id #{dir.to_s}, rank #{dir.to_s}") }
  scope :sort_data_import_meeting_relay_result_by_data_import_meeting,  lambda { |dir| order("data_import_meeting_program_id #{dir.to_s}, rank #{dir.to_s}") }


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------
  #++


  # Computes a verbose or formal description for the row data "conflicting" with the current import data row
  def get_verbose_conflicting_row
    if ( self.conflicting_meeting_relay_result_id.to_i > 0 )
      begin
        conflicting_row = MeetingRelayResult.find( conflicting_meeting_relay_result_id )
        "(ID:#{conflicting_meeting_relay_result_id}) #{conflicting_row.get_verbose_name}"
      rescue
        "(ID:#{conflicting_meeting_relay_result_id}) <#{I18n.t(:unable_to_retrieve_row_data, :scope =>[:activerecord, :errors] )}>"
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

  # Computes a shorter description for the name associated with this data
  def get_full_name
    "#{get_scheduled_date}, #{get_event_type}: #{rank}) #{get_team_name}, #{get_timing}"
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    "#{get_meeting_program_verbose_name}: #{rank}) #{get_team_name}, #{get_timing}"
  end

  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------

  # Retrieves the team name
  def get_team_name
    self.team ? self.team.get_full_name() : (self.data_import_team ? self.data_import_team.get_full_name() : '?')
  end

  # Retrieves the localized Event Type code
  def get_event_type
    self.meeting_program ? self.meeting_program.event_type.i18n_short : (self.data_import_meeting_program ? self.data_import_meeting_program.event_type.i18n_short : '?')
  end

  # Retrieves the scheduled_date of this result
  def get_scheduled_date 
    self.meeting_program ? self.meeting_program.get_scheduled_date() : (self.data_import_meeting_program ? self.data_import_meeting_program.get_scheduled_date() : '?')
  end

  # Retrieves the Meeting Program short name
  def get_meeting_program_name
    self.meeting_program ? self.meeting_program.get_meeting_program_name() : (self.data_import_meeting_program ? self.data_import_meeting_program.get_meeting_program_name() : '?')
  end

  # Retrieves the Meeting Program verbose name
  def get_meeting_program_verbose_name
    self.meeting_program ? self.meeting_program.get_meeting_program_verbose_name() : (self.data_import_meeting_program ? self.data_import_meeting_program.get_meeting_program_verbose_name() : '?')
  end
  # ----------------------------------------------------------------------------
end
