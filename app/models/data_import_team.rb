class DataImportTeam < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :data_import_session
  validates_associated  :data_import_session

  belongs_to :team, :foreign_key => "conflicting_team_id"

  validates_presence_of :import_text

  belongs_to :data_import_city
  belongs_to :city
  validates_associated :city

  validates_presence_of :name
  validates_length_of :name, :within => 1..60, :allow_nil => false

  # XXX [Steve, 20130925] :badge_number can be used as a temporary storage
  # for a team_affiliations.number found during data-import parsing,
  # skipping the need for a dedicated team_affiliations temp. table:
  validates_length_of :badge_number,  :maximum =>  40

  scope :sort_data_import_team_by_conflicting_rows_id,  lambda { |dir| order("conflicting_team_id #{dir.to_s}") }
  scope :sort_data_import_team_by_user,                 lambda { |dir| order("users.name #{dir.to_s}, data_import_teams.name #{dir.to_s}") }
  scope :sort_data_import_team_by_city,                 lambda { |dir| order("cities.name #{dir.to_s}, data_import_teams.name #{dir.to_s}") }
  # ----------------------------------------------------------------------------


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------
  #++


  # Computes a verbose or formal description for the row data "conflicting" with the current import data row
  def get_verbose_conflicting_row
    if ( self.conflicting_team_id.to_i > 0 )
      begin
        conflicting_row = Team.find( conflicting_team_id )
        "(ID:#{conflicting_team_id}) #{conflicting_row.get_verbose_name}"
      rescue
        "(ID:#{conflicting_team_id}) <#{I18n.t(:unable_to_retrieve_row_data, :scope =>[:activerecord, :errors] )}>"
      end
    else
      ''
    end
  end
  # ---------------------------------------------------------------------------

  # Computes a shorter description for the name associated with this data
  def get_full_name
    name
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    "#{name}#{( city ? ', '+city.get_full_name() : (data_import_city ? ', '+data_import_city.get_full_name() : '') )}"
  end

  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------
  #++
end
