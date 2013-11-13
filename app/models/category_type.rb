class CategoryType < ActiveRecord::Base

  validates_presence_of   :code
  validates_length_of     :code, :within => 1..7, :allow_nil => false

  validates_length_of     :federation_code, :within => 1..2
  validates_length_of     :description, :maximum => 100
  validates_length_of     :short_name, :maximum => 50
  validates_length_of     :group_name, :maximum => 50

  validates_length_of     :age_begin, :maximum => 3
  validates_length_of     :age_end, :maximum => 3

  belongs_to :season
  validates_presence_of :season                     # (must be not null)
  validates_associated :season                      # (foreign key integrity)

  has_one :season_type, :through => :season
  # ----------------------------------------------------------------------------


  # Returns the corresponding id given season type id, year of birth and
  # chosen year for the result; 0 on error.
  #
  def self.get_id_from( season_id, year_of_birth )
    target_age = chosen_year.to_i - year_of_birth.to_i
    category_type = CategoryType.includes(:season).where(
      [ 'season_id = ? AND category_types.age_begin >= ? AND category_types.age_end <= ?',
        season_id, target_age-5, target_age+5
      ]
    ).first
    category_type ? category_type.id : 0
  end
  # ----------------------------------------------------------------------------


  # Given a localized text description from an imported text,
  # returns the corresponding CategoryType.id; 0 when unable to parse.
  #
  def self.parse_category_type_from_import_text( season_id, category_token )
    result_code = ''
                                                    # NOTE: assuming 'Master YY'|'Under 25' format is used:
    if idx = (category_token =~ /\d\d\d\-\d\d\d/ui)
      result_code = category_token[ idx .. idx+6 ]

    elsif idx = category_token =~ /m/ui
      result_code = 'M'
      idx = category_token =~ /\d\d/ui
      subtokens = category_token[ idx .. idx+1 ]
      result_code << subtokens if subtokens.size > 0

    elsif category_token =~ /u/ui
      result_code = 'U25'
    end
# DEBUG
    puts "=> CategoryType.parse_category_type_from_import_text( #{season_id}, '#{category_token}' ):\t\tresult_code='#{result_code}'"
    category_type =  CategoryType.where(
      [ '(season_id = ?) AND (category_types.code = ?)', season_id, result_code ]
    ).first
    category_type ? category_type.id : 0
  end
  # ----------------------------------------------------------------------------


  # Label symbol corresponding to either a column name or a model method to be used
  # mainly in generating DropDown option lists.
  #
  def self.get_label_symbol
    :code
  end

  # Returns an Array of 2-items Arrays, in which each item is the ID of the record
  # and the other is assumed to be its label
  #
  # == Parameters:
  #
  # - where_condition: an ActiveRecord::Relation WHERE-clause; defaults to +nil+ (returns all records)
  # - key_sym: the key symbol/column name (defaults to :id)
  # - label_sym: the key symbol/column name (defaults to self.get_label_symbol())
  #
  # == Returns:
  # - an Array of arrays having the structure [ [label1, key_value1], [label2, key_value2], ... ]
  #
  def self.to_dropdown( where_condition = nil, key_sym = :id, label_sym = self.get_label_symbol() )
    self.where( where_condition ).map{ |row|
      [row.send(label_sym), row.send(key_sym)]
    }.sort_by{ |ar| ar[0] }
  end
  # ----------------------------------------------------------------------------
end
