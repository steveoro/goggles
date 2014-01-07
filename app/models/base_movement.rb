class BaseMovement < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :movement_type
  belongs_to :stroke_type
  belongs_to :movement_scope_type
  validates_associated :movement_type
  validates_associated :stroke_type
  validates_associated :movement_scope_type

  validates_presence_of   :code
  validates_length_of     :code, :within => 1..6, :allow_nil => false
  validates_uniqueness_of :code, :message => :already_exists


  # ---------------------------------------------------------------------------
  # Base methods:
  # ---------------------------------------------------------------------------


  # Computes a shorter description for the name associated with this data
  def get_full_name
# TODO (?) show something according to
#  is_arm_aux_allowed
#  is_kick_aux_allowed
#  is_body_aux_allowed
#  is_breath_aux_allowed
    "#{get_movement_type_short}, #{get_stroke_type_short} #{get_movement_scope_type_short}"
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

  # Retrieves the Movement Type short name
  def get_movement_type_short
    movement_type ? movement_type.i18n_short : ''
  end

  # Retrieves the Stroke Type short name
  def get_stroke_type_short
    stroke_type ? stroke_type.i18n_short : ''
  end

  # Retrieves the Movement Scope Type short name
  def get_movement_scope_type_short
    movement_scope_type ? movement_scope_type.i18n_short : ''
  end
  # ----------------------------------------------------------------------------
  
end
