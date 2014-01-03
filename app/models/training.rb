class Training < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :swimmer_level_type
  validates_associated :swimmer_level_type

  has_many :training_rows, :dependent => :delete_all
  accepts_nested_attributes_for :training_rows, :allow_destroy => true

  attr_accessible :title, :description, :swimmer_level_type_id, :user_id,
                  :training_rows_attributes         # (Needed by the nested_form gem)

  has_many :exercises, :through => :training_rows
  has_many :training_step_types, :through => :training_rows


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

  # Retrieves the User short name (the owner of this Training)
  def get_user_name
    user ? user.name : ''
  end

  # Retrieves the Swimmer level type short name
  def get_swimmer_level_type_short
    swimmer_level_type ? swimmer_level_type.i18n_short : ''
  end
  # ---------------------------------------------------------------------------
end
