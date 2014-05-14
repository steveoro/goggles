class SwimmingPool < ActiveRecord::Base
  include DropDownListable

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

  # validates :has_multiple_pools,      :inclusion => { :in => [true, false] }
  # validates :has_open_area,           :inclusion => { :in => [true, false] }
  # validates :has_bar,                 :inclusion => { :in => [true, false] }
  # validates :has_restaurant_service,  :inclusion => { :in => [true, false] }
  # validates :has_gym_area,            :inclusion => { :in => [true, false] }
  # validates :has_children_area,       :inclusion => { :in => [true, false] }

  scope :sort_swimming_pool_by_user,                ->(dir) { order("users.name #{dir.to_s}, swimming_pools.name #{dir.to_s}") }
  scope :sort_swimming_pool_by_city,                ->(dir) { order("cities.name #{dir.to_s}, swimming_pools.name #{dir.to_s}") }
  scope :sort_swimming_pool_by_pool_type,           ->(dir) { order("pool_types.code #{dir.to_s}, swimming_pools.name #{dir.to_s}") }
  scope :sort_swimming_pool_by_shower_type,         ->(dir) { order("shower_types.code #{dir.to_s}, swimming_pools.name #{dir.to_s}") }
  scope :sort_swimming_pool_by_hair_dryer_type,     ->(dir) { order("hair_dryer_types.code #{dir.to_s}, swimming_pools.name #{dir.to_s}") }
  scope :sort_swimming_pool_by_locker_cabinet_type, ->(dir) { order("locker_cabinet_types.code #{dir.to_s}, swimming_pools.name #{dir.to_s}") }


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
    "'#{name}', #{get_full_address}"
  end

  alias_method :i18n_short, :get_full_name
  alias_method :i18n_description, :get_verbose_name


  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------

  # Retrieves just the city name
  def get_city_name
    city ? city.get_full_name : ''
  end

  # Retrieves the full address
  def get_full_address
    "#{address ? address : ''} #{get_city_name}"
  end

  # Computes the URL for the Google Maps API service, according to the current instance
  # address, if defined. Returns nil otherwise.
  #
  def get_maps_url
    full_address = get_full_address
    if full_address.size > 0
      full_address.gsub!(' ', '+')
      "https://www.google.com/maps/preview#!q=#{full_address}"
    else
      nil
    end
  end
  # ----------------------------------------------------------------------------

  # Retrieves the swimming pool length in meters, or 0 if any
  # Eg 50
  #
  def get_pool_length_in_meters
    self.pool_type ? self.pool_type.length_in_meters : 0
  end

  # Retrieves the swimming pool lane number, or 0 if any
  # Eg 8
  #
  def get_pool_lanes_number
    self.lanes_number ? self.lanes_number : 0
  end

  # Compose the swimming pool attributes (lanes_numebr x length_in_meters)
  # Eg (8x50)
  #
  def get_pool_attributes
    self.pool_type ? "(#{self.get_pool_lanes_number}x#{self.get_pool_length_in_meters})" : '(?)'
  end
  # ----------------------------------------------------------------------------


  # Retrieves the Pool Type short name
  def get_pool_type
    self.pool_type ? self.pool_type.i18n_short : '?'
  end

  # Retrieves the Locker Cabinet Type full description
  def get_locker_cabinet_type
    self.locker_cabinet_type ? self.locker_cabinet_type.i18n_description : '?'
  end

  # Retrieves the Shower Type full description
  def get_shower_type
    self.shower_type ? self.shower_type.i18n_description : '?'
  end

  # Retrieves the Hair-drier Type full description
  def get_hair_dryer_type
    self.hair_dryer_type ? self.hair_dryer_type.i18n_description : '?'
  end
  # ----------------------------------------------------------------------------

end
