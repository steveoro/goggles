# encoding: utf-8


=begin

= TeamManagerValidator

 - Goggles framework vers.:  6.021
 - author: Steve A.

 Strategy class used to validate access for TeamManagers.

=end
class TeamManagerValidator

  # Returns true if the current user can manage (for its managed teams) the chosen
  # meeting, false otherwise.
  #
  # === Params:
  # - current_user : a valid User instance
  # - meeting : a valid Meeting instance
  #
  def self.can_manage?( current_user, meeting )
    # For a valid User & Meeting, the user must be a team-manager
    # and have among his/hers affiliations one that corresponds to the season
    # of the chosen meeting.
    current_user.instance_of?( User ) &&
    meeting.instance_of?( Meeting ) &&
    ( current_user.team_managers.count > 0 ) &&
    (! current_user.team_managers.find{|tm| tm.team_affiliation.season_id == meeting.season_id }.nil?)
  end
  #-- --------------------------------------------------------------------------
  #++

  # Returns true if the meeting can have its reservation edited and/or updated.
  # Returns false otherwise.
  #
  # === Params:
  # - meeting : a valid Meeting instance
  #
  def self.is_manageable?( meeting )
    # For a Meeting, the header date must be far-fetched than the current date
    # and the results must not be already acquired.
    meeting.instance_of?( Meeting ) &&
    ( !meeting.are_results_acquired? ) &&
    ( meeting.header_date >= Date.today )
  end
  #-- --------------------------------------------------------------------------
  #++

  # Returns +true+ if the current user has any reservations for the specified meeting.
  # (Supposedly, only the TeamManager can create the reservations.)
  #
  # === Params:
  # - current_user : a valid User instance
  # - meeting : a valid Meeting instance
  #
  def self.any_reservations_for?( current_user, meeting )
    return false if current_user.nil? || meeting.nil?
    MeetingReservation.where( meeting_id: meeting.id, swimmer_id: current_user.swimmer_id ).count > 0
  end
  #-- --------------------------------------------------------------------------
  #++
end
