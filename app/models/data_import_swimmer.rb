class DataImportSwimmer < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :data_import_session
  validates_associated  :data_import_session

  belongs_to :swimmer, :foreign_key => "conflicting_swimmer_id"
  belongs_to :gender_type

  validates_presence_of :import_text

  validates_presence_of :complete_name
  validates_length_of   :complete_name, :within => 1..100, :allow_nil => false

  validates_length_of   :last_name, :maximum => 50
  validates_length_of   :first_name, :maximum => 50

  validates_presence_of :year_of_birth
  validates_length_of   :year_of_birth, :within => 2..4, :allow_nil => false

  scope :sort_data_import_team_by_conflicting_rows_id,  lambda { |dir| order("conflicting_swimmer_id #{dir.to_s}") }
  scope :sort_data_import_team_by_user,                 lambda { |dir| order("users.name #{dir.to_s}, data_import_swimmers.name #{dir.to_s}") }
  scope :sort_data_import_team_by_gender_type,          lambda { |dir| order("gender_types.code #{dir.to_s}, data_import_swimmers.name #{dir.to_s}") }
  # ----------------------------------------------------------------------------


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------
  #++


  # Computes a verbose or formal description for the row data "conflicting" with the current import data row
  def get_verbose_conflicting_row
    if ( self.conflicting_swimmer_id.to_i > 0 )
      begin
        conflicting_row = Swimmer.find( conflicting_swimmer_id )
        "(ID:#{conflicting_swimmer_id}) #{conflicting_row.get_verbose_name}"
      rescue
        "(ID:#{conflicting_swimmer_id}) <#{I18n.t(:unable_to_retrieve_row_data, :scope =>[:activerecord, :errors] )}>"
      end
    else
      ''
    end
  end
  # ---------------------------------------------------------------------------

  # Computes a shorter description for the name associated with this data
  def get_full_name
    last_name ? "#{last_name} #{first_name}" : "#{complete_name}"
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    "#{get_full_name} (#{year_of_birth}, #{gender_type ? gender_type.code : '?'})"
  end

  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
  end
  # ---------------------------------------------------------------------------

end
