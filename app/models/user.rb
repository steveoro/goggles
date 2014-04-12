require 'digest/sha1'
require 'common/format'

require 'drop_down_listable'
require 'framework/naming_tools'
require 'i18n'


class User < ActiveRecord::Base
  include DropDownListable
  include Amistad::FriendModel                       # For Facebook-like friendship management
  include Rails.application.routes.url_helpers

  acts_as_token_authenticatable

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :confirmable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :swimmer

  belongs_to :swimmer_level_type
  belongs_to :coach_level_type

  validates_associated :swimmer_level_type

  validates_presence_of   :name
  validates_uniqueness_of :name, message: :already_exists

  validates_length_of     :description, maximum: 50

  attr_accessible :name, :email, :description, :password, :password_confirmation,
                  :api_authentication_token,
                  :outstanding_goggle_score_bias,
                  :outstanding_standard_score_bias,
                  :coach_level_type, :swimmer_level_type


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
  # @overload inherited from DropDownListable
  #
  def self.get_label_symbol
    :name
  end
  # ----------------------------------------------------------------------------


  # Returns either the preffered swimmer level ID for this user or its own computed
  # value; 0 in case the association is not yet defined.
  #
  def get_preferred_swimmer_level_id
    swimmer_level_type ? swimmer_level_type.id : 0
  end

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
  # ----------------------------------------------------------------------------

end
