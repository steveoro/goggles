# == MeetingTeamScore
#
# This entity stores the *team* scoring per meeting and is used
# to prepare the final meeting result chart of all the registered teams
# for a specific meeting.
#
class MeetingTeamScore < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :team                                  # Since meetings are already "filtered" by season, here we link directly to teams, instead of team_affiliations
  belongs_to :meeting
  validates_associated :team
  validates_associated :meeting

  validates_presence_of     :total_individual_points
  validates_numericality_of :total_individual_points
  validates_presence_of     :total_relay_points
  validates_numericality_of :total_relay_points


  scope :sort_challenge_score_by_user,        lambda { |dir| order("users.name #{dir.to_s}, teams.name #{dir.to_s}, meetings.description #{dir.to_s}, meeting_team_scores.total_individual_points #{dir.to_s}, meeting_team_scores.total_relay_points #{dir.to_s}") }
  scope :sort_challenge_score_by_team,        lambda { |dir| order("teams.name #{dir.to_s}, meetings.description #{dir.to_s}, meeting_team_scores.total_individual_points #{dir.to_s}, meeting_team_scores.total_relay_points #{dir.to_s}") }
  scope :sort_challenge_score_by_meeting,     lambda { |dir| order("meetings.description #{dir.to_s}, teams.name #{dir.to_s}, meeting_team_scores.total_individual_points #{dir.to_s}, meeting_team_scores.total_relay_points #{dir.to_s}") }


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------
  #++

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
    self.team ? self.team.get_full_name() : '?'
  end

  # Retrieves the Meeting name
  def get_meeting_name
    self.meeting ? self.meeting.get_full_name() : '?'
  end
  # ----------------------------------------------------------------------------
end
