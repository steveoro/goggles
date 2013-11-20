class DataImportMeetingTeamScore < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :meeting_team_score, :foreign_key => "conflicting_meeting_team_score_id"

  belongs_to :data_import_team
  belongs_to :team
  belongs_to :team_affiliation
  belongs_to :data_import_meeting
  belongs_to :meeting
  belongs_to :season
  validates_associated :season

  validates_presence_of     :rank
  validates_presence_of     :sum_individual_points
  validates_presence_of     :sum_relay_points
  validates_presence_of     :sum_team_points
  validates_presence_of     :meeting_individual_points
  validates_presence_of     :meeting_relay_points
  validates_presence_of     :meeting_team_points
  validates_presence_of     :season_individual_points
  validates_presence_of     :season_relay_points
  validates_presence_of     :season_team_points
  validates_numericality_of :rank
  validates_numericality_of :sum_individual_points
  validates_numericality_of :sum_relay_points
  validates_numericality_of :sum_team_points
  validates_numericality_of :meeting_individual_points
  validates_numericality_of :meeting_relay_points
  validates_numericality_of :meeting_team_points
  validates_numericality_of :season_individual_points
  validates_numericality_of :season_relay_points
  validates_numericality_of :season_team_points


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------


  # Computes a verbose or formal description for the row data "conflicting" with the current import data row
  def get_verbose_conflicting_row
    if ( self.conflicting_meeting_team_score_id.to_i > 0 )
      begin
        conflicting_row = MeetingTeamScore.find( conflicting_meeting_team_score_id )
        "(ID:#{conflicting_meeting_team_score_id}) #{conflicting_row.get_verbose_name}"
      rescue
        "(ID:#{conflicting_meeting_team_score_id}) <#{I18n.t(:unable_to_retrieve_row_data, :scope =>[:activerecord, :errors] )}>"
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
