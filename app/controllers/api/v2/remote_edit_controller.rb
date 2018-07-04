# encoding: utf-8


=begin

= Api::V2::RemoteEditController

  - version:  6.343
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


  # POST #update_relay_swimmer
  #     { mrr: <MRR_id>, s: <swimmer_id>, min: <minutes>, sec: <seconds>, hun: <hundreds>, r: <reaction_time> }
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
    unless mrr && (relay_order > 0)
      render( status: 400, json: { result: "error", message: I18n.t("api.errors.invalid_request") } ) and return
      return
    end

    updater = RelaySwimmerUpdater.new( current_user )
    result  = updater.process( mrr, relay_order, swimmer_id, timing_text, reaction_text )

    if result.nil?                                  # --- ERROR during CREATE/UPDATE ---
      render( status: 400, json: { result: "error", message: I18n.t("api.errors.unable_to_find_or_create_data_row") } ) and return

    elsif result                                    # --- CREATE / UPDATE / DELETE performed ---
      # Add SQL text to AppParameter:
      serialize_into_app_parameters( updater )
      # Launch delayed Job to send the DB-diff to the SysOp using the remote-editing
      # dedicated named queue ('edit'):
      SendDbDiffJob.set( queue: :edit, wait: 1.minutes ).perform_later
#    else
      # (no operations for result false => DELETE skipped => no SQL edits)
    end

    render status: 200, json: { result: "ok" }
  end
  #-- -------------------------------------------------------------------------
  #++


  # POST #update_passage
  #     { mpg: <meeting_program_id>, pt: <passage_type_id>, s: <swimmer_id>, t: <team_id>
  #       min: <minutes>, sec: <seconds>, hun: <hundreds> }
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
  # === Minimun/Required Parameters:
  # - "mpg" => MeetingProgram ID (key#1, used for Passage.find_or_create_by)
  # - "pt"  => PassageType.id (key#2, used for Passage.find_or_create_by)
  # - "s"   => Swimmer.id
  # - "t"   => Team.id
  # - "min" => minutes for the timing value
  # - "sec" => seconds for the timing value
  # - "hun" => hundreds for the timing value
  #
  # === Additional Parameters:
  # - "r"   => reaction_time
  # - "mir" => MeetingIndividualResult ID (when available)
  #
  # === Returns:
  #
  # A JSON response (either :success or :error).
  #
  def update_passage
    # TODO
    render status: 200, json: { result: "ok" }
  end
  #-- -------------------------------------------------------------------------
  #++


  # POST #update_event_reservation
  #     { m: <meeting_id>, b: <badge_id>, e: <meeting_event_id>, min: <minutes>,
  #       sec: <seconds>, hun: <hundreds>, on: <is_doing_this> }
  #
  # Creates or updates a specific row of meeting_event_reservations, storing the resulting SQL
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
  # - "m"   => Meeting ID (required, key#1, used for Passage.find_or_create_by)
  # - "b"   => Badge id (required, key#2, used for Passage.find_or_create_by)
  # - "e"   => MeetingEvent id (required, key#3, used for Passage.find_or_create_by)
  # - "on"  => 'is_doing_this' ON (1) / OFF (0) <default> as smallint digit
  # - "min" => minutes for the timing value
  # - "sec" => seconds for the timing value
  # - "hun" => hundreds for the timing value
  #
  # === Returns:
  #
  # A JSON response (either :success or :error).
  #
  def update_event_reservation
    # TODO
    render status: 200, json: { result: "ok" }
  end
  #-- -------------------------------------------------------------------------
  #++


  # POST #update_relay_reservation
  #     { m: <meeting_id>, b: <badge_id>, e: <meeting_event_id>, on: <is_doing_this>, n: <notes> }
  #
  # Creates or updates a specific row of meeting_relay_reservations, storing the resulting SQL
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
  # - "m"   => Meeting ID (required, key#1, used for Passage.find_or_create_by)
  # - "b"   => Badge id (required, key#2, used for Passage.find_or_create_by)
  # - "e"   => MeetingEvent id (required, key#3, used for Passage.find_or_create_by)
  # - "on"  => 'is_doing_this' ON (1) / OFF (0) <default> as smallint digit
  # - "n"   => free text notes
  #
  # === Returns:
  #
  # A JSON response (either :success or :error).
  #
  def update_relay_reservation
    # TODO
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
  def serialize_into_app_parameters( updater )
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
