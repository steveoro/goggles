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


  # Returns a "natural" description for this data row.
  # The "natural" description is obtanied computing
  # exercise row and cobineing elements with some optimization
  # to create compact and more readable result
  #
  def get_friendly_description( total_distance = 0, swimmer_level_type_id = 0, separator = " + " )
    natural_description = ''

    # If less than two row should use exercise full name
    if exercise_rows.count < 2
      natural_description = get_full_name( total_distance = 0, verbose_level = :full, swimmer_level_type_id = 0, separator = " + " )
    else
      er = exercise_rows.includes([:base_movement, :tarining_mode_type])

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
