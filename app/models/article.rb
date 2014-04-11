class Article < ActiveRecord::Base
  belongs_to :user                                  # [Steve, 20120212] Do not validate associated user!

  validates_presence_of :title, length: { within: 1..80 }, allow_nil: false
  validates_presence_of :entry_text

  scope :permalinks,    -> { where(:is_sticky => true) }
  scope :sort_by_user,  ->(dir) { order("users.name #{dir.to_s}, articles.created_at #{dir.to_s}") }


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------
  #++

  # Computes a shorter description for the name associated with this data
  def get_full_name
    self.title
  end

  # Retrieves the user name associated with this article
  def user_name
    name = self.user.nil? ? '' : self.user.name
  end
  # ----------------------------------------------------------------------------
  #++

  # Checks and sets unset fields to default values.
  #
  # === Parameters:
  # - +params_hash+ => Hash of additional parameter values for attribute defaults override.
  #
  def preset_default_values( params_hash = {} )
    unless self.user || params_hash[:user_id].blank?  # Set current user only if not set
      begin
        if params_hash[:user_id]
          self.user_id = params_hash[:user_id].to_i
        end
      rescue
        self.user_id = nil
      end
    end
    self
  end
  # ----------------------------------------------------------------------------
end
