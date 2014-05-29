# encoding: utf-8

require 'wrappers/timing'   # [Steve 20140311] Used by UserTrainingRow


class UserTrainingStory < ActiveRecord::Base
  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
  #  validates_associated :user                       # (Do not enable this for User)

  belongs_to :user_training
  belongs_to :swimmer_level_type
  belongs_to :swimming_pool
  validates_associated :user_training
  validates_associated :swimmer_level_type
  validates_associated :swimming_pool

  validates_presence_of :swam_date

  validates_presence_of     :total_training_time
  validates_length_of       :total_training_time, within: 1..6, allow_nil: false
  validates_numericality_of :total_training_time

  attr_accessible :swam_date, :total_training_time, :notes,
                  :user_training_id, :swimming_pool_id, :swimmer_level_type_id 


  scope :sort_by_date,        order('swam_date')
  scope :sort_by_duration,    order('total_training_time')  
  # ---------------------------------------------------------------------------

  # Retrieves the User short name (the owner of this UserTrainingStory)
  def get_user_name
    user ? user.name : ''
  end

  # Retrieves the UserTraining name
  def get_user_training_name
    user_training ? user_training.get_full_name : ''
  end

  # Invokes UserTraining::compute_total_distance if available; defaults to 0
  def get_user_training_compute_total_distance
    user_training ? user_training.compute_total_distance : 0
  end

  # Invokes UserTraining::compute_total_seconds if available; defaults to 0
  def get_user_training_compute_total_seconds
    user_training ? user_training.compute_total_seconds : 0
  end
  # ----------------------------------------------------------------------------

  # Retrieves the swimmer level typ description, when set.
  # Allows to specify which label method can be used for the output, defaults to
  # the framework standard :i18n_short.
  # Returns an empty string when not available.
  def get_swimmer_level_type( label_method_sym = :i18n_short )
    if swimmer_level_type
      swimmer_level_type.send( label_method_sym.to_sym )  # (just to be sure)
    else
      ''
    end
  end

  # Retrieves the Swimmer level type description for the associated user
  # Allows to specify which label method can be used for the output, defaults to
  # the framework standard :i18n_short.
  # Returns an empty string when not available.
  #
  def get_user_swimmer_level_type( label_method_sym = :i18n_short )
    user ? user.get_swimmer_level_type( label_method_sym ) : ''
  end
  # ---------------------------------------------------------------------------
end
