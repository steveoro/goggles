# encoding: utf-8


=begin

= Api::V2::RemoteEditController

  - version:  6.349
  - author:   Steve A.

  API v2 controller for Remote-editing of single, specific data rows via JSON requests.

=end
class Api::V2::RemoteEditController < Api::BaseController

  include SqlConverter

  respond_to :json

  # Require authorization before invoking any of this controller's actions:
  before_action :authenticate_user_from_token!
  before_action :ensure_format
  #-- -------------------------------------------------------------------------
  #++


  # Default asynch wait period before creating a new ActiveJob instance
  WAIT_MINS_BEFORE_JOB_CREATE = 3.minutes
  #-- -------------------------------------------------------------------------
  #++



  # POST #update_relay_swimmer
  #     { u: <user.email>, t: <auth_token>,
  #       mrr: <MRR_id>, o: <relay_order>, s: <swimmer_id>,
  #       time: <incremental_timing_text>, r: <reaction_timing_text> }
  #
  # Creates or updates a specific row of meeting_relay_swimmers, storing the resulting SQL
  # text as a serialized DB-diff into the dedicated row (free_text_1) of AppParameter.
  # The actual row ID for the serialization of the DB-diff SQL text depends upon
  # the current_user.id (100_000 + user.id).
  #
  # At the end of the update process, a SendDbDiffJob will be invoked to be run after
  # a few minutes.
  # The delay in minutes should be chosen as "enough" to collect multiple DB updates
  # at once, in order to avoid sending too many DB-diff files to the same SysOp e-mail.
  #
  # === Minimun/Required Parameters:
  # - "mrr" => MeetingRelayResult ID (key#1, used for MeetingRelaySwimmer.find_or_create_by)
  # - "o"   => lap/step ordering in relay (key#2, used for MeetingRelaySwimmer.find_or_create_by)
  # - "s"   => Swimmer.id (when not set, allows to clear the row)
  #
  # === Additional Parameters:
  # - "time" => incremental timing value as text (e.g.: "1'15\"00")
  # - "r"    => reaction_time as text (e.g.: "0\"65")
  #
  # === Returns:
  #
  # A JSON response (either :success or :error).
  #
  def update_relay_swimmer
    # Fetch params
    mrr         = MeetingRelayResult.find_by_id( params['mrr'].to_i )
    relay_order = params['o'].to_i
    swimmer_id  = params['s'].to_i
    timing_text   = params['time'].to_s
    reaction_text = params['r'].to_s

    unless mrr && (relay_order > 0)                 # Nothing to do, bail out:
      render( status: 400, json: { result: "error", message: I18n.t("api.errors.invalid_request") } ) and return
      return
    end

    updater = RelaySwimmerUpdater.new( current_user )
    result  = updater.process!( mrr, relay_order, swimmer_id, timing_text, reaction_text )

    if result.nil?                                  # --- ERROR during CREATE/UPDATE ---
      render( status: 400, json: { result: "error", message: I18n.t("api.errors.unable_to_find_or_create_data_row") } ) and return

    elsif result                                    # --- CREATE / UPDATE / DELETE performed ---
      # Add SQL text to AppParameter:
      serialize_into_app_parameters!( updater )
      # Launch delayed Job to send the DB-diff to the SysOp using the remote-editing
      # dedicated named queue ('edit'):
      SendDbDiffJob.set( queue: :edit, wait: WAIT_MINS_BEFORE_JOB_CREATE ).perform_later
#    else
      # (no operations for result false => DELETE skipped => no SQL edits)
    end

    render status: 200, json: { result: "ok" }
  end
  #-- -------------------------------------------------------------------------
  #++


  # POST #update_passage
  #     { u: <user.email>, t: <auth_token>,
  #       p: <passage.id>
  #       mpg: <meeting_program_id>, pt: <passage_type_id>, s: <swimmer_id>, te: <team_id>,
  #       time: <incremental_timing_text>, r: <reaction_timing_text>, mir: <MIR.id> }
  #
  # Creates or updates a specific row of passages, storing the resulting SQL
  # text as a serialized DB-diff into the dedicated row (free_text_1) of AppParameter.
  # The actual row ID for the serialization of the DB-diff SQL text depends upon
  # the current_user.id (100_000 + user.id).
  #
  # At the end of the update process, a SendDbDiffJob will be invoked to be run after
  # a few minutes.
  # The delay in minutes should be chosen as "enough" to collect multiple DB updates
  # at once, in order to avoid sending too many DB-diff files to the same SysOp e-mail.
  #
  # === Parameters:
  # - "p"    => Passage.id, required only for edits
  # - "time" => incremental timing value as text (e.g.: "1'15\"00");
  #             when missing and the Passage.id is present, the Passage row is deleted
  # - "r"    => reaction_time as text (e.g.: "0\"65")
  # - "mpg"  => MeetingProgram ID
  # - "pt"   => PassageType.id
  # - "s"    => Swimmer.id
  # - "te"   => Team.id
  # - "mir"  => MeetingIndividualResult ID (when available)
  #
  # === Returns:
  #
  # A JSON response (either :success or :error).
  #
  def update_passage
# DEBUG
    puts "\r\n--- #update_passage: ---\r\nPARAMS: #{ params.inspect }"
    # Fetch params
    passage         = Passage.find_by_id( params['p'].to_i )
    timing_text     = params['time'].to_s
    reaction_text   = params['r'].to_s
    mpg_id          = params['mpg']
    passage_type_id = params['pt']
    swimmer_id      = params['s']
    team_id         = params['te']
    mir_id          = params['mir']

    if passage.nil? && !timing_text.present?        # Nothing to do, bail out:
      render( status: 400, json: { result: "error", message: I18n.t("api.errors.invalid_request") } ) and return
      return
    end

    updater = PassageUpdater.new( current_user )
    result  = updater.process!( passage, timing_text, passage_type_id, mir_id,
                                reaction_text, swimmer_id, team_id, mpg_id )

    if result.nil?                                  # --- ERROR during CREATE/UPDATE ---
      render( status: 400, json: { result: "error", message: I18n.t("api.errors.unable_to_find_or_create_data_row") } ) and return

    elsif result                                    # --- CREATE / UPDATE / DELETE performed ---
      # Add SQL text to AppParameter:
      serialize_into_app_parameters!( updater )
      # Launch delayed Job to send the DB-diff to the SysOp using the remote-editing
      # dedicated named queue ('edit'):
      SendDbDiffJob.set( queue: :edit, wait: WAIT_MINS_BEFORE_JOB_CREATE ).perform_later
#    else
      # (no operations for result false => DELETE skipped => no SQL edits)
    end

    render status: 200, json: { result: "ok" }
  end
  #-- -------------------------------------------------------------------------
  #++


  # POST #update_reservation
  #     { u: <user.email>, t: <auth_token>,
  #       b: <badge_id>, e: <meeting_event_id>, time: <incremental_timing_text> (can be nil),
  #       on: <is_doing_this>, skip: <is_not_coming>, ok: <has_confirmed>, n: <notes> }
  #
  # Creates or updates a specific tuple/set of reservations, storing the resulting SQL
  # text as a serialized DB-diff into the dedicated row (free_text_1) of AppParameter.
  # The actual row ID for the serialization of the DB-diff SQL text depends upon
  # the current_user.id (100_000 + user.id).
  # The action will involve either a MeetingEventReservation or a MeetingRelayReservation
  # depending by the type of the specified MeetingEvent ID.
  # Header rows (MeetingReservation) are also handled.
  #
  # @see MeetingReservationUpdater for more info.
  #
  # At the end of the update process a SendDbDiffJob will be invoked to be run after
  # a few minutes.
  # The delay in minutes should be chosen as "enough" to collect multiple DB updates
  # at once, in order to avoid sending too many DB-diff files to the same SysOp e-mail.
  #
  # === Parameters:
  # - "e"     => MeetingEvent id (required, key#2)
  # - "b"     => Badge id (required, key#1)
  # - "time"  => incremental timing value as text (e.g.: "1'15\"00"); can be nil when deleting rows
  # - "skip"  => 'is_not_coming' ON=1 / OFF=0 <default> as smallint char digit; when '1' any detail row will be deleted
  # - "on"    => 'is_doing_this' ON=1 / OFF=0 <default> as smallint char digit
  # - "ok"    => 'has_confirmed' ON=1 / OFF=0 <default> as smallint char digit
  # - "n"     => notes (used only for MeetingReservation and/or MeetingRelayReservation rows)
  #
  # === Returns:
  #
  # A JSON response (either :success or :error).
  #
  def update_reservation
# DEBUG
#    puts "\r\n--- #update_reservation: ---\r\nPARAMS: #{ params.inspect }"
    # Fetch params
    event_id      = params['e']
    badge_id      = params['b'].to_s
    is_not_coming = (params['skip'].to_i > 0)
    is_doing_this = (params['on'].to_i > 0)
    has_confirmed = (params['ok'].to_i > 0)
    timing_text   = params['time'].to_s
    notes         = params['n']

    if !event_id.present? && !badge_id.present?     # Nothing to do, bail out:
      render( status: 400, json: { result: "error", message: I18n.t("api.errors.invalid_request") } ) and return
      return
    end

    updater = MeetingReservationUpdater.new( current_user )
    result  = updater.process!( event_id, badge_id, is_doing_this, is_not_coming, has_confirmed, timing_text, notes )

    if result.nil?                                  # --- ERROR during CREATE/UPDATE ---
      render( status: 400, json: { result: "error", message: I18n.t("api.errors.unable_to_find_or_create_data_row") } ) and return

    elsif result                                    # --- CREATE / UPDATE / DELETE performed ---
      # Add SQL text to AppParameter:
      serialize_into_app_parameters!( updater )
      # Launch delayed Job to send the DB-diff to the SysOp using the remote-editing
      # dedicated named queue ('edit'):
      SendDbDiffJob.set( queue: :edit, wait: WAIT_MINS_BEFORE_JOB_CREATE ).perform_later
#    else
      # (no operations for result false => DELETE skipped => no SQL edits)
    end

    render status: 200, json: { result: "ok" }
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Stores into a dedicated row of AppParameter the SQL DB-diff contents logged
  # by the specified updater instance.
  #
  # The updater is supposed to respond to the SqlConvertable interface.
  #
  def serialize_into_app_parameters!( updater )
# DEBUG
#   puts "\r\nserialize_into_app_parameters for code: #{ 100000 + current_user.id }"
    app_parameter = AppParameter.find_or_create_by!( code: 100000 + current_user.id )

    new_text = if app_parameter.free_text_1.to_s.empty?
      updater.sql_diff_text_log
    else
      "#{ app_parameter.free_text_1 }\r\n\r\n#{ updater.sql_diff_text_log }"
    end

    app_parameter.update( free_text_1: new_text )
# DEBUG
#    app_parameter.reload
#    puts "\r\n------------8<----------\r\n#{ app_parameter.free_text_1 }\r\n-----------------------"
  end
  #-- -------------------------------------------------------------------------
  #++
end
