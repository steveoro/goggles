# encoding: utf-8
require 'fileutils'                                 # Used to process filenames
require 'common/format'

require_relative '../../../data_import/v2/dao/header_fields_dao'
require_relative '../../../data_import/v2/services/team_name_analyzer'
require_relative '../../../data_import/v2/services/swimmer_name_analyzer'

require_relative '../../../data_import/v2/strategies/filename_parser'
require_relative '../../../data_import/v2/strategies/meeting_date_parser'
require_relative '../../../data_import/v2/strategies/fin_result_parser'
require_relative '../../../data_import/v2/strategies/fin_result_phase2'
require_relative '../../../data_import/v2/strategies/fin_result_phase3'
require_relative '../../../data_import/v2/strategies/parse_result_converter'
require_relative '../../../data_import/v2/strategies/season_detect_utils'

require_relative '../../../data_import/v2/services/meeting_header_year_checker'
require_relative '../../../data_import/v2/services/meeting_notes_organization_checker'
require_relative '../../../data_import/v2/services/data_import_meeting_builder'
require_relative '../../../data_import/v2/services/data_import_meeting_session_builder'


=begin

= DataImporter

  - Goggles framework vers.:  4.00.757
  - author: Steve A.

  Data-Import strategy class.
  Refactored from the old DataImportController implementation.

=end
class DataImporter
  include V2::SeasonDetectUtils
  include V2::FinResultPhase2
  include V2::FinResultPhase3

  attr_reader   :logger, :flash, :data_import_session,
                :import_log,
                :analysis_log,
                :sql_executable_log,
                :header_fields_dao,
                :meeting,                           # serialized meeting
                :result_hash

  attr_accessor :full_pathname,
                :season,
                :current_admin_id,
                :force_missing_meeting_creation,
                :force_team_or_swimmer_creation,
                :do_not_consume_file,
                :log_dir
  #-- -------------------------------------------------------------------------
  #++

  # Creates a new instance.
  # When the logger is not given the default is to use the current Rails.logger.
  # If the data_import_session is not given a new one will be created.
  #
  def initialize( logger = nil, flash = nil, data_import_session = nil )
    @logger = logger || Rails.logger
    @flash  = flash  || {}
    @data_import_session    = data_import_session || create_new_data_import_session()
    @analysis_log           = ''                    # Full team analysis phase log
    @sql_executable_log     = ''                    # SQL 'suggested actions' from Team Analysis phase
    @import_log             = ''                    # Combined import log
                                                    # Batch parameters' default
    @season                 = @data_import_session.season
    @full_pathname          = @data_import_session.file_name
    header_fields_dao_init_from_filename if @full_pathname
    @current_admin_id       = @data_import_session.user_id
    @force_missing_meeting_creation = false
    @force_team_or_swimmer_creation = false
    @do_not_consume_file            = false
    @log_dir = File.join( Rails.root, 'log' )
  end


  # Sets the internal parameter/members using a block before execution.
  #
  # == Existing definable members/parameters:
  #
  #  - :full_pathname
  #  - :season
  #  - :current_admin_id
  #  - :force_missing_meeting_creation
  #  - :force_team_or_swimmer_creation
  #  - :do_not_consume_file
  #  - :log_dir
  #
  def set_up( options = {} )
    options.each do |key, value|
      send("#{key}=", value)
      # Force header_fields_dao init on filename change:
      header_fields_dao_init_from_filename if key == :full_pathname
    end
    # Synchronize any important member changes with the stored session:
    if options[:full_pathname] || options[:season]
      @data_import_session.file_name = @full_pathname
      @data_import_session.data_import_season_id = @season.id if @season.instance_of?( DataImportSeason )
      @data_import_session.season_id = @season.id if @season.instance_of?( Season )
      @data_import_session.save!
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Destroys the current Data-import session, including its linked secondary entities.
  # After a successful execution the internal member linking to the session becomes
  # invalid (+nil+) and the current instance should be considered trashable.
  # (We do not force that because the log members could still prove useful.)
  #
  def destroy_data_import_session()
    if ( @data_import_session )                     # For a safety clean-up, check also if the file wasn't consumed properly after phase-1:
      unless @data_import_session.file_name.nil?
        fullpathname = File.join( Dir.pwd, @data_import_session.file_name )
        if ( FileTest.exists?(fullpathname) && !@do_not_consume_file )
          update_logs( "-- destroy_data_import_session(#{ @data_import_session.id }): the import file wasn't consumed properly after phase-1. Erasing it..." )
          FileUtils.rm( fullpathname )
        end
      end
                                                    # For all data_import_... tables, delete rows for the corresponding data_import_session.id
      DataImportMeetingIndividualResult.delete_all( data_import_session_id: @data_import_session.id )
      DataImportMeetingEntry.delete_all( data_import_session_id: @data_import_session.id )
      DataImportMeetingProgram.delete_all( data_import_session_id: @data_import_session.id )
      DataImportMeetingRelayResult.delete_all( data_import_session_id: @data_import_session.id )
      DataImportMeetingSession.delete_all( data_import_session_id: @data_import_session.id )
      DataImportMeetingTeamScore.delete_all( data_import_session_id: @data_import_session.id )
      DataImportMeeting.delete_all( data_import_session_id: @data_import_session.id )
      DataImportSeason.delete_all( data_import_session_id: @data_import_session.id )
      DataImportSwimmer.delete_all( data_import_session_id: @data_import_session.id )
      DataImportTeam.delete_all( data_import_session_id: @data_import_session.id )
      DataImportBadge.delete_all( data_import_session_id: @data_import_session.id )
      DataImportCity.delete_all( data_import_session_id: @data_import_session.id )
      DataImportTeamAnalysisResult.delete_all( data_import_session_id: @data_import_session.id )
      DataImportSwimmerAnalysisResult.delete_all( data_import_session_id: @data_import_session.id )
      DataImportSession.delete( @data_import_session.id )
      @logger.info(  ) if @logger
      update_logs( "-- destroy_data_import_session(#{ @data_import_session.id }): data-import session clean-up done.\r\n" )
      @data_import_session = nil
    else
      update_logs( "-- destroy_data_import_session(#{ @data_import_session.id }): warning: unable to find the specified data-import session master record.\r\n" )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns the current (complete) #import_log filename
  def import_log_filename
    "#{ get_log_basename }#{ get_log_extension }"
  end

  # Generic log-to-file dumper.
  # Stores the text contents specified to a chosen filename (assuming permissions
  # are correctly set for the current #log_dir).
  #
  # If found, file is overwritten, otherwise is created.
  # Default #write_mode is 'a' (append); use 'w' to overwrite each time.
  #
  def to_logfile( log_contents, header_text = nil, footer_text = nil,
                  extension = get_log_extension(), write_mode = 'a' )
    log_basename = get_log_basename()
    if log_contents.size > 0
      File.open( log_basename + extension, write_mode ) do |f|
        f.puts header_text if header_text
        f.puts log_contents
        f.puts footer_text if footer_text
      end
    end
  end

  # Writes the current, complete import log concerning all the Phases that have
  # been successfully completed, up to the moment of the invocation.
  #
  def write_import_logfile
    to_logfile(
      @import_log,
      flash[:error] ? "               *** Latest flash[:error]: ***\r\n#{flash[:error] }\r\n-----------------------------------------------------------\r\n" : nil,
      nil, # (no additional footer)
      get_log_extension
    )
  end

  # Writes the current Team-Analysis to its dedicated logfile,
  # plus its own "suggested SQL operations" list file, which
  # is handled separately from the ultimate "SQL diff" produced
  # at the end of the Phase-3.
  #
  # Due to the fact that the phase 1.1 can be invoked just to get the resulting logs
  # (without actually terminating the SQL statements required), the #is_ok flag
  # signals whether the phase has been completed and executed without errors, and
  # an '.ok' additional extension is added to the resulting log files (if #is_ok is +true+).
  #
  def write_analysis_logfile( is_ok = false )
    to_logfile(
      @analysis_log,
      nil, # (no additional header)
      nil, # (no additional footer)
      is_ok ? ".11.ok#{get_log_extension}" : ".11#{get_log_extension}"
    )
    to_logfile(
      @sql_executable_log,
      "--\r\n-- *** Suggested SQL actions: ***\r\n--\r\n\r\nSET AUTOCOMMIT = 0;\r\nSTART TRANSACTION;\r\n\r\n",
      "\r\nCOMMIT;",
      is_ok ? '.11.ok.sql' : '.11.sql'
    )
  end

  # Writes the current Team-Analysis to its dedicated logfile,
  # overwriting any existing file (or creating it if not already existing).
  #
  def write_sql_diff_logfile
    to_logfile(
      @data_import_session ? @data_import_session.sql_diff : '',
      "-- *** SQL Diff file for #{ File.basename(@full_pathname) } ***\r\n-- Timestamp: #{ get_iso_timestamp }\r\n",
      "\r\n-- Last completed phase code: %02d" % get_last_completed_phase,
      ".%02d.diff.sql" % get_last_completed_phase
    )
  end
  #-- -------------------------------------------------------------------------
  #++

  # Sets the internal log variables, dedicated to store the result of the external phase 1.1.
  def set_analysis_logs( analysis_log, sql_diff_log )
    @analysis_log       = analysis_log
    @sql_executable_log = sql_diff_log
  end

  # Getter for the total of #committed_data_rows
  def get_committed_data_rows
    @committed_data_rows
  end
  #-- -------------------------------------------------------------------------
  #++


  # Executes a single data-import task as a whole process, without phases
  # interruption, using a delayed_job-compatible +perform+ method signature.
  #
  # If the internal +season+ member is not defined, it will be deduced from
  # the current pathname of the file.
  #
  # With the delayed_job gem, (typically, inside a rake task) use:
  #
  #     data_importer = DataImporter.new( logger, flash )
  #     data_importer.set_up(
  #       full_pathname:                  filename_to_be_parsed,
  #       force_missing_meeting_creation: force_missing_meeting_creation,
  #       force_team_or_swimmer_creation:    force_team_or_swimmer_creation,
  #       # do_not_consume_file:           false, # (default)
  #       current_admin_id:               current_admin.id
  #     )
  #     data_importer.delay( queue: 'data-import' ).perform()
  #
  # ...To add this to the delayed_job queue on the database.
  #
  def perform()
    full_log_filename = get_log_basename() + get_log_extension()
    phase_1_parse()
    data_import_session = phase_1_2_serialize
    if data_import_session
      is_ok = phase_3_commit()
      raise "Error during COMMIT phase! Check the log file: '#{full_log_filename}'." unless is_ok
    else
      raise "Error during SERIALIZE phase! Check the log file: '#{full_log_filename}'."
    end
    if FileTest.exists?( full_log_filename )
      @logger.info( "-- perform(): renaming log file as '.ok'..." ) if @logger
      File.rename( full_log_filename, full_log_filename+'.ok' )
    end
  end


  # Verbose display name for the delayed job.
  #
  def display_name
    "parse( #{@full_pathname} )"
  end


  # Max attempts used by delayed_job gem.
  #
  def max_attempts
    1
  end
  #-- -------------------------------------------------------------------------
  #++


  # Data-import Phase #1: text parsing.
  #
  # Reads and parses the whole TXT file into a complex Hash result, stored in memory.
  # When all the data is transferred to the temporary tables, the file is consumed (killed)
  # from the upload directory.
  #
  # The #data_import_session member is required to be not +nil+ before invoking this
  # method.
  #
  # === Returns:
  # The currently used #data_import_session instance if successful; +nil+ otherwise.
  #
  def phase_1_parse()
    raise ArgumentError.new("The #full_pathname member must be set before invoking this method!") unless @full_pathname.instance_of?(String)
    return nil unless @data_import_session.instance_of?( DataImportSession )

    @data_import_session.phase_1_log ||= ''         # Init phase log
    update_logs( "--------------------[Phase #1.0 - PARSE]--------------------" )
    update_logs( "Parsing file: #{@full_pathname}, force_missing_meeting_creation=#{@force_missing_meeting_creation}, force_team_or_swimmer_creation=#{@force_team_or_swimmer_creation}, do_not_consume_file=#{@do_not_consume_file}.\r\n" )
    header_fields_dao_init_from_filename()          # Make sure #header_fields_dao is defined
                                                    # Check if it's a "continuation session":
    if @data_import_session.phase > 0
      update_logs( "\r\n*** CONTINUING SESSION (after team name Analysis, stored in separate log file) ***" )
    end
                                                    # FILE TYPE DETECT => '<ris><date_header><code>.txt' for FIN results type
    unless @data_import_session.file_format
      case @header_fields_dao.prefix
      when 'ris'
        @data_import_session.file_format = 'fin-results'
      when /sta|stl/
        @data_import_session.file_format = 'fin-startlist'
      end
      @data_import_session.save!
    end

    if @season.nil?                                 # SEASON DETECT
      try_detect_season_from_file_path
      try_detect_season_from_header_fields
                                                    # (@season must be defined after this point)
      @flash[:error] = "#{ I18n.t('admin_import.season_not_found') })}\r\n#{ @header_fields_dao }" and return nil unless @season
    else
      update_logs( "Specified season ID=#{@season.id}. Parsing file..." )
    end
                                                    # Get the remaining default values from the season instance:
    @header_fields_dao.header_year     = @season.header_year
    @header_fields_dao.edition         = @season.edition
    @header_fields_dao.edition_type_id = @season.edition_type_id
    @header_fields_dao.timing_type_id  = @season.timing_type_id
    update_logs( "\r\nParsed header fields: #{@header_fields_dao}", :debug )

    # Parse the file and store the results in memory, inside the @result_hash member.
    #
    # NOTE: @result_hash has the following structure:
    #     {
    #       parse_result: {
    #         :category_header => [
    #           { id: <category_header_id>, fields: <hash_of_category_header_fields_dao_with_values>,
    #             import_text: last_line_of_text_used_to_extract_all_fields }
    #           ... (one Hash for each <category_header_id>)
    #         ],
    #         :result_row      => [
    #           { id: <category_header_id>, fields: <hash_of_result_row_fields_with_values>,
    #             import_text: last_line_of_text_used_to_extract_all_fields }
    #           ... (one or more Hash for each <category_header_id>, which acts as a "context page index")
    #         ],
    #         ...
    #       },
    #       line_count: tot_file_lines_read,
    #       total_data_rows: sum_of_data_pages_sizes,
    #       full_text_file_contents: full_text_file_contents
    #     }
    #
    # > V2::FinResultParser.field_list_for( context_sym )
    # returns the possible fields for either :category_header || :result_row
    #
    @result_hash = V2::FinResultParser.parse_txt_file( @full_pathname, logger ) # (=> show_progress = false)
                                                    # Make sure the :parse_result member is in 'standard' form:
    @result_hash[:parse_result] = V2::ParseResultConverter.new.to_parse_result(
      @result_hash[:parse_result],
      @result_hash[:parsing_defs],
      @season
    )

    @stored_data_rows = 0
                                                    # Store the raw text file into the data-import session:
    @data_import_session.source_data            = @result_hash[:full_text_file_contents]
    @data_import_session.total_data_rows        = @result_hash[:total_data_rows]
    @data_import_session.data_import_season_id  = @season.instance_of?( DataImportSeason ) ? @season.id : nil
    @data_import_session.season_id              = @season.instance_of?( Season ) ? @season.id : nil
    @data_import_session.phase                  = 10 if @data_import_session.phase < 10
    @data_import_session.phase_3_log            = 'PHASE 1.0 PARSE'
    result = @data_import_session.save ? @data_import_session : nil
    update_logs(
      "\r\nPHASE #1.0 END, returning #{ result ? 'current session' : 'NIL'}.",
      :info, true
    )
                                                    # Update the logs only the first time the parsing phase is executed:
    write_import_logfile if @data_import_session.phase == 10
    result
  end
  #-- -------------------------------------------------------------------------
  #++


  # Data-import Phase #1.2: parsing result serialization phase.
  #
  # This should be called only after a successful Phase 1.0.
  # (It checks for the last completed phase indicator in session and it returns +nil+
  # unless everything is ok.)
  #
  # The current implementation is able to rebuild/import the results of only *one*
  # MeetingSession at a time.
  #
  # Returns +nil+ only on error; otherwise it returns the current #data_import_session
  # instance.
  #
  # After a successful execution, remember to check the actual completion by peeking
  # at the #data_import_session.phase and whether...
  #   @data_import_session.data_import_team_analysis_results.any?
  #   @data_import_session.data_import_swimmer_analysis_results.any?
  # ... Are both +true+.
  #
  # The "Phase #2" of the "data-import wizard" allows the user to manually review
  # the digested/serialized data from the support tables, so that any mistakes or
  # conflicts may be edited (and solved) before the final commit phase (which is phase #3).
  #
  def phase_1_2_serialize()
    return nil unless @data_import_session.instance_of?( DataImportSession ) &&
                      @result_hash.instance_of?(Hash) &&
                      @data_import_session.phase >= 10 && @data_import_session.phase < 12
                                                    # Create just one header row for each one of Meeting/Meeting Session entities:
    season_starting_year = 0                        # This is needed by the individual results
    meeting_header_row = meeting_dates = scheduled_date = nil
    update_logs( "\r\n\r\n--------------------[Phase #1.2 - DIGEST/SERIALIZE]--------------------" )
    update_logs( "Parsing of '#{full_pathname}' done.\r\nDigesting data...", :debug )
                                                    # -- MEETING HEADER digest --
    if @season
      meeting_headers = @result_hash[:parse_result][:meeting_header]
      meeting_header_row = meeting_headers.first if meeting_headers
      if meeting_header_row                         # If the meeting_dates are found inside the data file, use them:
        update_logs( "meeting_header_row = #{meeting_header_row.inspect}", :debug )
        meeting_dates = meeting_header_row[:fields][:meeting_dates]
        # TODO [Steve, 20140923]
        #      The new V2::MeetingDateParser now supports multiple date extraction: this should be used
        #      to extract all meeting_session dates, when possible.
        #      (Marked as FUTUREDEV, since we assume all meeting sessions will be existing
        #       before each data-import execution.)
        scheduled_dates = V2::MeetingDateParser.new.parse( meeting_dates )
        scheduled_date  = scheduled_dates.first if scheduled_dates.instance_of?( Array )
        update_logs( "meeting_dates = '#{meeting_dates}' => #{scheduled_dates.inspect} (USING ONLY: #{scheduled_date})", :debug )
      end
                                                      # ...Otherwise, parse them from the filename/header:
      if scheduled_date.nil? && @header_fields_dao.header_date
        scheduled_date = @header_fields_dao.header_date
        update_logs( "scheduled_date=#{scheduled_date} (set to file name date)", :debug )
      end
                                                      # If we still haven't found the scheduled date, fall back to some defaults:
      if scheduled_date.nil?
        begin
          scheduled_date = @season.begin_date         # This may be null or invalid
        rescue
          scheduled_date = Date.today                 # Extreme fall-back case
        end
      end
    end

    is_ok = true
    if @season                                        # -- PRE-SCAN TEAM & SWIMMER Names --
      season_starting_year = @season.begin_date.year
      update_logs( "Found season '#{@season.inspect}'; #{@season.season_type.inspect}, season_starting_year=#{season_starting_year}", :debug )
      # [Steve, 20150112] The existance of Season is the minimum requirement before
      # starting the Team & Swimmer name analysis sub-phases.
                                                    # Any required prescan will abort the rest of the procedure:
      are_team_names_ok = prescan_parse_result_for_unknown_team_names(
        @data_import_session,
        @season,
        @result_hash[:parse_result],
        @force_team_or_swimmer_creation
      )
      update_logs( "PHASE #1.1: Team name Analysis phase needed!" ) unless are_team_names_ok

      are_swimmer_names_ok = prescan_parse_result_for_unknown_swimmer_names(
        @data_import_session,
        @season,
        @result_hash[:parse_result],
        @force_team_or_swimmer_creation
      )
      update_logs( "PHASE #1.1: Swimmer name Analysis phase needed!" ) unless are_swimmer_names_ok
                                                    # Update is_ok status flag:
      is_ok = are_team_names_ok && are_swimmer_names_ok
    end

    @meeting = nil
    if is_ok && @season                             # -- MEETING (digest/serialization) --
      meeting_builder = V2::DataImportMeetingBuilder.build_from_parameters(
        @data_import_session,
        @season,
        @header_fields_dao,
        meeting_header_row,
        meeting_dates,
        @force_team_or_swimmer_creation
      )
      @meeting = meeting_builder.result_row
    end
                                                    # --- TEAM RANKING/SCORES (digest/serialization) --
    if @meeting                                     # Check for possible validation failures:
      update_logs( "PHASE #1.2: checking possible Meeting validation failures..." )
      sql_diff = V2::MeetingHeaderYearChecker.check_and_fix( @meeting )
      if sql_diff.size > 0
        @data_import_session.sql_diff << sql_diff
        update_logs( "PHASE #1.2: associated Meeting corrected." )
      end

      if meeting_header_row.instance_of?( Hash ) && meeting_header_row.has_key?(:fields)
        update_logs( "PHASE #1.2: checking possible missing Meeting notes/organization..." )
        sql_diff = V2::MeetingNotesOrganizationChecker.check_and_fix(
          @meeting,
          meeting_dates,
          meeting_header_row[:fields][:organization]
        )
        if sql_diff.size > 0
          @data_import_session.sql_diff << sql_diff
          update_logs( "PHASE #1.2: associated Meeting#notes updated with missing value." )
        end
      end
                                                    # Retrieve default meeting session: (used only for new/missing meeting events or programs)
      update_logs( "PHASE #1.2: processing TEAM RANKING/SCORES..." )
      ranking_details = @result_hash[:parse_result][:ranking_row]
      is_ok = process_team_ranking(
          @full_pathname,
          @data_import_session,
          @season,
          @meeting,
          ranking_details,
          @force_team_or_swimmer_creation
      )
    end
                                                    # -- MEETING SESSION (digest/serialization) --
    meeting_session = nil
    if @meeting                                     # Retrieve default meeting session: (used only for new/missing meeting events or programs)
      meeting_session_builder = V2::DataImportMeetingSessionBuilder.build_from_parameters(
        @data_import_session,
        @meeting,
        @header_fields_dao,
        meeting_dates, # meeting_dates_text
        scheduled_date,
        @force_missing_meeting_creation
      )
      meeting_session = meeting_session_builder.result_row
    end
                                                    # --- CATEGORY (digest/serialization) --
    if is_ok && meeting_session
      update_logs( "PHASE #1.2: processing CATEGORY headers..." )
      is_ok = process_category_headers(
          @full_pathname,
          @data_import_session,
          @season,
          season_starting_year,
          @meeting,
          meeting_session,
          @result_hash[:parse_result],
          scheduled_date,
          @force_team_or_swimmer_creation
      )
    end
                                                    # --- RELAY (digest/serialization) --
    if is_ok && meeting_session
      update_logs( "PHASE #1.2: processing RELAY headers..." )
      is_ok = process_relay_headers(
          @full_pathname,
          @data_import_session,
          @season,
          season_starting_year,
          @meeting,
          meeting_session,
          @result_hash[:parse_result],
          scheduled_date,
          @force_team_or_swimmer_creation
      )
    end
                                                    # After having successfully stored the contents, remove the file
    if is_ok
      update_logs( "-- phase_1_parse(#{ @full_pathname }): file processed and 'digested'(serialized) on support tables." )
      unless @do_not_consume_file
        update_logs( "Consuming it..." )
        FileUtils.rm( @full_pathname )
      end
      @data_import_session.phase = 12               # Update "last completed phase" indicator (12 = '1.2')
      @data_import_session.save!
      update_logs(
        "\r\nFile '#{File.basename( @full_pathname )}', created session ID: #{ @data_import_session.id }\r\n" <<
        "Total file lines .....: #{ @result_hash[:line_count] }\r\n" <<
        "Total data headers ...: #{ @result_hash[:total_data_rows] }\r\n" <<
        "Actual stored rows ...: #{ @stored_data_rows }\r\n" <<
        "Meeting ID:...........: #{ @meeting ? @meeting.id : '(nil)' }\r\n" <<
        "Season ID:............: #{ @season ? @season.id : '(nil)' }\r\n" <<
        "File processed.\r\nData-import PHASE #1.2 DONE."
      )
    end
                                                    # Update the global log with the whole phase 1 log
    update_logs(
      "\r\nPHASE #1.2 END, returning #{ is_ok ? '(current session)' : 'NIL'}.",
      :info, true
    )
                                                    # Rewrite the logs & return the result:
    write_import_logfile
    write_sql_diff_logfile if is_ok                 # (Dump the SQL diff file only if phase #1.1 is not required)
    is_ok ? @data_import_session : nil
  end
  #-- -------------------------------------------------------------------------
  #++


  # Data Import Wizard: phase #3 (Phase #2 is manual review of the parsed data)
  # On (editable) data grid final commit, do the actual data import into destination table,
  # logging every error or mismatch and finally displaying it on the dedicated view.
  #
  # === Returns:
  # true on success; false on error.
  #
  def phase_3_commit()
    @flash[:info] = I18n.t(:missing_session_parameter, { scope: [:admin_import] }) if @data_import_session.nil?
    return false unless @data_import_session.instance_of?( DataImportSession ) &&
                        ( @data_import_session.phase == 12 )
                                                    # Check season integrity
    @flash[:info] = I18n.t(:season_not_saved_in_session, { scope: [:admin_import] }) and return false unless @season

    update_logs( "\r\n\r\n--------------------[Phase #3 - COMMIT]--------------------" )
    update_logs( "\r\n-- phase_3_commit: session ID:#{ @data_import_session.id }, season ID: #{ @season.id }..." )
    @data_import_session.phase_2_log = "#{@data_import_session.phase_2_log}\r\nImporting data @ #{Format.a_short_datetime(DateTime.now)}.\r\nCommitting data_import_session ID:#{@data_import_session.id}, season ID: #{@season.id}...\r\n"
    @committed_data_rows = 0
                                                    # Bail out as soon as something is wrong:
    is_ok = commit_data_import_meeting( @data_import_session )
    is_ok = commit_data_import_meeting_session( @data_import_session ) if is_ok
    is_ok = commit_data_import_meeting_program( @data_import_session ) if is_ok
    is_ok = commit_data_import_cities( @data_import_session ) if is_ok
    is_ok = commit_data_import_teams( @data_import_session, @season ) if is_ok
    is_ok = commit_data_import_swimmers( @data_import_session ) if is_ok
    is_ok = commit_data_import_badges( @data_import_session ) if is_ok
    is_ok = commit_data_import_meeting_entries( @data_import_session ) if is_ok
    is_ok = commit_data_import_meeting_individual_results( @data_import_session ) if is_ok
    is_ok = commit_data_import_meeting_relay_results( @data_import_session ) if is_ok
    is_ok = commit_data_import_meeting_team_score( @data_import_session ) if is_ok
    @data_import_session.phase = 30                 # (30 = '3.0', but without successful ending, since the session in not nil)
    @data_import_session.save!
                                                    # Add the commit process log to the combined log for this phase:
    @import_log << @data_import_session.phase_2_log
                                                    # *** SET 'results aquired' flag. This will return the committed/updated meeting:
    @meeting = update_meeting_flags( @data_import_session ) if is_ok

    if @meeting && is_ok                            # *** FIX-UP committed meeting program's begin times:
      is_begin_time_fixed = BeginTimeCalculator.compute_for_all( @meeting, @data_import_session.sql_diff )
      update_logs(
        "\r\nBegin time re-computed for all meeting programs and updated directly on committed entities.\r\n",
        :info, true
      ) if is_begin_time_fixed
    end

    if is_ok
      update_logs(
        "data-import PHASES #2 & #3 DONE.\r\n\r\nTotal committed rows: #{ @committed_data_rows }\r\n" <<
        "Data-import session destroyed successfully.\r\n" <<
        "===========================================================\r\n",
        :info, true
      )
    else                                            # Store data_import_session.phase_2_log if something goes awry:
      if $!
        update_logs(
          "\r\n*** #{ data_import_session.phase_3_log }: exception caught during save!\r\n*** #{ $!.to_s }\r\n",
          :error, true
        )
      end
      @flash[:error] = "#{ I18n.t(:something_went_wrong) } [#{ data_import_session.phase_3_log }]" + ( $! ? ": '#{ $!.to_s }'" : '' )
    end
                                                    # Rewrite the logs & return the result:
    write_import_logfile
    write_sql_diff_logfile
    destroy_data_import_session() if is_ok
    is_ok
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Creates a new data-import session returning its instance.
  #
  def create_new_data_import_session( full_pathname = nil, full_text_file_contents = nil,
                                      total_data_rows = 0, file_format = nil,
                                      season_id = nil, current_admin_id = 1 )
    DataImportSession.create(
      phase:            0,
      file_format:      file_format,
      file_name:        full_pathname,
      source_data:      full_text_file_contents,
      total_data_rows:  total_data_rows,
      season_id:        season_id,
      phase_1_log:      '',
      phase_2_log:      '',
      phase_3_log:      '',
      sql_diff:         '',                         # Actual SQL-diff resulting from the whole data-import procedure
      user_id:          current_admin_id
    )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Filename header digest.
  # This will initialize the internal #header_fields_dao member based on the current
  # value of the #full_pathname of the parsed file. The #result_hash member will
  # be set to +nil+.
  #
  # This method does nothing if called when the header_fields_dao is
  # already defined (it's non-destructive).
  #
  def header_fields_dao_init_from_filename()
    # Bail out if #header_fields_dao is already defined:
    return if @header_fields_dao.instance_of?( HeaderFieldsDAO )
    @header_fields_dao = V2::FilenameParser.new( @full_pathname ).parse
    @result_hash = nil
  end


  # Getter for the log base file name (pathname + log filename w/o extension)
  def get_log_basename
    File.join( @log_dir, "#{get_iso_timestamp}prod_" << (File.basename(@full_pathname).split('.')[0]) )
  end

  # Getter for a string timestamp including the seconds.
  def get_iso_timestamp
    @data_import_session.created_at.strftime("%Y%m%d%H%M")
  end

  # Getter for the last completed phase
  def get_last_completed_phase
    @data_import_session ? @data_import_session.phase : 0
  end

  # Getter for the log extension
  def get_log_extension
    ".%02d.log" % get_last_completed_phase
  end


  # Stores the text +msg+ into the logs (both on the logger & on the support table).
  def update_logs( msg, method = :info, with_save = false )
    @logger.send( method, msg ) if @logger
    @import_log << "#{msg}\r\n"
    # The Log has become too long & complex to be saved into the table!

    # [Steve, 20141111] We cannot save the log on table: the UPDATE statement will take
    # a progressively longer time to complete, slowing the process considerably
    # and eventually make the statement execution fail with MySQL disconnection error.
    # A more quick, professional and permanent solution to obtain the logging serialized
    # on DB it would be to add a separate table entity with a row for each single log
    # event.
    # As it is, the only viable solution is to keep the logging only on file.

    # Quick hack: disregard any update to the log members and keep them just
    # as variables:
#    @data_import_session.phase_1_log_will_change! if with_save
    @data_import_session.phase_1_log << "#{msg}\r\n"
#    if with_save
#      ActiveRecord::Base.verify_active_connections!
#      @data_import_session.save!
#    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- ---------------------------------------------------------------------------
#++
