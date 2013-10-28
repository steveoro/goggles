class SwimmingPool < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :city
  belongs_to :pool_type
  belongs_to :shower_type
  belongs_to :hair_dryer_type
  belongs_to :locker_cabinet_type

  validates_associated :city
  validates_associated :pool_type

  validates_presence_of :name
  validates_length_of   :name, :within => 1..100, :allow_nil => false
  validates_presence_of :nick_name
  validates_length_of   :nick_name, :within => 1..100, :allow_nil => false

  validates_length_of :address,       :maximum => 100
  validates_length_of :phone_number,  :maximum =>  40
  validates_length_of :fax_number,    :maximum =>  40
  validates_length_of :e_mail,        :maximum => 100
  validates_length_of :contact_name,  :maximum => 100

  validates_presence_of     :lanes_number
  validates_length_of       :lanes_number, :within => 1..2, :allow_nil => false
  validates_numericality_of :lanes_number

  validates_presence_of     :has_multiple_pools
  validates_presence_of     :has_open_area
  validates_presence_of     :has_bar
  validates_presence_of     :has_restaurant_service
  validates_presence_of     :has_gym_area
  validates_presence_of     :has_children_area

  scope :sort_swimming_pool_by_user,                lambda { |dir| order("users.name #{dir.to_s}, swimming_pools.name #{dir.to_s}") }
  scope :sort_swimming_pool_by_city,                lambda { |dir| order("cities.name #{dir.to_s}, swimming_pools.name #{dir.to_s}") }
  scope :sort_swimming_pool_by_pool_type,           lambda { |dir| order("pool_types.code #{dir.to_s}, swimming_pools.name #{dir.to_s}") }
  scope :sort_swimming_pool_by_shower_type,         lambda { |dir| order("shower_types.code #{dir.to_s}, swimming_pools.name #{dir.to_s}") }
  scope :sort_swimming_pool_by_hair_dryer_type,     lambda { |dir| order("hair_dryer_types.code #{dir.to_s}, swimming_pools.name #{dir.to_s}") }
  scope :sort_swimming_pool_by_locker_cabinet_type, lambda { |dir| order("locker_cabinet_types.code #{dir.to_s}, swimming_pools.name #{dir.to_s}") }


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------
  #++

  # Computes a shorter description for the name associated with this data
  def get_full_name
    name
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    "#{name} #{address ? address : ''}"
  end


  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------
  #++
end
