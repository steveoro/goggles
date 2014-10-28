# encoding: utf-8

require 'data_import/services/data_import_entity_builder'


=begin

= DataImportCityBuilder

  - Goggles framework vers.:  4.00.583
  - author: Steve A.

 Specialized +DataImportEntityBuilder+ for searching (or adding brand new)
 Badge entity rows.

=end
class DataImportBadgeBuilder < DataImportEntityBuilder

  # Searches for an existing Badge given the parameters, or it adds a new one,
  # if no matches are found.
  #
  # == Returns
  # +nil+ in case of invalid parameters
  # #result_id as:
  #     - positive (#id) for a freshly added row into DataImportBadge;
  #     - negative (- #id) for a matching existing or commited row in Badge;
  #     - 0 on error/unable to process.
  #
  def self.build_from_parameters( data_import_session, badge_code, season, team, swimmer,
                                  category_type, entry_time_type )
# DEBUG
#    puts "\r\nBadge - build_from_parameters: data_import_session ID: #{data_import_session.id}, number: #{badge_code}, season: #{season.inspect}"
    self.build( data_import_session ) do
      entity      Badge

      set_up do
        set_result( nil ) and return if badge_code.nil? || badge_code.size < 2
      end

      search do
        primary   [
          "(season_id = ?) AND (number = ?)", season.id, badge_code
        ]
        secondary [
          "(data_import_session_id = ?) AND (season_id = ?) AND (number = ?)",
          data_import_session.id, season.id, badge_code
        ]
        default_search
# DEBUG
#        puts "primary_search_ok!" if primary_search_ok?
#        puts "secondary_search_ok!" if secondary_search_ok?
      end

      if_not_found do
# DEBUG
#        puts "NOT found!"
        attributes_for_creation(
          data_import_session_id: data_import_session.id,
          import_text:            badge_code,
          number:                 badge_code,
          category_type_id:       category_type.id,
          entry_time_type_id:     entry_time_type.id,

          swimmer_id:             swimmer.instance_of?(Swimmer)           ? swimmer.id : nil,
          data_import_swimmer_id: swimmer.instance_of?(DataImportSwimmer) ? swimmer.id : nil,
          team_id:                team.instance_of?(Team)                 ? team.id    : nil,
          data_import_team_id:    team.instance_of?(DataImportTeam)       ? team.id    : nil,
          season_id:              season.instance_of?(Season)             ? season.id  : nil,
          data_import_season_id:  season.instance_of?(DataImportSeason)   ? season.id  : nil,
          user_id:                1 # (don't care)
        )
        add_new
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
