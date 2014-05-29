require 'data_importable'


class DataImportTeam < ActiveRecord::Base
  include DataImportable

  belongs_to :user                                  # [Steve, 20120212] Do not validate associated user!

  belongs_to :team, foreign_key: "conflicting_team_id"

  validates_presence_of :import_text

  belongs_to :data_import_city
  belongs_to :city
  validates_associated  :city

  validates_presence_of :name, length: { within: 1..60 }, allow_nil: false

  # XXX [Steve, 20130925] :badge_number can be used as a temporary storage
  # for a team_affiliations.number found during data-import parsing,
  # skipping the need for a dedicated team_affiliations temp. table:
  validates_length_of :badge_number, maximum: 40

  scope :sort_by_conflicting_rows_id,  ->(dir) { order("conflicting_team_id #{dir.to_s}") }
  scope :sort_by_user,                 ->(dir) { order("users.name #{dir.to_s}, data_import_teams.name #{dir.to_s}") }
  scope :sort_by_city,                 ->(dir) { order("cities.name #{dir.to_s}, data_import_teams.name #{dir.to_s}") }


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------


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

end
