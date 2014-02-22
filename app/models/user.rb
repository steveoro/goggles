require 'digest/sha1'
require 'common/format'

require 'framework/naming_tools'
require 'i18n'


class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :confirmable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  include Rails.application.routes.url_helpers

#  belongs_to :user                                  # Used by the "updated_by" getter

  has_one :swimmer

  belongs_to :swimmer_level_type
  belongs_to :coach_level_type

  validates_associated :swimmer_level_type

  validates_presence_of   :name
  validates_length_of     :name, :within => 1..20
  validates_uniqueness_of :name, :message => :already_exists

  validates_length_of   :description, :maximum => 50

  attr_accessible :name, :email, :description, :password, :password_confirmation,
                  :coach_level_type, :swimmer_level_type

  # TODO ADD:
  # :outstanding_score_bias (default = 800)
  # column to manage upload of user avatar image
  # 


  # validates_presence_of :hashed_pwd
  # validates_length_of   :hashed_pwd, :within => 1..128
# 
  # validates_presence_of :salt
  # validates_length_of   :salt, :within => 1..128
# 
  # validates_numericality_of :authorization_level, :with => /[0123456789]/, :message => :must_be_a_number_from_0_to_9
# 
  # validates :password, :confirmation => true
  # validates_presence_of :password, :password_confirmation
                                                    # # Virtual attributes:
  # attr_accessor :password_confirmation

  # [Steve, 20120212] Using "netzke_attribute" helper to define in the model the configuration
  # of each column/attribute makes localization of the label unusable, since the model class is
  # receives the "netzke_attribute" configuration way before the current locale is actually defined.
  # So, it is way better to keep column configuration directly inside Netzke components or in the
  # view definition using the netzke helper.

# XXX [Steve, 20100211] Firm entity not used here:
#  scope :sort_user_by_firm,             lambda { |dir| order("firms.name #{dir.to_s}, le_users.name #{dir.to_s}") }


  #-----------------------------------------------------------------------------
  # Base methods:
  #-----------------------------------------------------------------------------
  #++

  # Utility method to retrieve the controller base route directly from an instance of the model
  def base_uri
    users_path( self )
  end

  # Computes a descriptive name associated with this data
  def get_full_name
    "#{self.name} (desc.: #{self.description})"
  end

  # to_s() override for debugging purposes:
  def to_s
    "[User: '#{get_full_name}']"
  end
  # ----------------------------------------------------------------------------


  # Label symbol corresponding to either a column name or a model method to be used
  # mainly in generating DropDown option lists.
  #
  def self.get_label_symbol
    :name
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


  # Returns either the preffered swimmer level ID for this user or its own computed
  # value
  #
  def get_preferred_swimmer_level_id
    swimmer_level_type.id
  end
  # ----------------------------------------------------------------------------
  # ----------------------------------------------------------------------------


  # Checks if a specified +ctrl_name+ is included in the list of accessible controllers
  # for this user instance access level (defined in +authorization_level+).
  #
  # def can_access( ctrl_name )
    # rows = AppParameter.where( "code >= #{AppParameter::PARAM_ACCESS_LEVEL_START} and code <= #{AppParameter::PARAM_ACCESS_LEVEL_START + self.authorization_level}" )
                                                    # # Collect all accessible controller names up to this user level:
    # arr = rows.collect { |row| row.free_text_1 }
    # arr.delete('')
    # accessible_ctrl_names = arr.join(',').gsub(' ','').split(',').compact
    # return accessible_ctrl_names.include?( ctrl_name.to_s )
  # end
# 
# 
  # # Checks if this LeUser instance can perform the specified controller, action combination
  # # according to its authorization level.
  # #
  # def can_perform( ctrl_name, action_name )
    # row = AppParameter.where( "code >= #{AppParameter::PARAM_BLACKLIST_ACCESS_START} and code <= #{AppParameter::PARAM_BLACKLIST_ACCESS_END} and controller_name='#{ctrl_name}' and action_name='#{action_name}'" ).first
    # if ( row )
# # DEBUG
# #      puts "=> [#{self.name}] can_perform( #{ctrl_name}, #{action_name} )? #{(self.authorization_level >= row.a_integer)}.\r\n"
      # return ( self.authorization_level >= row.a_integer )
    # else
# # DEBUG
# #      puts "=> [#{self.name}] can_perform( #{ctrl_name}, #{action_name} )? No restrictions found.\r\n"
      # return true
    # end
  # end
# 
# 
  # # Verifies that a specific user id can perform a specific action.
  # # Returns false otherwise.
  # #
  # # Works exactly as LeUser::can_do(), but for row instances, thus sparing a query to retrieve the data, in case the row as already been read.
  # #
  # # +action_name+ = the name of the action to be executed
  # # +ctrl_name+ = the controller name.
  # #
  # def can_do( ctrl_name, action_name = 'index' )
# # DEBUG
# #    puts "\r\n=> [#{self.name}] can_do( #{ctrl_name}, #{action_name} )?"
    # if can_access( ctrl_name.to_s )
# # DEBUG
# #      puts "-- can_access: ok. Checking performing restrictions..."
      # return can_perform( ctrl_name.to_s, action_name.to_s )
    # else                                            # Controller access refused!
# # DEBUG
# #      puts "-- access denied!"
      # false
    # end
  # end
# 
# 
  # # Verifies that a specific user id can perform a specific action.
  # # Returns false otherwise.
  # #
  # # +id+ = the id of the User
  # # +action_name+ = the name of the action to be executed
  # # +ctrl_name+ = the controller name.
  # #
  # def self.can_do( id, ctrl_name, action_name = 'index' )
    # if id && user = User.find_by_id( id )
      # user && user.can_do( ctrl_name, action_name )
    # else
      # false
    # end
  # end
  # # ----------------------------------------------------------------------------
# 
# 
  # # Read accessor override for virtual attribute
  # def password
    # @password
  # end
# 
  # # Write accessor override for virtual attribute
  # def password=(pwd)
    # @password = pwd
    # create_new_salt
    # self.hashed_pwd = User.encrypted_password( self.password, self.salt )
  # end
# 
  # # Safe way to delete a user
  # def safe_delete
    # transaction do
      # destroy
      # if User.count.zero?
        # raise t("The deletion of the last user is not allowed.")
      # end
    # end
  # end
  # # ----------------------------------------------------------------------------
# 
# 
  # protected
# 
# 
  # def validate
    # errors.add_to_base( t(:password_missing) ) if hashed_pwd.blank?
  # end
# 
# 
  # def self.authenticate(user_name, user_password)
    # user = self.find_by_name(user_name)
    # if user
      # user_password = '' if user_password.nil?      # Avoid nil parameters
      # expected_pwd = encrypted_password( user_password, user.salt )
      # if user.hashed_pwd != expected_pwd
        # user = nil
      # end
    # end
    # user
  # end
  # # ----------------------------------------------------------------------------
# 
# 
  # private
# 
# 
  # def self.encrypted_password( user_password, salt )
    # string_to_hash = user_password + "giggidi-giggidi-gi" + salt
    # Digest::SHA1.hexdigest( string_to_hash )
  # end
# 
# 
  # def create_new_salt
    # self.salt = self.object_id.to_s + rand.to_s
  # end
  # ----------------------------------------------------------------------------
end
