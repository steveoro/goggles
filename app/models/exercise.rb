require 'drop_down_listable'


class Exercise < ActiveRecord::Base
  include DropDownListable

  has_many :exercise_rows
  has_many :trainings, through: :training_rows
  has_many :base_movements, through: :exercise_rows

  validates_length_of     :training_step_type_codes, maximum: 50, allow_nil: true

  validates_presence_of   :code, length: { within: 1..6 }, allow_nil: false
  validates_uniqueness_of :code, message: :already_exists

  # Custom scope to detect all Exercises that may be used during a specified training_step_code
  scope :belongs_to_training_step_code, ->(training_step_code) {
    all.find_all{ |row|
      ( training_step_code.nil? ||
        row.training_step_type_codes.nil? ||
        (training_step_code.to_s == '') ||
        ( row.training_step_type_codes.instance_of?(String) &&
          row.training_step_type_codes.split(',').include?( training_step_code.to_s.upcase )
        )
      ) 
    }
  }
  # ----------------------------------------------------------------------------


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
      row.get_full_name( total_distance, verbose_level.to_sym, swimmer_level_type_id )
    }.join(separator)
  end
  # ---------------------------------------------------------------------------


  # Label symbol corresponding to either a column name or a model method to be used
  # mainly in generating DropDown option lists.
  #
  # @overload inherited from DropDownListable
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
  # @overload inherited from DropDownListable
  #
  def self.to_dropdown( where_condition = nil, key_sym = :id, label_sym = self.get_label_symbol(),
                        verbose_level_for_label_method = self.get_default_verbosity_for_label_symbol() )
    self.where( where_condition ).map{ |row|
      [row.send(label_sym, 0, verbose_level_for_label_method), row.send(key_sym)]
    }.sort_by{ |ar| ar[0] }
  end
  # ----------------------------------------------------------------------------


  # Computes the total distance in metres for this exercise.
  # (May return 0 in most cases.)
  #
  def compute_total_distance
    if self.exercise_rows
      self.exercise_rows.sort_by_part_order.inject(0){ |sum, row|
        actual_row_distance = row.compute_displayable_distance(0).to_i
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
    if self.exercise_rows
      self.exercise_rows.sort_by_part_order.inject(0){ |sum, row|
        sum + row.compute_total_seconds()
      }
    else
      0
    end
  end
  # ---------------------------------------------------------------------------

  # returns true if any of the exercise rows has a base_movement
  # that allows this aux entity type.
  #
  def is_arm_aux_allowed
    if base_movements
      base_movements.any?{ |row| row.is_arm_aux_allowed }
    else
      false
    end
  end

  # returns true if any of the exercise rows has a base_movement
  # that allows this aux entity type.
  #
  def is_kick_aux_allowed
    if base_movements
      base_movements.any?{ |row| row.is_kick_aux_allowed }
    else
      false
    end
  end

  # returns true if any of the exercise rows has a base_movement
  # that allows this aux entity type.
  #
  def is_body_aux_allowed
    if base_movements
      base_movements.any?{ |row| row.is_body_aux_allowed }
    else
      false
    end
  end

  # returns true if any of the exercise rows has a base_movement
  # that allows this aux entity type.
  #
  def is_breath_aux_allowed
    if base_movements
      base_movements.any?{ |row| row.is_breath_aux_allowed }
    else
      false
    end
  end
  # ---------------------------------------------------------------------------
end
