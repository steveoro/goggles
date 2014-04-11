class DataImportCity < ActiveRecord::Base
  belongs_to :user                                  # [Steve, 20120212] Do not validate associated user!
  belongs_to :data_import_session
  validates_associated  :data_import_session

  belongs_to :city, :foreign_key => "conflicting_city_id"

  validates_presence_of :import_text

  validates_presence_of   :name, length: { within: 1..50 }, allow_nil: false
  validates_uniqueness_of :name, scope: :zip, message: :already_exists
  validates_length_of     :zip,  maximum: 6
  validates_presence_of   :area, length: { within: 1..50 }, allow_nil: false
  validates_presence_of   :country, length: { within: 1..50 }, allow_nil: false
  validates_presence_of   :country_code, length: { within: 1..10 }, allow_nil: false
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
