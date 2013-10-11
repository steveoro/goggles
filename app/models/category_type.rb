class CategoryType < ActiveRecord::Base

  validates_presence_of   :code
  validates_length_of     :code, :within => 1..6

  validates_length_of     :federation_code, :within => 1..2
  validates_length_of     :description, :maximum => 100
  validates_length_of     :short_name, :maximum => 50
  validates_length_of     :group_name, :maximum => 50

  validates_length_of     :age_begin, :maximum => 3
  validates_length_of     :age_end, :maximum => 3

  belongs_to :season_type
  validates_presence_of :season_type                # (must be not null)
  validates_associated :season_type                 # (foreign key integrity)

  # ----------------------------------------------------------------------------
  #++


  # Returns the corresponding id given season type id, year of birth and
  # chosen year for the result; 0 on error.
  #
  def self.get_id_from( season_type_id, year_of_birth, chosen_year )
    target_age = chosen_year.to_i - year_of_birth.to_i
    category_type = CategoryType.where( ['season_type_id = ? AND age_begin >= ? AND age_end <= ?', season_type_id, target_age-5, target_age+5] ).first
    category_type ? category_type.id : 0
  end
  # ----------------------------------------------------------------------------


  # Given a localized text description from an imported text,
  # returns the corresponding CategoryType.id; 0 when unable to parse.
  #
  def self.parse_category_type_from_import_text( season_type_id, category_token )
    result_code = ''
                                                    # NOTE: assuming 'Master YY'|'Under 25' format is used:
    if idx = category_token =~ /master/ui
      result_code = 'M'
      subtokens = category_token[ idx .. idx+10 ].split(' ')
      result_code << subtokens[1] if subtokens.size > 0

    elsif category_token =~ /under/ui
      result_code = 'U25'

    elsif idx = (category_token =~ /m\d\d\d/ui)
      result_code = category_token[ idx .. idx+3 ]
    end
# DEBUG
#    puts "=> CategoryType.parse_category_type_from_import_text( #{season_type_id}, '#{category_token}' ):\t\tresult_code='#{result_code}'"
    category_type = CategoryType.where( ['season_type_id = ? AND code = ?', season_type_id, result_code] ).first
    category_type ? category_type.id : 0
  end
  # ----------------------------------------------------------------------------
end
