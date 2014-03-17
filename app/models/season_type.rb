class SeasonType < ActiveRecord::Base

  # Commodity reference to a specific code stored in the DB; make sure this value is always correct
  CODE_MAS_FIN = 'MASFIN'

  # Commodity reference to a specific code stored in the DB; make sure this value is always correct
  CODE_MAS_CSI = 'MASCSI'

  validates_presence_of   :code
  validates_length_of     :code, :within => 1..10, :allow_nil => false
  validates_uniqueness_of :code, :message => :already_exists

  validates_length_of     :description, :maximum => 100
  validates_length_of     :short_name, :maximum => 40

  belongs_to :federation_type
  validates_presence_of :federation_type            # (must be not null)
  validates_associated :federation_type             # (foreign key integrity)

  # ----------------------------------------------------------------------------


  # Label symbol corresponding to either a column name or a model method to be used
  # mainly in generating DropDown option lists.
  #
  def self.get_label_symbol
    :short_name
  end
  # ----------------------------------------------------------------------------

  # ID getter for the specified code; returns 0 on error
  #
  def self.get_id_by_code( code )
    season_type = SeasonType.find_by_code( code )
    season_type ? season_type.id : 0
  end
end
