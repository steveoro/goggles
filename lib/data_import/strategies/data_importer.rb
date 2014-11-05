# encoding: utf-8
require 'fileutils'                                 # Used to process filenames
require 'common/format'

require 'data_import/header_fields_dao'
require 'data_import/services/team_name_analizer'
require 'data_import/strategies/filename_parser'
require 'data_import/strategies/meeting_date_parser'
require 'data_import/strategies/fin_result_parser'
require 'data_import/strategies/fin_result_phase2'
require 'data_import/strategies/fin_result_phase3'

require 'data_import/services/data_import_meeting_builder'
require 'data_import/services/data_import_meeting_session_builder'


=begin

= DataImporter

  - Goggles framework vers.:  4.00.597
  - author: Steve A.

  Data-Import strategy class.
  Refactored from the old DataImportController implementation.

=end
class DataImporter
  include FinResultPhase2
  include FinResultPhase3

  attr_reader   :logger, :flash, :data_import_session,
                :import_log,
                :header_fields_dao,
                :result_hash

  attr_accessor :full_pathname,
                :season,
                :current_admin_id,
                :force_missing_meeting_creation,
                :force_missing_team_creation,
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
    @team_analysis_log      = ''                    # Full team analysis phase log
    @sql_executable_log     = ''                    # SQL 'suggested actions' from Team Analysis phase
    @import_log             = ''                    # Combined import log
    @team_analysis_results  = []
                                                    # Batch parameters' default
    @season                 = @data_import_session.season
    @full_pathname          = @data_import_session.file_name
    header_fields_dao_init_from_filename if @full_pathname
    @current_admin_id       = @data_import_session.user_id
    @force_missing_meeting_creation = false
    @force_missing_team_creation    = false
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
  #  - :force_missing_team_creation
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
  # If found, file is overwritten, otherwise is created.
  #
  def to_logfile( log_contents, header_text = nil, footer_text = nil, extension = get_log_extension() )
    log_basename = get_log_basename()
    if log_contents.size > 0
      File.open( log_basename + extension, 'w' ) do |f|
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
      '.log'
    )
  end

  # Writes the current Team-Analysis to its dedicated logfile,
  # plus its own "suggested SQL operations" list file, which
  # is handled separately from the ultimate "SQL diff" produced
  # at the end of the Phase-3.
  #
  def write_analysis_logfile( is_ok = false )
    to_logfile(
      @team_analysis_log,
      "\t*****************************\r\n\t  Team Analysis Report\r\n\t*****************************\r\n",
      nil, # (no footer)
      is_ok ? '.team.#{get_log_extension}.ok' : '.team.#{get_log_extension}'
    )
    to_logfile(
      @sql_executable_log,
      "--\r\n-- *** Suggested SQL actions: ***\r\n--\r\n\r\nSET AUTOCOMMIT = 0;\r\nSTART TRANSACTION;\r\n\r\n",
      "\r\nCOMMIT;",
      is_ok ? '.team.sql.ok' : '.team.sql'
    )
  end

  # Writes the current Team-Analysis to its dedicated logfile,
  # overwriting any existing file (or creating it if not already existing).
  #
  def write_sql_diff_logfile
    to_logfile(
      @data_import_session ? @data_import_session.sql_diff : '',
      "-- *** SQL Diff file for #{ File.basename(@full_pathname) } ***\r\n-- Timestamp: #{ get_iso_timestamp }\r\n",
      "\r\n\r\n-- Last completed phase code: %02d" % get_last_completed_phase,
      ".diff.sql"
    )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Getter for the total of #committed_data_rows
  def get_committed_data_rows
    @committed_data_rows
  end

  # +true+ if the team_analysis phase was executed
  # due to some problematic team name.
  def has_team_analysis_results
    ( @team_analysis_results.respond_to?(:count) && (@team_analysis_results.count > 0) )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Executes a single data-import task as a whole process, without phases
  # interruption, using a delayed_job-compatible +perform+ method signature.
  #
  # If the internal +season+ member is not defined, it will be deduced from
  # the current pathname of the file.
  #
  # With the delayed_job gem, use:
  #
  #        data_importer.delay( queue: 'data-import' ).perform()
  #
  # ...To add this to the delayed_job queue on the database.
  #
  def perform()
    full_log_filename = get_log_basename() +'.log'
    data_import_session = phase_1_parse()
    if data_import_session
      is_ok = commit(
        data_import_session,
        !@do_not_consume_file                       # Remove left-over files?
      )

      unless is_ok                                  # Report error on commit phase
        to_logfile( @import_log, nil, nil, '.perform.log' )
        raise "Error during COMMIT phase! Check the log file: '#{full_log_filename}'."
      end
    else                                            # Report error on digest phase
        to_logfile( @import_log, nil, nil, '.perform.log' )
        raise "Error during DIGEST phase! Check the log file: '#{full_log_filename}'."
    end
    to_logfile( @import_log, nil, nil, '.perform.log' )
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


  # Tries to detect/parse the season of the data files by looking at the container
  # path of the files.
  #
  # This method updates directly the internal #season member but it does nothing
  # if it has already a value.
  #
  # === Example:
  #
  #     "uploads"  [ / ] "results.132"  [ / ]  "ris20121123test.txt"
  #
  # => This will force Season with ID #132 for all the files contained therein.
  #
  #
  # === Returns
  # A Season instance when successfull or +nil+ when unable to parse the pathname.
  #
  def try_detect_season_from_file_path()
    return @season if @season.instance_of?( Season )

    container_dir_parts = File.dirname( @full_pathname ).split(File::SEPARATOR).last.split('.')
    if ( container_dir_parts.size == 2 )
      @season = Season.find_by_id( (container_dir_parts[1]).to_i )
      update_logs( "Detected forced season ID=#{ @season.id } from container folder name. Parsing file..." ) if @season
    end
    @season
  end


  # Tries to detect the season of the data files by parsing the header fields of the.
  # file name.
  # (Mainly by looking at the time stamp and deciding which Season it could be,
  #  according to the file type.)
  #
  # This method updates directly the internal #season member but it does nothing
  # if it has already a value.
  #
  # === Params:
  # The season_type_code (default: 'MASFIN')
  #
  # === Returns
  # A Season instance when successfull or +nil+ when unable to parse the pathname.
  #
  def try_detect_season_from_header_fields( season_type_code = 'MASFIN' )
    return @season if @season.instance_of?( Season )

    header_year = @header_fields_dao.header_year
    mas_fin_season_type = SeasonType.find_by_code( season_type_code )
    @season = Season.where([
      '(header_year = ?) AND (season_type_id = ?)',
      header_year, mas_fin_season_type.id
    ]).first
    update_logs( "Detected season ID=#{@season.id} from file header date. Parsing file..." ) if @season
    @season
  end
  #-- -------------------------------------------------------------------------
  #++


  # Data-import Phase #1: text parsing with result "digest" and serialization/storage
  # into 'temporary support' tables (elsewhere referred as 'secondary' or 'data-import'
  # tables).
  #
  # Reads and parses the whole TXT file into a complex Hash result, stored in memory.
  # When all the data is transferred to the temporary tables, the file is consumed (killed)
  # from the upload directory.
  #
  # The "Phase #2" of the "data-import wizard" usually allows the user to manually
  # review the digested data from the support tables, so that any mistakes or conflicts
  # may be edited before the final commit (Phase #3).
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
    update_logs( "\r\n-- DataImporter.phase_1_parse() start..." )
    update_logs( "Parsing file: #{@full_pathname}, force_missing_meeting_creation=#{@force_missing_meeting_creation}, force_missing_team_creation=#{@force_missing_team_creation}, do_not_consume_file=#{@do_not_consume_file}.\r\n" )
    header_fields_dao_init_from_filename()          # Make sure #header_fields_dao is defined
                                                    # Check if it's a "continuation session":
    if @data_import_session.phase > 0
      update_logs( "\r\n*** CONTINUING SESSION (after team name Analysis, stored in separate log file) ***" )
    end
                                                    # FILE TYPE DETECT => '<ris><date_header><code>.txt' for FIN results type
    unless @data_import_session.file_format
      case @header_fields_dao.prefix
      when 'ris'
        @data_import_session.file_format = 'fin_results'
      end
      @data_import_session.save!
    end

    if @season.nil?                                 # SEASON DETECT
      try_detect_season_from_file_path
      try_detect_season_from_header_fields
                                                    # (@season must be defined after this point)
      @flash[:error] = "#{I18n.t(:season_not_found, { scope: [:admin_import] })}\r\n#{ @header_fields_dao.inspect }" and return nil unless @season
    else
      update_logs( "Specified season ID=#{@season.id}. Parsing file..." )
    end
                                                    # Get the remaining default values from the season instance:
    @header_fields_dao.header_year     = @season.header_year
    @header_fields_dao.edition         = @season.edition
    @header_fields_dao.edition_type_id = @season.edition_type_id
    @header_fields_dao.timing_type_id  = @season.timing_type_id
    update_logs( "\r\nParsed header_fields_dao: #{@header_fields_dao.inspect}", :debug )

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
    # > FinResultParser.field_list_for( context_sym )
    # returns the possible fields for either :category_header || :result_row
    #
    @result_hash = FinResultParser.parse_txt_file( @full_pathname, logger ) # (=> show_progress = false)

    @stored_data_rows = 0
                                                    # Store the raw text file into the data-import session:
    @data_import_session.source_data            = @result_hash[:full_text_file_contents]
    @data_import_session.total_data_rows        = @result_hash[:total_data_rows]
    @data_import_session.data_import_season_id  = @season.instance_of?( DataImportSeason ) ? @season.id : nil
    @data_import_session.season_id              = @season.instance_of?( Season ) ? @season.id : nil
    @data_import_session.phase                  = 10      # Update "last completed phase" indicator in session (10 = 1.0)
    @data_import_session.phase_3_log            = '1'
    result = @data_import_session.save ? @data_import_session : nil
    update_logs( "\r\nPHASE #1.0 END, returning #{ result ? '(current session)' : 'NIL'}." )
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
  # at the #data_import_session.phase and whether #has_team_analysis_results is +true+.
  #
  def phase_1_2_serialize()
    return nil unless @data_import_session.instance_of?( DataImportSession ) &&
                      @result_hash.instance_of?(Hash) &&
                      ( @data_import_session.phase == 10 )
                                                    # Create just one header row for each one of Meeting/Meeting Session entities:
    season_starting_year = 0                        # This is needed by the individual results
    meeting_header_row = meeting_dates = scheduled_date = nil
    update_logs( "Parsing of '#{full_pathname}' done.\r\nDigesting data...", :debug )
                                                    # -- MEETING HEADER digest --
    if @season
      meeting_headers = @result_hash[:parse_result][:meeting_header]
      meeting_header_row = meeting_headers.first if meeting_headers
      if meeting_header_row                         # If the meeting_dates are found inside the data file, use them:
        update_logs( "meeting_header_row = #{meeting_header_row.inspect}", :debug )
        meeting_dates = meeting_header_row[:fields][:meeting_dates]
        # TODO [Steve, 20140923]
        #      The new MeetingDateParser now supports multiple date extraction: this should be used
        #      to extract all meeting_session dates, when possible.
        #      (Marked as FUTUREDEV, since we assume all meeting sessions will be existing
        #       before each data-import execution.)
        scheduled_dates = MeetingDateParser.new.parse( meeting_dates )
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
    if @season                                        # -- PRE-SCAN TEAM Names --
      season_starting_year = @season.begin_date.year
      update_logs( "Found season '#{@season.inspect}'; #{@season.season_type.inspect}, season_starting_year=#{season_starting_year}", :debug )
                                                    # The prescan will abort the rest of the procedure when false:
      is_ok = prescan_parse_result_for_unknown_team_names(
        @data_import_session,
        @season,
        @result_hash[:parse_result],
        @force_missing_team_creation
      )
      unless is_ok
        @team_analysis_results = DataImportTeamAnalysisResult.where( data_import_session_id: @data_import_session.id )
        update_logs( "PHASE #1.1: Team name Analysis phase needed!" )
      end
    end

    meeting = nil
    if is_ok && @season                             # -- MEETING (digest/serialization) --
      meeting_builder = DataImportMeetingBuilder.build_from_parameters(
        @data_import_session,
        @season,
        @header_fields_dao,
        meeting_header_row,
        meeting_dates,
        @force_missing_team_creation
      )
      meeting = meeting_builder.result_row
    end
                                                    # --- TEAM RANKING/SCORES (digest/serialization) --
    if meeting                                      # Retrieve default meeting session: (used only for new/missing meeting events or programs)
      update_logs( "PHASE #1.2: processing TEAM RANKING/SCORES..." )
      ranking_headers = @result_hash[:parse_result][:team_ranking]
      ranking_details = @result_hash[:parse_result][:ranking_row]
      ranking_headers_ids = ranking_headers.collect{|e| e[:id] }.compact.uniq.sort
      is_ok = process_team_ranking(
          @full_pathname,
          @data_import_session,
          @season,
          meeting,
          ranking_headers,
          ranking_headers_ids,
          ranking_details,
          @force_missing_team_creation
      )
    end
                                                    # -- MEETING SESSION (digest/serialization) --
    meeting_session = nil
    if meeting                                      # Retrieve default meeting session: (used only for new/missing meeting events or programs)
      meeting_session_builder = DataImportMeetingSessionBuilder.build_from_parameters(
        @data_import_session,
        meeting,
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
      category_headers = @result_hash[:parse_result][:category_header]
      category_details = @result_hash[:parse_result][:result_row]
      category_headers_ids = category_headers.collect{|e| e[:id] }.compact.uniq.sort
      is_ok = process_category_headers(
          @full_pathname,
          @data_import_session,
          @season,
          season_starting_year,
          meeting,
          meeting_session,
          category_headers,
          category_headers_ids,
          category_details,
          scheduled_date,
          @force_missing_team_creation
      )
    end
                                                    # --- RELAY (digest/serialization) --
    if is_ok && meeting_session
      update_logs( "PHASE #1.2: processing RELAY headers..." )
      relay_headers = @result_hash[:parse_result][:relay_header]
      relay_details = @result_hash[:parse_result][:relay_row]
      relay_headers_ids = relay_headers.collect{|e| e[:id] }.compact.uniq.sort
      is_ok = process_relay_headers(
          @full_pathname,
          @data_import_session,
          @season,
          season_starting_year,
          meeting,
          meeting_session,
          relay_headers,
          relay_headers_ids,
          relay_details,
          scheduled_date,
          @force_missing_team_creation
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
      update_logs(
        "\r\nFile '#{File.basename( @full_pathname )}', created session ID: #{ @data_import_session.id }\r\n" <<
        "Total file lines ....... : #{ @result_hash[:line_count] }\r\n" <<
        "Total data headers ..... : #{ @result_hash[:total_data_rows] }\r\n" <<
        "Actual stored rows ..... : #{ @stored_data_rows }\r\n" <<
        "File processed.\r\nData-import PHASE #1.2 DONE."
      )
    end
                                                    # Update the global log with the whole phase 1 log
    @import_log = "--------------------[Phase #1 - DIGEST/SERIALIZE]--------------------\r\n#{ @data_import_session.phase_1_log }"
    update_logs( "\r\nPHASE #1.2 END, returning #{ is_ok ? '(current session)' : 'NIL'}." )
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

    @logger.info( "\r\n-- phase_3_commit: session ID:#{ @data_import_session.id }, season ID: #{ @season.id }..." ) if @logger
    @data_import_session.phase_2_log ||= "\r\nImporting data @ #{Format.a_short_datetime(DateTime.now)}.\r\nCommitting data_import_session ID:#{@data_import_session.id}, season ID: #{@season.id}...\r\n"
    @committed_data_rows = 0
                                                    # Bail out as soon as something is wrong:
    is_ok = commit_data_import_meeting( @data_import_session )
    is_ok = commit_data_import_meeting_session( @data_import_session ) if is_ok
    is_ok = commit_data_import_meeting_program( @data_import_session ) if is_ok
    is_ok = commit_data_import_cities( @data_import_session ) if is_ok
    is_ok = commit_data_import_teams( @data_import_session, @season ) if is_ok
    is_ok = commit_data_import_swimmers( @data_import_session ) if is_ok
    is_ok = commit_data_import_badges( @data_import_session ) if is_ok
    is_ok = commit_data_import_meeting_individual_results( @data_import_session ) if is_ok
    is_ok = commit_data_import_meeting_relay_results( @data_import_session ) if is_ok
    is_ok = commit_data_import_meeting_team_score( @data_import_session ) if is_ok

    if ( is_ok )
      @import_log << "\r\n\r\n--------------------[Phase #3 - COMMIT]--------------------\r\n\r\n" +
                     @data_import_session.phase_2_log.to_s +
                     "data-import PHASE #2 & #3 DONE.\r\n" +
                     "\r\nTotal committed rows: #{ @committed_data_rows }\r\n" +
                     "Data-import session destroyed successfully.\r\n" +
                     "===========================================================\r\n"
      destroy_data_import_session()
    else                                            # Store data_import_session.phase_2_log if something goes awry:
      if $! && @logger
        @logger.error( "\r\n*** #{ data_import_session.phase_3_log }: exception caught during save!" )
        @logger.error( "*** #{ $!.to_s }\r\n" )
      end
      @flash[:error] = "#{ I18n.t(:something_went_wrong) } [#{ data_import_session.phase_3_log }]" + ( $! ? ": '#{ $!.to_s }'" : '' )
      @data_import_session.phase = 30               # (30 = '3.0', but without successful ending, since the session in not nil)
      @data_import_session.save!
    end
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
      total_data_rows:  0,
      file_format:      file_format,
      file_name:        full_pathname,
      source_data:      full_text_file_contents,
      total_data_rows:  total_data_rows,
      season_id:        season_id,
      phase_1_log:      '',
      phase_2_log:      '',
      phase_3_log:      '0',                        # Let's use phase_3_log column to update the "current progress" (computed as "curr. data header"/"tot. data headers")
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
    @header_fields_dao = FilenameParser.new( @full_pathname ).parse
    @result_hash = nil
  end


  # Getter for the log base file name (pathname + log filename w/o extension)
  def get_log_basename
    File.join( @log_dir, (File.basename(@full_pathname).split('.')[0]) )
  end

  # Getter for a string timestamp including the seconds.
  def get_iso_timestamp
    DateTime.now.strftime("%Y%m%d%H%M%S")
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
  def update_logs( msg, method = :info, with_save = true )
    @logger.send( method, msg ) if @logger
    @data_import_session.phase_1_log << (msg + "\r\n")
    @data_import_session.save! if with_save
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- ---------------------------------------------------------------------------
#++
