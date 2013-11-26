class Team < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)
  belongs_to :city
  validates_associated :city

  has_many :badges
  has_many :meeting_individual_results
  has_many :meetings, :through => :meeting_individual_results
  has_many :meeting_relay_results

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

  # Same as get_full_name but adds also the ID at the end.
  def get_full_name_with_id
    "#{editable_name} (#{id})"
  end


  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------
  # ----------------------------------------------------------------------------


  # Label symbol corresponding to either a column name or a model method to be used
  # mainly in generating DropDown option lists.
  #
  def self.get_label_symbol
    :get_full_name
  end

  # Returns an Array of 2-items Arrays, in which each item is the ID of the record
  # and the other is assumed to be its label
  #
  # == Parameters:
  #
  # - where_condition: an ActiveRecord::Relation WHERE-clause; defaults to +nil+ (returns all records)
  # - key_sym: the key symbol/column name (defaults to :id)
  # - label_sym: the key symbol/column name (defaults to self.get_label_symbol())
  #
  # == Returns:
  # - an Array of arrays having the structure [ [label1, key_value1], [label2, key_value2], ... ]
  #
  def self.to_dropdown( where_condition = nil, key_sym = :id, label_sym = self.get_label_symbol() )
    self.where( where_condition ).map{ |row|
      [row.send(label_sym), row.send(key_sym)]
    }.sort_by{ |ar| ar[0] }
  end
  # ----------------------------------------------------------------------------

  # Retrieves the array of unique swimmer IDs registered for a specified meeting_id
  # 
  def self.get_swimmer_ids_for( team_id, meeting_id )
    team = Team.find_by_id( team_id )
    team ? team.meeting_individual_results.includes(:meeting).where(['meetings.id=?', meeting_id]).collect{|row| row.swimmer_id}.uniq : []
  end
  # ----------------------------------------------------------------------------
end
