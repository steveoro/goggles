# encoding: utf-8

require 'wrappers/timing'


class ExerciseRow < ActiveRecord::Base

  belongs_to :exercise
  belongs_to :base_movement
  belongs_to :training_mode_type
  belongs_to :arm_aux_type
  belongs_to :kick_aux_type
  belongs_to :body_aux_type
  belongs_to :breath_aux_type
  belongs_to :execution_note_type
  validates_associated :exercise
  validates_associated :base_movement
  validates_associated :training_mode_type
  validates_associated :arm_aux_type
  validates_associated :kick_aux_type
  validates_associated :body_aux_type
  validates_associated :breath_aux_type
  validates_associated :execution_note_type

  validates_presence_of     :part_order
  validates_length_of       :part_order, :within => 1..3, :allow_nil => false
  validates_numericality_of :part_order
  validates_presence_of     :percentage
  validates_length_of       :percentage, :within => 1..3, :allow_nil => false
  validates_numericality_of :percentage
  validates_presence_of     :distance
  validates_length_of       :distance, :within => 1..4, :allow_nil => false
  validates_numericality_of :distance
  validates_presence_of     :start_and_rest
  validates_length_of       :start_and_rest, :within => 1..4, :allow_nil => false
  validates_numericality_of :start_and_rest
  validates_presence_of     :pause
  validates_length_of       :pause, :within => 1..4, :allow_nil => false
  validates_numericality_of :pause


  scope :sort_by_part_order, order('part_order')


  # ---------------------------------------------------------------------------
  # Base methods:
  # ---------------------------------------------------------------------------


  # Computes a full description for this data row.
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
        compute_distance( total_distance ),
        get_base_movement_short( true, swimmer_level_type_id ),
        get_training_mode_type_name( verbose_level ),
        get_execution_note_type_name( verbose_level ),
        get_arm_aux_type_name( verbose_level ),
        get_kick_aux_type_name( verbose_level ),
        get_body_aux_type_name( verbose_level ),
        get_breath_aux_type_name( verbose_level ),
        get_formatted_start_and_rest,
        get_formatted_pause
      ].delete_if{ |e| e.to_s.empty? }.join(' ')
    when :verbose
      [
        ( show_also_ordinal_part ? sprintf("%02s)", part_order) : '' ),
        compute_distance( total_distance ),
        get_base_movement_full( true, swimmer_level_type_id ),
        get_training_mode_type_name( verbose_level ),
        get_execution_note_type_name( verbose_level ),
        get_arm_aux_type_name( verbose_level ),
        get_kick_aux_type_name( verbose_level ),
        get_body_aux_type_name( verbose_level ),
        get_breath_aux_type_name( verbose_level ),
        get_formatted_start_and_rest,
        get_formatted_pause
      ].delete_if{ |e| e.to_s.empty? }.join(' ')
    else
      [
        ( show_also_ordinal_part ? sprintf("%02s)", part_order) : '' ),
        compute_distance( total_distance ),
        get_base_movement_short( true, swimmer_level_type_id ),
        get_training_mode_type_name( :execution ),
        get_execution_note_type_name( :short ),
        get_arm_aux_type_name( :short ),
        get_kick_aux_type_name( :short ),
        get_body_aux_type_name( :short ),
        get_breath_aux_type_name( :short ),
        get_formatted_start_and_rest,
        get_formatted_pause
      ].delete_if{ |e| e.to_s.empty? }.join(' ')
    end
  end


  # Returns the computed distance for this exercise row.
  def compute_distance( total_distance )
    if self.distance > 0
      self.distance
    else
      if total_distance > 0
        # what's percentage?!? I added 'self.' supposing it was execrcise row percentage, but I don't understand
        ( self.percentage < 100 ? "#{sprintf("%02s", total_distance * self.percentage / 100)}" : total_distance )
      else
        ( self.percentage < 100 ? "#{sprintf("%02s", self.percentage)}%" : '' )
      end
    end
  end
  # ---------------------------------------------------------------------------


  # Label symbol corresponding to either a column name or a model method to be used
  # mainly in generating DropDown option lists.
  #
  def self.get_label_symbol
    :get_full_name
  end

  # Returns the default parameter verbosity (override) for the corresponding label method used by get_label_symbol
  # and to_dropdown methods.
  # It can be nil if the method specified in get_label_symbol doesn't take any parameters.
  #
  def self.get_default_verbosity_for_label_symbol
    :short
  end

  # Returns an Array of 2-items Arrays, in which each item is the ID of the record
  # and the other is assumed to be its label
  #
  # == Parameters:
  #
  # - where_condition: an ActiveRecord::Relation WHERE-clause; defaults to +nil+ (returns all records)
  # - key_sym: the key symbol/column name (defaults to :id)
  # - label_sym: the key symbol/column name (defaults to self.get_label_symbol())
  #
  # == Returns:
  # - an Array of arrays having the structure [ [label1, key_value1], [label2, key_value2], ... ]
  #
  def self.to_dropdown( where_condition = nil, key_sym = :id, label_sym = self.get_label_symbol(),
                        verbose_level_for_label_method = self.get_default_verbosity_for_label_symbol() )
    self.where( where_condition ).map{ |row|
      [row.send(label_sym, 0, verbose_level_for_label_method), row.send(key_sym)]
    }.sort_by{ |ar| ar[0] }
  end
  # ----------------------------------------------------------------------------

  # Getter for the formatted string of the +pause+ value
  def get_formatted_pause
# FIXME with pause > 60", Timing conversion won't be perfomed using to_compact_s
    pause > 0 ? " p.#{Timing.to_compact_s(0, pause)}" : ''
  end

  # Getter for the formatted string of the +start_and_rest+ value
  def get_formatted_start_and_rest
    start_and_rest > 0 ? " S-R: #{Timing.to_s(0, start_and_rest)}" : ''
  end
  # ----------------------------------------------------------------------------

  # Retrieves the BaseMovement full description
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

  # Retrieves the BaseMovement short description
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

  # Retrieves the ExecutionNoteTypes name
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

  # Retrieves the Training Mode type name
  #
  # === Params:
  # - verbose_level: either :short, :full or :verbose; default: :short
  #
  def get_training_mode_type_name( verbose_level = :short )
    return '' unless training_mode_type
    if verbose_level.to_sym == :short
      training_mode_type.i18n_short
    else
      training_mode_type.i18n_execution
    end
  end

  # Retrieves the Arm Aux Type name
  #
  # === Params:
  # - verbose_level: either :short, :full or :verbose; default: :short
  #
  def get_arm_aux_type_name( verbose_level = :short )
    return '' unless base_movement
    if verbose_level.to_sym == :short
      (base_movement.is_arm_aux_allowed && arm_aux_type) ? arm_aux_type.i18n_short : ''
    else
      (base_movement.is_arm_aux_allowed && arm_aux_type) ? arm_aux_type.i18n_description : ''
    end
  end

  # Retrieves the Kick Aux Type name
  #
  # === Params:
  # - verbose_level: either :short, :full or :verbose; default: :short
  #
  def get_kick_aux_type_name( verbose_level = :short )
    return '' unless base_movement
    if verbose_level.to_sym == :short
      (base_movement.is_kick_aux_allowed && kick_aux_type) ? kick_aux_type.i18n_short : ''
    else
      (base_movement.is_kick_aux_allowed && kick_aux_type) ? kick_aux_type.i18n_description : ''
    end
  end

  # Retrieves the Body Aux Type name
  #
  # === Params:
  # - verbose_level: either :short, :full or :verbose; default: :short
  #
  def get_body_aux_type_name( verbose_level = :short )
    return '' unless base_movement
    if verbose_level.to_sym == :short
      (base_movement.is_body_aux_allowed && body_aux_type) ? body_aux_type.i18n_short : ''
    else
      (base_movement.is_body_aux_allowed && body_aux_type) ? body_aux_type.i18n_description : ''
    end
  end

  # Retrieves the Breath Aux Type name
  #
  # === Params:
  # - verbose_level: either :short, :full or :verbose; default: :short
  #
  def get_breath_aux_type_name( verbose_level = :short )
    return '' unless base_movement
    if verbose_level.to_sym == :short
      (base_movement.is_breath_aux_allowed && breath_aux_type) ? breath_aux_type.i18n_short : ''
    else
      (base_movement.is_breath_aux_allowed && breath_aux_type) ? breath_aux_type.i18n_description : ''
    end
  end
  # ----------------------------------------------------------------------------
end
