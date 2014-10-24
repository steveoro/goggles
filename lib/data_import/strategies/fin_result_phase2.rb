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

  - Goggles framework vers.:  4.00.581
  - author: Steve A.

  Data-Import/Digest Module incapsulating all "record search/add" methods
  to search and/or add a new entity record inside the database, assuming
  the results from the parsing ("phase 1") have already been obtained.

  Refactored from the original DataImportController implementation.

=end
module FinResultPhase2

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
    parse_result[:result_row].each do |result_row|
      team_names << result_row[:fields][:team_name] if result_row[:fields][:team_name]
    end
    parse_result[:relay_row].each do |relay_row|
      team_names << relay_row[:fields][:team_name] if relay_row[:fields][:team_name]
    end
    parse_result[:ranking_row].each do |ranking_row|
      team_names << ranking_row[:fields][:team_name] if ranking_row[:fields][:team_name]
    end

    team_names.uniq!                                # Clear the duplicates
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
        data_import_session.save!
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
end
#-- ---------------------------------------------------------------------------
#++
