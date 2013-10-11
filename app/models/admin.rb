class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :trackable, :timeoutable, :lockable
#         :recoverable, :rememberable, :validatable
         # [Steve, 20130716] Registerable module remove as-per-config of rails_admin gem:
#         :registerable

  attr_accessible :name, :email, :description, :password, :password_confirmation

  include Rails.application.routes.url_helpers


  validates_presence_of   :name
  validates_length_of     :name, :within => 1..20
  validates_uniqueness_of :name, :message => :already_exists

  validates_length_of   :description, :maximum => 50

  # [Steve, 20130716] These are not used anymore with Devise
#  validates_presence_of :hashed_pwd
#  validates_length_of   :hashed_pwd, :within => 1..128

#  validates_presence_of :salt
#  validates_length_of   :salt, :within => 1..128

#  validates :password, :confirmation => true
#  validates_presence_of :password, :password_confirmation
                                                    # Virtual attributes:
#  attr_accessor :password_confirmation


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
  # ----------------------------------------------------------------------------


  protected


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
  # ----------------------------------------------------------------------------


  private


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
