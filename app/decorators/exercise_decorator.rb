=begin

= ExerciseDecorator

  - version:  4.00.313.20140610
  - author:   Steve A.

  Decorator for the Exercise model.
  Contains all presentation-logic centered methods.

=end
class ExerciseDecorator < Draper::Decorator
  delegate_all


  # Creates the Hash of all the pre-computed attributes used by type-ahead look-up
  # combos and lists. 
  #
  # == Params:
  # - <tt>current_user</tt> => the current_user instance, when available.
  #
  # == Returns:
  # An Hash instance having the following structure:
  # <tt>{
  #       :label                  => #get_full_name,
  #       :value                  => row.id,
  #       :tot_distance           => #compute_total_distance(),
  #       :tot_secs               => #compute_total_seconds(),
  #       :is_arm_aux_allowed     => #is_arm_aux_allowed(),
  #       :is_kick_aux_allowed    => #is_kick_aux_allowed(),
  #       :is_body_aux_allowed    => #is_body_aux_allowed(),
  #       :is_breath_aux_allowed  => #is_breath_aux_allowed(),
  #     }</tt>. 
  #
  def drop_down_attrs( current_user = nil )
    {
      label:                  get_full_name(
        0,
        :short,
        ( current_user ? current_user.get_preferred_swimmer_level_id() : 0 )
      ),
      value:                  id,
      tot_distance:           compute_total_distance(),
      tot_secs:               compute_total_seconds(),
      is_arm_aux_allowed:     is_arm_aux_allowed(),
      is_kick_aux_allowed:    is_kick_aux_allowed(),
      is_body_aux_allowed:    is_body_aux_allowed(),
      is_breath_aux_allowed:  is_breath_aux_allowed()
    }
  end
  #-- -------------------------------------------------------------------------
  #++


  # Computes a full description for this data row
  #
  # === Params:
  # - total_distance: can be 0 if it must be obtained from each component
  # - verbose_level: either :short, :full or :verbose; default: :full
  # - swimmer_level_type_id: the id of the user's swimmer level type (or its preferred swimmer level type ID); NOT the code, NOT the level: the *ID*; it can be 0 if it must be ignored
  # - separator: string separator for joining each field
  #
  def get_full_name( total_distance = 0, verbose_level = :full, swimmer_level_type_id = 0, separator = " + " )
    exercise_rows.sort_by_part_order.collect{ |row|
      ExerciseRowDecorator.decorate( row ).get_full_name( total_distance, verbose_level.to_sym, swimmer_level_type_id )
    }.join(separator)
  end
  #-- -------------------------------------------------------------------------
  #++

  # Computes the total distance in metres for this exercise.
  # (May return 0 in most cases.)
  #
  def compute_total_distance
    if exercise_rows
      exercise_rows.sort_by_part_order.inject(0){ |sum, row|
        actual_row_distance = ExerciseRowDecorator.decorate( row ).compute_displayable_distance(0).to_i
        sum + actual_row_distance
      }
    else
      0
    end
  end

  # Computes the esteemed total seconds of expected duration for this exercise
  # (May return 0 in most cases.)
  #
  def compute_total_seconds
    if exercise_rows
      exercise_rows.sort_by_part_order.inject(0){ |sum, row|
        sum + ExerciseRowDecorator.decorate( row ).compute_total_seconds()
      }
    else
      0
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # returns true if any of the exercise rows has a base_movement
  # that allows this aux entity type.
  #
  def is_arm_aux_allowed
    if base_movements
      base_movements.any?{ |base_movement| base_movement.is_arm_aux_allowed }
    else
      false
    end
  end

  # returns true if any of the exercise rows has a base_movement
  # that allows this aux entity type.
  #
  def is_kick_aux_allowed
    if base_movements
      base_movements.any?{ |base_movement| base_movement.is_kick_aux_allowed }
    else
      false
    end
  end

  # returns true if any of the exercise rows has a base_movement
  # that allows this aux entity type.
  #
  def is_body_aux_allowed
    if base_movements
      base_movements.any?{ |base_movement| base_movement.is_body_aux_allowed }
    else
      false
    end
  end

  # returns true if any of the exercise rows has a base_movement
  # that allows this aux entity type.
  #
  def is_breath_aux_allowed
    if base_movements
      base_movements.any?{ |base_movement| base_movement.is_breath_aux_allowed }
    else
      false
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
