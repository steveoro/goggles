# encoding: utf-8

require 'data_import/strategies/city_comparator'
require 'data_import/services/data_import_entity_builder'
require 'data_import/services/data_import_city_builder'


=begin

= DataImportTeamBuilder

  - Goggles framework vers.:  4.00.571
  - author: Steve A.

 Specialized +DataImportEntityBuilder+ for searching (or adding brand new)
 Team entity rows.

 Normally the automatic Team creation procedure is disabled and requires a
 separate pre-analysis stage, with a statistical report of the best-match
 data before actual data insertion.

=== Entity look-up order/algorithm:
  1) Scan TeamAffiliation to seek affiliations created/inserted from
     previous runs, which allegedly should have name just like '<team_name>%'.
  => if found, Team must exist (due to validations)

  2) If not found, scan if the wanted 'team_name' was just inserted into
     DataImportTeam (due to be committed on next phase).

  3) If not found, scan Team with some fuzzy-logic metric to seek for a
     "best-match", but using a very-high bias score (>= 0.98).
     This should be the last resort, since a positive match could be wrong
     anyway if the bias is not high enough.

  3.1) Additional (*integrity*) check on TeamAffiliation:
     If a Team was found, we can actually create at this point the missing
     TeamAffiliation using the searched <team_name>.
     (NOTE: THIS IS THE ONLY STAGE AND SITUATION IN WHICH TeamAffiliations are
      added when missing because their corresponding Team is already found!
      During phase 3 TeamAffiliations are _always_ added because all the Teams
      processed there are considered as "new" or missing.)

  4) If all else fails, insert a new Team ONLY if its enabling flag has been
     set to true (force_missing_team_creation).

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
                                                  # 1) Default search: TeamAffiliation + DataImportTeam:
      search do
        primary     [ "(season_id = ?) AND (name LIKE ?)", season.id, "#{team_name}%" ]
        secondary   [ "(data_import_session_id = ?) AND (name LIKE ?)", data_import_session.id, "#{team_name}%" ]
        default_search
        entity      Team                          # reset primary entity after the search
        if primary_search_ok? # Force result to be a Team instance when it is found
# DEBUG
#          puts "primary_search_ok!"
          set_result  @result_row.team
        end
      end
                                                  # 2) Search for a team alias:
      if_not_found  do
        search_for( DataImportTeamAlias, name: team_name )
      end

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
# DEBUG
#          puts "actual_team_result: #{actual_team_result.inspect}"
          # ASSERT: It should never happen that: (Team missing && TeamAffiliation found).

          # Check the remote case in which we could have found a Team without its
          # associated TeamAffiliation (it may happen for freshly created teams).
          # To avoid mysql to complain about duplicate insertions, we test before
          # the add if the TeamAffiliation is really missing (which is almost never
          # the case when the Team has been found by the searches above).
          search_for( TeamAffiliation, team_id: actual_team_result.id, season_id: season.id )
          if_not_found do
            entity_for_creation TeamAffiliation
            attributes_for_creation(
              name:                       team_name,# Use the actual provided (and searched) name instead of the result_row.name
              team_id:                    actual_team_result.id,
              season_id:                  season.id,
              is_autofilled:              true,     # signal that we have guessed some of the values
              must_calculate_goggle_cup:  false,
              user_id:                    1         # (don't care)
              # FIXME Unable to guess team affiliation number (not filled-in, to be added by hand)
            )
            add_new
          end
          # We need to restore the result_row, in case the above procedure has changed the
          # result value:
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
            city_id:                city_builder.result_row.instance_of?(City)           ? city_builder.result_row.id : nil,
            data_import_city_id:    city_builder.result_row.instance_of?(DataImportCity) ? city_builder.result_row.id : nil,
            user_id:                1 # (don't care)
          )
          add_new
        else
          # Not found & can't create a new team? => Do a full depth-first analyze of
          # the team name in search for a match and report the results via the builder
          # instance:
          @team_analysis_log ||= ''
          @sql_executable_log ||= ''
          result = TeamNameAnalizer.new.analyze(
              team_name, season.id,
              @team_analysis_log,                   # The method will update these 2 variables in place
              @sql_executable_log,                  # (it uses the << operator)
              0.99, 0.8
          )
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
            data_import_session.phase_1_log ||= ''
            data_import_session.sql_diff    ||= ''
            data_import_session.phase_1_log << "#{ @team_analysis_log }\r\n"
            data_import_session.sql_diff    << "#{ @sql_executable_log }\r\n"
            data_import_session.save!
          end
          # Result not found w/o Team creation => Do a manual review of the analysis data.
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
