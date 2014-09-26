=begin

= Tag model

  - version:  4.00.523
  - author:   Steve A.

=end
class Tag < ActiveRecord::Base
  after_create    UserContentLogger.new('tags')
  after_update    UserContentLogger.new('tags')
  before_destroy  UserContentLogger.new('tags')

  include Rails.application.routes.url_helpers

  validates_presence_of :name
  validates_length_of :name, within: 1..40
  validates_uniqueness_of :name, message: :already_exists

  belongs_to :user

#  has_many :tag4_entities

  delegate :name, to: :user, prefix: true

  attr_accessible :name, :user_id
  #-- -------------------------------------------------------------------------
  #++

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
