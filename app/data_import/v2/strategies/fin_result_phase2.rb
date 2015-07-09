# encoding: utf-8

require 'fileutils'                                 # Used to process filenames
require 'common/format'
require_relative '../../../data_import/v2/dao/header_fields_dao'
require_relative '../../../data_import/v2/services/team_name_analyzer'
require_relative '../../../data_import/v2/services/swimmer_name_analyzer'

require_relative '../../../data_import/v2/strategies/city_comparator'
require_relative '../../../data_import/v2/strategies/fin_result_parser'

require_relative '../../../data_import/v2/services/data_import_entity_builder'
require_relative '../../../data_import/v2/services/data_import_meeting_builder'
require_relative '../../../data_import/v2/services/data_import_meeting_event_builder'
require_relative '../../../data_import/v2/services/data_import_meeting_individual_result_builder'
require_relative '../../../data_import/v2/services/data_import_meeting_entry_builder'
require_relative '../../../data_import/v2/services/data_import_meeting_program_builder'
require_relative '../../../data_import/v2/services/data_import_meeting_relay_result_builder'
require_relative '../../../data_import/v2/services/data_import_meeting_session_builder'
require_relative '../../../data_import/v2/services/data_import_meeting_team_score_builder'
require_relative '../../../data_import/v2/services/data_import_season_builder'
require_relative '../../../data_import/v2/services/data_import_swimmer_builder'
require_relative '../../../data_import/v2/services/data_import_team_builder'
require_relative '../../../data_import/v2/services/data_import_time_standard_builder'


=begin

= FinResultPhase2

  - Goggles framework vers.:  4.00.767
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


  # Scans parse_result hash structure to collect all team names found.
  #
  # For each team name found, a DataImportTeamBuilder instance is executed.
  # If the Team is not found or some problem arises, that same class will delegate to
  # a strategy class to perform the team name analysis (which will then require human
  #`supervision before commit).
  #
  # == Returns: when +false+, the additional "Team name analysis" phase must be
  #    executed; +true+ if the "standard" data-import phase can go on.
  #
  def prescan_parse_result_for_unknown_team_names( data_import_session, season,
                                                   parse_result, force_team_or_swimmer_creation = false )
    is_ok = true
    team_names = []
    # The parse result will always contain an Array of Hash for each defined key field.
    # In this case, whether or not the :relay_row section was found, the result
    # will always be defined (as an Array of Hash), although empty in the worst case
    # scenario.
                                                    # Collect all team names in the parsed file:
    team_names_from_results = parse_result[:result_row].map { |row| row[:fields][:team_name] }.compact
    team_names_from_results += parse_result[:relay_row].map { |row| row[:fields][:team_name] }.compact
    team_names_from_results.uniq!
    team_names_from_results.sort!
    update_logs(
      "\r\n** Team names collected from RESULTS: **\r\n" <<
      team_names_from_results.join("\r\n") << "\r\n==== Tot.: #{ team_names_from_results.size } ===="
    )

    ranking_names = parse_result[:ranking_row].map { |row| row[:fields][:team_name] }.compact.sort
    if ranking_names.size == 0                      # If we don't have a Ranking, there's no problem:
      team_names = team_names_from_results
    else                                            # To avoid issues from the hand-compiled rankings: (says "uncle pork")
      team_names = extract_unique_team_names( ranking_names, team_names_from_results, parse_result )
    end

    update_logs(
      "\r\n** Final collected UNIQUE names: **\r\n\r\n" <<
      team_names.join("\r\n") << "\r\n==== Tot.: #{ team_names.size } ====\r\n"
    )

    # Signal an error in case the initial list of names is shorter at the end of
    # the "longer name" substitution phase:
    if team_names_from_results.size > team_names.size
      update_logs(
        "\r\n*** WARNING! *** The Fuzzy search may have merged two different Team names!\r\n" <<
        "This may be a signal that the bias value is too low and permissive (currently: #{BIAS_FOR_PRESCAN_FUZZY_SEARCH}).\r\n" <<
        "==> CHECK THE ABOVE TEAM NAMES in Alias Map for lines with NO comment, to see if the aliased team names are referring to the same one! <==\r\n" <<
        "==> PROCEED WITH THE COMMIT OF PHASE 2 ONLY AFTER THIS MANUAL CHECK! <==\r\n"
      )
      flash[:error] = "*** WARNING *** Possible excessive Team name merge done by pre-analysis!\r\n" <<
                      "CHECK TEAM NAMES in ALIAS MAP inside Log file from phase 1.1 and look for lines WITHOUT comments:\r\n" <<
                      "these are the Team names aliased automatically that need to be checked; if they refer to the same Team, the COMMIT for phase 2 is safe.\r\n" <<
                      "Otherwise, set a higher bias inside FinResultPhase2 module."
    end

    team_names.each_with_index do |team_name, idx|
      team_builder = DataImportTeamBuilder.build_from_parameters(
        data_import_session,
        team_name,
        season,
        force_team_or_swimmer_creation
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


  # Scans parse_result hash structure to collect all swimmer names found.
  #
  # For each swimmer name found, a DataImportSwimmerBuilder instance is executed.
  # If the Swimmer is not found or some problem arises, that same class will delegate to
  # a strategy class to perform the swimmer name analysis (which will then require human
  #`supervision before commit).
  #
  # == Returns: when +false+, the additional "Swimmer name analysis" phase must be
  #    executed; +true+ if the "standard" data-import phase can go on.
  #
  def prescan_parse_result_for_unknown_swimmer_names( data_import_session, season, parse_result,
                                                      force_team_or_swimmer_creation = false )
    is_ok = true
                                                    # Collect all swimmer names in the parsed file:
    swimmer_names_from_results = parse_result[:result_row].map do |result_row|
      header_row    = parse_result[:category_header].find({}) { |category_row| category_row[:id] == result_row[:id] }
      gender_type   = GenderType.parse_gender_type_from_import_text( header_row[:fields][:gender] )
      category_type = CategoryType.parse_category_type_from_import_text( season, header_row[:fields][:category_group] )
      {
        name:     result_row[:fields][:swimmer_name],
        year:     result_row[:fields][:swimmer_year],
        category: category_type,
        gender:   gender_type
      }
    end.compact

    swimmer_names_from_results.uniq!
    swimmer_names_from_results.sort! { |a, b| a[:name] <=> b[:name] }

    update_logs(
      "\r\n** Swimmer names collected from RESULTS: **\r\n" <<
      swimmer_names_from_results.join("\r\n") << "\r\n==== Tot.: #{ swimmer_names_from_results.size } ===="
    )

    swimmer_names_from_results.each_with_index do |swimmer_hash, idx|
      swimmer_builder = DataImportSwimmerBuilder.build_from_parameters(
        data_import_session,
        swimmer_hash[:name],
        swimmer_hash[:year],
        swimmer_hash[:gender],
        swimmer_hash[:category],
        force_team_or_swimmer_creation
      )
      swimmer = swimmer_builder.result_row
      unless swimmer
        data_import_session.phase_1_log << "\r\nPrescan Swimmer names: '#{ swimmer_hash[:name] }' (#{swimmer_hash[:year]}, gender: #{swimmer_hash[:gender]}, #{ idx+1 }/#{ swimmer_names_from_results.size }) uncertain. 'Swimmer name Analysis' needed.\r\n"
        is_ok = false
      end
                                                    # Update progress on current session:
      DataImportSession.where( id: data_import_session.id ).update_all(
        phase_3_log: "1-SWIMMER-CHECK:#{ idx+1 }/#{ swimmer_names_from_results.size }"
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
                                meeting, meeting_session, parse_result, scheduled_date,
                                force_team_or_swimmer_creation = false )
    is_ok = true
    category_headers = parse_result[:category_header]
    category_details = parse_result[:result_row]
    category_headers_ids = category_headers.collect{|e| e[:id] }.compact.uniq.sort
    previous_begin_time = nil
    previous_duration_in_secs = 120
                                                    # **** HEADER LOOP **** For each header row:...
    category_headers_ids.each_with_index do |category_id, header_index|
                                                    # For each category_details key, add import entities rows:
# DEBUG
#      data_import_session.phase_1_log << "\r\nCATEGORY HEADER: Processing category.id:'#{ category_id }', key #{ header_index+1 }/#{ category_headers_ids.size }..."
                                                    # Extract header row with its details for current category:
      header_row  = category_headers.find({}) { |e| e[:id] == category_id }
      detail_rows = category_details.find_all { |e| e[:id] == category_id }
# DEBUG
#      data_import_session.phase_1_log << "                 Parsed CATEGORY header_row[:fields]=#{ header_row[:fields].inspect }...\r\n"

                                                    # -- MEETING PROGRAM (digest part) --
      gender_type   = GenderType.parse_gender_type_from_import_text( header_row[:fields][:gender] )
      raise "Unrecognized GenderType in category headers! (token='#{ header_row[:fields][:gender] }')" unless gender_type
      category_type = CategoryType.parse_category_type_from_import_text( season, header_row[:fields][:category_group] )
      raise "Unrecognized CategoryType in category headers! (season.id=#{ season.id }, token='#{ header_row[:fields][:category_group] }')" unless category_type
      stroke_type   = StrokeType.parse_stroke_type_from_import_text( header_row[:fields][:style] )
      raise "Unrecognized StrokeType in category headers! (token='#{ header_row[:fields][:style] }')" unless stroke_type
      length_in_meters = header_row[:fields][:distance].to_i
# DEBUG
#      data_import_session.phase_1_log << "CATEGORY HEADER: Current header_row: #{ header_row.inspect }\r\nResulting category_type_id=#{ category_type.id }, gender_type_id=#{ gender_type.id }, stroke_type_id=#{ stroke_type.id }, data_import_session ID=#{ data_import_session.id }"

      meeting_program_builder = DataImportMeetingProgramBuilder.build_from_parameters(
        data_import_session,
        season, meeting_session,
        header_row, header_index,
        gender_type, category_type, stroke_type,
        length_in_meters,
        scheduled_date,
        detail_rows.size,
        previous_begin_time,
        previous_duration_in_secs
      )
      meeting_program = meeting_program_builder.result_row
      is_ok = ! meeting_program.nil?
      if meeting_program                            # Update prev. begin & duration times:
        begin_time = meeting_program.begin_time ? meeting_program.begin_time :
                                                  scheduled_date.to_time + (8 * 3600)
        previous_duration_in_secs = previous_begin_time ? (begin_time - previous_begin_time).abs : 120
# DEBUG
#        puts "\r\nBEGIN TIME DELTA for M.PRGs(MIR): order:#{meeting_program.event_order} " <<
#             "- meeting_program.begin_time: #{meeting_program.begin_time}\r\n" <<
#             "- scheduled_date.to_time: #{scheduled_date.to_time}\r\n" <<
#             "- previous_begin_time: #{previous_begin_time} |=> begin_time: #{begin_time}\r\n" <<
#             "- DELTA in secs: #{ begin_time.to_f - previous_begin_time.to_f }" <<
#             "=> resulting duration_in_secs: #{ previous_duration_in_secs }"
        previous_begin_time = begin_time
      end
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
          force_team_or_swimmer_creation
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
                             meeting, meeting_session, parse_result, scheduled_date,
                             force_team_or_swimmer_creation = false )
    is_ok = true
    relay_headers = parse_result[:relay_header]
    relay_details = parse_result[:relay_row]
    relay_headers_ids = relay_headers.collect{|e| e[:id] }.compact.uniq.sort
    previous_begin_time = nil
    previous_duration_in_secs = 120
                                                    # Adjust begin time esteem, continuing from individual result programs:
    if data_import_session.data_import_meeting_programs.last
      last_prg = data_import_session.data_import_meeting_programs.last
      previous_begin_time = last_prg.begin_time
      previous_duration_in_secs = last_prg.minutes.to_i * 60 + last_prg.seconds.to_i + 30
    end
                                                    # **** HEADER LOOP **** For each header row:...
    relay_headers_ids.each_with_index do |relay_id, header_index|
# DEBUG
#      data_import_session.phase_1_log << "\r\nRELAY HEADER: Processing relay_id:'#{relay_id}', key #{header_index+1}/#{relay_headers_ids.size}..."
                                                    # Extract header row with its details for current relay:
      header_row  = relay_headers.find({}) { |e| e[:id] == relay_id }
      detail_rows = relay_details.find_all { |e| e[:id] == relay_id }
# DEBUG
#      data_import_session.phase_1_log << "              Parsed RELAY header_row[:fields]=#{header_row[:fields].inspect}...\r\n"

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
#      data_import_session.phase_1_log << "RELAY HEADER: Current header_row: #{ header_row.inspect }\r\n" <<
#        "Resulting category_type_id=#{ category_type.id }, gender_type_id=#{ gender_type.id }, stroke_type_id=#{ stroke_type.id }"

      meeting_program_builder = DataImportMeetingProgramBuilder.build_from_parameters(
        data_import_session,
        season,
        meeting_session,
        header_row, header_index,
        gender_type, category_type, stroke_type,
        length_in_meters,
        scheduled_date,
        detail_rows.size,
        previous_begin_time,
        previous_duration_in_secs
      )
      meeting_program = meeting_program_builder.result_row
      is_ok = ! meeting_program.nil?
      return unless is_ok

      if meeting_program                            # Update prev. begin & duration times:
        begin_time = meeting_program.begin_time ? meeting_program.begin_time :
                                                  scheduled_date.to_time + (8 * 3600)
        previous_duration_in_secs = previous_begin_time ? (begin_time - previous_begin_time).abs : 120
# DEBUG
#        puts "\r\nBEGIN TIME DELTA for M.PRGs(Rel.): order:#{meeting_program.event_order} " <<
#             "- meeting_program.begin_time: #{meeting_program.begin_time}\r\n" <<
#             "- scheduled_date.to_time: #{scheduled_date.to_time}\r\n" <<
#             "- previous_begin_time: #{previous_begin_time} |=> begin_time: #{begin_time}" <<
#             "- DELTA in secs: #{ begin_time.to_f - previous_begin_time.to_f }" <<
#             "=> resulting duration_in_secs: #{ previous_duration_in_secs }"
        previous_begin_time = begin_time
      end
                                                    # **** DETAIL LOOP **** For each result row:...
                                                    # Store each detail into the dedicated temp DB table:
      detail_rows.each_with_index do |detail_row, detail_row_idx|
                                                    # -- MEETING RELAY RESULT (digest part) --
        mrr_builder = DataImportMeetingRelayResultBuilder.build_from_parameters(
          data_import_session,
          season,
          meeting_program,
          detail_row, detail_row_idx, detail_rows.size,
          force_team_or_swimmer_creation
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
                            ranking_details, force_team_or_swimmer_creation = false )
    is_ok = true
                                                    # **** DETAIL LOOP **** For each result row:...
    ranking_details.each_with_index do |detail_row, detail_row_idx|
# DEBUG
#      data_import_session.phase_1_log << "\r\nTEAM RANKINGS: Processing ranking #{ detail_row_idx+1 }/#{ ranking_details.size }..."
                                                    # -- TEAM RANKING (digest part) --
      mts_builder = DataImportMeetingTeamScoreBuilder.build_from_parameters(
        data_import_session,
        season,
        meeting,
        detail_row, detail_row_idx, ranking_details.size,
        force_team_or_swimmer_creation
      )
                                                    # This will store the is_ok status up 'till the end (1 failure is enough)
      is_ok = is_ok && (! mts_builder.result_row.nil?)
                                                    # Update current header count into "progress counter column"
      DataImportSession.where( id: data_import_session.id ).update_all(
        phase_3_log: "1.2-RANK:#{ detail_row_idx+1 }/#{ ranking_details.size }"
      )
    end                                             # **** (END loop) ****
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
  #-- -------------------------------------------------------------------------
  #++


  # Assuming +row+ is a result row, either from the parse_result[:result_row]
  # or from the parse_result[:relay_row] data structures, this updates
  # *in place* their corresponding :team_name value with the one provided
  # by the +alias_map+ & +unique_names_map+ translation Hash structures.
  #
  def update_original_team_name( row, alias_map, unique_names_map )
    if row[:fields][:team_name]
      result_team_key = normalize( row[:fields][:team_name] )
      if alias_map.has_value?( result_team_key )
        alias_ranking_key = alias_map.key( result_team_key )
        # (We won't change team names that do not have a different alias)
        row[:fields][:team_name] = unique_names_map[ alias_ranking_key ] if alias_ranking_key != result_team_key
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Builds up and returns a unique array of team names, given:
  #
  # - ranking_names: the already compiled array of team names found in the ranking
  #   section of the parse result structure;
  #
  # - team_names_from_results: similarly to the above, a pre-filled array of team names
  #   extracted only from the results of the parse structure (either individual or relays);
  #
  # - parse_result: the full parse resulting structure from phase 1.0; this will be used
  #   to update the actual team name strings contained therein with a unique team name
  #   for each possible team name variation.
  #   (this will be done only for team names that actually have more than one spelling
  #    variation in their name among the same file)
  #
  def extract_unique_team_names( ranking_names, team_names_from_results, parse_result )
    result_names_map = {}                           # Build a normalized map:
    team_names_from_results.each { |name| result_names_map[ normalize(name) ] = name }

    ranking_names_map = {}                          # Build a normalized map:
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
    update_logs( "\r\n** Alias map for Ranking (UNIQ [key]= value | ALIAS key): **" )
    ranking_names_map.each do |ranking_key, team_name|
      aliased_key = get_matching_normalized_key_for( team_name, result_matcher )
      alias_map[ ranking_key ] = aliased_key
      # We will always use the longer name from the rankings as resulting editable team name,
      # even more when we don't have a corresponding match from the result (and the aliased
      # key is equal to the starting ranking key):
      unique_names_map[ ranking_key ] = team_name
      # When the aliased key is different from the starting ranking key, it means that
      # we have a match and we will use the ranking team name overwrite the aliased (destination)
      # name with it (which should be allegedly longer and perhaps more 'complete').
      update_logs(
        "[%-30s]= '%-40s'  |  (%-25s) #{aliased_key != ranking_key ? '' :  '-- Not found in results or equal'}" %
        [ ranking_key, unique_names_map[ ranking_key ], aliased_key ]
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
      unique_names_map.merge!( result_diff_map )
      result_diff_map.each do |result_key, team_name|
        # Add the identity members to the alias map, so that we may recognize which names
        # don't get to be changed:
        alias_map[ result_key ] = result_key
        update_logs(
          "[%-30s]= '%-40s'  |  -- Added to alias as identity" % [ result_key, unique_names_map[ result_key ] ]
        )
      end
      update_logs( "\r\nResulting sizes: ALIAS Map=#{alias_map.size}, UNIQUE Map=#{unique_names_map.size}" )
    end

    missing_name_keys = result_names_map.keys.reject{ |key| alias_map.values.include?( key ) }
    if missing_name_keys.size > 0                 # This should never occur
      update_logs(
        "\r\n*** ERROR!! *** Some of the team normalized names from the results are MISSING from the alias values list for the translation! THIS SHOULD NEVER OCCUR!\r\n" <<
        "Missing name keys: #{missing_name_keys.inspect}"
      )
      # Block data-import process returning false anyway:
      is_ok = false
    end

    # Substitute original values ,so that we may have a unique team name
    # among all the parsed results:
    parse_result[:result_row].each do |row|
      update_original_team_name( row, alias_map, unique_names_map )
    end
    parse_result[:relay_row].each do |row|
      update_original_team_name( row, alias_map, unique_names_map )
    end
    # Return the array of unique team names, sorted alphabetically:
    unique_names_map.values.sort
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- ---------------------------------------------------------------------------
#++
