require 'wrappers/timing'
require 'timing_parser'
require 'common/validation_error_tools'


=begin

= PassageUpdater

  - Goggles framework vers.:  6.350
  - author: Steve A.

 Single-row Passage updater.

 Allows to find or create and update a single Passage row given some key
 parameters.

 This class can be used by any user, whereas its sister class PassageBatchUpdater
 can only be invoked by a valid TeamManager user.

 The resulting DB edits will be serialized into a dedicated AppParameter row,
 using the text field 'free_text_1'.
 (Which, allegedly, should be large enough to store all SQL commands issued in
  between DB-diff collection & clearing. See below.)

 On this purpose, later on, an instance of SendDbDiffJob is expected to be executed
 in order to collect all the rows storing the SQL edits, build a single SQL/DB-diff file,
 send it via e-mail to the SysOp and - finally - clear all the collected rows.

=end
class PassageUpdater
  include SqlConvertable

  # Creates a new instance, given the current user that has "recorded" this operation.
  #
  def initialize( current_user )
    raise ArgumentError.new('current_user must be defined!') unless current_user.instance_of?( User )
    @current_user = current_user
  end
  #-- -------------------------------------------------------------------------
  #++



  # Process a single Passage row.
  #
  # The row will be:
  # - updated, when the row exists;
  # - created with the specified values, when not found;
  # - deleted, when the timing specified is nil and the row itself is existing.
  #
  # The method will act according to the presence of the first 2 parameters,
  # the others are not required and can be nil.
  #
  # When specified, the MeetingIndividualResult instance (mir_id) parameter will take
  # precedence over any other supplied meeting_program_id, swimmer_id & team_id.
  # (These 3 must all be present in order to be used when the +mir+ parameter is +nil+)
  #
  # (Thus, this updater supports also the editing of Passage rows w/o the existance
  # of a parent MIR row.)
  #
  # The method updates also the internal SQL diff log file accordingly.
  #
  # == Returns:
  #
  # The updated/created Passage instance, or +true+ in case of deletion;
  #
  # Result is +false+ when the row was not found and the deletion was skipped,
  # or +nil+ only in case of any errors during the update/create transaction.
  #
  def process!( passage, incremental_timing_text_value, passage_type_id = nil, mir_id = nil,
                reaction_time_text = nil, swimmer_id = nil, team_id = nil, meeting_program_id = nil )
    timing_instance = TimingParser.parse( incremental_timing_text_value ) if incremental_timing_text_value
    reaction_time   = TimingParser.parse( reaction_time_text ) if reaction_time_text
    mir = MeetingIndividualResult.find_by_id( mir_id )

    return nil if passage.nil? && timing_instance.nil? # (nothing to be done)
# DEBUG
#    puts "timing: '#{ incremental_timing_text_value }' => #{ timing_instance }\r\nreaction: '#{ reaction_time_text }' => #{ reaction_time }"

    if passage && timing_instance.nil?                # --- DELETE ---
      return delete_existing_row!( passage )

    elsif passage && timing_instance                  # --- UPDATE ---
      begin
        Passage.transaction do
          edit_existing_row!( passage, timing_instance, reaction_time,
                              meeting_program_id, swimmer_id, team_id )
        end
      rescue
# DEBUG
        puts "RESCUE: '#{ $! }'"
        return nil
      end

    elsif passage.nil? && timing_instance           # --- CREATE ---
      begin
        Passage.transaction do
          create_new_row!( mir, passage_type_id, timing_instance, reaction_time,
                           meeting_program_id, swimmer_id, team_id )
        end
      rescue
# DEBUG
        puts "RESCUE: '#{ $! }'"
        return nil
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++



  # Check if a passage timing refers to a delta/lap timing value.
  #
  # A passage row is a delta if its timing is the time swam in the passage distance.
  #
  # First passage row of a Meeting individual result group is always a "delta".
  # A passage is a delta if < prevvoius one.
  # A passage is a delta if > prevvoius one but not exceeding 50% of difference
  # between the current and the previous distance swam (according to an average
  # speed per meter).
  # (Thus a passage results as "incremental" only if greater than the previous one
  #  by a significant amount.)
  #
  # ==== EG 1.
  #  50: 3000 -> delta (first passage)
  # 100: 6130 -> incremental (50 in 6130 is a variation greater than 50% of previous one)
  # 150: 9300 -> incremental (50 in 9300 is a variation lesser than 50% of previous one)
  #
  # ==== EG 2.
  #  50: 3000 -> delta (first passage)
  # 100: 3130 -> delta (50 in 3130 is a variation lesser than 50% of previous one)
  # 150: 3270 -> delta (50 in 3270 is a variation lesser than 50% of previous one)
  #
  def self.is_delta?( passage )
    # We can't compute anything if the Passage doesn't have a working link on the MIR
    return true if passage.meeting_individual_result_id.to_i < 1

    # XXX [Steve, 20180712] Currently, passage.get_previous_passage() & passage.get_final_time()
    # work correctly only if the Passage row has a valid link to a MIR row.
    is_delta = false

    # Is incremental (not delta) if passage time swam equal to mir time swam
    if passage.get_timing_instance == passage.get_final_time
      is_delta = false
    else
      previous_passage = passage.get_previous_passage
      if previous_passage
        total_time_before = previous_passage.compute_incremental_time
        # Is delta if passage time swam < time swam before
        if total_time_before > passage.get_timing_instance
          is_delta = true
        # Is delta if passage swam speed per meter < average swam speed per meter * 50%
        elsif (passage.get_timing_instance.to_hundreds / passage.compute_distance_swam) <= (( passage.get_final_time.to_hundreds / passage.get_total_distance ) * 1.5 )
          is_delta = true
        # Is incremental if passage swam speed per meter > average swam speed per meter * 50%
        else
          is_delta = false
        end
      # Is delta if first passage (or no previous one)
      else
        is_delta = true
      end
    end
    is_delta
  end
  #-- -------------------------------------------------------------------------
  #++


  protected


  # Deletes an existing Passage row when found existing.
  # This method updates also the internal SQL diff log file.
  #
  # == Returns:
  #
  # +true+ in case of deletion, +false+ otherwise (row not found / destroy skipped).
  #
  def delete_existing_row!( passage )
    if passage && passage.destroy                   # --- DELETE ---
      # Store Db-diff text for DELETE
      sql_diff_text_log << to_sql_delete( passage, false, "\r\n" )
      true
    else # (no error, nothing done)
      false
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Edits an existing Passage row assuming its new timing value is specified as
  # an incremental timing.
  # This method updates also the internal SQL diff log file.
  #
  # == Returns:
  #
  # The specified Passage instance.
  # +nil+ only in case of errors.
  #
  def edit_existing_row!( passage, timing_instance, reaction_time_instance = nil,
                          meeting_program_id = nil, swimmer_id = nil, team_id = nil )
    return nil unless passage && timing_instance
# DEBUG
#    puts "\r\nedit_existing_row( passage.id: #{ passage.id }, timing: #{ timing_instance }, reaction_time: #{ reaction_time_instance })"
#    puts "before UPDATE"

    passage = prepare_passage_fields( passage, timing_instance, reaction_time_instance,
                                      passage.meeting_individual_result, passage.passage_type_id,
                                      meeting_program_id, swimmer_id, team_id )
    passage.save!

    # Store Db-diff text for UPDATE
    sql_attributes = passage.attributes.select do |key|
      [
        'id', 'minutes', 'seconds', 'hundreds',
        'reaction_time',
        'minutes_from_start', 'seconds_from_start', 'hundreds_from_start',
        'user_id'
      ].include?( key.to_s )
    end
    sql_diff_text_log << to_sql_update( passage, false, sql_attributes, "\r\n" )

    passage
  end
  #-- -------------------------------------------------------------------------
  #++


  # Creates a new row given its parent mrr id and its other values.
  # This method updates also the internal SQL diff log file.
  #
  # When specified, the MeetingIndividualResult instance (mir) parameter will take
  # precedence over any other supplied meeting_program_id, swimmer_id & team_id.
  # (These 3 must all be present in order to be used when the +mir+ parameter is +nil+)
  #
  # == Returns:
  #
  # The specified Passage instance (which will result created only when successful).
  # nil only in case of errors.
  #
  def create_new_row!( mir, passage_type_id, timing_instance, reaction_time_instance = nil,
                       meeting_program_id = nil, swimmer_id = nil, team_id = nil )
    return nil unless passage_type_id && timing_instance
    passage = prepare_passage_fields( Passage.new, timing_instance, reaction_time_instance, mir, passage_type_id,
                                      meeting_program_id, swimmer_id, team_id )
    passage.save!

    # Store Db-diff text for INSERT
    sql_diff_text_log << to_sql_insert( passage, false, "\r\n" )

    passage
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Prepares the required timing fields for the specified passage instance row,
  # given a parsed timing instance containing the values used to update the Passage.
  #
  # When specified, the MeetingIndividualResult instance (mir) parameter will take
  # precedence over any other supplied meeting_program_id, swimmer_id & team_id.
  # (These 3 must all be present in order to be used when the +mir+ parameter is +nil+)
  #
  # === Returns:
  # The updated Passage instance
  #
  def prepare_passage_fields( passage, timing_instance, reaction_time_instance = nil, mir = nil, passage_type_id = nil,
                              meeting_program_id = nil, swimmer_id = nil, team_id = nil )
    passage.user_id = @current_user.id
    prev_timing_instance = nil

    if mir.instance_of?( MeetingIndividualResult )
# DEBUG
#      puts "Passage->MIR link valid"
      passage.meeting_program_id = mir.meeting_program_id
      passage.meeting_individual_result_id = mir.id
      passage.swimmer_id = mir.swimmer_id
      passage.team_id = mir.team_id
      # [Steve, 20180712] passage.get_previous_passage() works only if the Passage
      # instance has a MIR associated.
      prev_timing_instance = passage.get_previous_passage ? passage.get_previous_passage.compute_incremental_time : nil
    else
# DEBUG
#      puts "Passage->MIR link NULL"
      passage.meeting_program_id = meeting_program_id if meeting_program_id.present?
      passage.swimmer_id = swimmer_id if swimmer_id.present?
      passage.team_id    = team_id if team_id.present?
    end
    passage.passage_type_id = passage_type_id if passage_type_id

    # Establish whether the passage is "delta" or "incremental":
    passage.minutes  = timing_instance.minutes
    passage.seconds  = timing_instance.seconds
    passage.hundreds = timing_instance.hundreds
    passage.reaction_time = reaction_time_instance ? reaction_time_instance.to_hundreds / 100.0 : 0.0
    is_delta = PassageUpdater.is_delta?( passage )

    if is_delta == true
      # timing_instance is "delta".
      # Should calculate time from start:
      passage.minutes  = timing_instance.minutes
      passage.seconds  = timing_instance.seconds
      passage.hundreds = timing_instance.hundreds
      passage.minutes_from_start  = timing_instance.minutes + ( prev_timing_instance ? prev_timing_instance.minutes : 0 )
      passage.seconds_from_start  = timing_instance.seconds + ( prev_timing_instance ? prev_timing_instance.seconds : 0 )
      passage.hundreds_from_start = timing_instance.hundreds + ( prev_timing_instance ? prev_timing_instance.hundreds : 0 )
    else
      # timing_instance is "incremental".
      # Should calculate delta time:
      delta_timing_instance = prev_timing_instance ? timing_instance - prev_timing_instance : timing_instance
      passage.minutes  = delta_timing_instance.minutes
      passage.seconds  = delta_timing_instance.seconds
      passage.hundreds = delta_timing_instance.hundreds
      passage.minutes_from_start  = timing_instance.minutes
      passage.seconds_from_start  = timing_instance.seconds
      passage.hundreds_from_start = timing_instance.hundreds
    end
# DEBUG
#    puts "\r\n- prepare_passage_fields(mir: #{mir ? mir.id : 'nil'}): " << passage.inspect

    passage
  end
  #-- -------------------------------------------------------------------------
  #++
end
