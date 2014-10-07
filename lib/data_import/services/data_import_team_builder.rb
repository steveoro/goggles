# encoding: utf-8

require 'data_import/strategies/city_comparator'
require 'data_import/services/data_import_entity_builder'
require 'data_import/services/data_import_city_builder'


=begin

= DataImportTeamBuilder

  - Goggles framework vers.:  4.00.545
  - author: Steve A.

 Specialized +DataImportEntityBuilder+ for searching (or adding brand new)
 Team entity rows.

=end
class DataImportTeamBuilder < DataImportEntityBuilder

  # Searches for an existing Team given the parameters, or it adds a new one, if not found.
  #
  def self.build_from_parameters( data_import_session, team_name, season, force_missing_team_creation )
# DEBUG
#    puts "\r\nSearching for team '#{team_name}'..."
    self.build( data_import_session ) do
      entity              TeamAffiliation
      entity_for_creation DataImportTeam
                                                  # 1) Search TeamAffiliation + DataImportTeam:
      search do
        primary     [ "(name LIKE ?)", team_name+'%' ]
        secondary   [ "(data_import_session_id = ?) AND (name LIKE ?)", data_import_session.id, team_name+'%' ]
        default_search
        entity      Team                          # reset primary entity after the search
        if primary_search_ok? # Force result to be a Team instance when it is found
# DEBUG
#          puts "primary_search_ok!"
          set_result  @result_row.team
        end
      end
                                                  # 2) Search for a team alias:
      if_not_found  { search_for( DataImportTeamAlias, name: team_name ) }

      if_not_found do                             # 3) Do a single-shot, "best-match" fuzzy search:
        matcher     = FuzzyStringMatcher.new( Team.all, :name, :editable_name )
        result_row  = matcher.find( team_name, FuzzyStringMatcher::BIAS_SCORE_BEST )
        entity      Team                          # reset primary entity after the search
        set_result  result_row
# DEBUG
#        puts "FuzzyStringMatcher: result = #{result_row.inspect}"
      end
                                                  # 4) Additional TeamAffiliation check:
      # INTEGRITY Check: add a missing TeamAffiliation but only if we have a primary match.
      # (Cannot add a TeamAffiliation if the Team doesn't exist yet.)
      custom_logic do
        if primary_search_ok?
          actual_team_result = @result_row
          search_for( TeamAffiliation, team_id: -@result_id, season_id: season.id )

          if_not_found do
            entity_for_creation TeamAffiliation
            attributes_for_creation(
              name:                       team_name, # Use the actual provided (and searched) name instead of the result_row.name
              team_id:                    -@result_id,
              season_id:                  season.id,
              is_autofilled:              true, # signal that we have guessed some of the values
              must_calculate_goggle_cup:  false,
              user_id:                    1 # (don't care)
              # FIXME Unable to guess team affiliation number (not filled-in, to be added by hand)
            )
            add_new                       # this will reset the result_row, so we restore it by hand
          end
          set_result actual_team_result
        end
      end

      if_not_found do
        if force_missing_team_creation              # Guess city name & setup fields:
          city_builder = DataImportCityBuilder.build_from_parameters( data_import_session, team_name )
          entity_for_creation DataImportTeam

          attributes_for_creation(
            data_import_session_id: data_import_session.id,
            import_text:            team_name,
            name:                   team_name,
            city_id:                city_builder.result_id.to_i < 0 ? -city_builder.result_id : nil,
            data_import_city_id:    city_builder.result_id.to_i < 0 ? nil : city_builder.result_id,
            user_id:                1 # (don't care)
          )
          add_new
        else
          # Not found & can't create a new team? => Do a full depth-first analyze of
          # the team name in search for a match and report the results via the builder
          # instance:
          @team_analysis_log = ''
          @sql_executable_log = ''
          result = TeamNameAnalizer.new.analyze(
              team_name, season.id,
              @team_analysis_log,
              @sql_executable_log,
              0.99, 0.8
          )
          @team_analysis_log  = result.analysis_log_text
          @sql_executable_log = result.sql_text
          result.data_import_session_id = data_import_session.id
                                                    # Store the team analysis result:
          if ( DataImportTeamAnalysisResult.where(
                data_import_session_id: result.data_import_session_id,
                searched_team_name:     result.searched_team_name,
                desired_season_id:      result.desired_season_id
               ).none?
          )
            result.save!
# DEBUG
#            puts "Team analysis saved."
          end
          # Result not found w/o Team creation => Do a manual review of the analysis data.
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
