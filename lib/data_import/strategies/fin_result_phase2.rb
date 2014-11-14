# encoding: utf-8

require 'fileutils'                                 # Used to process filenames
require 'common/format'
require 'data_import/header_fields_dao'
require 'data_import/strategies/city_comparator'
require 'data_import/strategies/fin_result_parser'
require 'data_import/services/team_name_analizer'
require 'data_import/services/data_import_entity_builder'
require 'data_import/services/data_import_meeting_builder'
require 'data_import/services/data_import_meeting_event_builder'
require 'data_import/services/data_import_meeting_individual_result_builder'
require 'data_import/services/data_import_meeting_program_builder'
require 'data_import/services/data_import_meeting_relay_result_builder'
require 'data_import/services/data_import_meeting_session_builder'
require 'data_import/services/data_import_meeting_team_score_builder'
require 'data_import/services/data_import_season_builder'
require 'data_import/services/data_import_swimmer_builder'
require 'data_import/services/data_import_team_builder'
require 'data_import/services/data_import_time_standard_builder'


=begin

= FinResultPhase2

  - Goggles framework vers.:  4.00.621
  - author: Steve A.

  Data-Import/Digest Module incapsulating all "record search/add" methods
  to search and/or add a new entity record inside the database, assuming
  the results from the parsing ("phase 1") have already been obtained.

  Refactored from the original DataImportController implementation.

=end
module FinResultPhase2

  # Bias value used as minimum score to flag a different Team name as a possible match
  # during the pre-scan for unknown team names.
  BIAS_FOR_PRESCAN_FUZZY_SEARCH = 0.75


  # Scans parse_result hash structure to collect all team_names found.
  #
  # For each team_name found, the search_or_add_a_corresponding_team
  # method is executed. If the team is not found or some problem arise,
  # that same method will also run the team name analysis (which will
  # then require human supervision before commit).
  #
  # == Returns: when +false+, the additional "Team name analysis" phase must be
  #    run; +true+ if the "standard" data-import phase can go on.
  #
  def prescan_parse_result_for_unknown_team_names( data_import_session, season,
                                                   parse_result, force_missing_team_creation = false )
    is_ok = true
    team_names = []
                                                    # Collect all team names in the parsed file:
    team_names_from_results = parse_result[:result_row].map { |row| row[:fields][:team_name] }.compact
    team_names_from_results += parse_result[:relay_row].map { |row| row[:fields][:team_name] }.compact
    team_names_from_results.uniq!
    team_names_from_results.sort!
    result_names_map = {}                           # Build a normalized map:
    team_names_from_results.each { |name| result_names_map[ normalize(name) ] = name }
    update_logs(
      "\r\n** Team names collected from RESULTS: **\r\n" <<
      team_names_from_results.join("\r\n") << "\r\n==== Tot.: #{ team_names_from_results.size } ===="
    )

    ranking_names = parse_result[:ranking_row].map { |row| row[:fields][:team_name] }.compact.sort
    if ranking_names.size == 0                      # If we don't have a Ranking, there's no problem:
      team_names = team_names_from_results
    else                                            # Issues come from the hand-compiled rankings: ("uncle pork")
      ranking_names_map = {}                        # Build a normalized map:
      ranking_names.each { |name| ranking_names_map[ normalize(name) ] = name }
      update_logs(
        "\r\n** Team names collected from RANKINGS: **\r\n" <<
        ranking_names.join("\r\n") << "\r\n==== Tot.: #{ ranking_names.size } ===="
      )
      # This matcher will work with normalized team names, that in turn will have to be
      # compared to other normalized strings to get a normalized result (which will be
      # the key to the name translation map):
      result_matcher = FuzzyStringMatcher.new( result_names_map.keys.sort, :to_s )

      # Find a possible corrispondence between two normalized "keys" by building an
      # Alias Map, from the ranking list into the result names list:
      alias_map = {}
      unique_names_map = {}
      update_logs( "\r\n** Alias map for Ranking (RANKING name <== RESULT name): **" )
      ranking_names_map.each do |ranking_key, team_name|
        aliased_key = get_matching_normalized_key_for( team_name, result_matcher )
        alias_map[ ranking_key ] = aliased_key
        unique_names_map[ ranking_key ] = (aliased_key != ranking_key) ? result_names_map[ aliased_key ] : team_name
        update_logs(
          "(#{ranking_key}) = '#{team_name}'   <==|   (#{aliased_key})" <<
          " = '#{  unique_names_map[ ranking_key ] }' #{aliased_key != ranking_key ? '' :  '<-- Not found in results or equal'}"
        )
      end

      # List the remaining Result team names not found in the "Alias map". These,
      # allegedly, are all the team names for which we haven't been able to find
      # a corresponding Ranking team name (key):
      result_diff_map = result_names_map.reject{ |key, val| alias_map.has_value?(key) }
      if result_diff_map.size > 0
        update_logs(
          "\r\n** Result team names NOT found in Ranking: **\r\n" <<
          result_diff_map.values.join("\r\n") << "\r\n==== Tot.: #{ result_diff_map.size } ====\r\n"
        )
        unique_names_map.merge( result_diff_map )
      end

      unless result_names_map.keys.all?{ |key| unique_names_map.has_key?( key ) }
        update_logs( "\r\nERROR! Some of the team names from the results are not contained into the unique name map!" )
        is_ok = false
      end

      # Substitute original values:
      parse_result[:result_row].each do |row|
        if row[:fields][:team_name]
          result_team_key = normalize( row[:fields][:team_name] )
          # (We won't change team names that do not have an alias)
          if alias_map.has_value?( result_team_key )
            alias_ranking_key = alias_map.key( result_team_key )
            row[:fields][:team_name] = unique_names_map[ alias_ranking_key ]
          end
        end
      end
      parse_result[:relay_row].each do |row|
        if row[:fields][:team_name]
          result_team_key = normalize( row[:fields][:team_name] )
          # (We won't change team names that do not have an alias)
          if alias_map.has_value?( result_team_key )
            alias_ranking_key = alias_map.key( result_team_key )
            row[:fields][:team_name] = unique_names_map[ alias_ranking_key ]
          end
        end
      end
    end


    team_names = unique_names_map.values.sort
    update_logs(
      "\r\n** Final collected UNIQUE names: **\r\n\r\n" <<
      team_names.join("\r\n") << "\r\n==== Tot.: #{ team_names.size } ====\r\n"
    )

##############################
    # # Team names stored in Ranking may be a longer copy of the short version collected from
    # # the results before. So we process them apart, and we substitute the shorter names
    # # with the longer ones.
    # ranking_names_map = {}
    # parse_result[:ranking_row].each do |ranking_row|
      # team_name = ranking_row[:fields][:team_name]
      # ranking_names_map[ normalize( team_name ) ] = team_name if team_name
    # end
    # # This matcher will work with normalized team names, that in turn will have to be
    # # compared to other normalized strings to get a normalized result (which will be
    # # the key to the name translation map):
    # matcher = FuzzyStringMatcher.new( ranking_names_map.keys.sort, :to_s ) if ranking_names_map.size > 0
#
    # team_names_map = {}                             # This will store the final list of team names
    # alias_key_map  = {}                             # This will store the aliases between keys
    # team_names_from_results.each do |short_name|
      # aliased_team_key  = get_unique_and_possibly_longer_name_key_for( short_name, matcher )
      # original_team_key = normalize( short_name )
      # # In the alias map, the keys are from the "original" (result) Team name maps,
      # # while the values correspond to the aliased name key:
      # alias_key_map[ original_team_key ] = aliased_team_key
#
# #      if ranking_names_map.keys.include?( )
#
      # team_names_map[ team_key ] = short_team_name
    # end

    # parse_result[:result_row].each do |result_row|
      # result_row[:fields][:team_name] = get_unique_and_possibly_longer_name_for(
        # result_row[:fields][:team_name],
        # team_names,
        # matcher
      # )
    # end
    # parse_result[:relay_row].each do |relay_row|
      # relay_row[:fields][:team_name] = get_unique_and_possibly_longer_name_for(
        # relay_row[:fields][:team_name],
        # team_names,
        # matcher
      # )
    # end

##############################
    # ranking_diff_list = ranking_names.reject{ |e| team_names.include?(e) }
    # if ranking_diff_list.size > 0
      # update_logs(
        # "\r\n** Ranking names NOT found in results: **\r\n" <<
        # ranking_diff_list.join("\r\n") << "\r\n==== Tot.: #{ ranking_diff_list.size } ====\r\n"
      # )
      # team_names += ranking_diff_list
    # end
    # team_names.sort!
#
    # update_logs(
      # "\r\n** Pre-scan Team names, resulting collected names: **\r\n\r\n" <<
      # team_names.join("\r\n") << "\r\n==== Tot.: #{ team_names.size } ====\r\n"
    # )

##############################

    # Signal an error in case the initial list of names is shorter at the end of
    # the "longer name" substitution phase:
    if team_names_from_results.size > team_names.size
      update_logs(
        "\r\nERROR! The Fuzzy search may have merged two different Team names and this should NOT occur!\r\n" <<
        "This means that the bias value is too low and permissive (currently: #{BIAS_FOR_PRESCAN_FUZZY_SEARCH}).\r\n" <<
        "==> Do NOT continue with data-import and try to change the bias value! <=="
      )
      is_ok = false
    end

    team_names.each_with_index do |team_name, idx|
      team_builder = DataImportTeamBuilder.build_from_parameters(
        data_import_session,
        team_name,
        season,
        force_missing_team_creation
      )
      team = team_builder.result_row
      unless team
        data_import_session.phase_1_log << "\r\nPrescan Team names: '#{ team_name }' (#{ idx+1 }/#{ team_names.size }) uncertain. 'Team name Analysis' needed.\r\n"
        is_ok = false
      end
                                                    # Update progress on current session:
      DataImportSession.where( id: data_import_session.id ).update_all(
        phase_3_log: "1-TEAM-CHECK:#{ idx+1 }/#{ team_names.size }"
      )
    end
    is_ok
  end
  #-- -------------------------------------------------------------------------
  #++


  # "Digest" process for the :category_headers array extracted by the Parser
  #
  # == Returns: false on error
  #
  def process_category_headers( full_pathname, data_import_session, season, season_starting_year,
                                meeting, meeting_session, category_headers, category_headers_ids,
                                category_details, scheduled_date, force_missing_team_creation = false )
    is_ok = true
                                                    # **** HEADER LOOP **** For each header row:...
    category_headers_ids.each_with_index do |category_id, header_index|
                                                    # For each category_details key, add import entities rows:
# DEBUG
      data_import_session.phase_1_log << "\r\nCATEGORY HEADER: Processing category.id:'#{ category_id }', key #{ header_index+1 }/#{ category_headers_ids.size }..."
                                                    # Extract header row with its details for current category:
      header_row  = category_headers.find({}) { |e| e[:id] == category_id }
      detail_rows = category_details.find_all { |e| e[:id] == category_id }
# DEBUG
      data_import_session.phase_1_log << "                 Parsed CATEGORY header_row[:fields]=#{ header_row[:fields].inspect }...\r\n"

                                                    # -- MEETING PROGRAM (digest part) --
      gender_type   = GenderType.parse_gender_type_from_import_text( header_row[:fields][:gender] )
      raise "Unrecognized GenderType in category headers! (token='#{ header_row[:fields][:gender] }')" unless gender_type
      category_type = CategoryType.parse_category_type_from_import_text( season, header_row[:fields][:category_group] )
      raise "Unrecognized CategoryType in category headers! (season.id=#{ season.id }, token='#{ header_row[:fields][:category_group] }')" unless category_type
      stroke_type   = StrokeType.parse_stroke_type_from_import_text( header_row[:fields][:style] )
      raise "Unrecognized StrokeType in category headers! (token='#{ header_row[:fields][:style] }')" unless stroke_type
      length_in_meters = header_row[:fields][:distance].to_i
# DEBUG
      data_import_session.phase_1_log << "CATEGORY HEADER: Current header_row: #{ header_row.inspect }\r\nResulting category_type_id=#{ category_type.id }, gender_type_id=#{ gender_type.id }, stroke_type_id=#{ stroke_type.id }, data_import_session ID=#{ data_import_session.id }"

      meeting_program_builder = DataImportMeetingProgramBuilder.build_from_parameters(
        data_import_session,
        season, meeting_session,
        header_row, header_index,
        gender_type, category_type, stroke_type,
        length_in_meters,
        scheduled_date,
        detail_rows.size
      )
      meeting_program = meeting_program_builder.result_row
      is_ok = ! meeting_program.nil?
      return unless is_ok                           # **** DETAIL LOOP **** For each result row:...
                                                    # Store each detail into the dedicated temp DB table:
      detail_rows.each_with_index do |detail_row, detail_row_idx|
                                                    # -- MEETING INDIVIDUAL RESULT (digest part) --
        mir_builder = DataImportMeetingIndividualResultBuilder.build_from_parameters(
          data_import_session,
          season,
          meeting_program,
          detail_row, detail_row_idx, detail_rows.size,
          gender_type, category_type,
          force_missing_team_creation
        )
        is_ok = ! mir_builder.result_row.nil?
        return unless is_ok
      end                                           # **** (END of DETAIL) ****
                                                    # Update current header count into "progress counter column"
      DataImportSession.where( id: data_import_session.id ).update_all(
        phase_3_log: "1.2-CAT:#{header_index+1}/#{category_headers_ids.size}"
      )
    end                                             # **** (END of HEADER) ****
    is_ok
  end
  #-- -------------------------------------------------------------------------
  #++


  # "Digest" process for the :relay_headers array extracted by the Parser
  #
  # == Returns: false on error
  #
  def process_relay_headers( full_pathname, data_import_session, season, season_starting_year,
                             meeting, meeting_session, relay_headers, relay_headers_ids,
                             relay_details, scheduled_date, force_missing_team_creation = false )
    is_ok = true
                                                    # **** HEADER LOOP **** For each header row:...
    relay_headers_ids.each_with_index do |relay_id, header_index|
# DEBUG
      data_import_session.phase_1_log << "\r\nRELAY HEADER: Processing relay_id:'#{relay_id}', key #{header_index+1}/#{relay_headers_ids.size}..."
                                                    # Extract header row with its details for current relay:
      header_row  = relay_headers.find({}) { |e| e[:id] == relay_id }
      detail_rows = relay_details.find_all { |e| e[:id] == relay_id }
# DEBUG
      data_import_session.phase_1_log << "              Parsed RELAY header_row[:fields]=#{header_row[:fields].inspect}...\r\n"

                                                    # -- MEETING PROGRAM (digest part) -- (add also a Program entry for each found Relay)
      gender_type   = GenderType.parse_gender_type_from_import_text( header_row[:fields][:gender] )
      raise "Unrecognized GenderType in relay headers! (token='#{ header_row[:fields][:gender] }')" unless gender_type
      category_type = CategoryType.parse_category_type_from_import_text( season, header_row[:fields][:category_group] )
      raise "Unrecognized CategoryType in relay headers! (season.id=#{ season.id }, token='#{ header_row[:fields][:category_group] }')" unless category_type
      stroke_type   = StrokeType.parse_stroke_type_from_import_text( header_row[:fields][:style] )
      raise "Unrecognized StrokeType in relay headers! (token='#{ header_row[:fields][:style] }')" unless stroke_type
      phases           = header_row[:fields][:distance][0].to_i     # "NxMMM " |=> "N".to_i
      phase_length     = header_row[:fields][:distance][2..4].to_i  # "NxMM "  |=> "MM ".to_i
      length_in_meters = phases * phase_length
# DEBUG
      data_import_session.phase_1_log << "RELAY HEADER: Current header_row: #{ header_row.inspect }\r\n" <<
        "Resulting category_type_id=#{ category_type.id }, gender_type_id=#{ gender_type.id }, stroke_type_id=#{ stroke_type.id }"

      meeting_program_builder = DataImportMeetingProgramBuilder.build_from_parameters(
        data_import_session,
        season,
        meeting_session,
        header_row, header_index,
        gender_type, category_type, stroke_type,
        length_in_meters,
        scheduled_date,
        detail_rows.size
      )
      meeting_program = meeting_program_builder.result_row
      is_ok = ! meeting_program.nil?
      return unless is_ok
                                                    # **** DETAIL LOOP **** For each result row:...
                                                    # Store each detail into the dedicated temp DB table:
      detail_rows.each_with_index do |detail_row, detail_row_idx|
                                                    # -- MEETING RELAY RESULT (digest part) --
        mrr_builder = DataImportMeetingRelayResultBuilder.build_from_parameters(
          data_import_session,
          season,
          meeting_program,
          detail_row, detail_row_idx, detail_rows.size,
          force_missing_team_creation
        )
        is_ok = ! mrr_builder.result_row.nil?
        return unless is_ok
      end                                           # **** (END of DETAIL) ****
                                                    # Update current header count into "progress counter column"
      DataImportSession.where( id: data_import_session.id ).update_all(
        phase_3_log: "1.2-REL:#{ header_index+1 }/#{ relay_headers_ids.size }"
      )
    end                                             # **** (END of HEADER) ****
    is_ok
  end
  #-- -------------------------------------------------------------------------
  #++


  # "Digest" process for the :team_ranking array extracted by the Parser
  #
  # == Returns: false on error
  #
  def process_team_ranking( full_pathname, data_import_session, season, meeting,
                            ranking_headers, ranking_headers_ids, ranking_details,
                            force_missing_team_creation = false )
    is_ok = true
                                                    # **** HEADER LOOP **** For each header row (even if there's only one):...
    ranking_headers_ids.each_with_index do |ranking_id, header_index|
# DEBUG
      data_import_session.phase_1_log << "\r\nTEAM RANKING HEADER: Processing ranking_id:'#{ ranking_id }', key #{ header_index+1 }/#{ ranking_headers_ids.size }..."
                                                    # Extract header row with its details for current relay:
      header_row  = ranking_headers.find({}) { |e| e[:id] == ranking_id }
      detail_rows = ranking_details.find_all { |e| e[:id] == ranking_id }
# DEBUG
      data_import_session.phase_1_log << "Parsed TEAM RANKING header_row[:fields]=#{ header_row[:fields].inspect }...\r\n"
                                                    # **** DETAIL LOOP **** For each result row:...
      detail_rows.each_with_index do |detail_row, detail_row_idx|
                                                    # -- TEAM RANKING (digest part) --
        mts_builder = DataImportMeetingTeamScoreBuilder.build_from_parameters(
          data_import_session,
          season,
          meeting,
          detail_row, detail_row_idx, detail_rows.size,
          force_missing_team_creation
        )
                                                    # This will store the is_ok status up 'till the end (1 failure is enough)
        is_ok = is_ok && (! mts_builder.result_row.nil?)
      end                                           # **** (END of DETAIL) ****
                                                    # Update current header count into "progress counter column"
      DataImportSession.where( id: data_import_session.id ).update_all(
        phase_3_log: "1.2-RANK:#{ header_index+1 }/#{ ranking_headers_ids.size }"
      )
    end                                             # **** (END of HEADER) ****
    is_ok
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Returns a "normalized" version of the +name+.
  def normalize( name )
    name.gsub(/\W/, '')
  end


  # Searches for a possible longer name key.
  # Using a pre-defined #FuzzyStringMatcher #matcher instance (which it can be +nil+
  # to avoid any additional processing when the ranking rows are missing), a possible
  # longer/"better" (in the sense of more complete) occurrence of the specified
  # #short_name is searched by the matcher.
  #
  # The resulting string key should be used to retrieve the actual team name from
  # the translation map.
  #
  # === Returns
  # The resulting team name "key" or the normalized team_name itself, if no other
  # alias key has been found.
  #
  def get_matching_normalized_key_for( team_name, matcher )
    return nil unless team_name.instance_of?( String )
    team_key = normalize( team_name )
    if team_key && matcher
      matching_key = matcher.find( team_key, BIAS_FOR_PRESCAN_FUZZY_SEARCH )
      if matching_key
        team_key = matching_key
      else
        update_logs( "WARNING: Unable to find a match for '#{team_name}'!" )
      end
    end
    team_key
  end
end
#-- ---------------------------------------------------------------------------
#++
