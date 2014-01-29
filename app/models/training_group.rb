# encoding: utf-8

class TrainingGroup < ActiveRecord::Base

  has_many :training_rows

  validates_presence_of     :part_order
  validates_length_of       :part_order, :within => 1..3, :allow_nil => false
  validates_numericality_of :part_order
  validates_presence_of     :times
  validates_length_of       :times, :within => 1..3, :allow_nil => false
  validates_numericality_of :times
  validates_presence_of     :start_and_rest
  validates_length_of       :start_and_rest, :within => 1..4, :allow_nil => false
  validates_numericality_of :start_and_rest
  validates_presence_of     :pause
  validates_length_of       :pause, :within => 1..4, :allow_nil => false
  validates_numericality_of :pause

  attr_accessible :part_order, :times, :start_and_rest, :pause

  scope :sort_by_part_order, order('part_order')
  # ---------------------------------------------------------------------------

  # Computes a description for this data
  #
  def get_full_name
    [
      "[G.#{self.part_order}: #{self.times}x",
      get_formatted_start_and_rest(),
      get_formatted_pause(),
      "]"
    ].delete_if{ |e| e.nil? || e.to_s.empty? }.join(' ')
  end
  # ---------------------------------------------------------------------------

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


  # Computes the esteemed total seconds of expected duration for this training group
  # For this method, the result value *ALREADY* includes the times multiplier.
  #
  def compute_total_seconds
    # [Steve, 20140129] Even if the DB structure supports unlimited nesting of
    # training_rows by training_groups, as of this version we limit the support
    # to 1-level of grouping.
    group_secs = training_rows.inject(0){ |sum, row|
        sum + row.compute_total_seconds()
    } * self.times
                                                    # Zero esteemed computation on exercise rows?
    if ( group_secs == 0 )
      if ( self.start_and_rest > 0 )
        self.start_and_rest * self.times + (self.pause * self.times)
      else
        self.pause * self.times
      end
    else
      group_secs + (self.pause * self.times)
    end
  end
  # ---------------------------------------------------------------------------
end
