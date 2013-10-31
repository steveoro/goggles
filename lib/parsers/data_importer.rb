# encoding: utf-8
require 'fileutils'                                 # Used to process filenames
require 'common/format'
require 'parsers/fin_result_parser'
require 'parsers/fin_result_parser_tools'
require 'parsers/fin_result_phase2'
require 'parsers/fin_result_phase3'


=begin

= DataImporter

  - Goggles framework vers.:  4.00.79.20131031
  - author: Steve A.

  Data-Import methods container class. 
  Refactored from the original DataImportController implementation.

  === Defines:
  - @current_admin_id ID of the current Admin instance

  - @phase_1_log string (log text) variable member
  - @esteemed_meeting_mins integer variable member: total minutes counter
  - @stored_data_rows integer (counter) variable member

  - @phase_2_log string (log text) variable member
  - @committed_data_rows integer variable member

  - @import_log string variable member: full import log

=end
class DataImporter
  include FinResultPhase2
  include FinResultPhase3

  attr_accessor :logger, :flash, 
                # Batch/delayed execution parameters:
                :full_pathname, :season, :force_missing_meeting_creation,
                :do_not_consume_file, :log_dir

  # Set this to true or false to enable or disable debugging output, L1.
  #
  DEBUG_VERBOSE = false
  # ---------------------------------------------------------------------------

  # Creates a new instance.
  #
  def initialize( logger, flash, current_admin_id = 1 )
    self.logger = logger
    self.flash = flash
    @current_admin_id = current_admin_id
    @phase_1_log = ''
    @phase_2_log = ''
    @import_log  = ''
    @esteemed_meeting_mins = 0
    @stored_data_rows = 0
    @committed_data_rows = 0
                                                    # Batch parameters' default
    self.full_pathname = nil
    self.season = nil
    self.force_missing_meeting_creation = false
    self.do_not_consume_file = false
    self.log_dir = File.join( Rails.root, 'log' )
  end


  # Resets the current instance and its counter/log variables, inizializing
  # it with the specified season_id.
  #
  def reset( season_id, current_admin_id = 1 )
    @season_id = season_id
    @current_admin_id = current_admin_id
    @phase_1_log = ''
    @phase_2_log = ''
    @import_log  = ''
    @esteemed_meeting_mins = 0
    @stored_data_rows = 0
    @committed_data_rows = 0
                                                    # Batch parameters' default
    self.full_pathname = nil
    self.season = nil
    self.force_missing_meeting_creation = false
    self.do_not_consume_file = false
    self.log_dir = File.join( Rails.root, 'log' )
  end

  # Getter for @phase_1_log
  def get_phase_1_log
    @phase_1_log
  end

  # Getter for @phase_2_log
  def get_phase_2_log
    @phase_2_log
  end

  # Getter for @import_log
  def get_import_log
    @import_log
  end

  # Getter for @esteemed_meeting_mins
  def get_esteemed_meeting_mins
    @esteemed_meeting_mins
  end

  # Getter for @stored_data_rows
  def get_stored_data_rows
    @stored_data_rows
  end

  # Getter for @committed_data_rows
  def get_committed_data_rows
    @committed_data_rows
  end
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------


  # Creates a new data-import session returning its instance.
  #
  def self.create_new_data_import_session( full_pathname, full_text_file_contents,
                                           total_data_rows, file_format, season_id,
                                           current_admin_id )
    DataImportSession.create(
      :file_name => full_pathname,
      :source_data => full_text_file_contents,
      :total_data_rows => total_data_rows,
      :file_format => file_format,
      :season_id => season_id,
      :phase_3_log => '0',                          # Let's use phase_3_log column to update the "current progress" (computed as "curr. data header"/"tot. data headers") 
      :user_id => current_admin_id
    )
  end


  # Destroys an existing Data-import session given its session ID.
  #
  def self.destroy_data_import_session( session_id, logger = nil, do_consume_residual_file = true )
    data_import_session = DataImportSession.find_by_id( session_id )

    if ( data_import_session )                      # For a safety clean-up, check also if the file wasn't consumed properly after phase-1:
      full_pathname = File.join(Dir.pwd, data_import_session.file_name)
      if ( FileTest.exists?(full_pathname) && do_consume_residual_file )
        logger.info( "-- destroy_data_import_session(#{session_id}): the import file wasn't consumed properly after phase-1. Erasing it..." ) if logger
        FileUtils.rm( full_pathname )
      end
                                                    # For all data_import_... tables, delete rows where :data_import_session_id => session_id
      DataImportMeetingIndividualResult.delete_all( :data_import_session_id => session_id )
      DataImportMeetingProgram.delete_all( :data_import_session_id => session_id )
      DataImportMeetingRelayResult.delete_all( :data_import_session_id => session_id )
      DataImportMeetingSession.delete_all( :data_import_session_id => session_id )
      DataImportMeetingTeamScore.delete_all( :data_import_session_id => session_id )
      DataImportMeeting.delete_all( :data_import_session_id => session_id )
      DataImportSeason.delete_all( :data_import_session_id => session_id )
      DataImportSwimmer.delete_all( :data_import_session_id => session_id )
      DataImportTeam.delete_all( :data_import_session_id => session_id )
      DataImportBadge.delete_all( :data_import_session_id => session_id )
      DataImportCity.delete_all( :data_import_session_id => session_id )
      DataImportSession.delete( session_id )
      logger.info( "-- destroy_data_import_session(#{session_id}): data-import session clean-up done.\r\n" ) if logger
    else
      logger.info( "-- destroy_data_import_session(#{session_id}): warning: unable to find the specified data-import session master record.\r\n" ) if logger
    end
  end
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------


  # Executes the batch action using a delayed_job-compatible
  # +perform+ method signature.
  # This assumes that all parameters relevant to the execution
  # must be already set into their dedicated class members.  
  # 
  def perform
    batch_import()
  end

  # Display name used by delayed_job gem.
  #
  def display_name
    "batch_import(#{self.full_pathname})"
  end

  # Max attempts used by delayed_job gem.
  #
  def max_attempts
    3
  end

  # Sets the parameter values for batch/delayed execution.  
  # 
  def set_batch_parameters( full_pathname, season = nil,
                            force_missing_meeting_creation = false,
                            do_not_consume_file = false,
                            log_dir = File.join( Rails.root, 'log' ) )
    self.full_pathname = full_pathname
    self.season = season
    self.force_missing_meeting_creation = force_missing_meeting_creation
    self.do_not_consume_file = do_not_consume_file
    self.log_dir = log_dir
  end


  # Stores the content of the internal log text to a specified
  # filename (assuming permissions are correctly set).
  # If found, file is overwritten, otherwise is created.
  #
  def to_logfile( log_filename )
    File.open( log_filename, 'w' ) do |f|
      if ( flash[:error] )
        f.puts "*** Latest flash[:error]: ***"
        f.puts flash[:error]
        f.puts "------------------------------\r\n"
      end
      f.puts get_import_log  
    end  
  end


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
    log_filename = File.join( self.log_dir, (File.basename(self.full_pathname).split('.')[0])+'.log' )
    data_import_session = consume_txt_file(
      self.full_pathname,
      self.season,
      self.force_missing_meeting_creation,
      self.do_not_consume_file
    )
    if data_import_session
      is_ok = commit(
        data_import_session,
        !self.do_not_consume_file                   # Remove left-over files?
      )
      unless is_ok                                  # Report error on commit phase
        to_logfile( log_filename )                  # store log file somewhere
        raise "Error during COMMIT phase! Check the log file: '#{log_filename}'."
      end
    else                                            # Report error on digest phase
        to_logfile( log_filename )                  # store log file somewhere
        raise "Error during DIGEST phase! Check the log file: '#{log_filename}'."
    end
    to_logfile( log_filename )
    if FileTest.exists?( log_filename )
      logger.info( "-- batch_import(): renaming log file as '.ok'..." ) if self.logger
      File.rename( log_filename, log_filename+'.ok' )
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
  # === Returns the newly created "data_import" session instance if successful; +nil+ otherwise.
  #     The parse result hash is directly stored into dedicated temporary table on the database.
  #
  def consume_txt_file( full_pathname, season = nil, force_missing_meeting_creation = false,
                        do_not_consume_file = false )
    logger.info( "\r\n-- consume_txt_file: '#{full_pathname}', force_missing_meeting_creation=#{force_missing_meeting_creation}, do_not_consume_file=#{do_not_consume_file}." )
    @phase_1_log = "Parsing file: #{full_pathname}, force_missing_meeting_creation=#{force_missing_meeting_creation}, do_not_consume_file=#{do_not_consume_file}.\r\n"

    # TODO PARSE file_type => '<ris><date_header><code>.txt' for FIN results type
    file_type = 'fin_results'                       # FIXME Pre-fixed file structure type, only FIN Results supported, no parsing at all
                                                    # -- FILE HEADER digest --
    header_fields = FinResultParserTools.parse_filename_fields( full_pathname )
    season_id = 0
    if season.nil?                                  # Try to detect which season from the path/name of the file
      container_dir_parts = File.dirname(full_pathname).split(File::SEPARATOR).last.split('.')
                                                    # Get the season override from the containing folder name, if present (must be: "season.<ID>")
      if ( (container_dir_parts.size == 2) &&
           (container_dir_parts[0] == 'season') )
        season_id = (container_dir_parts[1]).to_i
        season = Season.find_by_id( season_id )
        unless ( season && season.id.to_i > 0 )
          flash[:error] = "#{I18n.t(:season_not_found, {:scope=>[:admin_import]})} (FORCED season_id=#{season_id})"
          return nil
        end
        logger.info( "   Detected forced season ID=#{season_id} from container folder name. Parsing file..." )
        @phase_1_log = "Detected forced season ID=#{season_id} from container folder name. Parsing file...\r\n"
      else
        seek_date = header_fields[:header_date]
        mas_fin_season_type = SeasonType.find_by_code('MASFIN')
        unless ( mas_fin_season_type && mas_fin_season_type.id.to_i > 0 )
          flash[:error] = "#{I18n.t(:season_type_not_found, {:scope=>[:admin_import]})} (code='MASFIN'))"
          return nil
        end
        season = Season.where([
          '(begin_date <= ?) AND (end_date >= ?) AND (season_type_id = ?)',
          seek_date, seek_date, mas_fin_season_type.id
        ]).first
        unless ( season && season.id.to_i > 0 )
          flash[:error] = "#{I18n.t(:season_not_found, {:scope=>[:admin_import]})} (DETECTED season_id=#{season_id})"
          return nil
        end
        season_id = season.id
        logger.info( "   Detected season ID=#{season_id} from file header date. Parsing file..." )
        @phase_1_log = "Detected season ID=#{season_id} from file header date. Parsing file...\r\n"
      end
    else
      season_id = season.id
      logger.info( "   Specified season ID=#{season_id}. Parsing file..." )
      @phase_1_log = "Specified season ID=#{season_id}. Parsing file...\r\n"
    end
                                                    # Get the remaining default values from the season instance:
    header_fields[:header_year] = season.header_year
    header_fields[:edition] = season.edition
    header_fields[:edition_type_id] = season.edition_type_id
    header_fields[:timing_type_id]  = season.timing_type_id
    @season_id = season_id                          # Set the currently used season_id (this member variable is used just by its getter method)
    data_rows = []

    result_hash = FinResultParser.parse_txt_file( full_pathname, false, logger ) # (=> show_progress = false)
    # NOTE: result_hash has the following structure:
    #     {
    #       :parse_result => {
    #         :category_header => [
    #           { :id => <category_header_id>, :fields => <hash_of_category_header_fields_with_values>,
    #             :import_text => last_line_of_text_used_to_extract_all_fields }
    #           ... (one Hash for each <category_header_id>)
    #         ],
    #         :result_row      => [
    #           { :id => <category_header_id>, :fields => <hash_of_result_row_fields_with_values>,
    #             :import_text => last_line_of_text_used_to_extract_all_fields }
    #           ... (one or more Hash for each <category_header_id>, which acts as a "context page index")
    #         ],
    #         ...
    #       },
    #       :line_count               => tot_file_lines_read,
    #       :total_data_rows          => sum_of_data_pages_sizes,
    #       :full_text_file_contents  => full_text_file_contents
    #     }
    #
    # FinResultParser.get_field_list_for( context_sym )
    # returns the possible fields for either :category_header || :result_row

    line_count = result_hash[:line_count]
    @stored_data_rows = 0
                                                    # Store the raw text file into its row header
    data_import_session = DataImporter.create_new_data_import_session(
        full_pathname,
        result_hash[:full_text_file_contents],
        result_hash[:total_data_rows],
        file_type,
        season_id,
        @current_admin_id
    )

    if ( data_import_session )                      # Create all the data-import rows from the parsed result:
      session_id = data_import_session.id
      # XXX [Steve, 20130826] ASSERT: Assuming each data_import session will be used to import
      # the results of only 1 MeetingProgram / MeetingSession at a time.
      #
      # That is, as of this version, the import file to be parsed is assumed to contain
      # the results of only 1 day/session/program at a time, even if the event/meeting
      # is divided into more that 1 day.
                                                    # Create just one header row for each one of Meeting/Meeting Session entities:
      meeting_id = meeting_session_id = 0
      season_type_id = season_starting_year = 0     # This is needed by the individual results
      meeting_header_row = meeting_dates = scheduled_date = nil
      @esteemed_meeting_mins = 0                    # Used to calc approx event duration for meeting programs
      logger.debug( "\r\n-- consume_txt_file(#{full_pathname}, #{season_id}): parsing file done. Digesting..." )
      @phase_1_log = "Parsing of '#{full_pathname}' done.\r\nDigesting data...\r\n"
                                                    # -- MEETING HEADER digest --
      if season
        meeting_headers = result_hash[:parse_result][:meeting_header]
        meeting_header_row = meeting_headers.first if meeting_headers
        if meeting_header_row                       # If the meeting_dates are found inside the data file, use them:
          meeting_dates = meeting_header_row[:fields][:meeting_dates]
        elsif header_fields[:header_date]           # ...Otherwise, parse them from the filename/header:
          scheduled_date = header_fields[:header_date]
        end
                                                    # If we still need to parse the scheduled date, let's do it:
        if meeting_dates && scheduled_date.nil?
          scheduled_date = FinResultParserTools.parse_meeting_date( meeting_dates )
        elsif scheduled_date.nil?
          begin
            scheduled_date = season.begin_date
          rescue
            scheduled_date = Date.today
          end
        end
      end

      if season                                     # -- MEETING digest --
        season_type_id = season.season_type_id if season
        season_starting_year = season.begin_date.year if season
# DEBUG
        logger.debug( "Found season '#{season.inspect}'; season_type_id=#{season_type_id}, season_starting_year=#{season_starting_year}" )
        meeting_id = search_or_add_a_corresponding_meeting(
            full_pathname, session_id, season_id, meeting_header_row,
            meeting_dates, scheduled_date, header_fields, force_missing_meeting_creation
        )
      end
                                                    # -- MEETING SESSION (digest part) --
      if meeting_id != 0
        meeting_session_id = search_or_add_a_corresponding_meeting_session(
            full_pathname, session_id, meeting_id,
            meeting_dates, scheduled_date,
            header_fields, force_missing_meeting_creation
        )
      end

      return nil unless (season_id > 0) && (season_type_id > 0) &&
                        (meeting_id != 0) && (meeting_session_id != 0)
                                                    # --- CATEGORY (digest part) --
      logger.info( "-- consume_txt_file(#{full_pathname}): PHASE #1.1) processing CATEGORY HEADERS...\r\n" )
      @phase_1_log << "PHASE #1.1: processing category_headers...\r\n"
      category_headers = result_hash[:parse_result][:category_header]
      category_details = result_hash[:parse_result][:result_row]
      category_headers_ids = category_headers.collect{|e| e[:id] }.compact.uniq.sort

      is_ok = process_category_headers(
          full_pathname, data_import_session.id,
          season_id, season_type_id, season_starting_year,
          meeting_session_id, category_headers, category_headers_ids,
          category_details, scheduled_date
      )
      return nil unless is_ok
                                                    # --- RELAY (digest part) --
      logger.info( "-- consume_txt_file(#{full_pathname}): PHASE #1.2) processing RELAY HEADERS...\r\n" )
      @phase_1_log << "PHASE #1.2: processing relay_headers...\r\n"
      relay_headers = result_hash[:parse_result][:relay_header]
      relay_details = result_hash[:parse_result][:relay_row]
      relay_headers_ids = relay_headers.collect{|e| e[:id] }.compact.uniq.sort

      is_ok = process_relay_headers(
          full_pathname, data_import_session.id,
          season_id, season_type_id, season_starting_year,
          meeting_session_id, relay_headers, relay_headers_ids,
          relay_details, scheduled_date
      )
      return nil unless is_ok
                                                    # --- TEAM RANKING/SCORES (digest part) --
      logger.info( "-- consume_txt_file(#{full_pathname}): PHASE #1.3) processing TEAM RANKING...\r\n" )
      @phase_1_log << "PHASE #1.3: processing team_ranking...\r\n"
      ranking_headers = result_hash[:parse_result][:team_ranking]
      ranking_details = result_hash[:parse_result][:ranking_row]
      ranking_headers_ids = ranking_headers.collect{|e| e[:id] }.compact.uniq.sort

      is_ok = process_team_ranking(
          full_pathname, data_import_session.id, season_id, meeting_id,
          ranking_headers, ranking_headers_ids, ranking_details
      )
      return nil unless is_ok

                                                    # After having successfully stored the contents, remove the file
      logger.info( "-- consume_txt_file(#{full_pathname}): file processed and 'digested' on temp. tables." )
      unless do_not_consume_file
        logger.info( "Consuming it...\r\n" )
        FileUtils.rm( full_pathname )
      end
                                                    # Update current phase indicator & log:
      data_import_session.phase = 1
      @phase_1_log << "\r\nFile '#{File.basename( full_pathname )}', created session ID: #{data_import_session.id}\r\nTotal file lines ....... : #{line_count}\r\nTotal data headers ..... : #{result_hash[:total_data_rows]}\r\nActual stored rows ..... : #{@stored_data_rows}\r\nFile processed.\r\n"
      @phase_1_log << "data-import PHASE #1 DONE.\r\n"
      data_import_session.phase_1_log = @phase_1_log
      data_import_session.save
      logger.info( "-- consume_txt_file(#{full_pathname}): data-import PHASE #1 DONE.\r\n" )

    else                                            # No data_import_session ?
      logger.error( "consume_txt_file(#{full_pathname}): failed to create a new data-import session!" )
    end
# DEBUG
#    logger.debug( "-- consume_txt_file(#{full_pathname}):\r\n" )
#    logger.debug( @phase_1_log )
                                                    # Update the import log:
    @import_log = "--------------------[Phase #1 - DIGEST]--------------------\r\n" + @phase_1_log
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
  def commit( data_import_session, do_consume_residual_file = true )
    unless ( data_import_session && data_import_session.id.to_i > 0 )
      flash[:notice] = I18n.t(:missing_session_parameter, {:scope=>[:admin_import]})
      return false
    end
    season_id = data_import_session.season_id if ( data_import_session && data_import_session.respond_to?( :season_id ) )
    if ( season_id.to_i < 1 )
      flash[:notice] = I18n.t(:season_not_saved_in_session, {:scope=>[:admin_import]})
      return false
    end
    data_import_session_id = data_import_session.id
    logger.info( "\r\n-- step3_commit: session ID:#{data_import_session_id}, season ID: #{season_id}..." )
    @phase_2_log = "\r\nImporting data @ #{Format.a_short_datetime(DateTime.now)}.\r\nCommitting data_import_session ID:#{data_import_session_id}, season ID: #{season_id}...\r\n"
    @committed_data_rows = 0

    is_ok = commit_data_import_meeting( data_import_session_id )
    DataImportSession.where( :id => data_import_session_id ).update_all( :phase_3_log => "COMMIT:1/10" )

    is_ok = commit_data_import_meeting_session( data_import_session_id ) if is_ok
    DataImportSession.where( :id => data_import_session_id ).update_all( :phase_3_log => "COMMIT:2/10" )

    is_ok = commit_data_import_meeting_program( data_import_session_id ) if is_ok
    DataImportSession.where( :id => data_import_session_id ).update_all( :phase_3_log => "COMMIT:3/10" )

    is_ok = commit_data_import_cities( data_import_session_id ) if is_ok
    DataImportSession.where( :id => data_import_session_id ).update_all( :phase_3_log => "COMMIT:4/10" )

    is_ok = commit_data_import_teams( data_import_session_id, season_id ) if is_ok
    DataImportSession.where( :id => data_import_session_id ).update_all( :phase_3_log => "COMMIT:5/10" )

    is_ok = commit_data_import_swimmers( data_import_session_id ) if is_ok
    DataImportSession.where( :id => data_import_session_id ).update_all( :phase_3_log => "COMMIT:6/10" )

    is_ok = commit_data_import_badges( data_import_session_id ) if is_ok
    DataImportSession.where( :id => data_import_session_id ).update_all( :phase_3_log => "COMMIT:7/10" )

    is_ok = commit_data_import_meeting_individual_results( data_import_session_id ) if is_ok
    DataImportSession.where( :id => data_import_session_id ).update_all( :phase_3_log => "COMMIT:8/10" )

    is_ok = commit_data_import_meeting_relay_results( data_import_session_id ) if is_ok
    DataImportSession.where( :id => data_import_session_id ).update_all( :phase_3_log => "COMMIT:9/10" )

    is_ok = commit_data_import_meeting_team_score( data_import_session_id ) if is_ok
    DataImportSession.where( :id => data_import_session_id ).update_all( :phase_3_log => "COMMIT:10/10" )

    if ( is_ok )
      DataImporter.destroy_data_import_session( data_import_session_id, logger, do_consume_residual_file )
      @phase_1_log = data_import_session.phase_1_log
      @import_log = "--------------------[Phase #1 - DIGEST]--------------------\r\n" +
                    @phase_1_log +
                    "\r\n\r\n--------------------[Phase #2 - COMMIT]--------------------\r\n\r\n" +
                    @phase_2_log +
                    "data-import PHASE #2 DONE.\r\n" +
                    "\r\nTotal committed rows: #{@committed_data_rows}\r\n" +
                    "Data-import session destroyed successfully.\r\n" +
                    "===========================================================\r\n"
    else                                            # Store data_import_session.phase_2_log if something goes awry:
      data_import_session.phase = 2
      @phase_1_log = data_import_session.phase_1_log
      data_import_session.phase_2_log = @phase_2_log
      data_import_session.save
      is_ok = false
    end
    is_ok
  end
  # ---------------------------------------------------------------------------
end
# -----------------------------------------------------------------------------
