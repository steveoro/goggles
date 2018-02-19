# encoding: utf-8


=begin

= TeamManagerValidator

 - Goggles framework vers.:  6.048
 - author: Steve A.

 Strategy class used to validate access for TeamManagers.

=end
class TeamManagerValidator

  # Returns true if the current user can manage (for its managed teams) the chosen
  # meeting, false otherwise.
  #
  # Only the team affiliation of the team manager is checked. That is, "a current user
  # can manage the chosen meeting if its season is the same of any managed teams' affilations".
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
    ( current_user.team_managers.exists? ) &&
    #(! current_user.team_managers.find{|tm| tm.team_affiliation.season_id == meeting.season_id }.nil?)
    ( current_user.team_managers.joins( :team_affiliation ).where( 'team_affiliations.season_id = ?', meeting.season_id ).exists? )
    
  end
  #-- --------------------------------------------------------------------------
  #++

  # This is specifically used to test if the current meeting can have any
  # *meeting reservations* added or edited by checking that is not already "closed"
  # (by having any results acquired and by being at least set in the future).
  #
  # Returns true if the meeting can have its reservations edited and/or updated.
  # Returns false otherwise.
  #
  # === Params:
  # - meeting : a valid Meeting instance
  #
  def self.is_reservation_manageable?( meeting )
    # For a Meeting, the header date must be far-fetched than the current date
    # and the results must not be already acquired.
    meeting.instance_of?( Meeting ) &&
    ( !meeting.are_results_acquired? ) &&
    ( !meeting.meeting_individual_results.exists? ) &&
    ( meeting.header_date >= Date.today )
  end
  #-- --------------------------------------------------------------------------
  #++

  # This is specifically used to test if the current user can edit or add lap
  # passage timings to the results acquired for a meeting.
  #
  # Returns +true+ if all the following conditions apply:
  #
  # - the current user is a team manager,
  # - the current meeting can be generically managed by the user (see #can_manage?),
  # - at least a team affiliation managed by the user has some results acquired for the meeting.
  #
  # === Params:
  # - current_user : a valid User instance
  # - meeting : a valid Meeting instance
  #
  def self.any_manageable_results_for?( current_user, meeting )
    return false if current_user.nil? || meeting.nil? ||
                    (! TeamManagerValidator.can_manage?(current_user, meeting) )
    # Find the user team manager affiliation that can manage this season:
    #team_manager = current_user.team_managers.find{|tm| tm.team_affiliation.season_id == meeting.season_id }
    team_manager = current_user.team_managers.joins( :team_affiliation ).where( 'team_affiliations.season_id = ?', meeting.season_id ).limit(1)
    return false if team_manager.nil? # (This is redundant, unless the def. of #can_manage? changes)

    # Find the first managed team affiliation among the meeting results:
    # (This will return nil if non are found or the meeting doesn't have any results.)
    return ( ! meeting.teams.uniq.find{|t| t.id == team_manager.first.team_affiliation.team_id }.nil? )
  end


  # This just checks the presence of any already existing reservations for the
  # specified (user, meeting) touple.
  #
  # Returns +true+ if the current user has any reservations for the specified meeting.
  # (Supposedly, only the TeamManager can create the reservations.)
  #
  # === Params:
  # - current_user : a valid User instance
  # - meeting : a valid Meeting instance
  #
  def self.any_reservations_for?( current_user, meeting )
    return false if current_user.nil? || meeting.nil?
    MeetingReservation.where( meeting_id: meeting.id, swimmer_id: current_user.swimmer_id ).exists?
  end
  #-- --------------------------------------------------------------------------
  #++
end
