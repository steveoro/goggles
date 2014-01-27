class Exercise < ActiveRecord::Base

  has_many :exercise_rows
  has_many :trainings, :through => :training_rows

  validates_length_of   :training_step_type_codes, :maximum => 50, :allow_nil => true

  validates_presence_of   :code
  validates_length_of     :code, :within => 1..6, :allow_nil => false
  validates_uniqueness_of :code, :message => :already_exists


  # Custom scope to detect all Exercises that may be used during a specified training_step_code
  scope :belongs_to_training_step_code, lambda{ |training_step_code|
    all.find_all{ |row|
      training_step_code.nil? ||
      training_step_code.to_s.empty? ||
      row.training_step_type_codes.nil? ||
      ( row.training_step_type_codes.instance_of?(String) &&
        row.training_step_type_codes.split(',').include?( training_step_code.to_s.upcase )
      ) 
    }
  }
  # ----------------------------------------------------------------------------


  # Computes a full description for this data row
  def get_full_name( total_distance = 0, separator = " + " )
    exercise_rows.sort_by_part_order.collect{ |row| row.get_full_name(total_distance) }.join(separator)
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
end
