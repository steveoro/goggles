class Tag < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  validates_presence_of :name
  validates_length_of :name, within: 1..40
  validates_uniqueness_of :name, message: :already_exists

  belongs_to :user
  # [Steve, 20120212] Validating user fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                    # (Do not enable this for User)
  validates_presence_of :user_id

#  has_many :tag4_entities
  # ---------------------------------------------------------------------------

  def base_uri
    tags_path( self )
  end


  # Builds up a result Hash containing all the defined tags
  # in the form <tt>{ id => name, ... }</tt>.
  #
  def self.get_tags_hash
    tags = Tag.all()
    result = {}
    tags.each{ |row| result[row.id] = row.name }
    result
  end


  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------
  #++
end
