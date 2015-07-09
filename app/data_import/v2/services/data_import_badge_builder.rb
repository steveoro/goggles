# encoding: utf-8

require_relative '../../../data_import/v2/services/data_import_entity_builder'


=begin

= DataImportCityBuilder

  - Goggles framework vers.:  4.00.743
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
        set_result( nil ) and return if badge_code.nil? || badge_code.size < 1
      end

      # Do the search only if the badge code is not the placeholder for an unknown
      # badge number ('?'). In that case, we have to add a new badge anyway.
      if badge_code != '?'
        search do
          primary   [
            "(season_id = ?) AND (number = ?)",
            ( season.instance_of?(Season) ? season.id : 0 ),
            badge_code
          ]
          secondary [
            "(data_import_session_id = ?) AND " <<
            "(#{season.instance_of?(Season) ? '' : 'data_import_'}season_id = ?) AND " <<
            "(number = ?)",
            data_import_session.id,
            season.id,
            badge_code
          ]
          default_search
# DEBUG
#          puts "primary search by CODE ok!" if primary_search_ok?
#          puts "secondary search by CODE ok!" if secondary_search_ok?
        end
      else
          # Search for an existing badge, but use swimmer, team and season:
          primary   [
            "(season_id = ?) AND (swimmer_id = ?) AND (team_id = ?)",
            ( season.instance_of?(Season) ? season.id : 0 ),
            ( swimmer.instance_of?(Swimmer) ? swimmer.id : 0 ),
            ( team.instance_of?(Team) ? team.id : 0 )
          ]
          secondary [
            "(data_import_session_id = ?) AND " <<
            "(#{season.instance_of?(Season) ? '' : 'data_import_'}season_id = ?) AND " <<
            "(#{swimmer.instance_of?(Swimmer) ? '' : 'data_import_'}swimmer_id = ?) AND " <<
            "(#{team.instance_of?(Team) ? '' : 'data_import_'}team_id = ?)",
            data_import_session.id,
            season.id,
            swimmer.id,
            team.id
          ]
          default_search
# DEBUG
#          puts "primary search by Season, Swimmer & Team ok!" if primary_search_ok?
#          puts "secondary search by Season, Swimmer & Team ok!" if secondary_search_ok?
      end

      if_not_found do                               # Still not found?
        search do
          # Search for an existing badge, but use just season & swimmer instead:
          primary   [
            "(season_id = ?) AND (swimmer_id = ?)",
            ( season.instance_of?(Season) ? season.id : 0 ),
            ( swimmer.instance_of?(Swimmer) ? swimmer.id : 0 )
          ]
          secondary [
            "(data_import_session_id = ?) AND " <<
            "(#{season.instance_of?(Season) ? '' : 'data_import_'}season_id = ?) AND " <<
            "(#{swimmer.instance_of?(Swimmer) ? '' : 'data_import_'}swimmer_id = ?)",
            data_import_session.id,
            season.id,
            swimmer.id
          ]
          default_search
# DEBUG
#          puts "primary search by Season & Swimmer ok!" if primary_search_ok?
#          puts "secondary search by Season & Swimmer ok!" if secondary_search_ok?
        end
      end

      if_not_found do
# DEBUG
#        puts "NOT found!"
                                                    # Search or add a TeamAffiliation:
        ta_builder = DataImportTeamAffiliationBuilder.build_from_parameters(
          data_import_session,
          team,
          season
        )
        ta = ta_builder.result_row

        attributes_for_creation(
          data_import_session_id: data_import_session.id,
          import_text:            badge_code,
          number:                 badge_code,
          category_type_id:       category_type.id,
          entry_time_type_id:     entry_time_type.id,

          team_affiliation_id:    ta.instance_of?(TeamAffiliation)        ? ta.id      : nil,
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
