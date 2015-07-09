# encoding: utf-8

require_relative '../../../data_import/v2/strategies/city_comparator'
require_relative '../../../data_import/v2/services/data_import_entity_builder'


=begin

= DataImportCityBuilder

  - Goggles framework vers.:  4.00.583
  - author: Steve A.

 Specialized +DataImportEntityBuilder+ for searching (or adding brand new)
 City entity rows.

=end
class DataImportCityBuilder < DataImportEntityBuilder

  # Searches for an existing City assuming city name can be deduced
  # by the given Team name.
  #
  # The current implementation uses CityComparator to detect the matching city
  # from the list of already existing rows found in the database.
  #
  # When no matches are found, *no* add operation will be performed.
  #
  def self.build_from_parameters( data_import_session, team_name )
    self.build( data_import_session ) do
      entity City

      search do                                     # (Custom) Primary search:
# DEBUG
#        puts "\r\nSearching: #{team_name}"
        city = CityComparator.new.search_composed_name( team_name )
        set_result( city )
      end

      if_not_found do                               # (Custom) Secondary search:
# DEBUG
#        puts "Primary search failure. Searching on secondary entity..."
        city = CityComparator.new.search_composed_name( team_name, DataImportCity )
        set_result( city )
      end

      # [Steve, 20141012] Unable to add a new city without any of these fields:
      # if_not_found do
        # attributes_for_creation(
          # data_import_session_id: data_import_session.id,
          # import_text:            team_name,
          # name:                   name,
          # zip:                    zip,
          # area:                   area,
          # country:                country,
          # country_code:           country_code,
          # user_id:                1 # (don't care)
        # )
        # add_new
      # end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
