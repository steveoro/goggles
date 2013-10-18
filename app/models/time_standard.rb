class TimeStandard < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :season
  belongs_to :gender_type
  belongs_to :pool_type
  belongs_to :event_type
  belongs_to :category_type
  validates_associated :season
  validates_associated :gender_type
  validates_associated :pool_type
  validates_associated :event_type
  validates_associated :category_type

  validates_presence_of     :minutes
  validates_length_of       :minutes, :within => 1..3, :allow_nil => false
  validates_numericality_of :minutes
  validates_presence_of     :seconds
  validates_length_of       :seconds, :within => 1..2, :allow_nil => false
  validates_numericality_of :seconds
  validates_presence_of     :hundreds
  validates_length_of       :hundreds, :within => 1..2, :allow_nil => false
  validates_numericality_of :hundreds


  scope :sort_passage_by_user,            lambda { |dir| order("users.name #{dir.to_s}, seasons.code #{dir.to_s}") }
  scope :sort_passage_by_season,          lambda { |dir| order("seasons.code #{dir.to_s}") }
  scope :sort_passage_by_gender_type,     lambda { |dir| order("seasons.code #{dir.to_s}, gender_types.code #{dir.to_s}") }
  scope :sort_passage_by_pool_type,       lambda { |dir| order("seasons.code #{dir.to_s}, pool_types.code #{dir.to_s}") }
  scope :sort_passage_by_event_type,      lambda { |dir| order("seasons.code #{dir.to_s}, event_types.code #{dir.to_s}") }
  scope :sort_passage_by_category_type,   lambda { |dir| order("seasons.code #{dir.to_s}, category_types.code #{dir.to_s}") }


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------
  #++

  # Returns just the formatted timing information
  def get_timing
    "#{minutes}'" + sprintf("%02.0f", seconds) + "\"." + sprintf("%02.0f", hundreds)
  end

  # Computes a shorter description for the name associated with this data
  def get_full_name
    "#{season.get_season_type}, #{get_event_type} #{get_category_type} #{get_gender_type_code}: #{get_timing}"
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    "#{season.get_season_type} #{get_pool_type}, #{get_event_type}: #{get_category_type} #{get_gender_type_code} => #{get_timing}"
  end

  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------

  # Retrieves the localized Event Type code
  def get_event_type
    self.event_type ? self.event_type.i18n_short : '?'
  end

  # Retrieves the localized Gender Type single-char code
  def get_gender_type_code
    self.gender_type ? self.gender_type.i18n_gender_type : '?'
  end

  # Retrieves the localized Pool Type code
  def get_pool_type
    self.pool_type ? self.pool_type.i18n_short : '?'
  end

  # Retrieves the localized Category Type code
  def get_category_type
    self.category_type ? self.category_type.short_name : '?'
  end
  # ----------------------------------------------------------------------------

end
