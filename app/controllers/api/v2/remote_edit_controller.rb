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
  # - "min" => minutes from timing value
  # - "sec" => seconds from timing value
  # - "hun" => hundreds from timing value
  #
  # === Additional Parameters:
  # - "r"   => reaction_time
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
    minutes     = params['min'].to_i
    seconds     = params['sec'].to_i
    hundreds    = params['hun'].to_i
    reaction_time = params['r'].to_i
    unless mrr && (relay_order > 0)
      render( status: 400, json: { result: "error", message: I18n.t("api.errors.invalid_request") } ) and return
      return
    end
    sql_diff_text = ""

    # Swimmer.id null? Search for an existing MeetingRelaySwimmer and delete the row if found:
    if swimmer_id < 1                               # Possible DELETE
# DEBUG
      puts "\r\nswimmer_id null => seeking MRS with MRR #{ mrr.id } & relay_order: #{ relay_order }..."
      mrs = MeetingRelaySwimmer.where( meeting_relay_result_id: mrr.id, relay_order: relay_order ).first

      if mrs                                        # --- DELETE ---
# DEBUG
        puts "MRS found. Deleting..."
        mrs.delete
        # Store Db-diff text for DELETE
        sql_diff_text << to_sql_delete( mrs, false, "\r\n" )
        # TODO add SQL text to AppParameter
      else # (no error, nothing done)
        render( status: 200, json: { result: "ok", message: I18n.t("api.errors.unable_to_clear_existing_row") } ) and return
      end

    else                                            # Possible UPDATE or CREATE
      team_id   = mrr.team_id
      season_id = mrr.season.id
# DEBUG
      puts "MRR #{ mrr.id }. Seeking badge for team: #{ team_id }, season: #{ season_id }, swimmer: #{ swimmer_id }"
      badge     = Badge.where( team_id: team_id, season_id: season_id, swimmer_id: swimmer_id ).first
      stroke_type_id = RelaySwimmerBatchUpdater.get_fractionist_stroke_type_id_by( mrr.event_type.stroke_type_id, relay_order )

      unless badge && stroke_type_id
# DEBUG
        puts "badge (#{ badge ? badge.id : 'nil'}) or stroke_type_id (#{ stroke_type_id }) NOT found"
        render( status: 400, json: { result: "error", message: I18n.t("api.errors.unable_to_find_existing_badge") } ) and return
      end

      begin
        MeetingRelaySwimmer.transaction do
# DEBUG
          puts "in TRANSACTION"
          mrs = MeetingRelaySwimmer.where( meeting_relay_result_id: mrr.id, relay_order: relay_order ).first

          if mrs                                    # --- UPDATE ---
# DEBUG
            puts "before UPDATE"
            mrs.update!(
              minutes:        minutes,
              seconds:        seconds,
              hundreds:       hundreds,
              swimmer_id:     swimmer_id,
              reaction_time:  reaction_time.to_f,
              badge_id:       badge.id,
              stroke_type_id: stroke_type_id,
              user_id:        current_user.id
            )
            # Store Db-diff text for UPDATE
            sql_attributes = mrs.attributes.select do |key|
              [
                'id', 'minutes', 'seconds', 'hundreds',
                'reaction_time',
                'stroke_type_id', 'swimmer_id', 'badge_id', 'user_id',
                'meeting_relay_result_id'
              ].include?( key.to_s )
            end
            sql_diff_text << to_sql_update( mrs, false, sql_attributes, "\r\n" )

          else                                      # --- CREATE ---
            mrs = MeetingRelaySwimmer.new(
              meeting_relay_result_id: mrr.id,
              relay_order:    relay_order,
              minutes:        minutes,
              seconds:        seconds,
              hundreds:       hundreds,
              swimmer_id:     swimmer_id,
              reaction_time:  reaction_time,
              badge_id:       badge.id,
              stroke_type_id: stroke_type_id,
              user_id:        current_user.id
            )
# DEBUG
            puts "before SAVE!"
            puts ValidationErrorTools.recursive_error_for( mrs )
            mrs.save!
            # Store Db-diff text for INSERT
            sql_diff_text << to_sql_insert( mrs, false, "\r\n" )
          end
        end
      rescue
# DEBUG
        puts "RESCUE: '#{ $! }'"
        render( status: 400, json: { result: "error", message: I18n.t("api.errors.unable_to_find_or_create_data_row") } ) and return
      end
    end

    # Add SQL text to AppParameter:
# DEBUG
    puts "SUCCESS. Before AppParameter.find_or_create_by!"
    app_parameter = AppParameter.find_or_create_by!( code: 100000 + current_user.id )
    app_parameter.free_text_1 = app_parameter.free_text_1.to_s << "\r\n\r\n" << sql_diff_text
    app_parameter.save!
    # Launch delayed Job to send the DB-diff to the SysOp using the remote editing named queue:
    SendDbDiffJob.set( queue: :edit, wait: 1.minutes ).perform_later

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
end
