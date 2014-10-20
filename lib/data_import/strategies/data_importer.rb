# encoding: utf-8
require 'fileutils'                                 # Used to process filenames
require 'common/format'

require 'data_import/header_fields_dao'
require 'data_import/services/team_name_analizer'
require 'data_import/strategies/filename_parser'
require 'data_import/strategies/fin_result_parser'
require 'data_import/strategies/fin_result_phase2'
require 'data_import/strategies/fin_result_phase3'

require 'data_import/services/data_import_meeting_builder'
require 'data_import/services/data_import_meeting_session_builder'


=begin

= DataImporter

  - Goggles framework vers.:  4.00.569
  - author: Steve A.

  Data-Import strategy class.
  Refactored from the original DataImportController implementation.

  === Defines:
  - @current_admin_id ID of the current Admin instance

  - @phase_1_log string (log text) variable member
  - @team_analysis_log string (additional log text) variable
  - @sql_executable_log string (additional log text) variable

  - @team_analysis_results an Array of DataImportTeamAnalysisResult
    instances;

  - @esteemed_meeting_mins integer variable member: total minutes counter
  - @stored_data_rows integer (counter) variable member

  - @phase_2_log string (log text) variable member
  - @committed_data_rows integer variable member

  - @import_log string variable member: full import log

=end
class DataImporter
  include FinResultPhase2
  include FinResultPhase3

  attr_reader  :logger, :flash, :data_import_session, :import_log

  attr_accessor :full_pathname, :season,
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
    @data_import_session = data_import_session || DataImporter.create_new_data_import_session(nil)
    @team_analysis_log  = ''
    @sql_executable_log = ''
    @import_log         = ''                        # Combined import log
    @team_analysis_results = []
                                                    # Batch parameters' default
    @full_pathname = nil
    @season = nil
    @current_admin_id = 1
    @force_missing_meeting_creation = false
    @force_missing_team_creation    = false
    @do_not_consume_file = false
    @log_dir = File.join( Rails.root, 'log' )
  end


  # Resets the current instance and its counter/log variables, inizializing
  # it with the specified season_id.
  #
  # def reset( season_id )
    # @season_id = season_id
    # @current_admin_id = current_admin_id
    # @phase_1_log = ''
    # @phase_2_log = ''
    # @team_analysis_log = ''
    # @sql_executable_log = ''
    # @import_log  = ''
    # @esteemed_meeting_mins = 0
    # @stored_data_rows = 0
    # @committed_data_rows = 0
    # @team_analysis_results = []
    # @created_data_import_session_id = 0
                                                    # # Batch parameters' default
    # self.full_pathname = nil
    # self.season = nil
    # self.force_missing_meeting_creation = false
    # self.force_missing_team_creation = false
    # self.do_not_consume_file = false
    # self.log_dir = File.join( Rails.root, 'log' )
  # end

  # Resets just the 2 log texts for the team analysis
  def clear_team_analysis_and_sql_log
    @team_analysis_log  = ''
    @sql_executable_log = ''
  end

  # Getter for @committed_data_rows
  def get_committed_data_rows
    @committed_data_rows
  end

  # +true+ if the team_analysis phase was executed
  # due to some problematic team name.
  def has_team_analysis_results
    ( @team_analysis_results.instance_of?(Array) && (@team_analysis_results.size > 0) )
  end

  # Getter for the default log base file name (pathname + log filename w/o extension)
  def get_log_filename
    File.join( @log_dir, (File.basename(@full_pathname).split('.')[0]) )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Creates a new data-import session returning its instance.
  #
  def self.create_new_data_import_session( full_pathname, full_text_file_contents = '',
                                           total_data_rows = 0, file_format = nil,
                                           season_id = 0, current_admin_id = 1 )
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
      sql_diff:         '',
      user_id:          current_admin_id
    )
  end


  # Destroys an existing Data-import session given its session ID, including its
  # linked secondary entities.
  #
  def self.destroy_data_import_session( session_id, logger = nil, do_consume_residual_file = true )
    data_import_session = DataImportSession.find_by_id( session_id )

    if ( data_import_session )                      # For a safety clean-up, check also if the file wasn't consumed properly after phase-1:
      full_pathname = File.join(Dir.pwd, data_import_session.file_name)
      if ( FileTest.exists?(full_pathname) && do_consume_residual_file )
        logger.info( "-- destroy_data_import_session(#{session_id}): the import file wasn't consumed properly after phase-1. Erasing it..." ) if logger
        FileUtils.rm( full_pathname )
      end
                                                    # For all data_import_... tables, delete rows where data_import_session_id: session_id
      DataImportMeetingIndividualResult.delete_all( data_import_session_id: session_id )
      DataImportMeetingProgram.delete_all( data_import_session_id: session_id )
      DataImportMeetingRelayResult.delete_all( data_import_session_id: session_id )
      DataImportMeetingSession.delete_all( data_import_session_id: session_id )
      DataImportMeetingTeamScore.delete_all( data_import_session_id: session_id )
      DataImportMeeting.delete_all( data_import_session_id: session_id )
      DataImportSeason.delete_all( data_import_session_id: session_id )
      DataImportSwimmer.delete_all( data_import_session_id: session_id )
      DataImportTeam.delete_all( data_import_session_id: session_id )
      DataImportBadge.delete_all( data_import_session_id: session_id )
      DataImportCity.delete_all( data_import_session_id: session_id )
      DataImportTeamAnalysisResult.delete_all( data_import_session_id: session_id )
      DataImportSession.delete( session_id )
      logger.info( "-- destroy_data_import_session(#{session_id}): data-import session clean-up done.\r\n" ) if logger
    else
      logger.info( "-- destroy_data_import_session(#{session_id}): warning: unable to find the specified data-import session master record.\r\n" ) if logger
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Executes the batch action using a delayed_job-compatible
  # +perform+ method signature.
  # This assumes that all parameters relevant to the execution
  # must be already set into their dedicated class members.
  #
# FIXME TEST delayed_job execution without perform method
#  def perform
#    batch_import()
#  end

  # Verbose display name for the job.
  #
  def display_name
    "batch_import(#{self.full_pathname})"
  end

  # Max attempts used by delayed_job gem.
  #
  def max_attempts
    1
  end

  # Sets the parameter values for batch/delayed execution.
  #
  def set_parameters( full_pathname, season = nil,
                      force_missing_meeting_creation = false,
                      force_missing_team_creation = false,
                      do_not_consume_file = false,
                      log_dir = File.join( Rails.root, 'log' ) )
    @full_pathname = full_pathname
    @season        = season
    @force_missing_meeting_creation = force_missing_meeting_creation
    @force_missing_team_creation    = force_missing_team_creation
    @do_not_consume_file            = do_not_consume_file
    @log_dir = log_dir
  end
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------


  # Saves to the specifed log_filename the log_contents, adding a default
  # dedicated header and footer and using a default extension.
  # If the content string is empty, nothing gets written to the file path.
  #
  def self.to_logfile( log_filename, log_contents, header_text, footer_text = '', extension = '.log' )
    if log_contents.size > 0
      File.open( log_filename + extension, 'w' ) do |f|
        f.puts header_text if header_text.size > 0
        f.puts log_contents
        f.puts footer_text if footer_text.size > 0
      end
    end
  end

  # Saves to the specifed log_filename the log_contents, adding a default
  # dedicated header and footer and using a default extension ('team.log').
  # If the content string is empty, nothing gets written to the file path.
  #
  def self.to_analysis_logfile( log_filename, log_contents, extension = '.team_scan.log' )
    DataImporter.to_logfile(
      log_filename, log_contents,
      "\t*****************************\r\n\t  Team Analysis Report\r\n\t*****************************\r\n",
      '',
      extension
    )
  end

  # Saves to the specifed log_filename the log_contents, adding a default
  # dedicated header and footer and using a default extension ('team.sql').
  # If the content string is empty, nothing gets written to the file path.
  #
  def self.to_sql_executable_logfile( log_filename, log_contents, extension = '.team_scan.sql' )
    DataImporter.to_logfile(
      log_filename, log_contents,
      "--\r\n-- *** Suggested SQL actions: ***\r\n--\r\n\r\nSET AUTOCOMMIT = 0;\r\nSTART TRANSACTION;\r\n\r\n",
      "\r\nCOMMIT;",
      extension
    )
  end


  # Stores the content of the internal log texts to a specified
  # filename (assuming permissions are correctly set).
  # If found, file is overwritten, otherwise is created.
  #
  # If the Team analysis sub-phase was started, their corresponding
  # log files are created also (same name, different extension).
  #
  def to_logfile( log_filename = get_log_filename() )
    DataImporter.to_logfile(
      log_filename, get_import_log,
      ( flash[:error] ? "               *** Latest flash[:error]: ***\r\n#{flash[:error] }\r\n-----------------------------------------------------------\r\n" : '' )
    )
    DataImporter.to_analysis_logfile( log_filename, @team_analysis_log )
    DataImporter.to_sql_executable_logfile( log_filename, @sql_executable_log )
  end
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------


  # Executes a single data-import task as a whole process, without phases
  # interruption.
  #
  # If +season+ instance is +nil+, it will be assumed from the pathname
  # of the file.
  #
  # With the delayed_job gem, use:
  #
  #        data_importer.delay(:queue=>'data-import').batch_import( params )
  #
  # ...To add this to the delayed_job queue on the database.
  #
  def batch_import()
    full_log_filename = get_log_filename() +'.log'
    data_import_session = consume_txt_file(
      @full_pathname,
      @season,
      @force_missing_meeting_creation,
      @force_missing_team_creation,
      @do_not_consume_file
    )
    if data_import_session
      is_ok = commit(
        data_import_session,
        !@do_not_consume_file                       # Remove left-over files?
      )
      unless is_ok                                  # Report error on commit phase
        to_logfile()                                # store log file somewhere
        raise "Error during COMMIT phase! Check the log file: '#{full_log_filename}'."
      end
    else                                            # Report error on digest phase
        to_logfile()                                # store log file somewhere
        raise "Error during DIGEST phase! Check the log file: '#{full_log_filename}'."
    end
    to_logfile()
    if FileTest.exists?( full_log_filename )
      logger.info( "-- batch_import(): renaming log file as '.ok'..." ) if self.logger
      File.rename( full_log_filename, full_log_filename+'.ok' )
    end
  end
  # ---------------------------------------------------------------------------


  # Data-import Phase #1+Phase #2: CSV/TXT parsing + result "digest" and storage into temporary tables.
  #
  # Reads and parses the whole CSV/TXT file into a complex Hash result, stored in memory.
  # A new data-import session is then created while also adding each data row to the
  # temporary data-import rows table.
  #
  # When all the data is transferred to the temporary tables, the file is consumed (killed)
  # from the upload directory.
  #
  # The "Phase #2" of the "data-import wizard" usually allows the user to review the digested data
  # from the temporary tables so that any mistakes or conflicts can be edited before the final
  # commit (Phase #3).
  #
  # If +season+ instance is +nil+, it will be assumed from the pathname
  # of the file.
  #
  # If data_import_session is not +nil+ it will be used as a "continuation session",
  # assuming the whole parsing from scratch of the data-file will not generate duplicates.
  # (This is actually possible for most cases in which an existing session has been abruptely
  # interrupted at the start, for example due to the "team names pre-analysis phase".
  # In all other cases of interrupted sessions, passing a non-nil data_import_session will
  # likely generate corrupted data!)
  #
  # === Returns the newly created "data_import" session instance if successful; +nil+ otherwise.
  #     The parse result hash is directly stored into dedicated temporary table on the database.
  #
  def consume_txt_file( full_pathname, season = nil, force_missing_meeting_creation = false,
                        force_missing_team_creation = false, do_not_consume_file = false )
########## WIP #############################à
    logger.info( "\r\n-- consume_txt_file: '#{full_pathname}', force_missing_meeting_creation=#{force_missing_meeting_creation}, force_missing_team_creation=#{force_missing_team_creation}, do_not_consume_file=#{do_not_consume_file}." )
    @data_import_session.phase_1_log = "Parsing file: #{full_pathname}, force_missing_meeting_creation=#{force_missing_meeting_creation}, force_missing_team_creation=#{force_missing_team_creation}, do_not_consume_file=#{do_not_consume_file}.\r\n"
    if @data_import_session.phase > 0
      logger.info( "\r\n                     ==> CONTINUING SESSION (after team name Analysis, stored in separate log file) <==" )
      @data_import_session.phase_1_log = "*** CONTINUING SESSION (after team name Analysis, stored in separate log file) ***\r\n"
    end
    @data_import_session.save!
                                                    # Set internal class parameters:
    set_parameters( full_pathname, season, force_missing_meeting_creation,
                    force_missing_team_creation, do_not_consume_file )

                                                    # -- FILE HEADER digest --
    header_fields_dao = FilenameParser.new( full_pathname ).parse

                                                    # PARSE file_type => '<ris><date_header><code>.txt' for FIN results type
    unless @data_import_session.file_format
      case header_fields_dao.prefix
      when 'ris'
        @data_import_session.file_format = 'fin_results'
      end
      @data_import_session.save!
    end

#    season_id = 0
    if season.nil?                                  # Try to detect which season from the path/name of the file
      container_dir_parts = File.dirname(full_pathname).split(File::SEPARATOR).last.split('.')
                                                    # Get the season override from the containing folder name, if present (must be: "<anything>.<ID>")
      if ( container_dir_parts.size == 2 )
        season_id = (container_dir_parts[1]).to_i
        season = Season.find_by_id( season_id )
        unless ( season && season.id.to_i > 0 )
          flash[:error] = "#{I18n.t(:season_not_found, { scope: [:admin_import] })} (FORCED season_id=#{season_id})"
          return nil
        end
        logger.info( "   Detected forced season ID=#{season_id} from container folder name. Parsing file..." )
        @data_import_session.phase_1_log = "Detected forced season ID=#{season_id} from container folder name. Parsing file...\r\n"
      else
        seek_date = header_fields_dao.header_date
        mas_fin_season_type = SeasonType.find_by_code('MASFIN')
        unless ( mas_fin_season_type && mas_fin_season_type.id.to_i > 0 )
          flash[:error] = "#{I18n.t(:season_type_not_found, { scope: [:admin_import] })} (code='MASFIN'))"
          return nil
        end
        season = Season.where([
          '(begin_date <= ?) AND (end_date >= ?) AND (season_type_id = ?)',
          seek_date, seek_date, mas_fin_season_type.id
        ]).first
        unless ( season && season.id.to_i > 0 )
          flash[:error] = "#{I18n.t(:season_not_found, { scope: [:admin_import] })} (DETECTED season_id=#{season_id})"
          return nil
        end
#        season_id = season.id
        logger.info( "   Detected season ID=#{season.id} from file header date. Parsing file..." )
        @data_import_session.phase_1_log = "Detected season ID=#{season.id} from file header date. Parsing file...\r\n"
      end
    else
#      season_id = season.id
      logger.info( "   Specified season ID=#{season.id}. Parsing file..." )
      @data_import_session.phase_1_log = "Specified season ID=#{season.id}. Parsing file...\r\n"
    end
    self.season = season                            # Update the internal reference member
    @season_id  = season.id                         # Set the currently used season_id (this member variable is used just by its getter method)
                                                    # Get the remaining default values from the season instance:
    header_fields_dao.header_year     = season.header_year
    header_fields_dao.edition         = season.edition
    header_fields_dao.edition_type_id = season.edition_type_id
    header_fields_dao.timing_type_id  = season.timing_type_id
# DEBUG
    logger.debug( "\r\nParsed header_fields_dao: #{header_fields_dao.inspect}" )
    @data_import_session.phase_1_log = "\r\nParsed header_fields_dao: #{header_fields_dao.inspect}\r\n"
    data_rows = []

    result_hash = FinResultParser.parse_txt_file( full_pathname, logger ) # (=> show_progress = false)
    # NOTE: result_hash has the following structure:
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
    # FinResultParser.field_list_for( context_sym )
    # returns the possible fields for either :category_header || :result_row

    line_count = result_hash[:line_count]
    @stored_data_rows = 0
    can_go_on = true
                                                    # Store the raw text file into its row header
    data_import_session = DataImporter.create_new_data_import_session(
        full_pathname,
        result_hash[:full_text_file_contents],
        result_hash[:total_data_rows],
        file_type,
        season.id,
        @current_admin_id
    ) if data_import_session.nil?
    @created_data_import_session_id = data_import_session.id

    if ( data_import_session )                      # Create all the data-import rows from the parsed result:
#      session_id = data_import_session.id
      # XXX [Steve, 20130826] ASSERT: Assuming each data_import session will be used to import
      # the results of only 1 MeetingProgram / MeetingSession at a time.
      #
      # That is, as of this version, the import file to be parsed is assumed to contain
      # the results of only 1 day/session/program at a time, even if the event/meeting
      # is divided into more that 1 day.
                                                    # Create just one header row for each one of Meeting/Meeting Session entities:
#      meeting_id = meeting_session_id = 0
#      season_type_id = 0
      season_starting_year = 0     # This is needed by the individual results
      meeting_header_row = meeting_dates = scheduled_date = nil
      @esteemed_meeting_mins = 0                    # Used to calc approx event duration for meeting programs
      logger.debug( "\r\n-- consume_txt_file(#{full_pathname}, #{season.id}): parsing file done. Digesting..." )
      @data_import_session.phase_1_log = "Parsing of '#{full_pathname}' done.\r\nDigesting data...\r\n"
                                                    # -- MEETING HEADER digest --
      if season
        meeting_headers = result_hash[:parse_result][:meeting_header]
        meeting_header_row = meeting_headers.first if meeting_headers
        if meeting_header_row                       # If the meeting_dates are found inside the data file, use them:
# DEBUG
          logger.debug( "meeting_header_row = #{meeting_header_row.inspect}" )
          @data_import_session.phase_1_log = "meeting_header_row = #{meeting_header_row.inspect}\r\n"
          meeting_dates = meeting_header_row[:fields][:meeting_dates]
          # TODO [Steve, 20140923]
          #      The new MeetingDateParser now supports multiple date extraction: this should be used
          #      to extract all meeting_session dates, when possible.
          scheduled_dates = MeetingDateParser.new.parse( meeting_dates )
          scheduled_date  = scheduled_dates.first
# DEBUG
          logger.debug( "meeting_dates = '#{meeting_dates}' => #{scheduled_dates.inspect} (#{scheduled_date})" )
          @data_import_session.phase_1_log = "meeting_dates = '#{meeting_dates}' => #{scheduled_dates.inspect} (#{scheduled_date})"
        end
                                                    # ...Otherwise, parse them from the filename/header:
        if scheduled_date.nil? && header_fields_dao.header_date
          scheduled_date = header_fields_dao.header_date
# DEBUG
          logger.debug( "scheduled_date=#{scheduled_date} (set to file name date)" )
          @data_import_session.phase_1_log = "scheduled_date=#{scheduled_date} (set to file name date)\r\n"
        end
                                                    # If we still haven't found the scheduled date, fall back to some defaults:
        if scheduled_date.nil?
          begin
            scheduled_date = season.begin_date
          rescue
            scheduled_date = Date.today
          end
        end
      end

      if season                                     # -- PRE-SCAN TEAM Names --
#        season_type_id = season.season_type_id if season
        season_starting_year = season.begin_date.year if season
# DEBUG
        logger.debug( "Found season '#{season.inspect}'; #{season.season_type.inspect}, season_starting_year=#{season_starting_year}" )
                                                    # The prescan will abort the rest of the procedure when false:
        can_go_on = prescan_parse_result_for_unknown_team_names(
            data_import_session,
            season,
            result_hash[:parse_result],
            force_missing_team_creation
        )
        unless can_go_on
          logger.info( "-- consume_txt_file(#{full_pathname}): PHASE #1.1) Team name Analysis checkout requested...\r\n" )
          @data_import_session.phase_1_log << "PHASE #1.1: Team name Analysis checkout requested...\r\n"
        end
      end

      meeting = nil
      if season && can_go_on                        # -- MEETING digest --
        meeting_builder = DataImportMeetingBuilder.build_from_parameters(
          data_import_session,
          season,
          header_fields_dao,
          meeting_header_row,
          meeting_dates, # meeting_dates_text
          force_missing_meeting_creation
        )
        meeting = meeting_builder.result_row
#        meeting_id = meeting_builder.result_id
# Old method:
        # meeting_id = search_or_add_a_corresponding_meeting(
            # data_import_session, full_pathname, season_id, meeting_header_row,
            # meeting_dates, scheduled_date, header_fields_dao, force_missing_meeting_creation
        # )
      end

                                                    # --- TEAM RANKING/SCORES (digest part) --
      if meeting                                    # Retrieve default meeting session: (used only for new/missing meeting events or programs)
        logger.info( "-- consume_txt_file(#{full_pathname}): PHASE #1.1) processing TEAM RANKING...\r\n" )
        @data_import_session.phase_1_log << "PHASE #1.1: processing team_ranking...\r\n"
        ranking_headers = result_hash[:parse_result][:team_ranking]
        ranking_details = result_hash[:parse_result][:ranking_row]
        ranking_headers_ids = ranking_headers.collect{|e| e[:id] }.compact.uniq.sort

        can_go_on = process_team_ranking(
            full_pathname,
            data_import_session,
            season,
            meeting,
            ranking_headers,
            ranking_headers_ids,
            ranking_details,
            force_missing_team_creation
        )
      end
                                                    # -- MEETING SESSION (digest part) --
      meeting_session = nil
      if meeting                                    # Retrieve default meeting session: (used only for new/missing meeting events or programs)
        meeting_session_builder = DataImportMeetingSessionBuilder.build_from_parameters(
          data_import_session,
          meeting,
          header_fields_dao,
          meeting_dates, # meeting_dates_text
          scheduled_date,
          force_missing_meeting_creation
        )
        meeting_session    = meeting_session_builder.result_row
#        meeting_session_id = meeting_session_builder.result_id
# Old method:
#        meeting_session_id = search_or_add_a_corresponding_meeting_session(
#            full_pathname, session_id, meeting_id,
#            meeting_dates, scheduled_date,
#            header_fields_dao, force_missing_meeting_creation
#        )
      end

      unless can_go_on && season && meeting && meeting_session
                                                    # Update the import log before exiting:
        @import_log = "--------------------[Phase #1 - DIGEST]--------------------\r\n" + @data_import_session.phase_1_log
        return nil
      end

                                                    # --- CATEGORY (digest part) --
      logger.info( "-- consume_txt_file(#{full_pathname}): PHASE #1.2) processing CATEGORY HEADERS...\r\n" )
      @data_import_session.phase_1_log << "PHASE #1.2: processing category_headers...\r\n"
      category_headers = result_hash[:parse_result][:category_header]
      category_details = result_hash[:parse_result][:result_row]
      category_headers_ids = category_headers.collect{|e| e[:id] }.compact.uniq.sort

      can_go_on = process_category_headers(
          full_pathname,
          data_import_session,
          season,
          season_starting_year,
          meeting,
          meeting_session,
          category_headers,
          category_headers_ids,
          category_details,
          scheduled_date,
          force_missing_team_creation
      )
      unless can_go_on                              # Update the import log before exiting:
        @import_log = "--------------------[Phase #1 - DIGEST]--------------------\r\n" + @data_import_session.phase_1_log
        return nil
      end
                                                    # --- RELAY (digest part) --
      logger.info( "-- consume_txt_file(#{full_pathname}): PHASE #1.3) processing RELAY HEADERS...\r\n" )
      @data_import_session.phase_1_log << "PHASE #1.3: processing relay_headers...\r\n"
      relay_headers = result_hash[:parse_result][:relay_header]
      relay_details = result_hash[:parse_result][:relay_row]
      relay_headers_ids = relay_headers.collect{|e| e[:id] }.compact.uniq.sort

      can_go_on = process_relay_headers(
          full_pathname,
          data_import_session,
          season,
          season_starting_year,
          meeting,
          meeting_session,
          relay_headers,
          relay_headers_ids,
          relay_details,
          scheduled_date,
          force_missing_team_creation
      )
      unless can_go_on                              # Update the import log before exiting:
        @import_log = "--------------------[Phase #1 - DIGEST]--------------------\r\n" + @data_import_session.phase_1_log
        return nil
      end

                                                    # After having successfully stored the contents, remove the file
      logger.info( "-- consume_txt_file(#{full_pathname}): file processed and 'digested' on temp. tables." )
      unless do_not_consume_file
        logger.info( "Consuming it...\r\n" )
        FileUtils.rm( full_pathname )
      end
                                                    # Update current phase indicator & log:
      data_import_session.phase = 1
      @data_import_session.phase_1_log << "\r\nFile '#{File.basename( full_pathname )}', created session ID: #{data_import_session.id}\r\nTotal file lines ....... : #{line_count}\r\nTotal data headers ..... : #{result_hash[:total_data_rows] }\r\nActual stored rows ..... : #{@stored_data_rows}\r\nFile processed.\r\n"
      @data_import_session.phase_1_log << "data-import PHASE #1 DONE.\r\n"
      @data_import_session.save!
      logger.info( "-- consume_txt_file(#{full_pathname}): data-import PHASE #1 DONE.\r\n" )

    else                                            # No data_import_session ?
      logger.error( "consume_txt_file(#{full_pathname}): failed to create a new data-import session!" )
    end
# DEBUG
#    logger.debug( "-- consume_txt_file(#{full_pathname}):\r\n" )
#    logger.debug( @phase_1_log )
                                                    # Update the import log:
    @import_log = "--------------------[Phase #1 - DIGEST]--------------------\r\n" + @data_import_session.phase_1_log
    return data_import_session
  end
  # ---------------------------------------------------------------------------


  # Data Import Wizard: phase #3 (Phase #2 is manual review of the parsed data)
  # On (editable) data grid final commit, do the actual data import into destination table,
  # logging every error or mismatch and finally displaying it on the dedicated view.
  #
  # === Params:
  #
  # - <tt>data_import_session</tt> => the data-import session instance to be used for the commit.
  #
  # === Returns:
  # true on success; false on error.
  #
  def commit( do_consume_residual_file = true )
    unless ( @data_import_session )
      flash[:info] = I18n.t(:missing_session_parameter, { scope: [:admin_import] })
      return false
    end
    season_id = @data_import_session.season_id if ( @data_import_session && @data_import_session.respond_to?( :season_id ) )
    if ( season_id.to_i < 1 )
      flash[:info] = I18n.t(:season_not_saved_in_session, { scope: [:admin_import] })
      return false
    end
    data_import_session_id = @data_import_session.id
    logger.info( "\r\n-- step3_commit: session ID:#{data_import_session_id}, season ID: #{season_id}..." )
    @data_import_session.phase_2_log = "\r\nImporting data @ #{Format.a_short_datetime(DateTime.now)}.\r\nCommitting data_import_session ID:#{data_import_session_id}, season ID: #{season_id}...\r\n"
    @committed_data_rows = 0

    is_ok = commit_data_import_meeting( data_import_session_id )
    DataImportSession.where( id: data_import_session_id ).update_all( phase_3_log: "COMMIT:1/10" )

    is_ok = commit_data_import_meeting_session( data_import_session_id ) if is_ok
    DataImportSession.where( id: data_import_session_id ).update_all( phase_3_log: "COMMIT:2/10" )

    is_ok = commit_data_import_meeting_program( data_import_session_id ) if is_ok
    DataImportSession.where( id: data_import_session_id ).update_all( phase_3_log: "COMMIT:3/10" )

    is_ok = commit_data_import_cities( data_import_session_id ) if is_ok
    DataImportSession.where( id: data_import_session_id ).update_all( phase_3_log: "COMMIT:4/10" )

    is_ok = commit_data_import_teams( data_import_session_id, season_id ) if is_ok
    DataImportSession.where( id: data_import_session_id ).update_all( phase_3_log: "COMMIT:5/10" )

    is_ok = commit_data_import_swimmers( data_import_session_id ) if is_ok
    DataImportSession.where( id: data_import_session_id ).update_all( phase_3_log: "COMMIT:6/10" )

    is_ok = commit_data_import_badges( data_import_session_id ) if is_ok
    DataImportSession.where( id: data_import_session_id ).update_all( phase_3_log: "COMMIT:7/10" )

    is_ok = commit_data_import_meeting_individual_results( data_import_session_id ) if is_ok
    DataImportSession.where( id: data_import_session_id ).update_all( phase_3_log: "COMMIT:8/10" )

    is_ok = commit_data_import_meeting_relay_results( data_import_session_id ) if is_ok
    DataImportSession.where( id: data_import_session_id ).update_all( phase_3_log: "COMMIT:9/10" )

    is_ok = commit_data_import_meeting_team_score( data_import_session_id ) if is_ok
    DataImportSession.where( id: data_import_session_id ).update_all( phase_3_log: "COMMIT:10/10" )

    if ( is_ok )
      DataImporter.destroy_data_import_session( data_import_session_id, logger, do_consume_residual_file )
      @import_log = "--------------------[Phase #1 - DIGEST]--------------------\r\n" +
                    @data_import_session.phase_1_log.to_s +
                    "\r\n\r\n--------------------[Phase #2 - COMMIT]--------------------\r\n\r\n" +
                    @data_import_session.phase_2_log.to_s +
                    "data-import PHASE #2 DONE.\r\n" +
                    "\r\nTotal committed rows: #{@committed_data_rows}\r\n" +
                    "Data-import session destroyed successfully.\r\n" +
                    "===========================================================\r\n"
    else                                            # Store data_import_session.phase_2_log if something goes awry:
      @data_import_session.phase = 2
      @data_import_session.save!
      is_ok = false
    end
    is_ok
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- ---------------------------------------------------------------------------
#++
