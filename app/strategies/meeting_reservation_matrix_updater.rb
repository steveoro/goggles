# encoding: utf-8
require 'common/validation_error_tools'
require 'wrappers/timing'


=begin

= MeetingReservationMatrixUpdater

 - Goggles framework vers.:  6.036
 - author: Steve A.

 Strategy class used to update the existing matrix of either MeetingEventReservation
 or MeetingRelayReservation rows on the DB, given the specific paramter keys and
 values.
 Each key contains a distinctive prefix which tells the class which kind of entity
 should be updated, together with its row ID, whereas the value is the content of
 the actual update.

 Key structure:

        <prefix><row_id> => <actual_update_value>

 The recognized prefixes are only the ones defined by the constants inside the
 parent class (MeetingReservationMatrixProcessor). All other keys are ignored.

 Check out also the companion class for this one, MeetingEventReservationMatrixCreator,
 which creates the matrix of rows itself.

 Each updated database row is logged through the SqlConvertable's exposed method
 #sql_diff_text_log in a single output "diff" text, created after #call.

 In case of failure, the strategy fails silently, logging the errors inside the
 same generated SQL diff text.

=== Notes:

 1. Keep in mind that serialization of this diff SQL text is delegated to external
 objects.

 2. To clear a timing value, send the updated value ('0') to the related toggle switch.
 Setting the timing text to "0'00\"" won't clear the value, but set it to "no-time".
 Setting the timing text to empty or nil will force skip the update on the field.

=end
class MeetingReservationMatrixUpdater < MeetingReservationMatrixProcessor

  attr_reader :reservation_keys

  # Creates a new Updater instance using the +params+ hash specified.
  #
  # The Hash (or even a ActionController::Parameters instance) is expected to
  # have string keys specified by the DOM_PRE_xxx constants of MeetingReservationMatrixProcessor.
  # These prefixes will be used to extract the actual row IDs which need to be
  # updated with the specified values.
  #
  # All the other string keys in the hash structure are ignored, unless prefixed
  # with one of the recognized constants.
  # (See #MeetingReservationMatrixProcessor)
  #
  # The +current_user+ parameter is used only for logging purposes.
  #
  def initialize( params, current_user )
    raise ArgumentError.new('params must either be a kind of Hash or an ActionController::Parameters instance.') unless params.instance_of?( ActionController::Parameters ) || params.kind_of?( Hash )
    # Let's store the whole params structure, so it can be retrieved easily later on:
    @params = params
    # Sample possible params structure:
    # <ActionController::Parameters {"utf8"=>"✓",
    #   "authenticity_token"=>"<a string token>",
    #   "evr_1"=>"", "evr_2"=>"35\"10", "evrChecked_2"=>"1", "evr_3"=>"",
    #   "evr_4"=>"", "evr_5"=>"", "evr_6"=>"", "evr_7"=>"", "evr_8"=>"32\"04",
    #   "evrChecked_8"=>"1",
    #   "evr_9"=>"", "evr_10"=>"", "evr_11"=>"", "resNotes_1"=>"2 seats available",
    #   "commit"=>"Save",
    #   "id"=>"16216", # <= this is the meeting ID (but it's currently unused)
    #   "controller"=>"meeting_reservations", "action"=>"update",
    #   "locale"=>"en"} permitted: false> # (We currently don't care about #permitted)

    @reservation_keys = params.keys.select do |k|
      k =~ /^#{ DOM_PRE_RES_NOT_COMING }|^#{ DOM_PRE_RES_CONFIRMED }|^#{ DOM_PRE_RES_NOTES }|^#{ DOM_PRE_EVENT_TIMING }|^#{ DOM_PRE_EVENT_CHECKED }|^#{ DOM_PRE_RELAY_CHECKED }|^#{ DOM_PRE_RELAY_NOTES }/
    end
    @total_errors = 0
    @processed_rows = 0
    create_sql_diff_header( "#{ self.class.name } recorded from actions by #{ current_user }" )
  end
  #-- --------------------------------------------------------------------------
  #++

  # Executes the creator given the stored parameters.
  # Returns +true+ in case of no errors, +false+ otherwise.
  #
  def call
    @reservation_keys.each do |key|
      if key =~ /#{ DOM_PRE_RES_NOT_COMING }/
        update_record_and_log( DOM_PRE_RES_NOT_COMING, key, MeetingReservation, 'is_not_coming' )
      elsif key =~ /#{ DOM_PRE_RES_CONFIRMED }/
        update_record_and_log( DOM_PRE_RES_CONFIRMED, key, MeetingReservation, 'has_confirmed' )
      elsif key =~ /#{ DOM_PRE_RES_NOTES }/
        update_record_and_log( DOM_PRE_RES_NOTES, key, MeetingReservation, 'notes' )

      elsif key =~ /#{ DOM_PRE_EVENT_CHECKED }/
        update_record_and_log( DOM_PRE_EVENT_CHECKED, key, MeetingEventReservation, 'is_doing_this' )
      elsif key =~ /#{ DOM_PRE_EVENT_TIMING }/
        update_record_and_log( DOM_PRE_EVENT_TIMING, key, MeetingEventReservation, 'timing' )

      elsif key =~ /#{ DOM_PRE_RELAY_CHECKED }/
        update_record_and_log( DOM_PRE_RELAY_CHECKED, key, MeetingRelayReservation, 'is_doing_this' )
      elsif key =~ /#{ DOM_PRE_RELAY_NOTES }/
        update_record_and_log( DOM_PRE_RELAY_NOTES, key, MeetingRelayReservation, 'notes' )
      end
    end
    return( @total_errors == 0 )
  end
  #-- --------------------------------------------------------------------------
  #++


  # Returns the expected row count for the execution of the updater class.
  #
  # The result is the expected number of updated rows.
  # The actual processed_rows will be lesser than this only when some updates
  # are skipped due to errors or empty or unprocessable values.
  # (We won't create a new SQL update query for each empty string passed as
  #  a timing)
  #
  def expected_rows_count
    @reservation_keys.count
  end
  #-- --------------------------------------------------------------------------
  #++


  private


  # Returns the row ID from the key, given the prefix
  #
  def extract_row_id( key, prefix )
    key.gsub(/#{ prefix }/, '')
  end

  # Value sanitizer for free notes and text fields
  #
  def sanitize_input( value )
    # Strip anything that could cause harm if injected with the right syntax:
    value.gsub(/[\.\,\;\:\/\\\'\"\[\]\(\)\<\>\%\#\@\$\!\`\^\?\*]/, '')
  end
  #-- --------------------------------------------------------------------------
  #++

  # Updates the given record with the specified value, logging the results
  # internally.
  #
  def update_record_and_log( prefix, key, entity, field_name )
    # Extract the row id and retrive the DB row, if possible:
    id = extract_row_id( key, prefix )
    record = entity.find_by_id( id )

    if record
      new_value = @params[ key ]
# DEBUG
#      puts "\r\n'#{field_name}' => <#{ new_value.inspect }>"
      # Pre-process new_value according to destination field type:
      # (Note that the FalseClass yields #present? to false, so we check
      # against nil here, forcing to nil any other ignored value,
      # including the empty string - which is returned by almost every
      # non-edited text field)
      unless new_value.nil?
                                                    # Convert to True/False class boolean fields:
        if field_name =~ /is_not_coming|has_confirmed|is_doing_this/
# DEBUG
#          puts "bool set"
          new_value = ( [1, '1', true, 'true'].member?(new_value) )
                                                    # Sanitize free text fields:
        elsif field_name == 'notes'
# DEBUG
#          puts "sanitize text"
          new_value = sanitize_input( new_value )
                                                    # Convert timing fields to instances:
        elsif field_name == 'timing'                # (Not an actual field, but gives us the type)
# DEBUG
#          puts "timing set"
          # (We need to get a single Timing instance from the value and then get
          #  the single fields: suggested_seconds, minutes and hundreds)
          new_value = TimingParser.parse( new_value )

        else                                        # Ignore any other case:
# DEBUG
#          puts "set to nil"
          new_value = nil
        end
      end

      unless new_value.nil?                         # Any value to process?
# DEBUG
#        puts "value found present"
        # Process new_value according to destination field type.
        # We have 3 types: boolean, integer from timing text and free notes (to be sanitized)
        if new_value.instance_of?( String )
          record.send(field_name + '=', new_value)

        elsif new_value.instance_of?( Timing )
          record.suggested_minutes = new_value.minutes
          record.suggested_seconds = new_value.seconds
          record.suggested_hundreds = new_value.hundreds

        elsif new_value.instance_of?( TrueClass ) || new_value.instance_of?( FalseClass )
          record.send(field_name + '=', new_value)
          # Clear also the timing if the field is 'is_doing_this' and the value is false:
          if (field_name =~ /is_doing_this/) && (! new_value) &&
             (entity.name == 'MeetingEventReservation')
            record.suggested_minutes = 0
            record.suggested_seconds = 0
            record.suggested_hundreds = 0
          end
        end
                                                    # Save the change:
        if record.save
# DEBUG
#          puts "save successful"
          sql_diff_text_log << to_sql_update( record, false, record.attributes, "\r\n\r\n" )
          @processed_rows += 1
        else                                        # Log also in case of failure:
# DEBUG
#          puts "\r\nsave FAILURE: record.invalid?: #{ record.invalid? }, validation: #{  ValidationErrorTools.recursive_error_for( record ) }"
          sql_diff_text_log << "-- UPDATE VALIDATION FAILURE: #{ ValidationErrorTools.recursive_error_for( record ) }\r\n" if record.invalid?
          sql_diff_text_log << "-- UPDATE FAILURE: #{ $! }\r\n" if $!
          @total_errors += 1
        end
      # else: we ignore (skip) null or unparsable values
      else
# DEBUG
#        puts "ELSE (skip)"
      end

    else                                        # Reservation row not found:
      sql_diff_text_log << "-- RESERVATION ROW NOT FOUND: id = #{ id }\r\n"
      sql_diff_text_log << "-- #{ entity.name } update skipped: '#{ field_name }' = '#{ new_value }'\r\n"
      @total_errors += 1
    end
  end
  #-- --------------------------------------------------------------------------
  #++
end
