class DataImportSeason < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :data_import_session
  validates_associated  :data_import_session

  belongs_to :season, :foreign_key => "conflicting_season_id"

  validates_presence_of :import_text

  belongs_to :season_type
  validates_associated :season_type

  validates_length_of :description, :within => 1..100, :allow_nil => false

  validates_presence_of :begin_date
  # [Steve, 20130710] validate also :end_date ?
  validates_presence_of :must_use_time_standards

  validates_length_of :max_points, :maximum => 9, :allow_nil => false
  validates_numericality_of :max_points


  scope :sort_data_import_season_by_conflicting_rows_id,  lambda { |dir| order("conflicting_season_id #{dir.to_s}") }
  scope :sort_data_import_season_by_user,                 lambda { |dir| order("users.name #{dir.to_s}, data_import_seasons.begin_date #{dir.to_s}") }
  scope :sort_data_import_season_by_season_type,          lambda { |dir| order("season_types.code #{dir.to_s}, data_import_seasons.begin_date #{dir.to_s}") }
  # ----------------------------------------------------------------------------


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------
  #++

  # Computes a shorter description for the name associated with this data
  def get_full_name
    "#{begin_date ? begin_date.strftime('%Y') : '?'}/#{end_date ? end_date.strftime('%y') : '?'} #{get_season_type}"
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    "(#{begin_date ? begin_date.strftime('%Y') : '?'}/#{end_date ? end_date.strftime('%y') : '?'}) #{description}"
  end

  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------

  # Retrieves the Season Type short name
  def get_season_type
    self.season_type ? self.season_type.short_name :  '?'
  end
  # ----------------------------------------------------------------------------


  # Computes a verbose or formal description for the row data "conflicting" with the current import data row
  def get_verbose_conflicting_row
    if ( self.conflicting_season_id.to_i > 0 )
      begin
        conflicting_row = Season.find( conflicting_season_id )
        "(ID:#{conflicting_season_id}) #{conflicting_row.get_season_type}"
      rescue
        "(ID:#{conflicting_season_id}) <#{I18n.t(:unable_to_retrieve_row_data, :scope =>[:activerecord, :errors] )}>"
      end
    else
      ''
    end
  end
  # ---------------------------------------------------------------------------

end
