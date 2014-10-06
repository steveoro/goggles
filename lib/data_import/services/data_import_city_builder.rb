# encoding: utf-8

require 'data_import/strategies/city_comparator'


=begin

= DataImportCityBuilder

  - Goggles framework vers.:  4.00.545
  - author: Steve A.

 Specialized +DataImportEntityBuilder+ for searching (or adding brand new)
 City entity rows.

=end
class DataImportCityBuilder < DataImportEntityBuilder

  # Searches for an existing City by looking at common patterns
  # inside the given Team name, or it adds a new one, if not found.
  #
  # (The guessing of the missing field names is not guaranteed to be successfull.)
  #
  def self.build_from_team_name( data_import_session, team_name )
    city_fields   = CityComparator.guess_city_from_team_name( team_name )
    names         = city_fields.split(',')
    name          = names.size > 0 ? names[0] : '?'
    area          = names.size > 1 ? names[1] : '?'
    zip           = names.size > 2 ? names[2] : '?'
    country       = names.size > 3 ? names[3] : 'Italia'
    country_code  = names.size > 4 ? names[4] : 'ITA'

    self.build( data_import_session ) do
      entity City

      search do                                     # Primary search:
        City.all.each do |city|                     # Loop on all pre-inserted cities and search for a match
          is_same_city = CityComparator.seems_the_same(
            name,         city.name,
            area,         city.area,
            country_code, city.country_code
          )
          if is_same_city
            result_row = city
            break
          end
        end
        set_result( result_row )
      end

      if_not_found do                               # Secondary search:
        DataImportCity.all.each do |city|           # Loop on all pre-inserted cities and search for a match
          is_same_city = CityComparator.seems_the_same(
            name,         city.name,
            area,         city.area,
            country_code, city.country_code
          )
          if is_same_city
            result_row = city
            break
          end
        end
        set_result( result_row )
      end

      if_not_found do
        attributes_for_creation(
          data_import_session_id: data_import_session.id,
          import_text:            team_name,
          name:                   name,
          zip:                    zip,
          area:                   area,
          country:                country,
          country_code:           country_code,
          user_id:                1 # (don't care)
        )
        add_new
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
