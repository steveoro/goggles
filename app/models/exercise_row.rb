class ExerciseRow < ActiveRecord::Base

  belongs_to :exercise
  belongs_to :base_movement
  belongs_to :training_mode_type
  belongs_to :arm_aux_type
  belongs_to :kick_aux_type
  belongs_to :body_aux_type
  belongs_to :breath_aux_type
  validates_associated :exercise
  validates_associated :base_movement
  validates_associated :training_mode_type
  validates_associated :arm_aux_type
  validates_associated :kick_aux_type
  validates_associated :body_aux_type
  validates_associated :breath_aux_type

  validates_presence_of     :part_order
  validates_length_of       :part_order, :within => 1..3, :allow_nil => false
  validates_numericality_of :part_order
  validates_presence_of     :percentage
  validates_length_of       :percentage, :within => 1..3, :allow_nil => false
  validates_numericality_of :percentage
  validates_presence_of     :start_and_rest
  validates_length_of       :start_and_rest, :within => 1..4, :allow_nil => false
  validates_numericality_of :start_and_rest
  validates_presence_of     :pause
  validates_length_of       :pause, :within => 1..4, :allow_nil => false
  validates_numericality_of :pause


  # ---------------------------------------------------------------------------
  # Base methods:
  # ---------------------------------------------------------------------------


  # Computes a shorter description for the name associated with this data
  def get_full_name
    "#{sprintf("%02s)", part_order)} #{sprintf("%02s", percentage)}% " +
# FIXME ?
    [ 
      get_base_movement_full,
      get_arm_aux_type_short,
      get_kick_aux_type_short,
      get_body_aux_type_short,
      get_breath_aux_type_short,
      get_formatted_start_and_rest,
      get_formatted_pause
    ].delete_if{ |e| e.empty? }.join(', ')
  end
  # ---------------------------------------------------------------------------


  # Label symbol corresponding to either a column name or a model method to be used
  # mainly in generating DropDown option lists.
  #
  def self.get_label_symbol
    :get_full_name
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
  def self.to_dropdown( where_condition = nil, key_sym = :id, label_sym = self.get_label_symbol() )
    self.where( where_condition ).map{ |row|
      [row.send(label_sym), row.send(key_sym)]
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
  def get_base_movement_full
    base_movement ? base_movement.get_full_name : ''
  end

  # Retrieves the Training Mode type short name
  def get_training_mode_type_short
    training_mode_type ? training_mode_type.i18n_short : ''
  end

  # Retrieves the Arm Aux Type short name
  def get_arm_aux_type_short
    (base_movement.is_arm_aux_allowed && arm_aux_type) ? arm_aux_type.i18n_short : ''
  end

  # Retrieves the Kick Aux Type short name
  def get_kick_aux_type_short
    (base_movement.is_kick_aux_allowed && kick_aux_type) ? kick_aux_type.i18n_short : ''
  end

  # Retrieves the Body Aux Type short name
  def get_body_aux_type_short
    (base_movement.is_body_aux_allowed && body_aux_type) ? body_aux_type.i18n_short : ''
  end

  # Retrieves the Breath Aux Type short name
  def get_breath_aux_type_short
    (base_movement.is_breath_aux_allowed && breath_aux_type) ? breath_aux_type.i18n_short : ''
  end
  # ----------------------------------------------------------------------------
end
