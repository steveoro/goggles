require 'digest/sha1'
require 'common/format'

require 'drop_down_listable'
require 'framework/naming_tools'
require 'i18n'


class User < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  include DropDownListable
  include Amistad::FriendModel                       # For Facebook-like friendship management

  acts_as_token_authenticatable
  acts_as_voter

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :confirmable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :swimmer

  has_many :user_swimmer_confirmations                  # These are confirmation endorsed by others (user is passive subject)
  has_many :confirmators, through: :user_swimmer_confirmations
  has_many :given_confirmations,
    class_name: "UserSwimmerConfirmation",           # These are confirmation given to others (user is active subject, a "confirmator")
    foreign_key: "confirmator_id"

  belongs_to :swimmer_level_type
  belongs_to :coach_level_type

  validates_associated :swimmer_level_type

  validates_presence_of   :name
  validates_uniqueness_of :name, message: :already_exists

  validates_length_of     :description,   maximum: 100  # Same as Swimmer#complete_name
  validates_length_of     :first_name,    maximum: 50
  validates_length_of     :last_name,     maximum: 50
  validates_length_of     :year_of_birth, maximum: 4

  attr_accessible :name, :email, :description, :password, :password_confirmation,
                  :last_name, :first_name, :year_of_birth,
                  :api_authentication_token,
                  :outstanding_goggle_score_bias,
                  :outstanding_standard_score_bias,
                  :coach_level_type, :swimmer_level_type
  #-- -------------------------------------------------------------------------
  #++

  # Clears swimmer association before account removal.
  before_destroy do |user|
    if user.has_associated_swimmer?
      user.set_associated_swimmer( nil )
    end
    # TODO Do we really need to clear automatically user_id from:
    # - UserTraining
    # - UserTrainingStory
    # - UserSwimmerConfirmation ?
    # - UserResult
    # - UserAchievement
    # - SwimmingPoolReview
    # - Passage
    # - Article ?
    # - Achievement ?
    UserTraining.where( user_id: user.id ).update_all( user_id: nil )
    UserTrainingStory.where( user_id: user.id ).update_all( user_id: nil )
    UserSwimmerConfirmation.where( user_id: user.id ).update_all( user_id: nil )
    UserResult.where( user_id: user.id ).update_all( user_id: nil )
    UserAchievement.where( user_id: user.id ).update_all( user_id: nil )
    SwimmingPoolReview.where( user_id: user.id ).update_all( user_id: nil )
    Passage.where( user_id: user.id ).update_all( user_id: nil )
    Article.where( user_id: user.id ).update_all( user_id: nil )
    Achievement.where( user_id: user.id ).update_all( user_id: nil )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Utility method to retrieve the controller base route directly from an instance of the model
  def base_uri
    users_path( self )
  end

  # Computes a descriptive name associated with this data
  def get_full_name
    "#{name} (#{description})"
  end

  # Computes a 'full debug data dump' associated with this data
  def get_verbose_name
    "'#{name}' (#{description}), e-mail: #{email}, class: #{year_of_birth}, swimmer ID: #{swimmer_id}"
  end

  # to_s() override for debugging purposes:
  def to_s
    "[User: '#{get_full_name}']"
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns the an array containing the first and the last name of this
  # user. When empty or nil the names are obtained from the description.
  def get_first_and_last_name
    if first_name && last_name && first_name.size > 0 && last_name.size > 0
      [ first_name, last_name ]
    elsif description && description.size > 0
      [
        description.split(' ')[0],
        description.split(' ')[1]
      ]
    else
      [ name[0..4], '' ]                            # Return just the first 5 char from the username, just to increase the chances
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Updates both this user and a Swimmer instance for "association" (identity match).
  #
  # If the user is already associated to another swimmer, both the old swimmer and the
  # new one will be updated (the old will have associated_user nulled while the new
  # one will receive the user id).
  #
  # If the specified +swimmer+ is nil and there is already an association this works
  # as a "dissociate" action, clearing both the user and the associated swimmer.
  #
  # === Returns:
  # - +true+ when successful.
  # - +false+ in case of error, or when the specified swimmer is not available for association (is already "taken").
  #
  def set_associated_swimmer( new_swimmer = nil )
    if new_swimmer.instance_of?( Swimmer )          # === Set a new association:
      return false if (new_swimmer.associated_user_id.to_i != 0) && (new_swimmer.associated_user_id.to_i != self.id)
      # TODO We could/should check here if we have a user.swimmer link that does NOT correspond to a swimmer.associated_user link
      if swimmer                                    # Already associated? Clear first the old swimmer:
        swimmer.associated_user_id = nil
        swimmer.save!
      end
      self.swimmer_id = new_swimmer.id              # Update this user:
      self.year_of_birth = new_swimmer.year_of_birth
      self.first_name = new_swimmer.first_name.titleize unless new_swimmer.first_name.empty?
      self.last_name  = new_swimmer.last_name.titleize unless new_swimmer.last_name.empty?
      self.description = "#{self.first_name} #{self.last_name}"
      save!
      new_swimmer.associated_user_id = self.id      # Update the swimmer
      new_swimmer.save!

    elsif new_swimmer.nil?                          # === Clear (dissociate) existing association:
      if swimmer
        swimmer.associated_user_id = nil
        swimmer.save!
      end
      self.swimmer_id = nil
      save!
    end
    reload
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns true if this user has a swimmer_id already associated to him/her.
  def has_associated_swimmer?
    ! (swimmer.nil?)
  end

  # Returns true if this user has at least some UserSwimmerConfirmation defined
  def has_swimmer_confirmations?
    user_swimmer_confirmations ? user_swimmer_confirmations.count > 0 : false
  end

  # Returns the first swimmer-association confirmation found given to the specified user
  # or nil when not found.
  def find_any_confirmation_given_to( user )
    UserSwimmerConfirmation.find_any_between( user, self ).first
  end
  #-- -------------------------------------------------------------------------
  #++

  # Label symbol corresponding to either a column name or a model method to be used
  # mainly in generating DropDown option lists.
  #
  # @overload inherited from DropDownListable
  #
  def self.get_label_symbol
    :name
  end
  #-- -------------------------------------------------------------------------
  #++

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
  #-- -------------------------------------------------------------------------
  #++
end
