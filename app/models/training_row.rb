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

  belongs_to :training_group                        # (Do not validate this, since it can be null)

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
                  :training_id, :exercise_id, :training_step_type_id,
                  :training_group_id, :user_id

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
# FIXME ********* REWRITE THIS FOR TRAINING ROW GROUPS *****
    full_row_distance = compute_distance()
    [
      ( show_also_ordinal_part ? sprintf("%02s)", part_order) : '' ),
      get_training_step_type_short,
      # Hide any 1x multiplier:
      ( times > 1 ? "#{sprintf("%2s", times)}x#{sprintf("%2s", full_row_distance)}:" : full_row_distance),
      get_exercise_full( full_row_distance ),
      get_formatted_start_and_rest,
      get_formatted_pause
    ].delete_if{ |e| e.nil? || e.to_s.empty? }.join(' ')
  end
  # ---------------------------------------------------------------------------

  # Similarly to get_full_name, computes the description for the name associated with
  # this row, storing each main group of data as items of a single array result.
  #
  def to_array()
# FIXME ********* REWRITE THIS FOR TRAINING ROW GROUPS *****
    full_row_distance = compute_distance()
    [
      sprintf("%02s)", part_order),
      get_training_step_type_short,
      # Hide any 1x multiplier:
      ( times > 1 ? "#{sprintf("%2s", times)}x#{sprintf("%2s", full_row_distance)}:" : full_row_distance),
      [
        get_exercise_full( full_row_distance ),
        get_formatted_start_and_rest,
        get_formatted_pause
      ].delete_if{ |e| e.nil? || e.to_s.empty? }.join(' ')
    ]
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
    # Note that with pause > 60", Timing conversion won't be perfomed using to_compact_s
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
  def get_exercise_full( precomputed_distance = 0 )
    precomputed_distance = compute_distance() if ( precomputed_distance == 0)
    self.exercise ? self.exercise.get_full_name( precomputed_distance ) : ''
  end
  # ----------------------------------------------------------------------------

  # Computes the total distance in metres for this training row
  def compute_distance
# FIXME Adapt this to groups of training_rows!! Mind that training row distance has to be already calculated by CRUD acording to execrcise
    #if self.exercise_rows
    #  self.exercise_rows.sort_by_part_order.inject(0){ |sum, row|
    #    sum + row.compute_distance( self.distance ).to_i
    #  }
    #else
      self.distance
    #end
  end
  # ---------------------------------------------------------------------------
end
