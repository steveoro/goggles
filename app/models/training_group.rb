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
end
