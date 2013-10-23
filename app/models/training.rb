class Training < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :swimmer_level_type
  validates_associated :swimmer_level_type

  validates_presence_of :title
  validates_length_of   :title, :within => 1..100, :allow_nil => false

  validates_presence_of :description


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
end
