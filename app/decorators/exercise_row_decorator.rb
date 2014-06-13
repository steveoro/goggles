# encoding: utf-8
require 'wrappers/timing'


=begin

= ExerciseRowDecorator

  - version:  4.00.313.20140610
  - author:   Steve A.

  Decorator for the ExerciseRow model.
  Contains all presentation-logic centered methods.

=end
class ExerciseRowDecorator < Draper::Decorator
  delegate_all


  # Returns a full description for this data row.
  #
  # === Params:
  # - total_distance: can be 0 if it must be obtained from each component
  # - verbose_level: either :short, :full or :verbose; default: :full
  # - swimmer_level_type_id: the id of the user's swimmer level type (or its preferred swimmer level type ID); NOT the code, NOT the level: the *ID*; it can be 0 if it must be ignored
  # - show_also_ordinal_part: true to show also the part_order; defaults to false.
  #
  def get_full_name( total_distance = 0, verbose_level = :full, swimmer_level_type_id = 0, show_also_ordinal_part = false )
    case verbose_level.to_sym
    when :short
      [
        ( show_also_ordinal_part ? sprintf("%02s)", part_order) : '' ),
        compute_displayable_distance( total_distance ),
        get_base_movement_short( true, swimmer_level_type_id ),
        get_training_mode_type_name( verbose_level ),
        get_execution_note_type_name( verbose_level ),
        get_formatted_start_and_rest,
        get_formatted_pause
      ].delete_if{ |e| e.to_s.empty? }.join(' ')
    when :verbose
      [
        ( show_also_ordinal_part ? sprintf("%02s)", part_order) : '' ),
        compute_displayable_distance( total_distance ),
        get_base_movement_full( true, swimmer_level_type_id ),
        get_training_mode_type_name( verbose_level ),
        get_execution_note_type_name( verbose_level ),
        get_formatted_start_and_rest,
        get_formatted_pause
      ].delete_if{ |e| e.to_s.empty? }.join(' ')
    else
      [
        ( show_also_ordinal_part ? sprintf("%02s)", part_order) : '' ),
        compute_displayable_distance( total_distance ),
        get_base_movement_short( true, swimmer_level_type_id ),
        get_training_mode_type_name( :execution ),
        get_execution_note_type_name( :short ),
        get_formatted_start_and_rest,
        get_formatted_pause
      ].delete_if{ |e| e.to_s.empty? }.join(' ')
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Returns a displayable (string) computed distance for this exercise row.
  # Parameter total_distance is assumed to refer to the external (training row) distance
  # set by the entity that is referring this exercise row.
  #
  # If the total "external" distance is specified but the percentage of this row is 100%,
  # an empty string is returned, assuming the total_distance will be displayed elsewhere
  # (since it is externally provided).
  #
  # Note that if the member distance is set to this row, it will take
  # precedence over the computed distance (obtained applying the percentage field
  # to the "external" total_distance).
  #
  def compute_displayable_distance( total_distance = 0 )
# DEBUG
#    puts "-- compute_displayable_distance( #{total_distance.inspect} ) called."
    if ( distance > 0 )
      distance.to_s
    else
      if ( total_distance > 0 )
        ( percentage < 100 ? "#{sprintf("%02s", total_distance * percentage / 100)}" : '' )
      else
        ( percentage < 100 ? "#{sprintf("%02s", self.percentage)}%" : '' )
      end
    end
  end


  # Returns the esteemed total seconds of expected duration for this exercise row.
  #
  # Field start_and_rest has the precedence on everything else.
  # When the internal row distance is set, it returns an esteemed duration (based on a slow-pace).
  #
  # In case the distance or the start_and_rest member are not set,
  # returns 0 or the pause member, if with_pause parameter is set to true .
  #
  def compute_total_seconds( with_pause = false )
    if start_and_rest > 0
      start_and_rest
    else                                            # Compute expected duration based on distance:
      result = ExerciseRow.esteem_time_in_seconds( distance )
      with_pause ? result + pause : result
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Returns the formatted string of the +pause+ value
  def get_formatted_pause
    Timing.to_formatted_pause( pause )
  end

  # Returns the formatted string of the +start_and_rest+ value
  def get_formatted_start_and_rest
    Timing.to_formatted_start_and_rest( start_and_rest )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns the BaseMovement full description
  #
  # === Params:
  # - use_i18n_desc: true to use the localized version of the description instead of the computed one; default to false
  # - swimmer_level_type_id: the id of the user's swimmer level type (or its preferred swimmer level type ID); NOT the code, NOT the level: the *ID*; it can be 0 if it must be ignored
  #
  def get_base_movement_full( use_i18n_desc = false, swimmer_level_type_id = 0 )
    return '' unless base_movement
    if use_i18n_desc
      base_movement.i18n_description
    else
      base_movement.get_full_name( :full, swimmer_level_type_id )
    end
  end

  # Returns the BaseMovement short description
  #
  # === Params:
  # - use_i18n_desc: true to use the localized version of the description instead of the computed one; default to false
  # - swimmer_level_type_id: the id of the user's swimmer level type (or its preferred swimmer level type ID); NOT the code, NOT the level: the *ID*; it can be 0 if it must be ignored
  #
  def get_base_movement_short( use_i18n_desc = false, swimmer_level_type_id = 0 )
    return '' unless base_movement
    if use_i18n_desc
      base_movement.i18n_short
    else
      base_movement.get_full_name( :short, swimmer_level_type_id )
    end
  end

  # Returns the ExecutionNoteTypes name
  #
  # === Params:
  # - verbose_level: either :short, :full or :verbose; default: :short
  #
  def get_execution_note_type_name( verbose_level = :short )
    return '' unless execution_note_type
    if verbose_level.to_sym == :short
      execution_note_type.i18n_short
    else
      execution_note_type.i18n_description
    end
  end

  # Returns the Training Mode type name
  #
  # === Params:
  # - verbose_level: either :short, :full or :verbose; default: :short
  #
  def get_training_mode_type_name( verbose_level = :short )
    return '' unless training_mode_type
    if verbose_level.to_sym == :short
      training_mode_type.i18n_short
    else
      training_mode_type.i18n_alternate
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
