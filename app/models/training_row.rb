# encoding: utf-8

require 'wrappers/timing'


class TrainingRow < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :training
  belongs_to :exercise
  belongs_to :training_step_type
  validates_associated :training
  validates_associated :exercise
  validates_associated :training_step_type

  has_many :exercise_rows,      :through => :exercise
  has_many :base_movements,     :through => :exercise_rows
  has_many :training_mode_type, :through => :exercise_rows

  validates_presence_of     :part_order
  validates_length_of       :part_order, :within => 1..3, :allow_nil => false
  validates_numericality_of :part_order
  validates_presence_of     :times
  validates_length_of       :times, :within => 1..3, :allow_nil => false
  validates_numericality_of :times
  validates_presence_of     :distance
  validates_length_of       :distance, :within => 1..4, :allow_nil => false
  validates_numericality_of :distance
  validates_presence_of     :start_and_rest
  validates_length_of       :start_and_rest, :within => 1..4, :allow_nil => false
  validates_numericality_of :start_and_rest
  validates_presence_of     :pause
  validates_length_of       :pause, :within => 1..4, :allow_nil => false
  validates_numericality_of :pause

  attr_accessible :part_order, :times, :distance, :start_and_rest, :pause,
                  :training_id, :exercise_id, :training_step_type_id, :user_id

  scope :sort_by_part_order, order('part_order')


  # Overload constructor for setting default values
  #
  def initialize( attributes = nil, options = {} )
    super( attributes, options )
    self.part_order = 1 unless self.part_order.to_i != 0
    self.times = 1 unless self.times.to_i > 0
    self.distance = 50 unless self.distance.to_i > 0
  end


  # ---------------------------------------------------------------------------
  # Base methods:
  # ---------------------------------------------------------------------------


  # Computes a shorter description for the name associated with this data
  def get_full_name( show_also_ordinal_part = false )
    [
      ( show_also_ordinal_part ? sprintf("%02s)", part_order) : '' ),
      get_training_step_type_short,
      "#{sprintf("%02s", times)}x#{sprintf("%03s", distance)}:",
# FIXME create method to get exercise description applying percentages to current distance set
      get_exercise_full,
      get_formatted_start_and_rest,
      get_formatted_pause
    ].delete_if{ |e| e.to_s.empty? }.join(' ')
  end
  # ---------------------------------------------------------------------------


  # Label symbol corresponding to either a column name or a model method to be used
  # mainly in generating DropDown option lists.
  #
  def self.get_label_symbol
    :get_full_name
  end
  # ----------------------------------------------------------------------------

  # Retrieves the User short name (the owner of this Training)
  def get_user_name
    user ? user.name : ''
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

  # Retrieves the Training step type short name
  def get_training_step_type_short
    training_step_type ? training_step_type.i18n_short : ''
  end

  # Retrieves the Exercise full description
  def get_exercise_full
    exercise ? exercise.get_full_name(distance) : ''
  end
  # ----------------------------------------------------------------------------
end
