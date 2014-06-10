# encoding: utf-8
require 'drop_down_listable'
require 'wrappers/timing'


class ExerciseRow < ActiveRecord::Base
  include DropDownListable

  belongs_to :exercise
  belongs_to :base_movement
  belongs_to :training_mode_type
  belongs_to :execution_note_type
  validates_associated :exercise
  validates_associated :base_movement
  validates_associated :training_mode_type
  validates_associated :execution_note_type

  validates_presence_of     :part_order, length: { within: 1..3 }, allow_nil: false
  validates_numericality_of :part_order
  validates_presence_of     :percentage, length: { within: 1..3 }, allow_nil: false
  validates_numericality_of :percentage
  # [Steve, 20140128] An exercise_row may or may not have a pre-defined distance
  # When left == 0, distance is assumed to be specified either by training_row.distance
  # itself or computed from the percentage field applied to it (training_row.distance).
  validates_presence_of     :distance, length: { within: 1..4 }, allow_nil: false
  validates_numericality_of :distance
  validates_presence_of     :start_and_rest, length: { within: 1..4 }, allow_nil: false
  validates_numericality_of :start_and_rest
  validates_presence_of     :pause, length: { within: 1..4 }, allow_nil: false
  validates_numericality_of :pause

  scope :sort_by_part_order, -> { order('part_order') }
  #-- -------------------------------------------------------------------------
  #++


  # Commodity shortcut to ExerciseRowDecorator#get_full_name().
  #
  # In the default invocation by self.to_dropdown() all parameters are omitted and
  # their defaults are used.
  #
  # === Params:
  # - total_distance: can be 0 if it must be obtained from each component
  # - verbose_level: either :short, :full or :verbose; default: :full
  # - swimmer_level_type_id: the id of the user's swimmer level type (or its preferred swimmer level type ID); NOT the code, NOT the level: the *ID*; it can be 0 if it must be ignored
  # - show_also_ordinal_part: true to show also the part_order; defaults to false.
  #
  def get_full_name( total_distance = 0, verbose_level = :short, swimmer_level_type_id = 0, show_also_ordinal_part = false )
    ExerciseRowDecorator.decorate( self ).get_full_name( total_distance, verbose_level.to_sym, swimmer_level_type_id, separator )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Label symbol corresponding to either a column name or a model method to be used
  # mainly in generating DropDown option lists.
  #
  # @overload inherited from DropDownListable
  #
  def self.get_label_symbol
    :get_full_name
  end
  #-- -------------------------------------------------------------------------
  #++
end
