require 'wrappers/timing'
require 'timing_parser'
require 'common/validation_error_tools'


=begin

= RelaySwimmerUpdater

  - Goggles framework vers.:  6.344
  - author: Steve A.

 Single-row MeetingRelaySwimmer updater.

 Allows to find or create and update a single MeetingRelaySwimmer row given some key
 parameters.

 This class can be used by any user, whereas its sister class RelaySwimmerBatchUpdater
 can only be invoked by a valid TeamManager user.

 The resulting DB edits will be serialized into a dedicated AppParameter row,
 using the text field 'free_text_1'.
 (Which, allegedly, should be large enough to store all SQL commands issued in
  between DB-diff collection & clearing. See below.)

 On this purpose, later on, an instance of SendDbDiffJob is expected to be executed
 in order to collect all the rows storing the SQL edits, build a single SQL/DB-diff file,
 send it via e-mail to the SysOp and - finally - clear all the collected rows.

=end
class RelaySwimmerUpdater
  include SqlConvertable

  # Creates a new instance, given the current user that has "recorded" this operation.
  #
  def initialize( current_user )
    raise ArgumentError.new('current_user must be defined!') unless current_user.instance_of?( User )
    @current_user = current_user
  end
  #-- -------------------------------------------------------------------------
  #++


  # Process a single MeetingRelaySwimmer, keyed by a instance of MeetingRelayResult
  # and the relay order.
  #
  # The row will be:
  # - updated, when found existing;
  # - created, wuth the specified values when not found;
  # - deleted, when swimmer_id is nil or 0 and the row itself is existing.
  #
  # The method updates the internal SQL diff log file accordingly.
  #
  # == Returns:
  #
  # The updated/created MeetingRelaySwimmer resulting instance,
  # or +true+ in case of deletion;
  #
  # Result is +false+ when the row was not found and the deletion was skipped,
  # or +nil+ only in case of error during the update/create transaction.
  #
  def process( mrr, relay_order, swimmer_id, incremental_timing_text_value, reaction_time_text )
    return nil unless mrr && (relay_order.to_i > 0)

    # Swimmer.id null? Search for an existing MeetingRelaySwimmer and delete the row if found:
    if swimmer_id.to_i < 1                               # Possible DELETE
      return delete_existing_row( mrr.id, relay_order )

    else                                            # Possible UPDATE or CREATE
      team_id   = mrr.team_id
      season_id = mrr.season.id
# DEBUG
#      puts "MRR #{ mrr.id }. Seeking badge for team: #{ team_id }, season: #{ season_id }, swimmer: #{ swimmer_id }"
      badge     = Badge.where( team_id: team_id, season_id: season_id, swimmer_id: swimmer_id ).first
      stroke_type_id = RelaySwimmerBatchUpdater.get_fractionist_stroke_type_id_by( mrr.event_type.stroke_type_id, relay_order )

      unless badge && stroke_type_id
# DEBUG
#        puts "badge (#{ badge ? badge.id : 'nil'}) or stroke_type_id (#{ stroke_type_id }) NOT found"
        return nil
      end

      timing = TimingParser.parse( incremental_timing_text_value )
      reaction_time = TimingParser.parse( reaction_time_text ) if reaction_time_text
# DEBUG
#      puts "timing: '#{ incremental_timing_text_value }' => #{ timing }\r\nreaction: '#{ reaction_time_text }' => #{ reaction_time }"

      begin
        MeetingRelaySwimmer.transaction do
# DEBUG
#          puts "in TRANSACTION, checking for row existance..."
          mrs = MeetingRelaySwimmer.where( meeting_relay_result_id: mrr.id, relay_order: relay_order ).first

          if mrs                                    # --- UPDATE ---
# DEBUG
#            puts "before UPDATE"
            edit_existing_row( mrs, swimmer_id, badge.id, stroke_type_id, timing, reaction_time )

          else                                      # --- CREATE ---
# DEBUG
#            puts "before CREATE"
            create_new_row( mrr, relay_order, swimmer_id, badge.id, stroke_type_id, timing, reaction_time )
          end
        end

      rescue
# DEBUG
#        puts "RESCUE: '#{ $! }'"
        return nil
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  protected


  # Deletes an existing row of MeetingRelaySwimmer if any was found indexed by
  # meeting_relay_result_id (mrr_id) and relay_order.
  #
  # This method updates also the internal SQL diff log file.
  #
  # == Returns:
  #
  # +true+ in case of deletion, +false+ otherwise (row not found, deletion skipped).
  #
  def delete_existing_row( mrr_id, relay_order )
# DEBUG
#    puts "\r\ndelete_existing_row( mrr_id: #{ mrr_id }, relay_order: #{ relay_order })"
    mrs = MeetingRelaySwimmer.where( meeting_relay_result_id: mrr_id, relay_order: relay_order ).first

    if mrs                                        # --- DELETE ---
# DEBUG
#      puts "MRS found (id: #{ mrs.id }). Deleting..."
      mrs.delete
      # Store Db-diff text for DELETE
      sql_diff_text_log << to_sql_delete( mrs, false, "\r\n" )
      true
    else # (no error, nothing done)
      false
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Edits an existing row id assuming its new timing value is specified as
  # an incremental timing (as a string).
  #
  # This method updates also the internal SQL diff log file.
  #
  # == Returns:
  #
  # The specified MeetingRelaySwimmer instance (which will result updated only when successful).
  # nil only in case of no-ops.
  #
  def edit_existing_row( mrs, swimmer_id, badge_id, stroke_type_id, timing_instance, reaction_time_instance )
    return nil unless swimmer_id.present? && badge_id.present?
# DEBUG
#    puts "\r\nedit_existing_row( mrs.id: #{ mrs.id }, swimmer_id: #{ swimmer_id }, badge_id: #{ badge_id }, stroke_type_id: #{ stroke_type_id }, timing: #{ timing_instance }, reaction_time: #{ reaction_time_instance })"
#    puts "before UPDATE"

    if is_an_actual_update_of( mrs, swimmer_id, badge_id, timing_instance )
      mrs.update!(
        swimmer_id:     swimmer_id,
        badge_id:       badge_id,
        minutes:        timing_instance ? timing_instance.minutes : 0,
        seconds:        timing_instance ? timing_instance.seconds : 0,
        hundreds:       timing_instance ? timing_instance.hundreds : 0,
        reaction_time:  reaction_time_instance ? reaction_time_instance.to_hundreds / 100.0 : 0.0,
        stroke_type_id: stroke_type_id,
        user_id:        @current_user.id
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
      sql_diff_text_log << to_sql_update( mrs, false, sql_attributes, "\r\n" )

    else # (log no-op)
# DEBUG
#      puts "No actual changes detected. Skipping update."
    end

    mrs
  end
  #-- -------------------------------------------------------------------------
  #++


  # Creates a new row given its parent mrr id and its other values.
  #
  # This method updates also the internal SQL diff log file.
  #
  # == Returns:
  #
  # The specified MeetingRelaySwimmer instance (which will result created only when successful).
  # nil only in case of no-ops.
  #
  def create_new_row( mrr, relay_order, swimmer_id, badge_id, stroke_type_id, timing_instance, reaction_time_instance )
    return nil unless swimmer_id.present? && badge_id.present? && relay_order.present?
    mrs = MeetingRelaySwimmer.new(
      meeting_relay_result_id: mrr.id,
      relay_order:    relay_order,
      swimmer_id:     swimmer_id,
      badge_id:       badge_id,
      minutes:        timing_instance ? timing_instance.minutes : 0,
      seconds:        timing_instance ? timing_instance.seconds : 0,
      hundreds:       timing_instance ? timing_instance.hundreds : 0,
      reaction_time:  reaction_time_instance ? reaction_time_instance.to_hundreds / 100.0 : 0.0,
      stroke_type_id: stroke_type_id,
      user_id:        @current_user.id
    )
# DEBUG
#    puts "before SAVE!"
#    puts ValidationErrorTools.recursive_error_for( mrs ) unless mrs.valid?
    mrs.save!
    # Store Db-diff text for INSERT
    sql_diff_text_log << to_sql_insert( mrs, false, "\r\n" )

    mrs
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Returns true if the specified constitute any actual changes to the specified
  # instance of MeetingRelaySwimmer; false otherwise.
  #
  def is_an_actual_update_of( mrs, swimmer_id, badge_id, timing )
    ( timing.instance_of?(Timing) && mrs.get_timing_instance.to_hundreds != timing.to_hundreds ) ||
    ( mrs.swimmer_id != swimmer_id.to_i ) ||
    ( mrs.badge_id != badge_id.to_i )
  end
  #-- -------------------------------------------------------------------------
  #++
end
