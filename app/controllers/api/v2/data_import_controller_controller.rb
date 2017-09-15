#
# API V2 controller
#
class Api::V2::DataImportControllerController < Api::BaseController

  respond_to :json

  # Require authorization before invoking any of this controller's actions:
  before_action :authenticate_user_from_token!
  before_action :ensure_format
  #-- -------------------------------------------------------------------------
  #++


  # POST #start, { u: <user_id>, m: <meeting_id>, e: <entity_name> }
  #
  # Starts or continues a data-import microtransaction session, given:
  # the user_id, the current meeting_id and the entity name to be processed for
  # a create/update/delete micro-transaction.
  #
  # Supported entity names so far:
  #
  # - "passages", "relay_swimmers", "reservations"
  #
  # === Returns:
  #
  # A JSON response code.
  #
  def start
    # TODO
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
  def commit
    # TODO
  end
  #-- -------------------------------------------------------------------------
  #++
end
