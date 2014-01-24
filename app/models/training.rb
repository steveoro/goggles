# encoding: utf-8

class Training < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  has_many :training_rows, :dependent => :delete_all
  accepts_nested_attributes_for :training_rows, :allow_destroy => true

  has_many :training_groups, :through => :training_rows

  has_many :exercises, :through => :training_rows
  has_many :training_step_types, :through => :training_rows


  validates_presence_of :title
  validates_length_of   :title, :within => 1..100, :allow_nil => false

  validates_presence_of :description

  validates_presence_of     :min_swimmer_level
  validates_length_of       :min_swimmer_level, :within => 1..3, :allow_nil => false
  validates_numericality_of :min_swimmer_level

  validates_presence_of     :max_swimmer_level
  validates_length_of       :max_swimmer_level, :within => 1..3, :allow_nil => false
  validates_numericality_of :max_swimmer_level


  attr_accessible :title, :description, :min_swimmer_level, :max_swimmer_level,
                  :user_id, :training_rows_attributes # (Needed by the nested_form gem)


  # ---------------------------------------------------------------------------
  # Base methods:
  # ---------------------------------------------------------------------------

  # Computes a shorter description for the name associated with this data
  def get_full_name
    title
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    title
  end
  # ---------------------------------------------------------------------------

  # Retrieves the User short name (the owner of this Training)
  def get_user_name
    user ? user.name : ''
  end

  # Retrieves the Swimmer level type short name
  def get_swimmer_level_type_short
# TODO get list of short descriptions from SwimmerLevelType, according to level range
    "L.#{min_swimmer_level}..#{max_swimmer_level}"
  end

  # Retrieves the Swimmer level type full description
  def get_swimmer_level_type_description
# TODO get list of full descriptions from SwimmerLevelType, according to level range
    "L. #{min_swimmer_level}..#{max_swimmer_level}"
  end
  # ---------------------------------------------------------------------------
end
