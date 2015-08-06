# encoding: utf-8

require_relative '../../../../app/data_import/v3/builders/entity_builder'
require_relative '../../../../app/data_import/v3/builders/city_builder'
require_relative '../../../../app/data_import/v3/builders/team_affiliation_builder'


=begin

= V3::TeamBuilder

  - Goggles framework vers.:  4.00.819
  - author: Steve A.

 Specialized +DataImportEntityBuilder+ for searching (or adding brand new)
 Team entity rows.

 Normally the automatic Team creation procedure is disabled and requires a
 separate pre-analysis stage, with a statistical report of the best-match
 data before actual data insertion.

 For this reason, the +force_team_or_swimmer_creation+ parameter should be set
 to +true+ only after the analysis phase while processing the analysis result rows.

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

  4) If all else fails, insert a new Team ONLY if the force creation flag has been
     set to true (force_team_or_swimmer_creation).
     Else, save the analysis' result and return +nil+, thus signaling the need of
     a manual review/selection of the candidates found.

=end
class V3::TeamBuilder < V3::EntityBuilder

  # Searches for an existing Team given the parameters, or it adds a new one,
  # if not found.
  #
  # == Returns
  # +nil+ in case of invalid parameters
  # #result_id as:
  #     - positive (#id) for a freshly added row into DataImportTeam;
  #     - negative (- #id) for a matching existing or commited row in Team;
  #     - 0 on error/unable to process.
  #
  #
  def self.build_from_parameters( data_import_session, team_name, season,
                                  force_team_or_swimmer_creation )
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
          set_result @result_row.team
        end
      end
                                                  # 2) Search for a Team Alias:
      if_not_found  do
        search_for( DataImportTeamAlias, name: team_name )
        unless @result_row                        # 2.1) Additional Fuzzy search on Team Aliases:
          matcher = FuzzyStringMatcher.new( DataImportTeamAlias.all, :name, )
          @result_row = matcher.find( team_name, FuzzyStringMatcher::BIAS_SCORE_BEST )
        end
        set_result( @result_row.team ) if @result_row
      end

      if_not_found do                             # 3) Do a single-shot, "manually-driven" "best-match" fuzzy search on TEAMS:
        matcher     = FuzzyStringMatcher.new( Team.all, :name, :editable_name )
        result_row  = matcher.find( team_name, FuzzyStringMatcher::BIAS_SCORE_BEST )
        entity      Team                          # reset primary entity after the search
        set_result  result_row                    # This will set the result so to simulate a search_for() execution
# DEBUG
#        puts "FuzzyStringMatcher on Team: result = #{result_row.inspect}"
      end
                                                  # 4) Additional TeamAffiliation check:
      # INTEGRITY Check: add a missing TeamAffiliation but only if we have a primary match.
      # (Cannot add a TeamAffiliation if the Team doesn't exist yet.)
      custom_logic do
        if primary_search_ok?
# DEBUG
#          puts "actual_team_result: #{@result_row.inspect}"
          # ASSERT: It should never happen that: (Team missing && TeamAffiliation found).

          # Check & fix the case in which we could have found a Team without its
          # associated TeamAffiliation (it may happen for freshly created teams or
          # at the beginning of a new season). Since we do not actually need the
          # affiliation at this stage, we just search for it and create it if missing,
          # without storing the result:
          V3::TeamAffiliationBuilder.build_from_parameters(
            data_import_session,
            @result_row,
            season
          )
        end
      end

      if_not_found do                             # 5) Do another single-shot, "best-match" fuzzy search on DATA_IMPORT_TEAMS:
        matcher     = FuzzyStringMatcher.new( DataImportTeam.all, :name )
        result_row  = matcher.find( team_name, FuzzyStringMatcher::BIAS_SCORE_BEST )
        entity      DataImportTeam                # reset primary entity after the search
        set_result  result_row
# DEBUG
#        puts "FuzzyStringMatcher on DataImportTeam: result = #{result_row.inspect}"
      end

      if_not_found do
        if force_team_or_swimmer_creation              # Guess city name & setup fields:
          city_builder = V3::CityBuilder.build_from_parameters( data_import_session, team_name )
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
          # Not found & can't create a new row? => Do a full depth-first analyze of
          # the team name in search for a match and report the results via the builder
          # instance:
          analysis_log = ''
          sql_executable_log = ''
          result = V3::TeamNameAnalyzer.new.analyze(
              team_name,
              season.id,
              analysis_log,                         # The method will update these 2 variables in place
              sql_executable_log,                   # (it uses the << operator)
              0.99, 0.8
          )
          result.data_import_session_id = data_import_session.id
                                                    # Store the analysis result (if there aren't any yet):
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
            data_import_session.phase_1_log << "#{ analysis_log }\r\n"
            data_import_session.sql_diff    << "#{ sql_executable_log }\r\n"
          end
          # Result not found w/o row creation => force a manual review of the analysis data.
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
