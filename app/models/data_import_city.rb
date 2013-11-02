class DataImportCity < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :data_import_session
  validates_associated  :data_import_session

  belongs_to :city, :foreign_key => "conflicting_city_id"

  validates_presence_of :import_text

  validates_presence_of   :name
  validates_length_of     :name, :within => 1..50
  validates_uniqueness_of :name, :scope => :zip, :message => :already_exists

  validates_length_of     :zip, :maximum => 6
  validates_length_of     :area, :maximum => 50
  validates_length_of     :country, :maximum => 50
  validates_length_of     :country_code, :maximum => 10
  # ----------------------------------------------------------------------------


  # Computes a verbose or formal description for the row data "conflicting" with the current import data row
  def get_verbose_conflicting_row
    if ( self.conflicting_city_id.to_i > 0 )
      begin
        conflicting_row = City.find( conflicting_city_id )
        "(ID:#{conflicting_city_id}) #{conflicting_row.get_verbose_name}"
      rescue
        "(ID:#{conflicting_city_id}) <#{I18n.t(:unable_to_retrieve_row_data, :scope =>[:activerecord, :errors] )}>"
      end
    else
      ''
    end
  end
  # ---------------------------------------------------------------------------

end
