class Swimmer < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  # This will be used to discriminate the actual user associated with this data
  # (the "associated_user_id") and the user_id which has created/updated/modified
  # the data itself (usually a user with a higher grant) 
  has_one :associated_user,  :class_name  => "User", 
                             :foreign_key => "associated_user_id"
  belongs_to :gender_type
  validates_associated :gender_type

  has_many :badges
  has_many :teams, :through => :badges
  has_many :meeting_individual_results
  has_many :meetings, :through => :meeting_individual_results
  has_many :swimmer_results

  validates_presence_of :complete_name
  validates_length_of   :complete_name, :within => 1..100, :allow_nil => false

  validates_length_of   :last_name, :maximum => 50
  validates_length_of   :first_name, :maximum => 50

  validates_presence_of :year_of_birth
  validates_length_of   :year_of_birth, :within => 2..4, :allow_nil => false

  validates_length_of :phone_mobile,  :maximum =>  40
  validates_length_of :phone_number,  :maximum =>  40
  validates_length_of :e_mail,        :maximum => 100
  validates_length_of :nickname,      :maximum => 25


  scope :sort_swimmer_by_user,        lambda { |dir| order("users.name #{dir.to_s}, swimmers.complete_name #{dir.to_s}") }
  scope :sort_swimmer_by_name,        lambda { |dir| order("complete_name #{dir.to_s}") }
  scope :sort_swimmer_by_gender_type, lambda { |dir| order("gender_types.code #{dir.to_s}, swimmers.complete_name #{dir.to_s}") }


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------
  #++

  # Computes a shorter description for the name associated with this data
  def get_full_name
    last_name.to_s.empty? ? "#{complete_name}" : "#{last_name} #{first_name}"
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    "#{get_full_name} (#{year_of_birth}, #{gender_type ? gender_type.code : '?'})"
  end

  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------


  # Returns the array of distinct team names associated to the specified swimmer_id.
  # An empty array when not found.
  #
  def self.get_team_names( swimmer_id )
    swimmer = Swimmer.find_by_id( swimmer_id )
    swimmer ? swimmer.teams.collect{|row| row.name }.uniq : []    
  end
  # ----------------------------------------------------------------------------

  # Retrieves a comma-separated string containing all the distinct team
  # names associated with this instance.
  #
  def get_team_names
    Swimmer.get_team_names( self.id ).join(', ')
  end
end
