class Article < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  validates_presence_of :title
  validates_length_of :title, :within => 1..80

  validates_presence_of :entry_text


  scope :permalinks, where(:is_sticky => true)

  scope :sort_article_by_user, lambda { |dir| order("users.name #{dir.to_s}, articles.title #{dir.to_s}") }

  #--
  # Note: boolean validation via a typical...
  #
  # validates_format_of :is_sticky_before_type_cast, :with => /[01]/, :message => 'Must be 1 or 0'
  #
  # ...must *not* be used together with inline_edit = true, because ActiveScaffold has an internal conversion
  # mechanism which acts differently.


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
