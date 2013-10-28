class DataImportBadge < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :data_import_session
  validates_associated  :data_import_session

  belongs_to :badge, :foreign_key => "conflicting_badge_id"

  validates_presence_of :import_text

  belongs_to :data_import_season
  belongs_to :data_import_swimmer
  belongs_to :data_import_team
  belongs_to :season
  belongs_to :swimmer
  belongs_to :team

  belongs_to :category_type
  belongs_to :entry_time_type

  validates_associated :category_type
  validates_associated :entry_time_type

  validates_presence_of :number
  validates_length_of :number, :maximum =>  40


  scope :sort_data_import_badge_by_conflicting_rows_id,     lambda { |dir| order("conflicting_badge_id #{dir.to_s}") }
  scope :sort_data_import_badge_by_user,                    lambda { |dir| order("users.name #{dir.to_s}, data_import_badges.number #{dir.to_s}") }
  scope :sort_data_import_badge_by_season,                  lambda { |dir| order("seasons.begin_date #{dir.to_s}, data_import_badges.number #{dir.to_s}") }
  scope :sort_data_import_badge_by_team,                    lambda { |dir| order("teams.name #{dir.to_s}, data_import_badges.number #{dir.to_s}") }
  scope :sort_data_import_badge_by_swimmer,                 lambda { |dir| order("swimmers.last_name #{dir.to_s}, swimmers.first_name #{dir.to_s}") }
  scope :sort_data_import_badge_by_category_type,           lambda { |dir| order("category_types.code #{dir.to_s}, data_import_badges.number #{dir.to_s}") }
  # ----------------------------------------------------------------------------


  # Computes a verbose or formal description for the row data "conflicting" with the current import data row
  def get_verbose_conflicting_row
    if ( self.conflicting_badge_id.to_i > 0 )
      begin
        conflicting_row = Badge.find( conflicting_badge_id )
        "(ID:#{conflicting_badge_id}) #{conflicting_row.get_verbose_name}"
      rescue
        "(ID:#{conflicting_badge_id}) <#{I18n.t(:unable_to_retrieve_row_data, :scope =>[:activerecord, :errors] )}>"
      end
    else
      ''
    end
  end
  # ---------------------------------------------------------------------------

end
