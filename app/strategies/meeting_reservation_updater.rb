require 'wrappers/timing'
require 'timing_parser'
require 'common/validation_error_tools'


=begin

= MeetingReservationUpdater

  - Goggles framework vers.:  6.373
  - author: Steve A.

 Single MeetingReservation + Meeting(Event/Relay)Reservation updater.

 Allows to find or create and update a single MeetingEventReservation or
 MeetingRelayReservation row given some key parameters.
 (In this case, meeting_id, badge_id, event_id.)

 If the header entity MeetingReservation is not found is created using the specified
 values. When found, it is updated.

 By specifying the event_id, the class identifies the event_type and acts accordingly,
 creating or updating either MeetingEventReservation or MeetingRelayReservation instances.

 This class can be used by any user. The process! method does not check the
 parameters for actual "manageability" of the specified meeting.

 The resulting DB edits will be serialized into a dedicated AppParameter row,
 using the text field 'free_text_1'.
 (Which, allegedly, should be large enough to store all SQL commands issued in
  between DB-diff collection & clearing. See below.)

 On this purpose, later on, an instance of SendDbDiffJob is expected to be executed
 in order to collect all the rows storing the SQL edits, build a single SQL/DB-diff file,
 send it via e-mail to the SysOp and - finally - clear all the collected rows.

=end
class MeetingReservationUpdater
  include SqlConvertable

  # Creates a new instance, given the current user that has "recorded" this operation.
  #
  def initialize( current_user )
    raise ArgumentError.new('current_user must be defined!') unless current_user.instance_of?( User )
    @current_user = current_user
  end
  #-- -------------------------------------------------------------------------
  #++


  # Process a single reservation tuple, identified by the keys meeting_id,
  # event_id & badge_id.
  # The event_id can be nil in case the processing involves only the header row
  # of the reservation.
  #
  # The header and detail tuples will be:
  # - updated, when the row exists;
  # - created with the specified values, when not found;
  # - deleted (just the detail rows), when is_not_coming == true.
  #
  # The method will act according to the presence of the first 2 parameters,
  # the others are not required and can be nil.
  # The method updates also the internal SQL diff log file accordingly.
  #
  # == Returns:
  #
  # The updated/created Meeting/Event/Relay/Reservation instance,
  # or +true+ in case of deletion;
  #
  # Result is +false+ when the row was not found and the deletion was skipped,
  # or +nil+ only in case of error during the update/create transaction.
  #
  def process!( meeting_id, badge_id, event_id, is_doing_this, is_not_coming = false, has_confirmed = false,
                timing_text_value = nil, notes = nil, relay_notes = nil )
# DEBUG
#    puts "\r\nprocess!( meeting_id: #{ meeting_id }: badge_id: #{ badge_id }, event_id: #{ event_id }, is_doing_this: #{ is_doing_this }, is_not_coming: #{ is_not_coming }, has_confirmed: #{ has_confirmed }, time: #{ timing_text_value }, notes: '#{ notes }', relay_notes: '#{ relay_notes }')"
    return nil unless meeting_id.present? && badge_id.present?
    badge = Badge.find_by_id( badge_id )
    event = event_id ? MeetingEvent.joins(:event_type).includes(:event_type).find_by_id( event_id ) : nil
    unless badge
# DEBUG
#      puts "\r\nBadge NOT found!"
      return nil
    end
    mrs = MeetingReservation.where( meeting_id: meeting_id, badge_id: badge_id ).first
# DEBUG
#    puts "\r\nRESERVATION HEADER: #{ mrs.inspect }"

    #                                               # --- Header CREATE or UPDATE ---
    if mrs.nil?
      mrs = create_new_header_row!( meeting_id, badge, is_not_coming, has_confirmed, notes )
    else
      mrs = edit_existing_header_row!( mrs, is_not_coming, has_confirmed, notes )
    end
                                                    # --- DELETE detail row(s) ---
    if is_not_coming ||
       (event && !event.event_type.is_a_relay? && !timing_text_value.present?) ||
       (event && event.event_type.is_a_relay? && !relay_notes.present?)
      return delete_existing_rows!( meeting_id, badge_id, event_id )

    elsif event.nil?                                # --- No event specified (only header row was involved) ---
      return mrs

    else                                            # --- UPDATE or CREATE detail rows ---
      team_id    = badge.team_id
      swimmer_id = badge.swimmer_id
      klass      = event.event_type.is_a_relay? ? MeetingRelayReservation : MeetingEventReservation
      suggested_timing = TimingParser.parse( timing_text_value )
# DEBUG
#      puts "timing: '#{ timing_text_value }' => #{ suggested_timing }; klass: #{ klass }, notes: '#{ notes }'"
      mres = klass.where( badge_id: badge_id, meeting_event_id: event_id ).first

      ActiveRecord::Base.transaction do
        if mres                                   # --- UPDATE ---
# DEBUG
#            puts "before UPDATE (#{ klass })"
          edit_existing_detail_row!( mres, event, is_doing_this, suggested_timing, relay_notes )
        else                                      # --- CREATE ---
# DEBUG
#            puts "before CREATE (#{ klass })"
          create_new_detail_row!( meeting_id, badge, event, is_doing_this, suggested_timing, relay_notes )
        end
      end
    end

  rescue
# DEBUG
    puts "RESCUE: '#{ $! }'"
    puts caller
    return nil
  end
  #-- -------------------------------------------------------------------------
  #++


  protected


  # Deletes any MeetingEventReservation or MeetingRelayReservation indexed by the
  # paramters.
  # This method updates also the internal SQL diff log file.
  #
  # == Returns:
  #
  # +true+ in case of deletion, raises an Exception in case of error.
  #
  def delete_existing_rows!( meeting_id, badge_id, event_id )
    delete_existing_detail_rows!( MeetingEventReservation, meeting_id, badge_id, event_id )
    delete_existing_detail_rows!( MeetingRelayReservation, meeting_id, badge_id, event_id )
    true
  end
  #-- -------------------------------------------------------------------------
  #++


  # Edits an existing detail MeetingReservation row.
  # This method updates also the internal SQL diff log file.
  #
  # == Returns:
  #
  # The specified MeetingReservation instance.
  # Returns +nil+ only in case of no-operations.
  #
  def edit_existing_header_row!( mrs, is_not_coming = false, has_confirmed = false, notes = nil )
    return nil unless mrs.instance_of?(MeetingReservation)
# DEBUG
#    puts "\r\nedit_existing_header_row!( mrs.id: #{ mrs.id } is_not_coming: #{ is_not_coming }, has_confirmed: #{ has_confirmed }, notes: '#{ notes }')"

    if is_an_actual_header_update_of( mrs, is_not_coming, has_confirmed, notes )
# DEBUG
#      puts "before HEADER UPDATE!"
      mrs.update!(
        is_not_coming:      is_not_coming,
        has_confirmed:      has_confirmed,
        notes:              notes,
        user_id:            @current_user.id
      )
      sql_attributes = mrs.attributes.select do |key|
        [ 'id', 'is_not_coming', 'has_confirmed', 'notes', 'user_id' ].include?( key.to_s )
      end
      sql_diff_text_log << to_sql_update( mrs, false, sql_attributes, "\r\n" )
# DEBUG
#      puts "after HEADER UPDATE, resulting DIFF:"
#      puts "\r\n------------8<----------\r\n#{ sql_diff_text_log }\r\n------------8<----------"
#      puts "HEADER: #{ mrs.inspect }"

#    else # (log no-op)
# DEBUG
#      puts "No actual changes detected. Skipping header update."
    end

    mrs
  end
  #-- -------------------------------------------------------------------------
  #++


  # Edits an existing detail row id (either a MeetingEventReservation or MeetingRelayReservation
  # instance). The MeetingEvent is used to discriminate between model types.
  # This method updates also the internal SQL diff log file.
  #
  # == Returns:
  #
  # The specified MeetingEventReservation or MeetingRelayReservation instance.
  # Returns +nil+ only in case of no-operations.
  #
  def edit_existing_detail_row!( mres, event, is_doing_this, suggested_timing = nil, notes = nil )
    return nil unless event.instance_of?(MeetingEvent) && (mres.instance_of?(MeetingEventReservation) || mres.instance_of?(MeetingRelayReservation))
# DEBUG
#    puts "\r\nedit_existing_detail_row!( #{ mres.class }: mres.id: #{ mres.id }, event: #{ event.get_full_name }, is_doing_this: #{ is_doing_this }, timing: #{ suggested_timing }, notes: '#{ notes }')"
#    puts "before UPDATE"

    if is_an_actual_detail_update_of( mres, is_doing_this, suggested_timing, notes )
      sql_attributes = []
# DEBUG
#      puts "before detail UPDATE!"
      if event.event_type.is_a_relay?
        mres.update!(
          is_doing_this:      is_doing_this,
          notes:              notes,
          user_id:            @current_user.id
        )
        sql_attributes = mres.attributes.select do |key|
          [ 'id', 'is_doing_this', 'notes', 'user_id' ].include?( key.to_s )
        end
      else
        mres.update!(
          is_doing_this:      is_doing_this,
          suggested_minutes:  suggested_timing ? suggested_timing.minutes : nil,
          suggested_seconds:  suggested_timing ? suggested_timing.seconds : nil,
          suggested_hundreds: suggested_timing ? suggested_timing.hundreds : nil,
          user_id:            @current_user.id
        )
        sql_attributes = mres.attributes.select do |key|
          [
            'id', 'is_doing_this', 'suggested_minutes', 'suggested_seconds', 'suggested_hundreds',
            'user_id'
          ].include?( key.to_s )
        end
      end
# DEBUG
#      puts "before sql_diff_text_log,"
#      puts "mres: #{ mres.inspect }"
      sql_diff_text_log << to_sql_update( mres, false, sql_attributes, "\r\n" )

#    else # (log no-op)
# DEBUG
#      puts "No actual changes detected. Skipping update."
    end

    mres
  end
  #-- -------------------------------------------------------------------------
  #++


  # Creates a new MeetingReservation row given the parameters.
  # This method updates also the internal SQL diff log file.
  #
  # == Returns:
  #
  # The specified MeetingReservation instance (which will result created only when successful).
  # nil only in case of no-ops.
  #
  def create_new_header_row!( meeting_id, badge, is_not_coming = false, has_confirmed = false,
                              notes = nil )
    return nil unless meeting_id.present? && badge.instance_of?(Badge)
    mrs = MeetingReservation.new(
      meeting_id:       meeting_id,
      team_id:          badge.team_id,
      swimmer_id:       badge.swimmer_id,
      badge_id:         badge.id,
      is_not_coming:    is_not_coming,
      has_confirmed:    has_confirmed,
      notes:            notes,
      user_id:          @current_user.id
    )
# DEBUG
#    puts "before Res (header) SAVE!"
#    puts ValidationErrorTools.recursive_error_for( mrs ) unless mrs.valid?
    mrs.save!
    # Store Db-diff text for INSERT
    sql_diff_text_log << to_sql_insert( mrs, false, "\r\n" )

    mrs
  end
  #-- -------------------------------------------------------------------------
  #++


  # Creates a new detail row given the parameters.
  # This method updates also the internal SQL diff log file.
  #
  # == Returns:
  #
  # The specified MeetingEventReservation or MeetingRelayReservation instance,
  # depending upon the type of the +event_id+.
  # Returns +nil+ only in case of no-operations.
  #
  def create_new_detail_row!( meeting_id, badge, event, is_doing_this, suggested_timing = nil,
                              notes = nil )
# DEBUG
#    puts "\r\ncreate_new_detail_row!( meeting_id: #{ meeting_id }, badge: #{ badge.id }, event: #{ event.get_full_name }, is_doing_this: #{ is_doing_this }, timing: #{ suggested_timing }, notes: '#{ notes }')"
#    puts "before CREATE (detail)"
    return nil unless meeting_id.present? && badge.instance_of?(Badge) && event.instance_of?(MeetingEvent)

    mres = if event.event_type.is_a_relay?
# DEBUG
#      puts "new RELAY res"
      MeetingRelayReservation.new(
        meeting_id:         meeting_id,
        team_id:            badge.team_id,
        swimmer_id:         badge.swimmer_id,
        badge_id:           badge.id,
        meeting_event_id:   event.id,
        is_doing_this:      is_doing_this,
        notes:              notes,
        user_id:            @current_user.id
      )
    else
# DEBUG
#      puts "new EVENT res"
      MeetingEventReservation.new(
        meeting_id:         meeting_id,
        team_id:            badge.team_id,
        swimmer_id:         badge.swimmer_id,
        badge_id:           badge.id,
        meeting_event_id:   event.id,
        is_doing_this:      is_doing_this,
        suggested_minutes:  suggested_timing ? suggested_timing.minutes : nil,
        suggested_seconds:  suggested_timing ? suggested_timing.seconds : nil,
        suggested_hundreds: suggested_timing ? suggested_timing.hundreds : nil,
        user_id:            @current_user.id
      )
    end

# DEBUG
#    puts "before Res (detail) SAVE!"
#    puts ValidationErrorTools.recursive_error_for( mres ) unless mres.valid?
    mres.save!
    # Store Db-diff text for INSERT
    sql_diff_text_log << to_sql_insert( mres, false, "\r\n" )

    mres
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Destroys any MeetingEventReservation or MeetingRelayReservation indexed by the
  # paramters; the actual model class must be specified as +klass+..
  # This method updates also the internal SQL diff log file.
  #
  # == Returns:
  #
  # +true+ in case of deletion, raises an Exception in case of error.
  #
  def delete_existing_detail_rows!( klass, meeting_id, badge_id, event_id )
# DEBUG
#    puts "before DELETE (klass: #{ klass }, meeting_id: #{ meeting_id }, badge_id: #{ badge_id }, event_id: #{ event_id })"
    mrs = event_id.present? ? klass.where( badge_id: badge_id, meeting_event_id: event_id ) :
                              klass.where( meeting_id: meeting_id, badge_id: badge_id )
    if mrs.count > 0
# DEBUG
#      puts "Some rows for deletion FOUND."
      # Store Db-diff text for DELETE
      mrs.each do |mres|
        sql_diff_text_log << to_sql_delete( mres, false, "\r\n" ) if mres.destroy!
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns +true+ if the row has any actual changes when compared to the parameters;
  # false otherwise.
  #
  def is_an_actual_header_update_of( mres, is_not_coming, has_confirmed, notes )
    ( mres.is_not_coming != is_not_coming ) ||
    ( mres.has_confirmed != has_confirmed ) ||
    ( mres.notes != notes )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns +true+ if the row has any actual changes when compared to the parameters;
  # false otherwise.
  #
  def is_an_actual_detail_update_of( mer, is_doing_this, suggested_timing, notes )
    ( mer.is_doing_this != is_doing_this ) ||
    ( suggested_timing.instance_of?(Timing) && mer.respond_to?(:suggested_minutes) &&
      mer.get_timing_instance.to_hundreds != suggested_timing.to_hundreds ) ||
    ( mer.respond_to?(:notes) && mer.notes != notes )
  end
  #-- -------------------------------------------------------------------------
  #++
end
