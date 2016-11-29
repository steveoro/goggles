# encoding: utf-8
require 'common/format'
require 'wrappers/timing'


=begin

= MeetingReservationsController

  - version:  6.015
  - author:   Steve A.

=end
class MeetingReservationsController < ApplicationController

  # Require authorization before invoking any of this controller's actions:
  before_action :authenticate_user!

  # Parse parameters:
  before_action :verify_meeting_and_association


  # Edits the matrix of reservations for the selected meeting, for the whole team
  # of the currently logged-in user.
  #
  # If the user is a team manager, the whole matrix of rows is editable.
  #
  # If no reservation rows are found, a new (empty but serialized on DB) matrix
  # of events reservations is created, having a single MeetingReservationRow for
  # each possibile event of the chosen meeting, for each and every one if the swimmers
  # currently registered to the current user's team affiliation.
  #
  # This is a POST-only action due to the implied row insertions.
  # No row deletions are currently permitted. This action recreates the whole matrix
  # *only* if no rows are found.
  #
  # == Params:
  # id: the meeting id to be processed
  #
  # == Implied parameters:
  # current_user:  user must be logged-in and either be a team-manager or have an
  #                associated swimmer (must be a "goggler").
  #                (when also a team-manager, the whole matrix of rows should be editable)
  #
  def edit
  end
  #-- -------------------------------------------------------------------------
  #++


  # POSTs the update for the matrix of reservations for the selected meeting, for the whole team
  # of the currently logged-in user.
  #
  # Posting updates for non-existing rows will fail silently.
  #
  # == Params:
  # id: the meeting id to be processed
  #
  # == Implied parameters:
  # current_user:  user must be logged-in and either be a team-manager or have an
  #                associated swimmer (must be a "goggler").
  #                (when also a team-manager, the whole matrix of rows should be editable)
  #
  def update
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Verifies that a meeting id is provided as parameter and that the current user
  # is either associated to a swimmer or is the team_manager of a team.
  # Else, returns an invalid action request.
  #
  # Sets/assigns:
  # - @meeting, a valid Meeting instance
  # - @is_valid_team_manager, either +true+ or +false+
  # - @swimmer, +nil+ only when no associated swimmer was found (allegedly, in this case @is_valid_team_manager should result true)
  #
  # == Params:
  # id: the meeting id to be processed
  #
  # == Implied parameters:
  # current_user:  user must be logged-in and either be a team-manager or have an
  #                associated swimmer (must be a "goggler").
  #
  def verify_meeting_and_association
    meeting_id = params[:id].to_i
    @meeting = Meeting.find_by_id( meeting_id )
    unless ( @meeting )
      flash[:error] = I18n.t(:invalid_action_request) + ' - ' + I18n.t('meeting.errors.missing_meeting_id')
      redirect_to( meetings_current_path() ) and return
    end

    # To be a valid team manager, a user must be enabled to manage the season
    # of the selected Meeting:
    @is_valid_team_manager = current_user &&
              (current_user.team_managers.count > 0) &&
              (! current_user.team_managers.find{|tm| tm.team_affiliation.season_id == @meeting.season_id }.nil?)

    # Detect if there's a swimmer associated:
    @swimmer = current_user.swimmer

    unless ( @is_valid_team_manager || @swimmer )
      flash[:error] = I18n.t(:invalid_action_request) + ' - ' + I18n.t('meeting.errors.invalid_team_manager_or_no_swimmer')
      redirect_to( meetings_current_path() ) and return
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
