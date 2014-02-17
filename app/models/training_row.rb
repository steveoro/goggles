# encoding: utf-8

require 'wrappers/timing'


class TrainingRow < ActiveRecord::Base
  belongs_to :training
  belongs_to :exercise
  belongs_to :training_step_type
  validates_associated :training
  validates_associated :exercise
  validates_associated :training_step_type

  has_many :exercise_rows,      :through => :exercise
  has_many :base_movements,     :through => :exercise_rows
  has_many :training_mode_type, :through => :exercise_rows

  validates_presence_of     :group_id
  validates_length_of       :group_id, :within => 1..3, :allow_nil => false
  validates_numericality_of :group_id
  validates_presence_of     :group_times
  validates_length_of       :group_times, :within => 1..3, :allow_nil => false
  validates_numericality_of :group_times
  validates_presence_of     :group_start_and_rest
  validates_length_of       :group_start_and_rest, :within => 1..4, :allow_nil => false
  validates_numericality_of :group_start_and_rest
  validates_presence_of     :group_pause
  validates_length_of       :group_pause, :within => 1..4, :allow_nil => false
  validates_numericality_of :group_pause

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

  attr_accessible :part_order, 
                  :group_id, :group_times, :group_start_and_rest, :group_pause,
                  :times, :distance, :start_and_rest, :pause,
                  :training_id, :exercise_id, :training_step_type_id

  scope :sort_by_part_order,    order('part_order')
  scope :with_groups,           where('group_id > 0').order('part_order')
  scope :without_groups,        where('(group_id is null) or (group_id = 0)').order('part_order')


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


  # Computes a compact description for this data
  #
  def get_full_name( show_also_ordinal_part = false )
    full_row_distance = compute_distance()
    [
      get_training_group_text(),
      ( show_also_ordinal_part ? sprintf("%02s)", part_order) : '' ),
      get_training_step_type_short,
      # Hide any 1x multiplier:
      ( times > 1 ? "#{sprintf("%2s", times)}x#{sprintf("%2s", full_row_distance)}" : full_row_distance),
      get_exercise_full( full_row_distance ),
      get_formatted_start_and_rest,
      get_formatted_pause
    ].delete_if{ |e| e.nil? || e.to_s.empty? }.join(' ')
  end
  # ---------------------------------------------------------------------------

  # Similarly to get_full_name, computes the description for the name associated with
  # this row, storing each main group of data as items of a single array result.
  #
  # Please note that this method will not consider any additional multiplier given by
  # any training_group linked by this row.
  # Training groups should be checked for existance and managed elsewhere, for instance,
  # during ouput formatting or in other parent entities.
  #
  # == Returns:
  # An array having the structure:
  #    [
  #      #0: ordering (string),
  #      #1: training_step_type description,
  #      #2: esteemed tot. duration in secs (integer or string, depending on the parameter),
  #      #3: total distance with multiplier (string), 
  #      #4: full exercise description
  #    ]
  #
  def to_array( format_everything_to_string = false )
    full_row_distance = compute_distance()
    esteemed_row_secs = compute_total_seconds()
    [
      sprintf("%02s)", part_order),
      get_training_step_type_short,
      format_everything_to_string ? "(#{Timing.to_minute_string(esteemed_row_secs)})" : esteemed_row_secs,
      # Hide any 1x multiplier:
      ( times > 1 ? "#{sprintf("%2s", times)}x#{sprintf("%2s", full_row_distance)}" : full_row_distance),
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

  # Getter for the formatted string of the +pause+ value
  def get_formatted_pause
    Timing.to_formatted_pause( pause )
  end

  # Getter for the formatted string of the +start_and_rest+ value
  def get_formatted_start_and_rest
    Timing.to_formatted_start_and_rest( start_and_rest)
  end
  # ----------------------------------------------------------------------------


  # Computes a description for the group data fields
  #
  def get_training_group_text
    if group_id.to_i > 0
      [
        "[G.#{group_id}: #{group_times}x",
        get_formatted_group_start_and_rest(),
        get_formatted_group_pause(),
        "]"
      ].delete_if{ |e| e.nil? || e.to_s.empty? }.join(' ')
    else
      ''
    end
  end

  # Getter for the formatted string of the +group_pause+ value
  def get_formatted_group_pause
    # Note that with pause > 60", Timing conversion won't be perfomed using to_compact_s
    group_pause > 0 ? " p.#{Timing.to_compact_s(0, group_pause)}" : ''
  end

  # Getter for the formatted string of the +group_start_and_rest+ value
  def get_formatted_group_start_and_rest
    group_start_and_rest > 0 ? " S-R: #{Timing.to_s(0, group_start_and_rest)}" : ''
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

  # Computes the value of the total distance in metres for this training row
  # For this method, the result value does *NOT* include the times multiplier.
  #
  # Note also that this method will not consider any additional multiplier given by
  # any training_group linked by this row.
  # Training groups should be checked for existance and managed elsewhere, for example
  # during ouput formatting or in other parent entities.
  #
  def compute_distance
    if self.exercise_rows
      self.exercise_rows.sort_by_part_order.inject(0){ |sum, row|
        actual_row_distance = row.compute_displayable_distance( self.distance ).to_i
        actual_row_distance = self.distance if actual_row_distance == 0
        sum + actual_row_distance
      }
    else
      self.distance
    end
  end
  # ---------------------------------------------------------------------------


  # Computes the esteemed total seconds of expected duration for this training row.
  # For this method, the result value *ALREADY* includes the times multiplier.
  #
  # Field start_and_rest has the precedence on everything else, unless pre-defined
  # exercise_row distances or start_and_rest values are specified.
  #
  # When the internal row distance is set, it returns an esteemed duration (based on a slow-pace).
  # In case the distance or the start_and_rest member are not set, returns the pause member.
  #
  # Note also that this method will not consider any additional multiplier given by
  # any training_group linked by this row.
  # Training groups should be checked for existance and managed elsewhere, for example
  # during ouput formatting or in other parent entities.
  #
  #
  def compute_total_seconds
    exercise_seconds = self.exercise_rows.inject(0){ |sum, row|
      sum + row.compute_total_seconds()             # Compute row sum excluding row.pause
    }
    if ( exercise_seconds == 0 )                    # Zero esteemed duration (excluding pause)?
      if ( self.start_and_rest > 0 )
        self.start_and_rest * self.times + (self.pause * self.times)
      elsif ( self.distance > 0 )
        # FIXME Quick'n'dirty esteem: 1.2 mt/sec; does not report duration in case distance is not set
        ( self.pause + (self.distance.to_f * 1.2).to_i ) * self.times
      else
        self.pause * self.times
      end
    else
      self.exercise_rows.inject(0){ |sum, row|
        sum + row.compute_total_seconds( true )     # Re-compute row sum including row.pause
      } * self.times + (self.pause * self.times)
    end
  end
  # ---------------------------------------------------------------------------


  # Generic group-oriented implementation for <tt>compute_total_seconds</tt>
  # for a bunch of TrainingRow instances.
  #
  # Computes the esteemed total seconds of expected duration for the
  # specified array of training rows.
  #
  # For this method, the result value *ALREADY* includes the group_times
  # multiplier.
  # This can be used, for instance, with arrays of grouped or filtered training rows.
  #
  # === Params:
  # - training_rows: the array of TrainingRow instances to be processed.
  #
  def self.compute_total_seconds( training_rows )
    # [Steve, 20140203] ASSUMES grouping information comes only from
    # the first row
                                                    # Extract grouping information
    group_times = training_rows.first.group_times
    group_start_and_rest = training_rows.first.group_start_and_rest
    group_pause = training_rows.first.group_pause

    group_secs = training_rows.inject(0){ |sum, row|
        sum + row.compute_total_seconds()
    } * group_times
                                                    # Zero esteemed computation on exercise rows?
    if ( group_secs == 0 )
      if ( group_start_and_rest > 0 )
        group_start_and_rest * group_times + (group_pause * group_times)
      else
        group_pause * group_times
      end
    else
      group_secs + (group_pause * group_times)
    end
  end
  # ---------------------------------------------------------------------------
end
