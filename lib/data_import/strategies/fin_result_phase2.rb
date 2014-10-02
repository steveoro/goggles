# encoding: utf-8
require 'fileutils'                                 # Used to process filenames
require 'common/format'
require 'data_import/header_fields_dao'
require 'data_import/strategies/city_comparator'
require 'data_import/strategies/fin_result_parser'
require 'data_import/services/team_name_analizer'
require 'data_import/services/data_import_entity_builder'


=begin

= FinResultPhase2

  - Goggles framework vers.:  4.00.535
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
  def prescan_parse_result_for_unknown_team_names( data_import_session_id, season_id,
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
      team_id = search_or_add_a_corresponding_team( data_import_session_id, season_id, team_name,
                                                    force_missing_team_creation )
      if ( team_id == 0 )
        @phase_1_log << "\r\nPrescan Team names: '#{team_name}' (#{idx+1}/#{team_names.size}) needs the additional 'Team name Analysis' phase.\r\n"
        logger.info( "\r\nPrescan Team names: '#{team_name}' (#{idx+1}/#{team_names.size}) needs the additional 'Team name Analysis' phase." )
        is_ok = false
      end
                                                    # Update progress on current session:
      DataImportSession.where( id: data_import_session_id ).update_all( phase_3_log: "TEAM-CHECK:#{idx+1}/#{team_names.size}" )
    }
    is_ok
  end
  # -----------------------------------------------------------------------------
  # -----------------------------------------------------------------------------


  # "Digest" process for the :category_headers array extracted by the Parser
  #
  # == Returns: false on error
  #
  def process_category_headers( full_pathname, data_import_session_id, season_id, season_type_id, season_starting_year,
                                meeting_id, meeting_session_id, category_headers, category_headers_ids,
                                category_details, scheduled_date, force_missing_team_creation = false )
    is_ok = true
                                                    # **** HEADER LOOP **** For each header row:...
    category_headers_ids.each_with_index { |category_id, header_index|
                                                    # For each category_details key, add import entities rows:
# DEBUG
      logger.debug( "\r\nCATEGORY HEADER: Processing category_id:'#{category_id}', key #{header_index+1}/#{category_headers_ids.size}..." )
                                                    # Extract header row with its details for current category:
      header_row  = category_headers.find({}){|e| e[:id] == category_id }
      detail_rows = category_details.find_all{|e| e[:id] == category_id }
# DEBUG
      logger.debug( "                 Parsed CATEGORY header_row[:fields]=#{header_row[:fields].inspect}...\r\n" )

                                                    # -- MEETING PROGRAM (digest part) --
      gender_type_id   = GenderType.parse_gender_type_from_import_text( header_row[:fields][:gender] )
      raise "Unrecognized GenderType in category headers! (token='#{header_row[:fields][:gender] }')" if gender_type_id == 0
      category_type_id = CategoryType.parse_category_type_from_import_text( season_id, header_row[:fields][:category_group] )
      raise "Unrecognized CategoryType in category headers! (season_id=#{season_id}, token='#{header_row[:fields][:category_group] }')" if category_type_id == 0
      stroke_type_id   = StrokeType.parse_stroke_type_from_import_text( header_row[:fields][:style] )
      raise "Unrecognized StrokeType in category headers! (token='#{header_row[:fields][:style] }')" if stroke_type_id == 0
      length_in_meters = header_row[:fields][:distance].to_i
# DEBUG
      logger.debug( "CATEGORY HEADER: Current header_row: #{header_row.inspect}\r\nResulting category_type_id=#{category_type_id}, gender_type_id=#{gender_type_id}, stroke_type_id=#{stroke_type_id}, data_import_session ID=#{data_import_session_id}" )

      meeting_program_id = search_or_add_a_corresponding_meeting_program(
          full_pathname, data_import_session_id, season_id,
          meeting_id, meeting_session_id,
          header_row, header_index, gender_type_id,
          category_type_id, stroke_type_id, length_in_meters,
          scheduled_date, false, detail_rows.size
      )
      is_ok = (meeting_program_id != 0)
      return unless is_ok
                                                    # **** DETAIL LOOP **** For each result row:...
                                                    # Store each detail into the dedicated temp DB table:
      detail_rows.each_with_index { |detail_row, detail_row_idx|
                                                    # -- MEETING INDIVIDUAL RESULT (digest part) --
        result_id = search_or_add_a_corresponding_individual_result(
            full_pathname, data_import_session_id,
            season_id, season_type_id, season_starting_year,
            meeting_program_id, detail_row, detail_row_idx, detail_rows.size,
            gender_type_id, category_type_id,
            force_missing_team_creation
        )
        is_ok = (result_id != 0)
        return unless is_ok
      }                                             # **** (END of DETAIL) ****
                                                    # Update current header count into "progress counter column"
      DataImportSession.where( id: data_import_session_id ).update_all( phase_3_log: "CAT.1:#{header_index+1}/#{category_headers_ids.size}" )
    }                                               # **** (END of HEADER) ****
    is_ok
  end
  # -----------------------------------------------------------------------------


  # "Digest" process for the :relay_headers array extracted by the Parser
  #
  # == Returns: false on error
  #
  def process_relay_headers( full_pathname, data_import_session_id, season_id, season_type_id, season_starting_year,
                             meeting_id, meeting_session_id, relay_headers, relay_headers_ids,
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
      gender_type_id   = GenderType.parse_gender_type_from_import_text( header_row[:fields][:gender] )
      raise "Unrecognized GenderType in relay headers! (token='#{header_row[:fields][:gender] }')" if gender_type_id == 0
      category_type_id = CategoryType.parse_category_type_from_import_text( season_id, header_row[:fields][:category_group] )
      raise "Unrecognized CategoryType in relay headers! (season_id=#{season_id}, token='#{header_row[:fields][:category_group] }')" if category_type_id == 0
      stroke_type_id   = StrokeType.parse_stroke_type_from_import_text( header_row[:fields][:style] )
      raise "Unrecognized StrokeType in relay headers! (token='#{header_row[:fields][:style] }')" if stroke_type_id == 0
      phases           = header_row[:fields][:distance][0].to_i     # "NxMMM " |=> "N".to_i
      phase_length     = header_row[:fields][:distance][2..4].to_i  # "NxMM " |=> "MM ".to_i
      length_in_meters = phases * phase_length
# DEBUG
      logger.debug( "RELAY HEADER: Current header_row: #{header_row.inspect}\r\nResulting category_type_id=#{category_type_id}, gender_type_id=#{gender_type_id}, stroke_type_id=#{stroke_type_id}" )

      meeting_program_id = search_or_add_a_corresponding_meeting_program(
          full_pathname, data_import_session_id, season_id,
          meeting_id, meeting_session_id,
          header_row, header_index, gender_type_id,
          category_type_id, stroke_type_id, length_in_meters,
          scheduled_date, true, detail_rows.size
      )
      is_ok = (meeting_program_id != 0)
      return unless is_ok
                                         # **** DETAIL LOOP **** For each result row:...
                                                    # Store each detail into the dedicated temp DB table:
      detail_rows.each_with_index { |detail_row, detail_row_idx|
                                                    # -- MEETING RELAY RESULT (digest part) --
        result_id = search_or_add_a_corresponding_meeting_relay_result(
            full_pathname, data_import_session_id, season_id, meeting_program_id,
            detail_row, detail_row_idx, detail_rows.size,
            force_missing_team_creation
        )
        is_ok = (result_id != 0)
        return unless is_ok
      }                                             # **** (END of DETAIL) ****
                                                    # Update current header count into "progress counter column"
      DataImportSession.where( id: data_import_session_id ).update_all( phase_3_log: "REL.2:#{header_index+1}/#{relay_headers_ids.size}" )
    }                                               # **** (END of HEADER) ****
    is_ok
  end
  # -----------------------------------------------------------------------------


  # "Digest" process for the :team_ranking array extracted by the Parser
  #
  # == Returns: false on error
  #
  def process_team_ranking( full_pathname, data_import_session_id, season_id, meeting_id,
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
                                                    # -- MEETING RELAY RESULT (digest part) --
        result_id = search_or_add_a_corresponding_meeting_team_score(
            full_pathname, data_import_session_id, season_id, meeting_id,
            detail_row, detail_row_idx, detail_rows.size,
            force_missing_team_creation
        )
                                                    # Make it so that the loop continues until all team names are scanned and checked:
        is_ok = is_ok && (result_id != 0)
      }                                             # **** (END of DETAIL) ****
                                                    # Update current header count into "progress counter column"
      DataImportSession.where( id: data_import_session_id ).update_all( phase_3_log: "RNK.3:#{header_index+1}/#{ranking_headers_ids.size}" )
    }                                               # **** (END of HEADER) ****
    is_ok
  end
  #-- -------------------------------------------------------------------------
  #-- -------------------------------------------------------------------------
  #++


  # DataImportSeason relation getter / adder.
  # Searches for a corresponding / existing Season row. When not found a new temp row (data_import_xxx)
  # is added.
  #
  # == Returns: the corresponding id of searched entity row,
  #   - positive if freshly added into its dedicated data_import_xxx table;
  #   - negative IDs only for already existing/commited rows in "standard" entity;
  #   - 0 only on error/unable to process.
  #
  # @deprecated Not used as of this version: NOTE that all referenced season_id below are ASSUMED as always positive (that is, coming from Season, not DataImportSeason !)
  #
  def search_or_add_a_corresponding_season( data_import_session, header_date )
    builder = DataImportEntityBuilder.build( data_import_session ) do
      entity            Season

      fields_setup do                             # Set the fields:
        header_date     = Date.parse( header_date )
        @description    = I18n.t( 'admin_import.missing_data_warning' )
        @header_date    = header_date.kind_of?( Date ) ? header_date : Date.today
        year            = @header_date.month < 10 ? @header_date.year - 1 : @header_date.year
        # FIXME This is an approximation, it should include most of the seasons:
        @begin_date     = "#{year}-09-01" # Date.parse( "#{year}-09-01" )
        @end_date       = "#{year + 1}-09-30" # Date.parse( "#{year + 1}-08-30" )
        @header_year    = "#{year}/#{year+1}" # "#{@begin_date.year}/#{@end_date.year}",
        # FIXME ASSERT: season type is always "MASFIN"
        @season_type_id = SeasonType.first.id
        # FIXME This is plain wrong:
        @edition        = 0
      end
                                                  # Search conditions:
      primary_search    [
        "(season_type_id = ?) AND (begin_date >= ?) AND (end_date <= ?)",
        @season_type_id, @begin_date, @end_date
      ]
      secondary_search  [
        "(data_import_session_id = ?) AND (season_type_id = ?) AND (begin_date >= ?) AND (end_date <= ?)",
        @data_import_session.id, @season_type_id, @begin_date, @end_date
      ]

      attributes_for_creation(
        data_import_session_id: @data_import_session.id,
        import_text:            @header_date,
        description:            @description,
        begin_date:             @begin_date,
        end_date:               @end_date,
        season_type_id:         @season_type_id,
        header_year:            @header_year,
        edition:                @edition
      )
    end

    builder.result_id
  end


  # DataImportMeeting relation getter / adder.
  # Searches for a corresponding / existing Meeting row. When not found a new temp row (data_import_xxx)
  # is added.
  #
  # == Returns: the corresponding id of searched entity row,
  #   - positive if freshly added into its dedicated data_import_xxx table;
  #   - negative IDs only for already existing/commited rows in "standard" entity;
  #   - 0 only on error/unable to process.
  #
  def search_or_add_a_corresponding_meeting( data_import_session, full_pathname, season_id,
                                             meeting_header_row, meeting_dates, scheduled_date,
                                             header_fields_dao, force_missing_meeting_creation = false )
    # result_id = 0
    # result_row = nil
    # not_found = true
                                                    # # --- FIELD SETUP: Extract field values before the search:
    # title = organization = notes = nil
#
    # if ( meeting_header_row )
      # title         = meeting_header_row[:fields][:title]
      # organization  = meeting_header_row[:fields][:organization]
      # notes = (meeting_dates ? "#{meeting_dates}\r\n" : '') +
              # (organization ? "#{organization}" : '')
    # end
    # description = ( title ? title : "#{header_fields_dao.code_name } (#{Format.a_date(scheduled_date)})" )
# # DEBUG
    # logger.debug( "\r\nParsed MEETING header_row = #{meeting_header_row.inspect}...\r\n\r\n" )
    # @phase_1_log << "\r\nParsed MEETING header_row = #{meeting_header_row.inspect}...\r\n\r\n"

                                                    # --- SEARCH for any existing/conflicting rows (DO NOT create forcibly one each time)
# DEBUG
    # logger.debug( "Seeking existing Meeting @ #{scheduled_date}..." )
    # @phase_1_log << "Seeking existing Meeting @ #{scheduled_date}...\r\n"
                                                    # # ASSERT: there can be only 1 row keyed by this tuple:
    # result_row = Meeting.where(
      # [ "(header_date = ?) AND (season_id = ?) AND (code = ?)",
        # scheduled_date, season_id, header_fields_dao.code_name ]
    # ).first
    # if result_row                                   # We must differentiate the result: negative for Meeting, positive for DataImportMeeting
# # DEBUG
      # logger.debug( "Meeting found! (#{result_row.description})" )
      # @phase_1_log << "Meeting found! (#{result_row.description})\r\n"
      # result_id = - result_row.id
      # not_found = false
                                                    # # [Steve, 20131114] Sometimes header_year is missing from old seed data; we need to check this (otherwise validation fails):
      # result_row.header_year = header_fields_dao.header_year if header_fields_dao.header_year
      # result_row.notes = notes if notes
      # result_row.save! if result_row.changed?
                                                    # # Search also inside data_import_xxx table counterpart when unsuccesful:
    # else
# # DEBUG
      # logger.debug( "Seeking existing DataImportMeeting @ #{scheduled_date}..." )
      # @phase_1_log << "Seeking existing DataImportMeeting @ #{scheduled_date}...\r\n"
                                                    # # ASSERT: there can be only 1 row keyed by this tuple:
      # result_row = DataImportMeeting.where(
        # [ "(data_import_session_id = ?) AND (header_date = ?) AND (season_id = ?) AND (description = ?)",
          # data_import_session.id, scheduled_date, season_id, description ]
      # ).first
      # if result_row
        # result_id = result_row.id
        # not_found = false
      # end
    # end

    # if not_found && (!force_missing_meeting_creation)
      # flash[:error] = "#{I18n.t(:requested_entity_missing)}: 'Meeting'"
      # return 0
    # end
                                                    # --- ADD: Nothing existing/conflicting found? => Add a fresh new data-import row
    # if not_found
      # begin                                         # --- BEGIN transaction ---
        # DataImportMeeting.transaction do
          # result_row = DataImportMeeting.new(
            # data_import_session_id: data_import_session.id,
            # import_text:            meeting_header_row.instance_of?(Hash) ? meeting_header_row[:import_text] : '-',
            # description:            description,
            # # [Steve, 20131025] No default value for this one:
# #            entry_deadline: scheduled_date - 14, # (This is just a guess)
            # are_results_acquired:   true,
            # is_under_25_admitted:   true, # (This is just a guess)
            # configuration_file:     full_pathname,
            # header_date:            scheduled_date,
            # code:                   header_fields_dao.code_name,
            # header_year:            header_fields_dao.header_year,
            # edition:                header_fields_dao.edition, # (This is just a guess)
            # edition_type_id:        header_fields_dao.edition_type_id,
            # timing_type_id:         header_fields_dao.timing_type_id,
            # # TODO/FUTURE DEV:
# #            individual_score_computation_type_id: 0,
# #            relay_score_computation_type_id: 0,
# #            team_score_computation_type_id: 0,
            # notes: notes,
            # season_id: season_id,
            # user_id: @current_admin_id
          # )
          # result_row.save!                          # raise automatically an exception if save is not successful
        # end
      # rescue                                        # --- RESCUE (failed) transaction ---
        # @phase_1_log << "\r\nDataImportMeeting creation: exception caught during save!\r\n"
        # @phase_1_log << "#{ $!.to_s }\r\n" if $!
        # logger.error( "\r\n*** DataImportMeeting creation: exception caught during save!" )
        # logger.error( "*** #{ $!.to_s }\r\n" ) if $!
        # flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
      # else
        # result_id = result_row.id
# # DEBUG
        # logger.debug( "Created data_import_meeting, ID:'#{result_id}', '#{result_row.get_verbose_name}'." )
        # @phase_1_log << "Created data_import_meeting, ID:'#{result_id}', '#{result_row.get_verbose_name}'.\r\n"
        # @stored_data_rows += 1
      # end                                           # --- END transaction ---
    # end

    title = organization = notes = nil
    if ( meeting_header_row )
      title         = meeting_header_row[:fields][:title]
      organization  = meeting_header_row[:fields][:organization]
      notes = (meeting_dates ? "#{meeting_dates}\r\n" : '') +
              (organization ? "#{organization}" : '')
    end
    description = ( title ? title : "#{header_fields_dao.code_name } (#{Format.a_date(scheduled_date)})" )


    builder = DataImportEntityBuilder.build( data_import_session ) do
      entity            Meeting
                                                  # Search conditions:
      primary_search    [
        "(header_date = ?) AND (season_id = ?) AND (code = ?)",
        scheduled_date, season_id, header_fields_dao.code_name
      ]
      secondary_search  [
        "(data_import_session_id = ?) AND (header_date = ?) AND (season_id = ?) AND (description = ?)",
        data_import_session.id, scheduled_date, season_id, description
      ]

# FIXME WE NEED 3 DIFFERENT SCOPES: 1 for setup (before search), 1 for search & 1 for creation or search unsuccessfull

      attributes_for_creation(
        data_import_session_id: data_import_session.id,
        import_text:            meeting_header_row.instance_of?(Hash) ? meeting_header_row[:import_text] : '-',
        description:            description,
        # [Steve, 20131025] No default value for this one:
#       entry_deadline:         scheduled_date - 14, # (This is just a guess)
        are_results_acquired:   true,
        is_under_25_admitted:   true, # (This is just a guess)
        configuration_file:     full_pathname,
        header_date:            scheduled_date,
        code:                   header_fields_dao.code_name,
        header_year:            header_fields_dao.header_year,
        edition:                header_fields_dao.edition, # (This is just a guess)
        edition_type_id:        header_fields_dao.edition_type_id,
        timing_type_id:         header_fields_dao.timing_type_id,
        # TODO/FUTURE DEV:
#       individual_score_computation_type_id: 0,
#       relay_score_computation_type_id: 0,
#       team_score_computation_type_id: 0,
        notes:                  notes,
        season_id:              season_id,
        user_id:                @current_admin_id
      )
    end

    if builder.result_row
      # [Steve, 20131114] Sometimes header_year is missing from old seed data;
      # furthermore, here we have the opportunity to fill-in any missing details
      # coming from the data-import to update any result found.
      builder.result_row.header_year = header_fields_dao.header_year if builder.result_row.header_year.nil? && header_fields_dao.header_year
      builder.result_row.notes = notes if builder.result_row.notes.nil? && notes
      builder.result_row.save! if builder.result_row.changed?
    end

    builder.result_id
  end


  # DataImportMeetingSession relation getter / adder.
  # Searches for a corresponding / existing MeetingSession row. When not found a new temp row (data_import_xxx)
  # is added.
  #
  # If a Meeting already exists and has more than one MeetingSession, only the first session
  # will be returned. This will be the "default" MeetingSession used for the insertion of all
  # missing MeetingEvents or MeetingPrograms found during phase 1.
  #
  # == Returns: the corresponding id of searched entity row,
  #   - positive if freshly added into its dedicated data_import_xxx table;
  #   - negative IDs only for already existing/commited rows in "standard" entity;
  #   - 0 only on error/unable to process.
  #
  def search_or_add_a_corresponding_meeting_session( full_pathname, session_id, meeting_id,
                                                     meeting_dates, scheduled_date,
                                                     header_fields_dao, force_missing_meeting_creation = false )
    result_id = 0
    result_row = nil
    not_found = true
                                                    # --- FIELD SETUP: Extract field values before the search:
    description = "#{I18n.t(:meeting_session, { scope: [:activerecord, :models] })} #1"
    warm_up_time  = Time.utc(
      scheduled_date.year, scheduled_date.month, scheduled_date.day,
      7, 30                                         # (UTC time)
    )
    begin_time  = Time.utc(
      scheduled_date.year, scheduled_date.month, scheduled_date.day,
      8, 00                                         # (UTC time)
    )
                                                    # --- SEARCH for any existing/conflicting rows (DO NOT create forcibly one each time)
    if ( meeting_id < 0 )                           # We can search in non-data_import table only when the result is negative! (only data_import tables have references to both type of tables)
# DEBUG
#      logger.debug( "Seeking existing MeetingSession @ #{scheduled_date}..." )
#      @phase_1_log << "Seeking existing MeetingSession @ #{scheduled_date}...\r\n"
                                                    # ASSERT: there can be only 1 row keyed by this tuple:
      result_row = MeetingSession.where(
        [ "(scheduled_date = ?) AND (meeting_id = ?)",
          scheduled_date, -meeting_id ]
      ).first
    end

    if result_row                                   # We must differentiate the result: negative for MeetingSession, positive for DataImportMeetingSession
      result_row = fix_existing_invalid_meeting_session( result_row )
      result_id  = - result_row.id
      not_found  = false
    else                                            # Search also inside data_import_xxx table counterpart when unsuccesful:
# DEBUG
#      logger.debug( "Seeking existing DataImportMeetingSession @ #{scheduled_date}..." )
#      @phase_1_log << "Seeking existing DataImportMeetingSession @ #{scheduled_date}...\r\n"
                                                    # ASSERT: there can be only 1 row keyed by this tuple:
      result_row = DataImportMeetingSession.where(
        [ "(data_import_session_id = ?) AND (scheduled_date = ?) AND " +
          "(#{meeting_id < 0 ? '' : 'data_import_'}meeting_id = ?)",
          session_id, scheduled_date, (meeting_id < 0 ? -meeting_id : meeting_id) ]
      ).first
      if result_row
        result_id = result_row.id
        not_found = false
      end
    end

    if not_found && (!force_missing_meeting_creation)
      flash[:error] = "#{I18n.t(:requested_entity_missing)}: 'MeetingSession'"
      return 0
    end
                                                    # --- ADD: Nothing existing/conflicting found? => Add a fresh new data-import row
    if not_found                                    # (the following is an educated guess)
      swimming_pool = SwimmingPool.where([ "(nick_name LIKE ?)", "#{header_fields_dao.code_name }%" ]).first

      begin                                         # --- BEGIN transaction ---
        field_hash = {
          data_import_session_id: session_id,
          import_text:            ( meeting_dates.instance_of?(String) && meeting_dates.size > 0 ? meeting_dates : '-' ),
          scheduled_date:         scheduled_date,
          warm_up_time:           warm_up_time,
          begin_time:             begin_time,
          description:            description,
          session_order:          1,                # (since we are processing just 1 meeting session at a time; but is far from correct)
          user_id:                @current_admin_id,
          swimming_pool_id:       ( swimming_pool ? swimming_pool.id : nil ),
          day_part_type_id:       DayPartType::MORNING_ID
          # TODO :notes is not used!
        }.merge(
          meeting_id.to_i < 0 ?  { meeting_id: -meeting_id } : { data_import_meeting_id: meeting_id }
        )

        DataImportMeetingSession.transaction do
          result_row = DataImportMeetingSession.new( field_hash )
          result_row.save!                          # raise automatically an exception if save is not successful
        end
      rescue                                        # --- RESCUE (failed) transaction ---
        @phase_1_log << "\r\nDataImportMeetingSession creation: exception caught during save!\r\n"
        @phase_1_log << "field_hash = #{ field_hash.inspect }\r\n" if field_hash
        @phase_1_log << "#{ $!.to_s }\r\n" if $!
        logger.error( "\r\n*** DataImportMeetingSession creation: exception caught during save!" )
        logger.error( "field_hash = #{ field_hash.inspect }\r\n" ) if field_hash
        logger.error( "*** #{ $!.to_s }\r\n" ) if $!
        flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
      else
        result_id = result_row.id
# DEBUG
        logger.debug( "Created data_import_meeting_session, ID:'#{result_id}', '#{result_row.get_verbose_name}'." )
        @phase_1_log << "Created data_import_meeting_session, ID:'#{result_id}', '#{result_row.get_verbose_name}'.\r\n"
        @stored_data_rows += 1
      end                                           # --- END transaction ---
    end

    result_id
  end
  # ---------------------------------------------------------------------------


  # TimeStandard relation getter / adder.
  # Searches for a corresponding / existing TimeStandard row.
  # Note that while all other search_or_add_a_XYZ methods create temporary rows
  # on dedicated (temporary) entities, this method is one of the only 2 which commit
  # directly to the destination entity (when a corresponding row is not found).
  #
  # == Returns: the corresponding id of searched entity row,
  #   - positive if freshly added into time_standards table;
  #   - 0 or less only on error/unable to process.
  #
  def search_or_add_a_corresponding_time_standard( season_id, event_type_id, category_type_id,
                                                   gender_type_id, pool_type_id,
                                                   mins, secs, hds )
    result_id = 0
    result_row = TimeStandard.where(
      event_type_id: event_type_id,
      category_type_id: category_type_id,
      gender_type_id: gender_type_id,
      pool_type_id: pool_type_id,
      minutes: mins,
      seconds: secs,
      hundreds: hds
    ).first

    if result_row
      result_id = result_row.id
    else
# DEBUG
      logger.debug( "Adding new TimeStandard having:  #{mins}'#{secs}\".#{hds} @ season_id=#{season_id}, event_type_id=#{event_type_id}, :category_type_id=#{category_type_id}, pool_type_id=#{pool_type_id}, gender_type_id=#{gender_type_id}..." )
      begin                                         # --- BEGIN transaction ---
        field_hash = {
          season_id: season_id,
          gender_type_id: gender_type_id,
          pool_type_id: pool_type_id,
          event_type_id: event_type_id,
          category_type_id: category_type_id,
          minutes: mins,
          seconds: secs,
          hundreds: hds
        }
        TimeStandard.transaction do
          result_row = TimeStandard.new( field_hash )
          result_row.save!                          # raise automatically an exception if save is not successful
        end
      rescue                                        # --- RESCUE (failed) transaction ---
        @phase_1_log << "\r\TimeStandard creation: exception caught during save!\r\n"
        @phase_1_log << "field_hash = #{ field_hash.inspect }\r\n" if field_hash
        @phase_1_log << "#{ $!.to_s }\r\n" if $!
        logger.error( "\r\n*** TimeStandard creation: exception caught during save!" )
        logger.error( "field_hash = #{ field_hash.inspect }\r\n" ) if field_hash
        logger.error( "*** #{ $!.to_s }\r\n" ) if $!
        flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
      else
        result_id = result_row.id
# DEBUG
        logger.debug( "Created TimeStandard, ID:'#{result_id}', '#{result_row.get_verbose_name}'." )
        @phase_1_log << "Created TimeStandard, ID:'#{result_id}', '#{result_row.get_verbose_name}'.\r\n"
        @stored_data_rows += 1
      end                                           # --- END transaction ---
    end
    result_id
  end


  # DataImportMeetingProgram relation getter / adder.
  # Searches for a corresponding / existing MeetingProgram row. When not found a new temp row (data_import_xxx)
  # is added.
  #
  # == Returns: the corresponding id of searched entity row,
  #   - positive if freshly added into its dedicated data_import_xxx table;
  #   - negative IDs only for already existing/commited rows in "standard" entity;
  #   - 0 only on error/unable to process.
  #
  def search_or_add_a_corresponding_meeting_program( full_pathname, session_id, season_id,
                                                     meeting_id, meeting_session_id,
                                                     header_row, header_index, gender_type_id,
                                                     category_type_id, stroke_type_id, length_in_meters,
                                                     scheduled_date, is_a_relay, detail_rows_size )
    result_id = 0
    result_row = nil
    not_found = true
    meeting_session = nil
                                                    # --- FIELD SETUP: Extract field values before the search:
    # NOTE:
    # header_row[:fields] => [ :distance, :style, :gender, :category_group, :base_time ]

    import_text = header_row[:import_text]
                                                    # Note: header_index will give a new event_order for each combination of [ :distance, :style, :gender, :category_group ]
    event_order = header_index + 1                  # (Actually, this counts each single Heat as an event)
    base_time   = header_row[:fields][:base_time]
    result_parser   = ResultTimeParser.new( 0, base_time ).parse
    mins, secs, hds = result_parser.mins_secs_hds_array
                                                    # Quick'n'dirty trick: compute approx. begin_time using scheduled_date + header_index * (mins, secs, hds) of base time
    heat_number_approx   = ( detail_rows_size / 8 ) + 1
    @esteemed_meeting_mins += heat_number_approx * (mins < 3 ? 2 : mins + 2)
    esteemed_hours       = 8 + (@esteemed_meeting_mins / 60)
# DEBUG
#    logger.debug( "\r\nMeeting program parsing: base_time='#{base_time}' ... #{mins}:#{secs}.#{hds}, (#{header_row[:fields].inspect})" )
#    logger.debug( "scheduled_date=#{scheduled_date}, header_index=#{header_index} * heat_number_approx='#{heat_number_approx}', esteemed_hours=#{esteemed_hours}, @esteemed_meeting_mins=#{@esteemed_meeting_mins}" )
#    @phase_1_log << "\r\nMeeting program parsing: base_time='#{base_time}' ... #{mins}:#{secs}.#{hds}, (#{header_row[:fields].inspect})\r\n"
#    @phase_1_log << "scheduled_date=#{scheduled_date}, header_index=#{header_index} * heat_number_approx='#{heat_number_approx}', esteemed_hours=#{esteemed_hours}, @esteemed_meeting_mins=#{@esteemed_meeting_mins}\r\n"
    begin_time  = Time.utc(
      scheduled_date.year, scheduled_date.month, scheduled_date.day + (esteemed_hours/24),
      esteemed_hours % 24,
      @esteemed_meeting_mins % 60
    )
# DEBUG
#    logger.debug( "begin_time=#{begin_time}" )
#    @phase_1_log << "begin_time=#{begin_time}\r\n"
#    logger.debug( "Searching EventType where length_in_meters=#{length_in_meters}, stroke_type_id=#{stroke_type_id}..." )
    event_type_id  = EventType.where(
      length_in_meters: length_in_meters,
      stroke_type_id: stroke_type_id,
      is_a_relay: is_a_relay
    ).first.id                                      # |=> 'MASTER FIN'.id

                                                    # --- SEARCH for any existing/conflicting rows (DO NOT create forcibly one each time)
    if ( meeting_id < 0 )                           # We can search in non-data_import table only when the value is negative! (only data_import tables have references to both type of tables)
# DEBUG
#      logger.debug( "Seeking existing MeetingProgram..." )
#      @phase_1_log << "Seeking existing MeetingProgram...\r\n"
      result_row = MeetingProgram.includes(:meeting, :event_type).where( # ASSERT: there can be only 1 row keyed by this tuple:
      [ "(meetings.id = ?) AND (event_types.id = ?) AND " +
        "(meeting_programs.category_type_id = ?) AND " +
        "(meeting_programs.gender_type_id = ?)",
        -meeting_id, event_type_id, category_type_id, gender_type_id ]
      ).first
    end

    if result_row                                   # We must differentiate the result: positive for data_import tables only, negative otherwise
      result_id = - result_row.id
      not_found = false
# DEBUG
      logger.debug( "Found existing M.Program! #{result_row.class.name}, ID:#{result_row.id} => #{result_row.inspect}" )
      @phase_1_log << "Found existing M.Program! #{result_row.class.name}, ID:#{result_row.id} => #{result_row.inspect}\r\n"
                                                    # Search also inside data_import_xxx table counterpart when unsuccesful:
    else                                            # Choose the correct meeting_session_id before further search or insertion (and fallback to default if the meeting event doesn't exist):
      me = MeetingEvent.includes(:meeting, :meeting_session).where(
        [ "(meetings.id = ?) AND (event_type_id = ?)",
          -meeting_id, event_type_id ]
      ).first
      if me
# DEBUG
        logger.debug( "Found existing M.Event (but not the Program)! ID:#{me.id} => #{me.inspect}" )
        @phase_1_log << "Found existing M.Event (but not the Program)! ID:#{me.id} => #{me.inspect}\r\n"
        meeting_session = fix_existing_invalid_meeting_session( me.meeting_session )
        meeting_session_id = - me.meeting_session_id
      end
# DEBUG
      logger.debug( "Seeking existing DataImportMeetingProgram (w/ meeting_session_id=#{meeting_session_id})..." )
      @phase_1_log << "Seeking existing DataImportMeetingProgram (w/ meeting_session_id=#{meeting_session_id})...\r\n"
                                                    # ASSERT: there can be only 1 row keyed by this tuple:
      result_row = DataImportMeetingProgram.where(
        [ "(data_import_session_id = ?) AND " +
          "(#{meeting_session_id < 0 ? '' : 'data_import_'}meeting_session_id = ?) AND " +
          "(event_type_id = ?) AND (category_type_id = ?) AND (gender_type_id = ?)",
          session_id,
          (meeting_session_id < 0 ? -meeting_session_id : meeting_session_id),
          event_type_id, category_type_id, gender_type_id ]
      ).first

      if result_row
        result_id = result_row.id
        not_found = false
# DEBUG
        logger.debug( "Found existing M.Program! #{result_row.class.name}, ID:#{result_row.id} => #{result_row.inspect}" )
        @phase_1_log << "Found existing M.Program! #{result_row.class.name}, ID:#{result_row.id} => #{result_row.inspect}\r\n"
      end
    end
                                                    # --- ADD: Nothing existing/conflicting found? => Add a fresh new data-import row
    if not_found
      if meeting_session.nil?                       # Both meeting event & program were not found? Let's retrieve the default meeting session:
        meeting_session = ( meeting_session_id < 0 ?
          MeetingSession.find( -meeting_session_id ) :
          DataImportMeetingSession.find( meeting_session_id )
        )
        meeting_session = fix_existing_invalid_meeting_session( meeting_session )
      end
                                                    # Retrieve the swimming pool type from the meeting session: (otherwise use a default)
      pool_type_id = ( meeting_session.swimming_pool ?
        meeting_session.swimming_pool.pool_type_id :
        PoolType::MT50_ID
      )
                                                    # Define also the base time or standard time, if any:
      time_standard_id = nil
      if ( mins > 0 || secs > 0 || hds > 0 )        # Base time found? Search for a corresponding standard time:
        time_standard_id = search_or_add_a_corresponding_time_standard(
          season_id, event_type_id, category_type_id, gender_type_id, pool_type_id,
          mins, secs, hds
        )
      end
      begin                                         # --- BEGIN transaction ---
# DEBUG
#        logger.debug( "Adding new DataImportMeetingProgram with: event_type_id=#{event_type_id}, order=#{header_index}, #{header_row[:fields][:distance].to_i} mt., stroke_type_id=#{stroke_type_id}, category_type_id=#{category_type_id}..." )
        field_hash = {
          data_import_session_id: session_id,
          import_text: import_text,
          event_order: event_order,
          begin_time: begin_time,
          event_type_id: event_type_id,
          category_type_id: category_type_id,
          gender_type_id: gender_type_id,
          minutes: mins,
          seconds: secs,
          hundreds: hds,
          is_out_of_race: false,                    # FIXME This is not parsed at all
          heat_type_id: HeatType::FINALS_ID,        # (This is just a guess, since this is the phase-2 processing of a "fin-result" type file)
          time_standard_id: time_standard_id,
          user_id: @current_admin_id
        }.merge(
          meeting_session_id.to_i < 0 ?  { meeting_session_id: -meeting_session_id } : { data_import_meeting_session_id: meeting_session_id }
        )

        DataImportMeetingProgram.transaction do
          result_row = DataImportMeetingProgram.new( field_hash )
          result_row.save!                          # raise automatically an exception if save is not successful
        end
      rescue                                        # --- RESCUE (failed) transaction ---
        @phase_1_log << "\r\nDataImportMeetingProgram creation: exception caught during save!\r\n"
        @phase_1_log << "event_type_id = #{ event_type_id.inspect }\r\n" if event_type_id
        @phase_1_log << "field_hash = #{ field_hash.inspect }\r\n" if field_hash
        @phase_1_log << "#{ $!.to_s }\r\n" if $!
        logger.error( "\r\n*** DataImportMeetingProgram creation: exception caught during save!" )
        logger.error( "*** #{ $!.to_s }\r\n" ) if $!
        flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
      else
        result_id = result_row.id
# DEBUG
        logger.debug( "Created data_import_meeting_program, ID:'#{result_id}', '#{result_row.get_verbose_name}'." )
        @phase_1_log << "Created data_import_meeting_program, ID:'#{result_id}', '#{result_row.get_verbose_name}'.\r\n"
        @stored_data_rows += 1
      end                                           # --- END transaction ---
    end

    result_id
  end
  # ---------------------------------------------------------------------------


  # Checks if a meeting_session instance is invalid (validation usually fails for
  # a missing description) and fixes it.
  #
  def fix_existing_invalid_meeting_session( meeting_session )
    if meeting_session.description.to_s.empty?      # [Steve, bugfix 2013115]: Make sure that the pre-existing meeting session doesn't have an empty description:
      logger.info( "Fixing meeting session empty description..." )
      @phase_1_log << "Fixing meeting session empty description...\r\n"
      meeting_session.description = meeting_session.get_order_with_date
      meeting_session.save!
    end
    meeting_session
  end
  # ---------------------------------------------------------------------------


  # DataImportMeetingIndividualResult getter / adder.
  # Searches for a corresponding / existing MeetingIndividualResult row.
  # When not found a new temp row (data_import_xxx) is added.
  #
  # == Returns: the corresponding id of searched entity row,
  #   - positive if freshly added into its dedicated data_import_xxx table;
  #   - negative IDs only for already existing/commited rows in "standard" entity;
  #   - 0 only on error/unable to process.
  #
  def search_or_add_a_corresponding_individual_result( full_pathname, session_id, season_id, season_type_id, season_starting_year,
                                                       meeting_program_id, detail_row, detail_row_idx, detail_rows_size,
                                                       gender_type_id, category_type_id,
                                                       force_missing_team_creation = false )
    result_id = 0
    result_row = nil
    not_found = true
                                                    # --- FIELD SETUP: Extract field values before the search:
    # NOTE:
    # detail_row[:fields] => [
    #    :result_position, :team_code, :swimmer_name, :swimmer_year, :team_name,
    #    :result_time, :result_score
    # ]
# DEBUG
#    logger.debug( "\r\nProcessing CATEGORY detail row #{detail_row_idx+1}/#{detail_rows_size}..." )

    import_text   = detail_row[:import_text]
    swimmer_name  = detail_row[:fields][:swimmer_name]
    swimmer_year  = detail_row[:fields][:swimmer_year]
    team_name     = detail_row[:fields][:team_name]
    athlete_badge = detail_row[:fields][:team_code]

    swimmer_id = search_or_add_a_corresponding_swimmer( session_id, swimmer_name, swimmer_year, gender_type_id )
    if ( swimmer_id == 0 )                          # Immediately exit on swimmer search/add error:
      @phase_1_log << "\r\nsearch_or_add_a_corresponding_individual_result(): returned swimmer_id IS ZERO! (And it can't be.)\r\n"
      logger.error( "\r\nsearch_or_add_a_corresponding_individual_result(): returned swimmer_id IS ZERO! (And it can't be.)" )
      flash[:error] = "#{I18n.t(:something_went_wrong)} ['returned swimmer_id IS ZERO']"
      return 0
    end
    team_id = search_or_add_a_corresponding_team( session_id, season_id, team_name, force_missing_team_creation )
    if ( team_id == 0 )                             # Immediately exit on team search/add error:
      @phase_1_log << "\r\nsearch_or_add_a_corresponding_individual_result(): returned team_id IS ZERO! (And it can't be.)\r\n"
      logger.error( "\r\nsearch_or_add_a_corresponding_individual_result(): returned team_id IS ZERO! (And it can't be.)" )
      flash[:error] = "#{I18n.t(:something_went_wrong)} ['returned team_id IS ZERO']"
      return 0
    end
    badge_id   = search_or_add_a_corresponding_badge(
        session_id, athlete_badge, season_id, team_id, swimmer_id,
        category_type_id, EntryTimeType::LAST_RACE_ID
    )
                                                # Retrieve team_badge_number from team_affiliation, but only if the team name was found in Team: (team_affiliations require an existing team)
    ta = TeamAffiliation.where(team_id: -team_id, season_id: season_id).first if (team_id.to_i < 0)
    team_badge_number = ta ? ta.number : nil

    rank              = detail_row[:fields][:result_position]
    result_time       = detail_row[:fields][:result_time]
    result_score      = ( detail_row[:fields][:result_score] ).gsub(/\,/, '.').to_f
    is_play_off       = true
    result_parser     = ResultTimeParser.new( rank, result_time ).parse
    is_out_of_race    = result_parser.is_out_of_race?
    is_disqualified   = result_parser.is_disqualified?
    dsq_code_type_id  = result_parser.disqualification_code_type_id
    mins, secs, hds   = result_parser.mins_secs_hds_array
# DEBUG
#    logger.debug( "\r\nIndividual Result parsing: rank:'#{rank}', result_time:'#{result_time}', result_score:'#{result_score}'" )
#    logger.debug( "is_out_of_race:'#{is_out_of_race}', is_disqualified:'#{is_disqualified}'\r\n" )
#    @phase_1_log << "\r\nIndividual Result parsing: rank:'#{rank}', result_time:'#{result_time}', result_score:'#{result_score}'\r\n"
#    @phase_1_log << "is_out_of_race:'#{is_out_of_race}', is_disqualified:'#{is_disqualified}'\r\n\r\n"
# TODO Not sure about this:
    standard_points = result_score
    meeting_points  = result_score

                                                    # --- SEARCH for any existing/conflicting rows (DO NOT create forcibly one each time)
    if (meeting_program_id < 0) && (swimmer_id < 0) && (team_id < 0)
# DEBUG
#      logger.debug( "Seeking existing MeetingIndividualResult..." )
#      @phase_1_log << "Seeking existing MeetingIndividualResult...\r\n"
      result_row = MeetingIndividualResult.where(   # ASSERT: there can be only 1 row keyed by this tuple:
        [ "(meeting_program_id = ?) AND (swimmer_id = ?) AND (team_id = ?)",
          -meeting_program_id, -swimmer_id, -team_id ]
      ).first
    end

    if result_row                                   # We must differentiate the result: positive for data_import tables only, negative otherwise
      result_id = - result_row.id
      not_found = false
    else                                            # Search also inside data_import_xxx table counterpart when unsuccesful:
# DEBUG
#      logger.debug( "Seeking existing DataImportMeetingIndividualResult..." )
#      @phase_1_log << "Seeking existing DataImportMeetingIndividualResult...\r\n"
                                                    # ASSERT: there can be only 1 row keyed by this tuple:
      result_row = DataImportMeetingIndividualResult.where(
        [ "(data_import_session_id = ?) AND " +
          "(#{meeting_program_id < 0 ? '' : 'data_import_'}meeting_program_id = ?) AND " +
          "(#{swimmer_id < 0 ? '' : 'data_import_'}swimmer_id = ?) AND " +
          "(#{team_id < 0 ? '' : 'data_import_'}team_id = ?)",
          session_id,
          (meeting_program_id < 0 ? -meeting_program_id : meeting_program_id),
          (swimmer_id < 0 ? -swimmer_id : swimmer_id),
          (team_id < 0 ? -team_id : team_id) ]
      ).first
      if result_row
        result_id = result_row.id
        not_found = false
      end
    end
                                                    # --- ADD: Nothing existing/conflicting found? => Add a fresh new data-import row
    if not_found
      begin                                         # --- BEGIN transaction ---
        # ASSERT: foreach data-import session, we are treating "atomically" at least 1 "full"
        #         category or context header of data-import at a time.
        #
        #         (This means: no support for half-finished data-imports of team scores,
        #         relay results, individual results of whatever.
        #         If a session halts in the middle of this phase, the only safe way to carry
        #         on is to fix by hand the issue, delete the session and redo from scratch.)
        #
        #         Assuming this, we can safely try to fix a nil +rank+ by just checking
        #         the current data_import temp session (not the destination entity).
                                                    # RANK fixup:
        if ( rank.to_i == 0 && standard_points >= 0.0 && !is_out_of_race )# Retrieve previous row in ranking and assign same rank:
          logger.info( "Rank == 0 (relay results). Searching previous same-scored row to assign same rank..." )
          @phase_1_log << "Rank == 0 (relay results). Searching previous same-scored row to assign same rank...\r\n"
          prev_row = DataImportMeetingIndividualResult.where(
            [ "(data_import_session_id = ?) AND " +
              "(#{meeting_program_id < 0 ? '' : 'data_import_'}meeting_program_id = ?) AND " +
              "(standard_points = ?)",
              session_id,
              (meeting_program_id < 0 ? -meeting_program_id : meeting_program_id),
              standard_points ]
          ).last
          if prev_row                               # Assign same rank as "previous" row:
            rank = prev_row.rank
          else                                      # Assign rank as total existing rows + 1 in same category/context:
            tot_rows = DataImportMeetingIndividualResult.where(
              [ "(data_import_session_id = ?) AND " +
                "(#{meeting_program_id < 0 ? '' : 'data_import_'}meeting_program_id = ?)",
                session_id,
                (meeting_program_id < 0 ? -meeting_program_id : meeting_program_id) ]
            ).count
            logger.info( "Previous same-scored row not found. Rank will be the total rows found so far +1 (=#{tot_rows+1})..." )
            @phase_1_log << "Previous same-scored row not found. Rank will be the total rows found so far +1 (=#{tot_rows+1})...\r\n"
            rank = tot_rows + 1
          end
        end

        field_hash = {
          data_import_session_id: session_id,
          import_text: import_text,
          athlete_name: swimmer_name,
          team_name: team_name,
          athlete_badge_number: athlete_badge,
          team_badge_number: team_badge_number,
          year_of_birth: swimmer_year,
          rank: rank.to_i,                       # Note that 'Fuori gara'.to_i = 0
          is_play_off: is_play_off,
          is_out_of_race: is_out_of_race,      # From ranking only ('Fuori gara')
          is_disqualified: is_disqualified,     # any DSQ possible code
          disqualification_code_type_id: dsq_code_type_id,
          standard_points: standard_points,
          meeting_individual_points: meeting_points,
          team_points: 0,                   # FIXME TODO
          goggle_cup_points: 0,
          minutes: mins,
          seconds: secs,
          hundreds: hds,
          reaction_time: 0,
          # TODO FUTURE DEV:
#          entry_time_type_id: nil,
          user_id: @current_admin_id
        }.merge(
          meeting_program_id < 0 ? { meeting_program_id: -meeting_program_id } : { data_import_meeting_program_id: meeting_program_id }
        ).merge(
          swimmer_id.to_i < 0 ?  { swimmer_id: -swimmer_id } : { data_import_swimmer_id: swimmer_id }
        ).merge(
          team_id.to_i < 0 ?     { team_id: -team_id } : { data_import_team_id: team_id }
        ).merge(
          badge_id.to_i < 0 ?    { badge_id: -badge_id } : { data_import_badge_id: badge_id }
        )
# DEBUG
#        logger.debug( "\r\nDataImportMeetingIndividualResult before save:\r\n#{field_hash.inspect}" )

        DataImportMeetingIndividualResult.transaction do
          result_row = DataImportMeetingIndividualResult.new( field_hash )
          result_row.save!                          # raise automatically an exception if save is not successful
        end
      rescue                                        # --- RESCUE (failed) transaction ---
        @phase_1_log << "\r\nDataImportMeetingIndividualResult creation: exception caught during save!\r\n"
        @phase_1_log << "#{ $!.to_s }\r\n" if $!
        logger.error( "\r\n*** DataImportMeetingIndividualResult creation: exception caught during save!" )
        logger.error( "*** #{ $!.to_s }\r\n" ) if $!
        flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
      else
        result_id = result_row.id
# DEBUG
#        logger.debug( "Created data_import_meeting_individual_result, ID:'#{result_id}', '#{result_row.get_verbose_name}'." )
#        @phase_1_log << "Created data_import_meeting_individual_result, ID:'#{result_id}', '#{result_row.get_verbose_name}'.\r\n"
        @stored_data_rows += 1
      end                                           # --- END transaction ---
    end

    result_id
  end
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------


  # DataImportMeetingRelayResult getter / adder.
  # Searches for a corresponding / existing MeetingRelayResult row.
  # When not found a new temp row (data_import_xxx) is added.
  #
  # == Returns: the corresponding id of searched entity row,
  #   - positive if freshly added into its dedicated data_import_xxx table;
  #   - negative IDs only for already existing/commited rows in "standard" entity;
  #   - 0 only on error/unable to process.
  #
  def search_or_add_a_corresponding_meeting_relay_result( full_pathname, session_id, season_id, meeting_program_id,
                                                          detail_row, detail_row_idx, detail_rows_size,
                                                          force_missing_team_creation = false )
    result_id = 0
    result_row = nil
    not_found = true
                                                    # --- FIELD SETUP: Extract field values before the search:
    # NOTE:
    # detail_row[:fields] => [ :result_position, :team_name,  :result_time, :result_score ]
# DEBUG
#    logger.debug( "\r\nProcessing RELAY detail row #{detail_row_idx+1}/#{detail_rows_size}..." )
    import_text   = detail_row[:import_text]
    rank          = detail_row[:fields][:result_position]
    team_name     = detail_row[:fields][:team_name]
    result_time   = detail_row[:fields][:result_time]
    result_score  = detail_row[:fields][:result_score] ? ( detail_row[:fields][:result_score] ).gsub(/\,/, '.').to_f : 0.0
    team_id       = search_or_add_a_corresponding_team( session_id, season_id, team_name, force_missing_team_creation )
    if ( team_id == 0 )                             # Immediately exit on team search/add error:
      @phase_1_log << "\r\nsearch_or_add_a_corresponding_meeting_relay_result(): returned team_id IS ZERO! (And it can't be.)\r\n"
      logger.error( "\r\nsearch_or_add_a_corresponding_meeting_relay_result(): returned team_id IS ZERO! (And it can't be.)" )
      flash[:error] = "#{I18n.t(:something_went_wrong)} ['returned team_id IS ZERO']"
      return 0
    end

    is_play_off       = true
    result_parser     = ResultTimeParser.new( rank, result_time ).parse
    is_out_of_race    = result_parser.is_out_of_race?
    is_disqualified   = result_parser.is_disqualified?
    dsq_code_type_id  = result_parser.disqualification_code_type_id
    mins, secs, hds   = result_parser.mins_secs_hds_array
    standard_points   = result_score
    meeting_points    = result_score
    rank              = rank.to_i                   # Note that 'Fuori gara'.to_i = 0

                                                    # --- SEARCH for any existing/conflicting rows (DO NOT create forcibly one each time)
    if (meeting_program_id < 0) && (team_id < 0)
# DEBUG
#      logger.debug( "Seeking existing MeetingRelayResult..." )
#      @phase_1_log << "Seeking existing MeetingRelayResult...\r\n"
      result_row = MeetingRelayResult.where(        # ASSERT: there can be only 1 row keyed by this tuple:
        [ "(meeting_program_id = ?) AND (team_id = ?) AND (rank = ?) AND (minutes = ?) AND (seconds = ?) AND (hundreds = ?)",
          -meeting_program_id, -team_id, rank, mins, secs, hds ]
      ).first
    end

    if result_row                                   # We must differentiate the result: positive for data_import tables only, negative otherwise
      result_id = - result_row.id
      not_found = false
    else                                            # Search also inside data_import_xxx table counterpart when unsuccesful:
# DEBUG
#      logger.debug( "Seeking existing DataImportMeetingRelayResult..." )
#      @phase_1_log << "Seeking existing DataImportMeetingRelayResult...\r\n"
                                                    # ASSERT: there can be only 1 row keyed by this tuple:
      result_row = DataImportMeetingRelayResult.where(
        [ "(data_import_session_id = ?) AND " +
          "(#{ meeting_program_id < 0 ? '' : 'data_import_' }meeting_program_id = ?) AND " +
          "(#{ team_id < 0 ? '' : 'data_import_' }team_id = ?) AND " +
          "(rank = ?) AND (minutes = ?) AND (seconds = ?) AND (hundreds = ?)",
          session_id,
          (meeting_program_id < 0 ? -meeting_program_id : meeting_program_id),
          (team_id < 0 ? -team_id : team_id),
          rank, mins, secs, hds ]
      ).first
      if result_row
        result_id = result_row.id
        not_found = false
      end
    end
                                                    # --- ADD: Nothing existing/conflicting found? => Add a fresh new data-import row
    if not_found
      begin                                         # --- BEGIN transaction ---
        # ASSERT: foreach data-import session, we are treating "atomically" at least 1 "full"
        #         category or context header of data-import at a time.
        #
        #         (This means: no support for half-finished data-imports of team scores,
        #         relay results, individual results of whatever.
        #         If a session halts in the middle of this phase, the only safe way to carry
        #         on is to fix by hand the issue, delete the session and redo from scratch.)
        #
        #         Assuming this, we can safely try to fix a nil +rank+ by just checking
        #         the current data_import temp session (not the destination entity).
                                                    # RANK fixup:
        if ( rank.to_i == 0 && standard_points >= 0.0 && !is_out_of_race )# Retrieve previous row in ranking and assign same rank:
          logger.info( "Rank == 0 (relay results). Searching previous same-scored row to assign same rank..." )
          @phase_1_log << "Rank == 0 (relay results). Searching previous same-scored row to assign same rank...\r\n"
          prev_row = DataImportMeetingRelayResult.where(
            [ "(data_import_session_id = ?) AND " +
              "(#{ meeting_program_id < 0 ? '' : 'data_import_' }meeting_program_id = ?) AND " +
              "(standard_points = ?)",
              session_id,
              (meeting_program_id < 0 ? -meeting_program_id : meeting_program_id),
              standard_points ]
          ).last
          if prev_row                               # Assign same rank as "previous" row:
            rank = prev_row.rank
          else                                      # Assign rank as total existing rows + 1 in same category/context:
            tot_rows = DataImportMeetingRelayResult.where(
              [ "(data_import_session_id = ?) AND " +
                "(#{ meeting_program_id < 0 ? '' : 'data_import_' }meeting_program_id = ?)",
                session_id,
                (meeting_program_id < 0 ? -meeting_program_id : meeting_program_id) ]
            ).count
            logger.info( "Previous same-scored row not found. Rank will be the total rows found so far +1 (=#{tot_rows+1})..." )
            @phase_1_log << "Previous same-scored row not found. Rank will be the total rows found so far +1 (=#{tot_rows+1})...\r\n"
            rank = tot_rows + 1
          end
        end

        field_hash = {
          data_import_session_id: session_id,
          import_text: import_text,
          is_play_off: is_play_off,
          is_out_of_race: is_out_of_race,
          is_disqualified: is_disqualified,
          disqualification_code_type_id: dsq_code_type_id,
          standard_points: standard_points,
          meeting_points: meeting_points,
          rank: rank,
          minutes: mins,
          seconds: secs,
          hundreds: hds,
          relay_header: team_name,
          reaction_time: 0,
          # TODO FUTURE DEV:
#          entry_time_type_id: nil,
          user_id: @current_admin_id
        }.merge(
          meeting_program_id.to_i < 0 ? { meeting_program_id: -meeting_program_id } : { data_import_meeting_program_id: meeting_program_id }
        ).merge(
          team_id.to_i < 0 ? { team_id: -team_id } : { data_import_team_id: team_id }
        )

        DataImportMeetingRelayResult.transaction do
          result_row = DataImportMeetingRelayResult.new( field_hash )
          result_row.save!                          # raise automatically an exception if save is not successful
        end
      rescue                                        # --- RESCUE (failed) transaction ---
        @phase_1_log << "\r\nDataImportMeetingRelayResult creation: exception caught during save!\r\n"
        @phase_1_log << "#{ $!.to_s }\r\n" if $!
        logger.error( "\r\n*** DataImportMeetingRelayResult creation: exception caught during save!" )
        logger.error( "*** #{ $!.to_s }\r\n" ) if $!
        flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
      else
        result_id = result_row.id
# DEBUG
#        logger.debug( "Created data_import_meeting_relay_results, ID:'#{result_id}', '#{result_row.get_verbose_name}'." )
#        @phase_1_log << "Created data_import_meeting_relay_results, ID:'#{result_id}', '#{result_row.get_verbose_name}'.\r\n"
        @stored_data_rows += 1
      end                                           # --- END transaction ---
    end

    result_id
  end
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------


  # DataImportMeetingRelayResult getter / adder.
  # Searches for a corresponding / existing MeetingRelayResult row.
  # When not found a new temp row (data_import_xxx) is added.
  #
  # == Returns: the corresponding id of searched entity row,
  #   - positive if freshly added into its dedicated data_import_xxx table;
  #   - negative IDs only for already existing/commited rows in "standard" entity;
  #   - 0 only on error/unable to process.
  #
  def search_or_add_a_corresponding_meeting_team_score( full_pathname, session_id, season_id, meeting_id,
                                                        detail_row, detail_row_idx, detail_rows_size,
                                                        force_missing_team_creation = false )
    result_id = 0
    result_row = nil
    not_found = true
                                                    # --- FIELD SETUP: Extract field values before the search:
    # NOTE:
    # detail_row[:fields] => [ :result_position, :team_code, :team_name, :result_score ]
# DEBUG
    logger.debug( "\r\nProcessing RANKING detail row #{detail_row_idx+1}/#{detail_rows_size}..." )
    import_text   = detail_row[:import_text]
    rank          = detail_row[:fields][:result_position]
# FIXME TEAM CODE is not used! (It could be used to fill-in missing data, when possible)
    team_code     = detail_row[:fields][:team_code]
    team_name     = detail_row[:fields][:team_name]
    team_id       = search_or_add_a_corresponding_team( session_id, season_id, team_name, force_missing_team_creation )
    if ( team_id == 0 )                             # Immediately exit on team search/add error:
      @phase_1_log << "\r\nsearch_or_add_a_corresponding_meeting_team_score(): returned team_id IS ZERO! (And it can't be.)\r\n"
      logger.error( "\r\nsearch_or_add_a_corresponding_meeting_team_score(): returned team_id IS ZERO! (And it can't be.)" )
      flash[:error] = "#{I18n.t(:something_went_wrong)} ['returned team_id IS ZERO']"
      return 0                                      # flash[:error] is already defined at this point.
    end
                                                    # Init the retrieval of the relay results, from meeting -> meeting_sessions -> meeting_programs entities
    relay_results = []
    # [Steve, 20131010] The convoluted method belown is an example on how to retrieve ALL relay results
    # among different "destination" entities, even if we are importing *partial* results from other
    # (additional) meeting_sessions while we have already committed previous ones.
    # We want *all* the relay results, both from committed and uncommitted entites.
    #
    # Normally (not during a data-import use-case), a simple line as the following would be
    # enough to get the seeked results:
    #
    #     relay_results = meeting.meeting_relay_results.where(
    #         team_id: -team_id,
    #         is_out_of_race: false, is_disqualified: false
    #     )
                                                    # Collect ALL meeting_sessions IDs:
    meeting_ss    = ( meeting_id < 0 ? MeetingSession.where( meeting_id: -meeting_id ) : [] )
    di_meeting_ss = DataImportMeetingSession.where(
      [ "(data_import_session_id = ?) AND (#{meeting_id < 0 ? '' : 'data_import_'}meeting_id = ?)",
        session_id,
        (meeting_id < 0 ? -meeting_id : meeting_id) ]
    )
    meeting_ss_ids    = meeting_ss.collect{ |row| row.id }
    di_meeting_ss_ids = di_meeting_ss.collect{ |row| row.id }
                                                    # Collect ALL meeting_programs IDs:
    meeting_prgs    = MeetingProgram.includes(:meeting_session).only_relays.where(
      '(meeting_events.meeting_session_id IN (?))',
      meeting_ss_ids
    )
    di_meeting_prgs = DataImportMeetingProgram.only_relays.where(
      [ '(meeting_session_id IN (?)) OR (data_import_meeting_session_id IN (?))',
        meeting_ss_ids, di_meeting_ss_ids ]
    )
    meeting_prgs_ids    = meeting_prgs.collect{ |row| row.id }
    di_meeting_prgs_ids = di_meeting_prgs.collect{ |row| row.id }
                                                    # Collect ALL relay results:
    relay_results += MeetingRelayResult.is_valid.where(
      meeting_program_id: meeting_prgs_ids,
      team_id: -team_id
    ) if ( team_id < 0 )

    relay_results += DataImportMeetingRelayResult.is_valid.where(
      [ "(#{team_id < 0 ? '' : 'data_import_'}team_id = ?) AND " +
        "( (meeting_program_id IN (?)) OR (data_import_meeting_program_id IN (?)) )",
        (team_id < 0 ? -team_id : team_id),
        meeting_prgs_ids, di_meeting_prgs_ids ]
    )
                                                    # Finally, compute the complete relay score for a team ranking:
    relay_scores = relay_results.collect{ |row| row.meeting_points.to_f }
    total_relay_points = relay_scores.inject{ |sum, score| sum + score }

    result_score  = ( detail_row[:fields][:result_score] ).gsub(/\,/, '.').to_f

                                                    # --- SEARCH for any existing/conflicting rows (DO NOT create forcibly one each time)
    if (meeting_id < 0) && (team_id < 0)
# DEBUG
      logger.debug( "Seeking existing MeetingTeamScore..." )
      @phase_1_log << "Seeking existing MeetingTeamScore...\r\n"
      result_row = MeetingTeamScore.where(          # ASSERT: there can be only 1 row keyed by this tuple:
        [ "(meeting_id = ?) AND (team_id = ?)",
          -meeting_id, -team_id ]
      ).first
    end

    if result_row                                   # We must differentiate the result: positive for data_import tables only, negative otherwise
      result_id = - result_row.id
      not_found = false
# DEBUG
      logger.debug( "Found existing Team Score! #{result_row.class.name}, ID:#{result_row.id} => #{result_row.inspect}" )
      @phase_1_log << "Found existing Team Score! #{result_row.class.name}, ID:#{result_row.id} => #{result_row.inspect}\r\n"
    else                                            # Search also inside data_import_xxx table counterpart when unsuccesful:
# DEBUG
      logger.debug( "Seeking existing DataImportMeetingTeamScore..." )
      @phase_1_log << "Seeking existing DataImportMeetingTeamScore...\r\n"
                                                    # ASSERT: there can be only 1 row keyed by this tuple:
      result_row = DataImportMeetingTeamScore.where(
        [ "(data_import_session_id = ?) AND " +
          "(#{meeting_id < 0 ? '' : 'data_import_'}meeting_id = ?) AND " +
          "(#{team_id < 0 ? '' : 'data_import_'}team_id = ?)",
          session_id,
          (meeting_id < 0 ? -meeting_id : meeting_id),
          (team_id < 0 ? -team_id : team_id) ]
      ).first
      if result_row
        result_id = result_row.id
        not_found = false
# DEBUG
        logger.debug( "Found existing Team Score! #{result_row.class.name}, ID:#{result_row.id} => #{result_row.inspect}" )
        @phase_1_log << "Found existing Team Score! #{result_row.class.name}, ID:#{result_row.id} => #{result_row.inspect}\r\n"
      end
    end
                                                    # --- ADD: Nothing existing/conflicting found? => Add a fresh new data-import row
    if not_found
      begin                                         # --- BEGIN transaction ---
        # ASSERT: foreach data-import session, we are treating "atomically" at least 1 "full"
        #         category or context header of data-import at a time.
        #
        #         (This means: no support for half-finished data-imports of team scores,
        #         relay results, individual results of whatever.
        #         If a session halts in the middle of this phase, the only safe way to carry
        #         on is to fix by hand the issue, delete the session and redo from scratch.)
        #
        #         Assuming this, we can safely try to fix a nil +rank+ by just checking
        #         the current data_import temp session (not the destination entity).
                                                    # RANK fixup:
        if ( rank.to_i == 0 && result_score >= 0.0 )# Retrieve previous row in ranking and assign same rank:
          logger.debug( "Rank == 0 (team scores). Searching previous same-scored row to assign same rank..." )
          @phase_1_log << "Rank == 0 (team scores). Searching previous same-scored row to assign same rank...\r\n"
          prev_row = DataImportMeetingTeamScore.where(
            [ "(data_import_session_id = ?) AND " +
              "(#{meeting_id < 0 ? '' : 'data_import_'}meeting_id = ?)",
              session_id,
              (meeting_id < 0 ? -meeting_id : meeting_id)
            ]
          ).last
          if prev_row                               # Assign same rank as "previous" row:
            rank = prev_row.rank
          else                                      # Assign rank as total existing rows + 1 in same category/context:
            tot_rows = DataImportMeetingTeamScore.where(
              [ "(data_import_session_id = ?) AND " +
                "(#{meeting_id < 0 ? '' : 'data_import_'}meeting_id = ?)",
                session_id,
                (meeting_id < 0 ? -meeting_id : meeting_id)
              ]
            ).count
            logger.info( "Previous same-scored row not found. Rank will be the total rows found so far +1 (=#{tot_rows+1})..." )
            @phase_1_log << "Previous same-scored row not found. Rank will be the total rows found so far +1 (=#{tot_rows+1})...\r\n"
            rank = tot_rows + 1
          end
        end

        field_hash = {
          data_import_session_id: session_id,
          import_text: import_text,
          sum_individual_points: result_score,
          sum_relay_points: total_relay_points.to_f,
          # sum_team_points: TODO
          # :meeting_individual_points=> TODO
          # :meeting_relay_points     => TODO
          # :meeting_team_points      => TODO
          # :season_individual_points => TODO
          # :season_relay_points      => TODO
          # :season_team_points       => TODO
          # team_affiliation_id will be updated upon Team/TeamAffiliation commit
          rank: rank.to_i,
          season_id: season_id,
          user_id: @current_admin_id
        }.merge(
          meeting_id.to_i < 0 ? { meeting_id: -meeting_id } : { data_import_meeting_id: meeting_id }
        ).merge(
          team_id.to_i < 0 ? { team_id: -team_id } : { data_import_team_id: team_id }
        )

        DataImportMeetingTeamScore.transaction do
          result_row = DataImportMeetingTeamScore.new( field_hash )
          result_row.save!                          # raise automatically an exception if save is not successful
        end
      rescue                                        # --- RESCUE (failed) transaction ---
        @phase_1_log << "\r\nDataImportMeetingTeamScore creation: exception caught during save!\r\n"
        @phase_1_log << "#{ $!.to_s }\r\n" if $!
        logger.error( "\r\n*** DataImportMeetingTeamScore creation: exception caught during save!" )
        logger.error( "*** #{ $!.to_s }\r\n" ) if $!
        flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
      else
        result_id = result_row.id
# DEBUG
        logger.debug( "Created :data_import_meeting_team_scores, ID:'#{result_id}'." )
        @phase_1_log << "Created :data_import_meeting_team_scores, ID:'#{result_id}'.\r\n"
        @stored_data_rows += 1
      end                                           # --- END transaction ---
    end

    result_id
  end
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------



  # Given the individual results parsed from the text file, an existing and
  # corresponding Swimmer is searched for.
  # Whenever none is found a new one is added to the temp table data_import_swimmer.
  #
  # == Returns: the corresponding id of searched entity row,
  #   - positive if freshly added into its dedicated data_import_xxx table;
  #   - negative IDs only for already existing/commited rows in "standard" entity;
  #   - 0 only on error/unable to process.
  #
  def search_or_add_a_corresponding_swimmer( session_id, swimmer_name, swimmer_year, gender_type_id )
    return 0 if swimmer_name.nil? || swimmer_name.size < 2
                                                    # --- FIELD SETUP: Extract field values before the search:
    complete_name = swimmer_name.gsub(/\s+/, ' ')
    splitted_name = swimmer_name.gsub(/\s{3,}/, '  ').split('  ') # Normalize multi-space separator between last_name and first_name
    last_name = first_name = nil
# DEBUG
#    @phase_1_log << "Processing swimmer_name='#{swimmer_name}', splitted_name='#{splitted_name.inspect}'\r\n"
                                                    # (Must find a "separator length" that at least results in a last_name + first_name array)
    if splitted_name.size < 2                       # Substitute all >= 3-space gaps with a constant 2-space gap:
      splitted_name = (splitted_name[0]).split(' ')
    end
    if splitted_name.size == 2                      # Use last & first name only when the splitting is certain
      last_name  = splitted_name[0]
      first_name = splitted_name.reject{ |s| s == last_name }.join(' ')
    end
# DEBUG
#    logger.debug( "Seeking Swimmer (#{swimmer_name}='#{last_name}'+'#{first_name}', #{swimmer_year}, splitted_name='#{splitted_name.inspect}')..." )
#    @phase_1_log << "Seeking Swimmer swimmer_name='#{complete_name}', splitted_name='#{splitted_name.inspect}' = '#{last_name}' + '#{first_name}'\r\n"
    result_id = 0
    not_found = true

                                                    # --- SEARCH for any existing/conflicting rows (DO NOT create forcibly one each time)
# TODO [Steve, 20131106] Toggle ON/OFF fuzzy search for names also upon parameter/checkbox:
#    unless result_row
#      matcher = FuzzyStringMatcher.new( Swimmer.where(year_of_birth: swimmer_year), :complete_name )
#      result_row = matcher.find( swimmer_name, FuzzyStringMatcher::BIAS_SCORE_BEST )
#    end
    result_row = Swimmer.where(
      [
        "(year_of_birth = ?) AND (complete_name LIKE ?)",
        swimmer_year, complete_name+'%'
      ]
    ).first # unless result_row

    if result_row                                   # We must differentiate the result: negative for Swimmer, positive for DataImportSwimmer
      result_id = - result_row.id
      not_found = false
# DEBUG
#      logger.debug( "Swimmer found! (ID=#{result_id})" )
    else                                            # Search also inside DataImportSwimmer when unsuccesful:
# TODO [Steve, 20131106] Toggle ON/OFF fuzzy search for names also upon parameter/checkbox:
#      unless result_row
#        matcher = FuzzyStringMatcher.new(
#          DataImportSwimmer.where(data_import_session_id: session_id, year_of_birth: swimmer_year),
#          :complete_name
#        )
#        result_row = matcher.find( swimmer_name, FuzzyStringMatcher::BIAS_SCORE_BEST )
#      end
      result_row = DataImportSwimmer.where(
        [ "(data_import_session_id = ?) AND (year_of_birth = ?) AND (complete_name LIKE ?)",
          session_id, swimmer_year, complete_name+'%'
        ]
      ).first # unless result_row

      if result_row
        result_id = result_row.id
        not_found = false
# DEBUG
#        logger.debug( "DataImportSwimmer found! (ID=#{result_id})" )
      end
    end
                                                    # --- ADD: Nothing existing/conflicting found? => Add a fresh new data-import row
    if not_found
      begin                                         # --- BEGIN transaction ---
# DEBUG
#        logger.debug( "Swimmer not found: creating new DataImportSwimmer row..." )
        DataImportSwimmer.transaction do
          result_row = DataImportSwimmer.new(
            data_import_session_id: session_id,
            import_text: "#{swimmer_name}, #{swimmer_year}",
            last_name: last_name,
            first_name: first_name,
            complete_name: complete_name,
            year_of_birth: swimmer_year,
            gender_type_id: gender_type_id,
            user_id: @current_admin_id
          )
          result_row.save!                          # raise automatically an exception if save is not successful
        end
      rescue                                        # --- RESCUE (failed) transaction ---
        @phase_1_log << "\r\nDataImportSwimmer creation: exception caught during save! (Data: #{complete_name}='#{last_name}'+'#{first_name}', #{swimmer_year})\r\n"
        @phase_1_log << "#{ $!.to_s }\r\n" if $!
        logger.error( "\r\n*** DataImportSwimmer creation: exception caught during save! (Data: #{swimmer_name}='#{last_name}'+'#{first_name}', #{swimmer_year})" )
        logger.error( "*** #{ $!.to_s }\r\n" ) if $!
        flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
      else
        result_id = result_row.id
        @stored_data_rows += 1
      end                                           # --- END transaction ---
    end

    result_id
  end
  # ---------------------------------------------------------------------------


  # Given the individual results parsed from the text file, an existing and
  # corresponding row in Teams is searched for.
  # Whenever none is found a new one is added to the temp table data_import_team.
  #
  # === Note:
  # Team add/creation is considered as "mission-critical" since a wrong Team
  # assignation (due to typos or mistakes during manual data-input) could forfait
  # a whole bunch of results data.
  #
  # Normally the automatic Team creation procedure is disabled and requires a
  # separate pre-analysis stage, with a statistical report of the best-match
  # data before actual data insertion.
  #
  # === Entity look-up order/algorithm:
  # 1) Scan TeamAffiliation to seek affiliations created/inserted from
  #    previous runs, which allegedly should have name just like '<team_name>%'.
  # => if found, Team must exist (due to validations)
  #
  # 2) If not found, scan if the wanted 'team_name' was just inserted into
  #    DataImportTeam (due to be committed on next phase).
  #
  # 3) If not found, scan Team with some fuzzy-logic metric to seek for a
  #    "best-match", but using a very-high bias score (>= 0.98).
  #    This should be the last resort, since a positive match could be wrong
  #    anyway if the bias is not high enough.
  #
  # 3.1) Additional (*integrity*) check on TeamAffiliation:
  #    If a Team was found, we can actually create at this point the missing
  #    TeamAffiliation using the searched <team_name>.
  #    (NOTE: THIS IS THE ONLY STAGE AND SITUATION IN WHICH TeamAffiliations are
  #     added when missing because their corresponding Team is already found!
  #     During phase 3 TeamAffiliations are _always_ added because all the Teams
  #     processed there are considered as "new" or missing.)
  #
  # 4) If all else fails, insert a new Team ONLY if its enabling flag has been
  #    set to true (force_missing_team_creation).
  #
  # == Returns: the corresponding id of searched entity row,
  #   - positive if freshly added into its dedicated data_import_xxx table;
  #   - negative IDs only for already existing/commited rows in "standard" entity;
  #   - 0 only on error/unable to process.
  #
  def search_or_add_a_corresponding_team( session_id, season_id, team_name,
                                          force_missing_team_creation = false )
    return 0 if team_name.nil? || team_name.size < 2
    result_id = 0
    not_found = true
                                                    # --- SEARCH for any existing/conflicting rows (DO NOT create forcibly one each time)
# DEBUG
    logger.debug( "Seeking TeamAffiliation '#{team_name}'..." )
    @phase_1_log << "Seeking TeamAffiliation '#{team_name}'...\r\n"
                                                    # *** (1) SCAN TeamAffiliation:
    team_affiliation = TeamAffiliation.where([      # Search of TeamAffiliation name is more strict (it shouldn't change at all in the same season;
        "(name LIKE ?)",                            # also, we extend the search to a very similar name in ANY season, just to find the actual team)
        team_name+'%'
    ]).first
    if team_affiliation
      result_row = team_affiliation.team
      result_id = - result_row.id                   # We must differentiate the result: negative for Team, positive for DataImportTeam
      not_found = false
    end
                                                    # *** (2) SCAN DataImportTeam:
    if not_found
      # [Steve, 20131106] We must do a "strict search" on the rows that we may
      # have already inserted, since new data_import rows always
      # will have the same exact team_name that we are searching.
      # If nothing will come out of this, we can then try some more exotic stuff,
      # like fuzzy searching the "absolute" Team.name in the destination entity.
      result_row = DataImportTeam.where([
          "(data_import_session_id = ?) AND (name LIKE ?)",
          session_id, team_name+'%'
      ]).first
      if result_row                                 # Existing team found in data_import_teams? (Yet to be committed)
        result_id = result_row.id                   # We must differentiate the result: negative for Team, positive for DataImportTeam
        not_found = false
# DEBUG
        logger.debug( "DataImportTeam found! (ID=#{result_id})" )
        @phase_1_log << "DataImportTeam found! (ID=#{result_id})...\r\n"
      end
    end
                                                    # *** (3) SCAN DataImportTeamAlias
    if not_found
      result_row = DataImportTeamAlias.where(["(name = ?)", team_name]).first
      if result_row                                 # Existing team found in aliases?
        result_id = - result_row.team_id            # Signal that this ID belongs to a Team (already committed)
        not_found = false
# DEBUG
        logger.debug( "Team ALIAS found! (ID=#{result_id})" )
        @phase_1_log << "Team ALIAS found! (ID=#{result_id})...\r\n"
      end
    end
                                                    # *** (4) FUZZY SCAN on Teams:
    if not_found
      matcher = FuzzyStringMatcher.new( Team.all, :name, :editable_name )
      result_row = matcher.find( team_name, FuzzyStringMatcher::BIAS_SCORE_BEST )
      if result_row
# DEBUG
        logger.debug( "Team found by (strict) fuzzy search! (with ID=#{result_row.id})" )
        @phase_1_log << "Using best-match '#{result_row.name}' (Team ID: #{result_row.id}) for '#{team_name}'.\r\n"
        @team_analysis_log << "Using best-match '#{result_row.name}' (Team ID: #{result_row.id}) for '#{team_name}'.\r\n"
        logger.info( "Using best-match '#{result_row.name}' (Team ID: #{result_row.id}) for '#{team_name}'.\r\b" )
        result_id = - result_row.id                 # We must differentiate the result: negative for Team, positive for DataImportTeam
        not_found = false
      end
    end

    if result_id < 0                                # Do we have an actual Team? => INTEGRITY Check on TeamAffiliation
      team_affiliation = TeamAffiliation.where(     # Check if there is (& there must be) a corresponding TeamAffiliation for THIS season: if missing, add it.
        team_id: - result_id,
        season_id: season_id
      ).first
                                                    # Always add any MISSING TeamAffiliation
      unless team_affiliation                       # (since the allegedly linked Team was found)
        begin
          TeamAffiliation.transaction do
            team_affiliation = TeamAffiliation.new(
              name: team_name,             # Use the actual provided (and searched) name instead of the result_row.name
              team_id: -result_id,
              season_id: season_id,
              is_autofilled: true,               # signal that we have guessed some of the values
              must_calculate_goggle_cup: false,
              user_id: @current_admin_id
              # FIXME Unable to guess team affiliation number (not filled-in, to be added by hand)
            )
            # (ASSERT: assuming TeamAffiliation DOES NOT exist if the Team row is missing)
            team_affiliation.save!                  # raise automatically an exception if save is not successful
          end
        rescue
          @phase_1_log << "\r\nDataImportTeam, TeamAffiliation creation: exception caught during save! (Name:'#{team_name}')\r\n"
          @phase_1_log << "#{ $!.to_s }\r\n" if $!
          logger.error( "\r\n*** DataImportTeam, TeamAffiliation creation: exception caught during save! (Name:'#{team_name}')" )
          logger.error( "*** #{ $!.to_s }\r\n" ) if $!
          flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
        end
      end # (END unless team_affiliation)
    end
                                                    # --- ADD: Nothing existing/conflicting found? => Add a fresh new data-import row
    if not_found && (!force_missing_team_creation)
      result = TeamNameAnalizer.new.analyze(
          team_name, season_id,
          @team_analysis_log,
          @sql_executable_log,
          0.99, 0.8
      )
      @team_analysis_log  = result.analysis_log_text
      @sql_executable_log = result.sql_text
      result.data_import_session_id = session_id
# FIXME Array structure is no more needed!
      @team_analysis_results << result
      begin                                         # Make sure we haven't already inserted an analysis result like this:
        DataImportTeamAnalysisResult.transaction do
          if ( DataImportTeamAnalysisResult.where(
                  data_import_session_id: result.data_import_session_id,
                  searched_team_name: result.searched_team_name,
                  desired_season_id: result.desired_season_id
               ).none? )
            result.save!
          end
        end
      rescue
        @phase_1_log << "\r\nDataImportTeamAnalysisResult creation: exception caught during save! (Result:#{result})\r\n"
        @phase_1_log << "#{ $!.to_s }\r\n" if $!
        logger.error( "\r\n*** DataImportTeamAnalysisResult creation: exception caught during save! (Result:#{result})\r\n" )
        logger.error( "*** #{ $!.to_s }\r\n" ) if $!
        flash[:error] = "(DataImportTeamAnalysisResult): #{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
      else
        flash[:info] = I18n.t('admin_import.team_analysis_needed')
      end
      return 0
    end

    if not_found                                    # --- FIELD SETUP: Extract field values before the search:
      city_id = search_or_add_a_corresponding_city(
        session_id,
        CityComparator.guess_city_from_team_name( team_name )
      )
      begin                                         # --- BEGIN transaction ---
# DEBUG
#        logger.debug( "Team not found: creating new DataImportTeam row..." )
        field_hash = {
          data_import_session_id: session_id,
          import_text: team_name,
          name: team_name,
          user_id: @current_admin_id
        }.merge(
          city_id.to_i < 0 ? { city_id: -city_id } : { data_import_city_id: city_id }
        )

        DataImportTeam.transaction do
          result_row = DataImportTeam.new( field_hash )
          result_row.save!                          # raise automatically an exception if save is not successful
        end
      rescue                                        # --- RESCUE (failed) transaction ---
        @phase_1_log << "\r\nDataImportTeam creation: exception caught during save! (Name:'#{team_name}')\r\n"
        @phase_1_log << "#{ $!.to_s }\r\n" if $!
        logger.error( "\r\n*** DataImportTeam creation: exception caught during save! (Name:'#{team_name}')" )
        logger.error( "*** #{ $!.to_s }\r\n" ) if $!
        flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
      else
        result_id = result_row.id
# DEBUG
        logger.debug( "Created data_import_team, ID:'#{result_id}', '#{result_row.name}'." )
        @phase_1_log << "Created data_import_team, ID:'#{result_id}', '#{result_row.name}'.\r\n"
        @stored_data_rows += 1
      end                                           # --- END transaction ---
    end

    result_id
  end
  # ---------------------------------------------------------------------------


  # Given the individual results parsed from the text file, an existing and
  # corresponding Badge is searched for.
  # Whenever none is found a new one is added to the temp table data_import_badge.
  #
  # == Returns: the corresponding id of searched entity row,
  #   - positive if freshly added into its dedicated data_import_xxx table;
  #   - negative IDs only for already existing/commited rows in "standard" entity;
  #   - 0 only on error/unable to process.
  #
  def search_or_add_a_corresponding_badge( session_id, badge_code, season_id, team_id, swimmer_id,
                                           category_type_id, entry_time_type_id )
    return 0 if badge_code.nil? || badge_code.size < 2
                                                    # --- FIELD SETUP: Extract field values before the search:
    result_id = 0
    not_found = true
# DEBUG
#    logger.debug( "Seeking Badge '#{badge_code}'..." )
#    @phase_1_log << "Seeking Badge '#{badge_code}'...\r\n"

                                                    # --- SEARCH for any existing/conflicting rows (DO NOT create forcibly one each time)
    result_row = Badge.where( ["(number LIKE ?)", badge_code+'%'] ).first
    if result_row                                   # We must differentiate the result: negative for Badge, positive for DataImportBadge
      result_id = - result_row.id
      not_found = false
# DEBUG
#      logger.debug( "Badge found! (ID=#{result_id})" )
    else                                            # Search also inside DataImportBadge when unsuccesful:
      result_row = DataImportBadge.where(
        [ "(data_import_session_id = ?) AND (number LIKE ?)",
          session_id, badge_code+'%' ]
      ).first
      if result_row
        result_id = result_row.id
        not_found = false
# DEBUG
#        logger.debug( "DataImportBadge found! (ID=#{result_id})" )
      end
    end
                                                    # --- ADD: Nothing existing/conflicting found? => Add a fresh new data-import row
    if not_found
      begin                                         # --- BEGIN transaction ---
# DEBUG
#        logger.debug( "Badge not found: creating new DataImportBadge row..." )
        field_hash = {
          data_import_session_id: session_id,
          import_text: badge_code,
          number: badge_code,
          category_type_id: category_type_id,
          entry_time_type_id: entry_time_type_id,
          season_id: season_id,
          user_id: @current_admin_id
        }.merge(
          swimmer_id.to_i < 0 ? { swimmer_id: -swimmer_id } : { data_import_swimmer_id: swimmer_id }
        ).merge(
          team_id.to_i < 0 ?    { team_id: -team_id } : { data_import_team_id: team_id }
        )

        DataImportBadge.transaction do
          result_row = DataImportBadge.new( field_hash )
          result_row.save!                          # raise automatically an exception if save is not successful
        end
      rescue                                        # --- RESCUE (failed) transaction ---
        @phase_1_log << "\r\nDataImportBadge creation: exception caught during save! (Number:'#{badge_code}')\r\n"
        @phase_1_log << "#{ $!.to_s }\r\n" if $!
        logger.error( "\r\n*** DataImportBadge creation: exception caught during save! (Number='#{badge_code}')" )
        logger.error( "*** #{ $!.to_s }\r\n" ) if $!
        flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
      else
        result_id = result_row.id
        @stored_data_rows += 1
      end                                           # --- END transaction ---
    end

    result_id
  end
  # ---------------------------------------------------------------------------


  # Given the individual results parsed from the text file, an existing and
  # corresponding City is searched for.
  # Whenever none is found a new one is added to the temp table data_import_city.
  #
  # == Params:
  # session_id: the id of the current data_import_session row
  # city_name: a text containing "name,area,zip,country,country_code", all separated by comma (no spaces).
  #
  # == Returns: the corresponding id of searched entity row,
  #   - positive if freshly added into its dedicated data_import_xxx table;
  #   - negative IDs only for already existing/commited rows in "standard" entity;
  #   - 0 only on error/unable to process.
  #
  def search_or_add_a_corresponding_city( session_id, city_name )
    return 0 if city_name.nil? || city_name.size < 2
                                                    # --- FIELD SETUP: Extract field values before the search:
    names = city_name.split(',')
# DEBUG
#    logger.debug( "Seeking City '#{names.inspect}'..." )
#    @phase_1_log << "Seeking City '#{names.inspect}'...\r\n"
    result_id     = 0
    not_found     = true
    name          = names.size > 0 ? names[0] : '?'
    area          = names.size > 1 ? names[1] : '?'
    zip           = names.size > 2 ? names[2] : '?'
    country       = names.size > 3 ? names[3] : 'Italia'
    country_code  = names.size > 4 ? names[4] : 'ITA'

                                                    # --- SEARCH for any existing/conflicting rows (DO NOT create forcibly one each time)
    result_row = nil
    City.all.each { |city|                          # Loop on all pre-inserted cities and search for a match
      is_same_city = CityComparator.seems_the_same(
        name,         city.name,
        area,         city.area,
        country_code, city.country_code
      )
      if is_same_city
        result_row = city
        break
      end
    }
    # XXX [Steve, 20131101] Old SQL-pure method, too strict:
#    result_row = City.where( ["(name LIKE ?) AND (area LIKE ?) AND (country_code LIKE ?)", name+'%', area+'%', country_code+'%'] ).first
    if result_row                                   # We must differentiate the result: negative for City, positive for DataImportCity
      result_id = - result_row.id
      not_found = false
# DEBUG
#      logger.debug( "City found! (#{result_row.name}, ID=#{result_id})" )
    else                                            # Search also inside DataImportTeam when unsuccesful:
      DataImportCity.all.each { |city|              # Loop on all pre-inserted cities and search for a match
        is_same_city = CityComparator.seems_the_same(
          name,         city.name,
          area,         city.area,
          country_code, city.country_code
        )
        if is_same_city
          result_row = city
          break
        end
      }
      # XXX [Steve, 20131101] Old SQL-pure method, too strict:
#      result_row = DataImportCity.where(
#        [ "(data_import_session_id = ?) AND (name LIKE ?) AND (area LIKE ?) AND (country_code LIKE ?)",
#          session_id, name+'%', area+'%', country_code+'%' ]
#      ).first
      if result_row
        result_id = result_row.id
        not_found = false
# DEBUG
#        logger.debug( "DataImportCity found! (#{result_row.name}, ID=#{result_id})" )
      end
    end
                                                    # --- ADD: Nothing existing/conflicting found? => Add a fresh new data-import row
    if not_found
      begin                                         # --- BEGIN transaction ---
# DEBUG
        logger.debug( "City not found: creating new DataImportCity row..." )
        DataImportCity.transaction do
          result_row = DataImportCity.new(
            data_import_session_id: session_id,
            import_text: city_name,
            name: name,
            zip: zip,
            area: area,
            country: country,
            country_code: country_code,
            user_id: @current_admin_id
          )
          result_row.save!                          # raise automatically an exception if save is not successful
        end
      rescue                                        # --- RESCUE (failed) transaction ---
        @phase_1_log << "\r\nDataImportCity creation: exception caught during save! (#{names.inspect})\r\n"
        @phase_1_log << "#{ $!.to_s }\r\n" if $!
        logger.error( "\r\n*** DataImportCity creation: exception caught during save! (#{names.inspect})" )
        logger.error( "*** #{ $!.to_s }\r\n" ) if $!
        flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
      else
        result_id = result_row.id
        @stored_data_rows += 1
      end                                           # --- END transaction ---
    end

    result_id
  end
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------
end
# -----------------------------------------------------------------------------
