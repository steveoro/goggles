#
# API V2 controller
#
class Api::V2::DataImportController < Api::BaseController

  respond_to :json

  # Require authorization before invoking any of this controller's actions:
  before_action :authenticate_user_from_token!
  before_action :ensure_format
  #-- -------------------------------------------------------------------------
  #++


  # POST #start, { u: <user_id>, t: <user_auth_token>, m: <meeting_id>, e: <entity_name> }
  #
  # Starts or continues a data-import microtransaction session, given:
  # the user_id, the current meeting_id and the entity name to be processed for
  # a create/update/delete micro-transaction.
  #
  # If the transaction for the specified (user, meeting) tuple is found, no changes
  # are made and the transaction session ID is returned. Otherwise, a new transaction
  # is created, returning the resulting ID.
  #
  #
  # === Supported entity "names" (linked to the specified Meeting):
  #
  # - "p" ..... DataImportPassage
  # - "rsw" ... DataImportRelaySwimmer
  #
  # === Future Dev.:
  # - "mr" (DataImportMeetingReservation)
  # - "mer" (DataImportMeetingEventReservation)
  # - "mer" (DataImportMeetingRelayReservation)
  #
  # === Returns:
  #
  # A JSON response with the transaction session ID.
  #
  def start
    # TODO
    render status: 200, json: { result: "ok" }
  end
  #-- -------------------------------------------------------------------------
  #++


  # POST #edit, { u: <user_id>, s: <data_import_session_id>, f: <field_name>, v: <value_for_field> }
  #
  # Sends an edit/update value for a data-import microtransaction session.
  #
  # === Returns:
  #
  # A JSON response code.
  #
  def edit
    # TODO
    render status: 200, json: { result: "ok" }
  end
  #-- -------------------------------------------------------------------------
  #++


  # POST #commit, { u: <user_id>, s: <data_import_session_id> }
  #
  # Sends the request to close and commit the microtransaction session specified
  # with its current ID.
  #
  # The session is then processed by the strategy and "resolved" where possible.
  #
  # === Returns:
  #
  # A JSON response code.
  #
  def commit
    # TODO
    render status: 200, json: { result: "ok" }
  end
  #-- -------------------------------------------------------------------------
  #++
end
