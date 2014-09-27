=begin

= ExerciseDecorator

  - version:  4.00.525
  - author:   Steve A., Leega

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
                                0, :short,
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


  # Returns a "natural" friendly description for exercises.
  # The "natural" description is obtanied computing
  # exercise row and combineing elements with some optimization
  # to create compact and more readable results
  #
  # If exercise rows of exercises with multiple rows has
  # the same stroke type it will precede the description, not never repeated
  # eg: SL 25 fast + 50 slow + 25 fast        instead of
  #     25 SL fast + 25 SL slow + 25 SL fast
  # 
  # If exercise rows of exercises with multiple rows has
  # the same training mode it will forward the description enclosed in parethesiys
  # eg: (25 SL + 25 DO) fast                  instead of
  #     25 SL fast + 25 DO fast
  #  (maybe shuld be better: SL/DO fast change at 25)
  # 
  # If exercise rows of exercises with multiple rows ora the only row has
  # the description of movemente "Complete" it should be omissed
  # eg: 50 SL + 50 DO                         instead of
  #     50 SL complete + 50 DO complete
  #  or 50 SL                                 instead of
  #     50 SL complete
  # 
  # If the training mode is A2 it sohuld be omissed (it's the default)
  # eg: 50 SL + 50 DO                         instead of
  #     50 SL resistance + 50 DO resistance
  #  or 25 FA fast + 25 SL                    instead of
  #     25 FA fast + 25 SL resistance
  # 
  # TODO Should we optimize something on distance too?
  #
  # So, finally we will have
  # 25 SL fast + 50 SL slow + 25 FA fast      instead of
  # 25 SL complete fast + 50 SL complete slow + 25 FA complete fast
  # or
  # SL 15 fast + 35 slow                      instead of
  # 15 SL complete fast + 35 SL complete slow
  # or
  # 100 SL                                    instead of
  # 100 SL complete resistance
  #
  def get_friendly_description( total_distance = 0, swimmer_level_type_id = 0, separator = " + " )
    natural_description = ''
    er = exercise_rows.includes([:base_movement, :tarining_mode_type])

    # If less than two row should use exercise full name
    if er.count < 2
      # TODO optimize training mode and complete movements
      natural_description = get_full_name( total_distance = 0, verbose_level = :full, swimmer_level_type_id = 0, separator = " + " )
    else
      # Check if same stroke type in all rows
      is_same_stroke = er.select('base_movements.stroke_type_id').uniq.count == 1

      # Check if same trainng mode in all rows
      is_same_mode = er.select(:training_mode_type_id).uniq.count == 1

      # Check if same distance
      is_same_distance = er.select(:percentage).uniq.count == 1

      exercise_rows.sort_by_part_order.collect{ |row|
        ExerciseRowDecorator.decorate( row ).get_description_elements( total_distance, swimmer_level_type_id )
      }.join(separator)
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
