class DataImportMeetingTeamScore < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :meeting_team_score, :foreign_key => "conflicting_challenge_score_id"

  belongs_to :data_import_team
  belongs_to :team
  belongs_to :data_import_meeting
  belongs_to :meeting
  validates_associated :data_import_team
  validates_associated :team
  validates_associated :data_import_meeting
  validates_associated :meeting

  validates_presence_of     :total_individual_points
  validates_numericality_of :total_individual_points
  validates_presence_of     :total_relay_points
  validates_numericality_of :total_relay_points


  scope :sort_data_import_meeting_team_score_by_user,              lambda { |dir| order("users.name #{dir.to_s}") }
  scope :sort_data_import_meeting_team_score_by_data_import_team,  lambda { |dir| order("data_import_team.name #{dir.to_s}") }
  scope :sort_data_import_meeting_team_score_by_meeting,           lambda { |dir| order("meetings.description #{dir.to_s}") }


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------


  # Computes a verbose or formal description for the row data "conflicting" with the current import data row
  def get_verbose_conflicting_row
    if ( self.conflicting_challenge_score_id.to_i > 0 )
      begin
        conflicting_row = MeetingTeamScore.find( conflicting_challenge_score_id )
        "(ID:#{conflicting_challenge_score_id}) #{conflicting_row.get_verbose_name}"
      rescue
        "(ID:#{conflicting_challenge_score_id}) <#{I18n.t(:unable_to_retrieve_row_data, :scope =>[:activerecord, :errors] )}>"
      end
    else
      ''
    end
  end
  # ---------------------------------------------------------------------------

  # Computes a shorter description for the name associated with this data
  def get_full_name
    "#{get_team_name}: #{total_individual_points} + #{total_relay_points}"
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    "#{get_meeting_name}: #{get_team_name} = #{total_individual_points} + #{total_relay_points}"
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

  # Retrieves the Meeting name
  def get_meeting_name
    self.meeting ? self.meeting.get_full_name() : (self.data_import_meeting ? self.data_import_meeting.get_full_name() : '?')
  end
  # ----------------------------------------------------------------------------
end
