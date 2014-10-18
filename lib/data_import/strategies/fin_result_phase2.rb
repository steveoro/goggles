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

  - Goggles framework vers.:  4.00.573
  - author: Steve A.

  Data-Import/Digest Module incapsulating all "record search/add" methods
  to search and/or add a new entity record inside the database, assuming
  the results from the parsing ("phase 1") have already been obtained.

  Refactored from the original DataImportController implementation.

  === Assumes the existance of:
  - +logger+ (console Logger) instance
  - +flash+ (error report) Hash

  === Defines:
  - @current_admin_id ID of the current Admin instance

  - @phase_1_log string (log text) variable
  - @team_analysis_log string (additional log text) variable
  - @sql_executable_log string (additional log text) variable

  - @team_analysis_results an Array of DataImportTeamAnalysisResult
    instances.

  - @stored_data_rows integer (counter) variable
  - @esteemed_meeting_mins integer (total minutes counter) variable

=end
module FinResultPhase2

  # Certainty bias score result for "fuzzy name search".
  FUZZY_SEARCH_BIAS_SCORE = 0.98

  # Allowed minimum "fuzzy name search" bias score result,
  # used as limit for an interative search if no matching
  # candidates are found.
  # If no match is found before reaching this limit, the
  # name is declared as "not found".
  MIN_FUZZY_SEARCH_BIAS_SCORE = 0.8

  # Previous/current phase text log stored as an UTF-8 string
  @phase_1_log = ''

  # Team analysis/recognition log, stored as an UTF-8 string.
  # Any uncertain team name match is always logged as well as all the
  # existing possible "best-matches" for a minimun result bias score.
  @team_analysis_log = ''

  # Total of stored data rows
  @stored_data_rows = 0

  # Esteemed total minutes since the beginning of the current parsed meeting
  @esteemed_meeting_mins = 0

  # Current Admin instace
  @current_admin_id = 0

  # When not nil and not empty, contains the array of hash of
  # results from the "team analysis" phase.
  @team_analysis_results = []
  # ---------------------------------------------------------------------------


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
    parse_result[:result_row].each { |result_row|
      team_names << result_row[:fields][:team_name] if result_row[:fields][:team_name]
    }
    parse_result[:relay_row].each { |relay_row|
      team_names << relay_row[:fields][:team_name] if relay_row[:fields][:team_name]
    }
    parse_result[:ranking_row].each { |ranking_row|
      team_names << ranking_row[:fields][:team_name] if ranking_row[:fields][:team_name]
    }

    team_names.uniq!                                # Clear the duplicates
    team_names.each_with_index { |team_name, idx|
      team_builder = DataImportTeamBuilder.build_from_parameters(
        data_import_session,
        team_name,
        season,
        force_missing_team_creation
      )
      team = team_builder.result_row
      if team
        @phase_1_log << "\r\nPrescan Team names: '#{team_name}' (#{idx+1}/#{team_names.size}) needs the additional 'Team name Analysis' phase.\r\n"
        logger.info( "\r\nPrescan Team names: '#{team_name}' (#{idx+1}/#{team_names.size}) needs the additional 'Team name Analysis' phase." )
        is_ok = false
      end
                                                    # Update progress on current session:
      DataImportSession.where( id: data_import_session.id ).update_all( phase_3_log: "TEAM-CHECK:#{idx+1}/#{team_names.size}" )
    }
    is_ok
  end
  # -----------------------------------------------------------------------------
  # -----------------------------------------------------------------------------


  # "Digest" process for the :category_headers array extracted by the Parser
  #
  # == Returns: false on error
  #
  def process_category_headers( full_pathname, data_import_session, season, season_starting_year,
                                meeting, meeting_session, category_headers, category_headers_ids,
                                category_details, scheduled_date, force_missing_team_creation = false )
    is_ok = true
                                                    # **** HEADER LOOP **** For each header row:...
    category_headers_ids.each_with_index { |category_id, header_index|
                                                    # For each category_details key, add import entities rows:
# DEBUG
      logger.debug( "\r\nCATEGORY HEADER: Processing category.id:'#{category_id}', key #{header_index+1}/#{category_headers_ids.size}..." )
                                                    # Extract header row with its details for current category:
      header_row  = category_headers.find({}){|e| e[:id] == category_id }
      detail_rows = category_details.find_all{|e| e[:id] == category_id }
# DEBUG
      logger.debug( "                 Parsed CATEGORY header_row[:fields]=#{header_row[:fields].inspect}...\r\n" )

                                                    # -- MEETING PROGRAM (digest part) --
      gender_type   = GenderType.parse_gender_type_from_import_text( header_row[:fields][:gender] )
      raise "Unrecognized GenderType in category headers! (token='#{header_row[:fields][:gender] }')" unless gender_type
      category_type = CategoryType.parse_category_type_from_import_text( season, header_row[:fields][:category_group] )
      raise "Unrecognized CategoryType in category headers! (season.id=#{season.id}, token='#{header_row[:fields][:category_group] }')" unless category_type
      stroke_type   = StrokeType.parse_stroke_type_from_import_text( header_row[:fields][:style] )
      raise "Unrecognized StrokeType in category headers! (token='#{header_row[:fields][:style] }')" unless stroke_type
      length_in_meters = header_row[:fields][:distance].to_i
# DEBUG
      logger.debug( "CATEGORY HEADER: Current header_row: #{header_row.inspect}\r\nResulting category_type_id=#{category_type.id}, gender_type_id=#{gender_type.id}, stroke_type_id=#{stroke_type.id}, data_import_session ID=#{data_import_session.id}" )

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
      return unless is_ok
                                                    # **** DETAIL LOOP **** For each result row:...
                                                    # Store each detail into the dedicated temp DB table:
      detail_rows.each_with_index { |detail_row, detail_row_idx|
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
      }                                             # **** (END of DETAIL) ****
                                                    # Update current header count into "progress counter column"
      DataImportSession.where( id: data_import_session.id ).update_all( phase_3_log: "CAT.1:#{header_index+1}/#{category_headers_ids.size}" )
    }                                               # **** (END of HEADER) ****
    is_ok
  end
  # -----------------------------------------------------------------------------


  # "Digest" process for the :relay_headers array extracted by the Parser
  #
  # == Returns: false on error
  #
  def process_relay_headers( full_pathname, data_import_session, season, season_starting_year,
                             meeting, meeting_session, relay_headers, relay_headers_ids,
                             relay_details, scheduled_date, force_missing_team_creation = false )
    is_ok = true
                                                    # **** HEADER LOOP **** For each header row:...
    relay_headers_ids.each_with_index { |relay_id, header_index|
# DEBUG
      logger.debug( "\r\nRELAY HEADER: Processing relay_id:'#{relay_id}', key #{header_index+1}/#{relay_headers_ids.size}..." )
                                                    # Extract header row with its details for current relay:
      header_row  = relay_headers.find({}){|e| e[:id] == relay_id }
      detail_rows = relay_details.find_all{|e| e[:id] == relay_id }
# DEBUG
      logger.debug( "              Parsed RELAY header_row[:fields]=#{header_row[:fields].inspect}...\r\n" )

                                                    # -- MEETING PROGRAM (digest part) -- (add also a Program entry for each found Relay)
      gender_type   = GenderType.parse_gender_type_from_import_text( header_row[:fields][:gender] )
      raise "Unrecognized GenderType in relay headers! (token='#{header_row[:fields][:gender] }')" unless gender_type
      category_type = CategoryType.parse_category_type_from_import_text( season, header_row[:fields][:category_group] )
      raise "Unrecognized CategoryType in relay headers! (season.id=#{season.id}, token='#{header_row[:fields][:category_group] }')" unless category_type
      stroke_type   = StrokeType.parse_stroke_type_from_import_text( header_row[:fields][:style] )
      raise "Unrecognized StrokeType in relay headers! (token='#{header_row[:fields][:style] }')" unless stroke_type
      phases           = header_row[:fields][:distance][0].to_i     # "NxMMM " |=> "N".to_i
      phase_length     = header_row[:fields][:distance][2..4].to_i  # "NxMM " |=> "MM ".to_i
      length_in_meters = phases * phase_length
# DEBUG
      logger.debug( "RELAY HEADER: Current header_row: #{header_row.inspect}\r\nResulting category_type_id=#{category_type.id}, gender_type_id=#{gender_type.id}, stroke_type_id=#{stroke_type.id}" )

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
      detail_rows.each_with_index { |detail_row, detail_row_idx|
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
      }                                             # **** (END of DETAIL) ****
                                                    # Update current header count into "progress counter column"
      DataImportSession.where( id: data_import_session.id ).update_all( phase_3_log: "REL.2:#{header_index+1}/#{relay_headers_ids.size}" )
    }                                               # **** (END of HEADER) ****
    is_ok
  end
  # -----------------------------------------------------------------------------


  # "Digest" process for the :team_ranking array extracted by the Parser
  #
  # == Returns: false on error
  #
  def process_team_ranking( full_pathname, data_import_session, season, meeting,
                            ranking_headers, ranking_headers_ids, ranking_details,
                            force_missing_team_creation = false )
    is_ok = true
                                                    # **** HEADER LOOP **** For each header row (even if there's only one):...
    ranking_headers_ids.each_with_index { |ranking_id, header_index|
# DEBUG
      logger.debug( "\r\nTEAM RANKING HEADER: Processing ranking_id:'#{ranking_id}', key #{header_index+1}/#{ranking_headers_ids.size}..." )
                                                    # Extract header row with its details for current relay:
      header_row  = ranking_headers.find({}){|e| e[:id] == ranking_id }
      detail_rows = ranking_details.find_all{|e| e[:id] == ranking_id }
# DEBUG
      logger.debug( "Parsed TEAM RANKING header_row[:fields]=#{header_row[:fields].inspect}...\r\n" )
                                                    # **** DETAIL LOOP **** For each result row:...
      detail_rows.each_with_index { |detail_row, detail_row_idx|
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
      }                                             # **** (END of DETAIL) ****
                                                    # Update current header count into "progress counter column"
      DataImportSession.where( id: data_import_session.id ).update_all( phase_3_log: "RNK.3:#{header_index+1}/#{ranking_headers_ids.size}" )
    }                                               # **** (END of HEADER) ****
    is_ok
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- ---------------------------------------------------------------------------
#++
