class Team < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)
  belongs_to :city
  validates_associated :city

  has_many :badges

  validates_presence_of :name
  validates_length_of :name, :within => 1..60, :allow_nil => false

  validates_presence_of :editable_name
  validates_length_of :editable_name, :within => 1..60, :allow_nil => false

  validates_length_of :address,       :maximum => 100
  validates_length_of :phone_mobile,  :maximum =>  40
  validates_length_of :phone_number,  :maximum =>  40
  validates_length_of :fax_number,    :maximum =>  40
  validates_length_of :e_mail,        :maximum => 100
  validates_length_of :contact_name,  :maximum => 100

  scope :sort_team_by_user, lambda { |dir| order("users.name #{dir.to_s}, teams.name #{dir.to_s}") }
  scope :sort_team_by_city, lambda { |dir| order("cities.name #{dir.to_s}, teams.name #{dir.to_s}") }


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------
  #++

  # Computes a shorter description for the name associated with this data
  def get_full_name
    editable_name
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    "#{editable_name}#{address ? ', '+address : ''}"
  end


  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------
  #++
end
