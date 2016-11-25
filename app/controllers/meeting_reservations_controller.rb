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
  # === Implied parameters:
  # - current_user:  must be logged-in and have an associated swimmer (must be a "goggler")
  #                  (when also a team-manager, the whole matrix of rows should be editable)
  # - id: a valid Meeting ID
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
  def update
  end
  #-- -------------------------------------------------------------------------
  #++
end
