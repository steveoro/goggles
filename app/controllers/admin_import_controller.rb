# encoding: utf-8
require 'fileutils'                                 # Used to process filenames
require 'common/format'
require 'parsers/fin_result_parser'
require 'parsers/fin_result_parser_tools'


class AdminImportController < ApplicationController

  layout 'admin_import'

  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_admin!
  # ---------------------------------------------------------------------------


  # Destroys an existing Data-import session
  #
  def kill_import_session
    destroy_data_import_session( params[:id].to_i ) if params[:id]
    redirect_to( goggles_di_step1_status_path() )
  end
  # ---------------------------------------------------------------------------


  # Data Import Wizard: START / STATUS
  # Phase #1: upload text (CSV) file / Select an existing Data-import session
  #
  def step1_status                                   # Retrieve current sessions for the current user and list them:
# DEBUG
#    logger.debug "\r\n\r\n!! ------ admin_import::step1_status -----"
#    logger.debug "current_admin: #{current_admin.inspect}"
    @existing_import_sessions = DataImportSession.where( :user_id => current_admin.id )
  end


  # AJAX-only action to retrieve the step-2/step-3 progress updates of either the specified or the latest
  # data-import session (being created or committed).
  #
  # == Params:
  # - <tt>:id</tt> => when present, is id of the data-import session to be checked out;
  #                   when missing, the last row created is used instead.
  # == Returns:
  # A DIV class containing the HTML representation of the updated progress bar. 
  #
  def get_step_progress                             # Retrieve current sessions for the current user and list them:
    if request.xhr?
      data_import_session = nil
      if params[:id]
        data_import_session = DataImportSession.find_by_id( params[:id].to_i )
      else
        data_import_session = DataImportSession.last
      end
      percent = 0

      if data_import_session                        # Retrieve current process steps and compute percentage:
        # NOTE: format sample: "<label>:<current>/<total>"
        tokens = data_import_session.phase_3_log.split(':') if data_import_session.phase_3_log
        if tokens.instance_of?(Array) && tokens.size > 1
          curr_label = tokens[0]
          curr_value, curr_total = tokens[1].split('/')
        end
        percent = ( (curr_value.to_i.to_f / curr_total.to_i.to_f) * 100 ).to_i
      end
      render( :text => "<span class=\"label label-info\">#{curr_label}</span><div class=\"bar\" style=\"width: #{percent}%;\"></div>" )

    else
      flash[:notice] = I18n.t(:invalid_action_request)
      redirect_to( goggles_di_step1_status_path() ) and return
    end
  end
  # ---------------------------------------------------------------------------


  # Data Import Wizard: Phase#2 (file parsing & consequent manual review of the data)
  # Scan each data-import row and parse it, preparing its "preview" columns.
  #
  # == Params:
  #
  # - <tt>'season[season_id]'</tt> => id of the selected sport season for the data-import operation
  # - <tt>:id</tt> => id of the data-import session in progress; when present, takes precedence over the +datafile+ parameter
  # - <tt>:datafile</tt> => an uploaded datafile (an ActionDispatch::Http::UploadedFile object)
  #
  def step2_checkout
# DEBUG
#    logger.debug "\r\n\r\n!! ------ admin_import::step2_checkout -----"
#    logger.debug "PARAMS: #{params.inspect}"
#    logger.debug "FILENAME...: #{params[:datafile].original_filename if params[:datafile]}"
    @season_id = 0                                  # (Must retrieve Season ID from form parameters)

    if params[:id]                                  # -- CASE #1: id parameter present? We then assume a session is already in progress:
      data_import_session = DataImportSession.find_by_id( params[:id].to_i )
      @season_id = data_import_session.season_id if ( data_import_session && data_import_session.respond_to?( :season_id ) )
                                                    # Session retrieval successful? Head on to phase #2 and let the component handle the rest:
      @data_import_session_id = data_import_session ? data_import_session.id : nil
# DEBUG
#      logger.debug "SEASON.....: ID=#{@season_id}"
#      logger.debug "!! ===========================\r\n\r\n"
      if ( @season_id.to_i < 1 )
        flash[:notice] = I18n.t(:season_not_saved_in_session, {:scope=>[:admin_import]})
        redirect_to( goggles_di_step1_status_path() ) and return
      end
      @season_description = '?'
      begin
        season = Season.find_by_id(@season_id)
        @season_description = season.description if season
      rescue
      end

    elsif params[:datafile]                         # -- CASE #2: datafile parameter present? Copy the file to its destination:
      if params[:season]                            # Retrieve season_id from parameters:
        @season_id = params[:season][:season_id].to_i
# DEBUG
#       logger.debug "SEASON.....: #{params[:season].inspect} (from params), ID=#{@season_id}"
      end
#      logger.debug "!! ===========================\r\n\r\n"
      if ( @season_id.to_i < 1 )
        flash[:notice] = I18n.t(:nothing_to_do_select_season, {:scope=>[:admin_import]})
        redirect_to( goggles_di_step1_status_path() ) and return
      end
      data_import_session = nil
      @season_description = '?'
      begin
        season = Season.find_by_id(@season_id)
        @season_description = season.description if season
      rescue
      end
      tmp_file = params[:datafile].tempfile         # (This is an ActionDispatch::Http::UploadedFile object)
      destination_filename = File.join( "public/uploads", params[:datafile].original_filename )
      FileUtils.cp tmp_file.path, destination_filename
                                                    # Create a new data-import session and consume the file:
      data_import_session = consume_txt_file( destination_filename, @season_id )
                                                    # Session retrieval successful? Head on to phase #2 and let the component handle the rest:
      @data_import_session_id = data_import_session ? data_import_session.id : nil

    else                                            # -- CASE ELSE: form not-fully completed
      flash[:notice] = I18n.t(:nothing_to_do_upload_something, {:scope=>[:admin_import]})
      redirect_to( goggles_di_step1_status_path() ) and return
    end
                                                    # -- CHECK OUTCOME: something went awfully wrong? Redirect:
    if @data_import_session_id.nil?
      if data_import_session                        # Store the log, if possible
        data_import_session.phase_1_log = @phase_1_log
        data_import_session.save
      end
      redirect_to( goggles_di_step1_status_path() ) and return
    end
                                                    # Compute the filtering parameters:
    ap = AppParameter.get_parameter_row_for( :data_import )
    @max_view_height = ap.get_view_height()
  end
  # ---------------------------------------------------------------------------


  # Data Import Wizard: phase #3 (Phase #2 is manual review of the parsed data)
  # On editable data grid final commit, do the actual data import into destination table,
  # logging every error or mismatch and finally displaying it on the dedicated view.
  #
  # == Params:
  #
  # - <tt>:data_import_session_id</tt> => the ID of the data-import session to be committed.
  #
  def step3_commit
# DEBUG
#    logger.debug "\r\n\r\n!! ----- admin_import::step3_commit -----"
#    logger.debug "PARAMS: #{params.inspect}"
                                                    # Retrieve data_import_session ID from parameters
    data_import_session_id = params[:data_import_session_id]
    unless ( data_import_session_id.to_i > 0 )
      flash[:notice] = I18n.t(:missing_session_parameter, {:scope=>[:admin_import]})
      redirect_to( goggles_di_step1_status_path() ) and return
    end

    data_import_session = DataImportSession.find_by_id( data_import_session_id )
    # ASSERT: assert_not_nil( data_import_session )
    season_id = data_import_session.season_id if ( data_import_session && data_import_session.respond_to?( :season_id ) )
    if ( season_id.to_i < 1 )
      flash[:notice] = I18n.t(:season_not_saved_in_session, {:scope=>[:admin_import]})
      redirect_to( goggles_di_step1_status_path() ) and return
    end

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
      destroy_data_import_session( data_import_session_id )
      @import_log = "--------------------[Phase #1 - DIGEST]--------------------\r\n" +
                    data_import_session.phase_1_log +
                    "\r\n\r\n--------------------[Phase #2 - COMMIT]--------------------\r\n\r\n" +
                    @phase_2_log +
                    "data-import PHASE #2 DONE.\r\n" +
                    "\r\nTotal committed rows: #{@committed_data_rows}\r\n" +
                    "Data-import session destroyed successfully.\r\n" +
                    "===========================================================\r\n"
    else                                            # Store data_import_session.phase_2_log if something goes awry:
      data_import_session.phase = 2
      data_import_session.phase_2_log = @phase_2_log
      data_import_session.save
      redirect_to( goggles_di_step1_status_path() ) and return
    end
  end
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------


  private


  # Creates a new data-import session returning its instance.
  #
  def create_new_data_import_session( full_pathname, full_text_file_contents, total_data_rows, file_format, season_id )
    DataImportSession.create(
      :file_name => full_pathname,
      :source_data => full_text_file_contents,
      :total_data_rows => total_data_rows,
      :file_format => file_format,
      :season_id => season_id,
      :phase_3_log => '0',                          # Let's use phase_3_log column to update the "current progress" (computed as "curr. data header"/"tot. data headers") 
      :user_id => current_admin.id
    )
  end


  # Destroys an existing Data-import session: implementation
  #
  def destroy_data_import_session( session_id )
    data_import_session = DataImportSession.find_by_id( session_id )

    if ( data_import_session )                      # For a safety clean-up, check also if the file wasn't consumed properly after phase-1:
      full_pathname = File.join(Dir.pwd, data_import_session.file_name)
      if ( FileTest.exists?(full_pathname) )
        logger.info( "-- destroy_data_import_session(#{session_id}): the import file wasn't consumed properly after phase-1. Erasing it..." )
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
      logger.info( "-- destroy_data_import_session(#{session_id}): data-import session clean-up done.\r\n" )
    else
      logger.info( "-- destroy_data_import_session(#{session_id}): warning: unable to find the specified data-import session master record.\r\n" )
    end
  end
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------



  # Data-import Phase #1: CSV storage and "consumption".
  #
  # Reads the whole CSV file into memory, assuming <tt>csv_separator</tt>
  # as column separator, while actually processing data starting from row number <tt>data_rows_starting_at</tt>.
  #
  # A new data-import session is then created while also adding each data row to the
  # temporary data-import rows table.
  #
  # When all the data is transferred to the temporary tables, the file is consumed (killed)
  # from the upload directory.
  #
  # The "Phase #2" of the "data-import wizard" it can subsequently begin.
  #
  # === Returns the newly created "data_import" session instance if successful; nil otherwise
  #
  def consume_txt_file( full_pathname, season_id )
# DEBUG
#    logger.debug( "\r\n-- consume_txt_file(#{full_pathname}, #{season_id}): parsing file..." )
#    @phase_1_log = "Parsing file: #{full_pathname}, season ID: #{season_id}...\r\n"
    data_rows = []

    # TODO PARSE file_type
    file_type = 'fin_results'                       # FIXME Pre-fixed file structure type, only FIN Results supported, no parsing at all

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
    #
    @line_count = result_hash[:line_count]
    @stored_data_rows = 0
                                                    # Store the raw text file into its row header
    data_import_session = create_new_data_import_session(
        full_pathname,
        result_hash[:full_text_file_contents],
        result_hash[:total_data_rows],
        file_type,
        season_id
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
      meeting_id, meeting_session_id = 0
      season_type_id, season_starting_year = 0      # This is needed by the individual results
      meeting_header_row, meeting_dates, scheduled_date = nil
      @esteemed_meeting_mins = 0                      # Used to calc approx event duration for meeting programs
      logger.debug( "\r\n-- consume_txt_file(#{full_pathname}, #{season_id}): parsing file done. Digesting..." )
      @phase_1_log = "Parsing of '#{full_pathname}' done.\r\nDigesting data...\r\n"


      if season_id > 0                              # -- MEETING HEADER digest --
        meeting_headers = result_hash[:parse_result][:meeting_header]
        meeting_header_row = meeting_headers.first if meeting_headers
        meeting_dates = meeting_header_row[:fields][:meeting_dates] if meeting_header_row
        if meeting_dates
          scheduled_date = FinResultParserTools.parse_meeting_date( meeting_dates )
        else
          begin
            scheduled_date = SeasonType.find_by_id( season_id ).begin_date
          rescue
            scheduled_date = Date.today
          end
        end
      end


      if season_id > 0                              # -- MEETING digest --
        season = Season.find( season_id )
        season_type_id = season.season_type.id if season
        season_starting_year = season.begin_date.year if season
# DEBUG
#        logger.debug( "Found season '#{season.inspect}'; season_type_id=#{season_type_id}, season_starting_year=#{season_starting_year}" )
        meeting_id = search_or_add_a_corresponding_meeting(
            full_pathname, session_id, season_id, meeting_header_row,
            meeting_dates, scheduled_date
        )
      end

                                                    # -- MEETING SESSION (digest part) --
      if meeting_id != 0
        meeting_session_id = search_or_add_a_corresponding_meeting_session(
            full_pathname, session_id, meeting_id,
            meeting_dates, scheduled_date
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
      logger.info( "-- consume_txt_file(#{full_pathname}): file processed and 'digested' on temp. tables. Consuming it...\r\n" )
      FileUtils.rm( full_pathname )
                                                    # Update current phase indicator & log:
      data_import_session.phase = 1
      @phase_1_log << "\r\nFile '#{File.basename( full_pathname )}', created session ID: #{data_import_session.id}\r\nTotal file lines ....... : #{@line_count}\r\nTotal data headers ..... : #{result_hash[:total_data_rows]}\r\nActual stored rows ..... : #{@stored_data_rows}\r\nFile processed.\r\n"
      @phase_1_log << "data-import PHASE #1 DONE.\r\n"
      data_import_session.phase_1_log = @phase_1_log
      data_import_session.save
      logger.info( "-- consume_txt_file(#{full_pathname}): data-import PHASE #1 DONE.\r\n" )

    else                                            # No data_import_session ?
      log_error( "consume_txt_file(#{full_pathname}): failed to create a new data-import session!" )
    end
# DEBUG
#    logger.debug( "-- consume_txt_file(#{full_pathname}):\r\n" )
#    logger.debug( @phase_1_log )

    return data_import_session
  end
  # -----------------------------------------------------------------------------
  # -----------------------------------------------------------------------------



  # "Digest" process for the :category_headers array extracted by the Parser
  #
  # == Returns: false on error
  #
  def process_category_headers( full_pathname, data_import_session_id, season_id, season_type_id, season_starting_year,
                                meeting_session_id, category_headers, category_headers_ids,
                                category_details, scheduled_date )
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
      category_type_id = CategoryType.parse_category_type_from_import_text( season_type_id, header_row[:fields][:category_group] )
      stroke_type_id   = StrokeType.parse_stroke_type_from_import_text( header_row[:fields][:style] )
      length_in_meters = header_row[:fields][:distance].to_i
# DEBUG
      logger.debug( "CATEGORY HEADER: Current header_row: #{header_row.inspect}\r\nResulting category_type_id=#{category_type_id}, gender_type_id=#{gender_type_id}, stroke_type_id=#{stroke_type_id}, data_import_session ID=#{data_import_session_id}" )

      meeting_program_id = search_or_add_a_corresponding_meeting_program(
          full_pathname, data_import_session_id, meeting_session_id,
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
            gender_type_id, category_type_id
        )
        is_ok = (result_id != 0)
        return unless is_ok
      }                                             # **** (END of DETAIL) ****
                                                    # Update current header count into "progress counter column"
      DataImportSession.where( :id => data_import_session_id ).update_all( :phase_3_log => "CAT.1:#{header_index+1}/#{category_headers_ids.size}" )
    }                                               # **** (END of HEADER) ****
    is_ok
  end
  # -----------------------------------------------------------------------------


  # "Digest" process for the :relay_headers array extracted by the Parser
  #
  # == Returns: false on error
  #
  def process_relay_headers( full_pathname, data_import_session_id, season_id, season_type_id, season_starting_year,
                             meeting_session_id, relay_headers, relay_headers_ids,
                             relay_details, scheduled_date )
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
      category_type_id = CategoryType.parse_category_type_from_import_text( season_type_id, header_row[:fields][:category_group] )
      stroke_type_id   = StrokeType.parse_stroke_type_from_import_text( header_row[:fields][:style] )
      phases           = header_row[:fields][:distance][0].to_i     # "NxMMM " |=> "N".to_i
      phase_length     = header_row[:fields][:distance][2..4].to_i  # "NxMM " |=> "MM ".to_i
      length_in_meters = phases * phase_length
# DEBUG
      logger.debug( "RELAY HEADER: Current header_row: #{header_row.inspect}\r\nResulting category_type_id=#{category_type_id}, gender_type_id=#{gender_type_id}, stroke_type_id=#{stroke_type_id}" )

      meeting_program_id = search_or_add_a_corresponding_meeting_program(
          full_pathname, data_import_session_id, meeting_session_id,
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
            detail_row, detail_row_idx, detail_rows.size
        )
        is_ok = (result_id != 0)
        return unless is_ok
      }                                             # **** (END of DETAIL) ****
                                                    # Update current header count into "progress counter column"
      DataImportSession.where( :id => data_import_session_id ).update_all( :phase_3_log => "REL.2:#{header_index+1}/#{relay_headers_ids.size}" )
    }                                               # **** (END of HEADER) ****
    is_ok
  end
  # -----------------------------------------------------------------------------


  # "Digest" process for the :team_ranking array extracted by the Parser
  #
  # == Returns: false on error
  #
  def process_team_ranking( full_pathname, data_import_session_id, season_id, meeting_id,
                            ranking_headers, ranking_headers_ids, ranking_details )
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
            detail_row, detail_row_idx, detail_rows.size
        )
        is_ok = (result_id != 0)
        return unless is_ok
      }                                             # **** (END of DETAIL) ****
                                                    # Update current header count into "progress counter column"
      DataImportSession.where( :id => data_import_session_id ).update_all( :phase_3_log => "RNK.3:#{header_index+1}/#{ranking_headers_ids.size}" )
    }                                               # **** (END of HEADER) ****
    is_ok
  end
  # -----------------------------------------------------------------------------
  # -----------------------------------------------------------------------------


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
  def search_or_add_a_corresponding_season( full_pathname, session_id )
    result_id = 0
    result_row = nil
    not_found = true
                                                    # --- FIELD SETUP: Extract field values before the search:
    description = I18n.t(:missing_data_warning, {:scope=>[:admin_import]})
    begin_date  = Date.parse( "#{Date.today.year - 1}-09-01" )
    end_date    = Date.parse( "#{Date.today.year}-06-30" )
    max_points  = 1000
    season_type_id = SeasonType.first.id            # FIXME ASSERT: season type is always "MASFIN"
    must_use_time_standards = true
                                                    # --- SEARCH for any existing/conflicting rows (DO NOT create forcibly one each time)
    # ********* TODO SEARCH for any existing/conflicting Season rows
                                                    # --- ADD: Nothing existing/conflicting found? => Add a fresh new data-import row
    if not_found
      begin                                         # --- BEGIN transaction ---
        DataImportSeason.transaction do
          result_row = DataImportSeason.new(
            :data_import_session_id => session_id,
            :import_text  => '-',
            :description  => description,
            :begin_date   => begin_date,
            :end_date     => end_date,
            :max_points   => max_points,
            :must_use_time_standards => must_use_time_standards,
            :season_type_id => season_type_id
          )
          result_row.save!                          # raise automatically an exception if save is not successful
        end
      rescue                                        # --- RESCUE (failed) transaction ---
        @phase_1_log << "\r\nDataImportSeason creation: exception caught during save!\r\n"
        @phase_1_log << "#{ $!.to_s }\r\n" if $!
        logger.error( "\r\n*** consume_txt_file(#{full_pathname}): DataImportSeason creation: exception caught during save!" )
        logger.error( "*** #{ $!.to_s }\r\n" ) if $!
        flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
      else
        result_id = result_row.id
# DEBUG
        logger.debug( "Created data_import_season, ID:'#{result_id}', '#{result_row.description}'." )
        @phase_1_log << "Created data_import_season, ID:'#{result_id}', '#{result_row.description}'.\r\n"
        @stored_data_rows += 1
      end                                           # --- END transaction ---
    end

    result_id
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
  def search_or_add_a_corresponding_meeting( full_pathname, session_id, season_id,
                                             meeting_header_row, meeting_dates, scheduled_date )
    result_id = 0
    result_row = nil
    not_found = true
                                                    # --- FIELD SETUP: Extract field values before the search:
    title, organization, notes = nil

    if ( meeting_header_row )
      title         = meeting_header_row[:fields][:title]
      organization  = meeting_header_row[:fields][:organization]
      notes = (meeting_dates ? "#{meeting_dates}\r\n" : '') +
              (organization ? "#{organization}" : '')
    end
# DEBUG
#    logger.debug( "\r\nParsed MEETING header_row = #{meeting_header_row.inspect}...\r\n\r\n" )

                                                    # --- SEARCH for any existing/conflicting rows (DO NOT create forcibly one each time)
# DEBUG
#    logger.debug( "Seeking existing Meeting @ #{scheduled_date}..." )
#    @phase_1_log << "Seeking existing Meeting @ #{scheduled_date}...\r\n"
                                                    # ASSERT: there can be only 1 row keyed by this tuple:
    result_row = Meeting.where(
      [ "(entry_deadline = ?) AND (season_id = ?)",
        scheduled_date, season_id ]
    ).first
    if result_row                                   # We must differentiate the result: negative for Meeting, positive for DataImportMeeting
      result_id = - result_row.id
      not_found = false
                                                    # Search also inside data_import_xxx table counterpart when unsuccesful:
    else
# DEBUG
#      logger.debug( "Seeking existing DataImportMeeting @ #{scheduled_date}..." )
#      @phase_1_log << "Seeking existing DataImportMeeting @ #{scheduled_date}...\r\n"
                                                    # ASSERT: there can be only 1 row keyed by this tuple:
      result_row = DataImportMeeting.where(
        [ "(data_import_session_id = ?) AND (entry_deadline = ?) AND (season_id = ?)",
          session_id, scheduled_date, season_id ]
      ).first
      if result_row
        result_id = result_row.id
        not_found = false
      end
    end
                                                    # --- ADD: Nothing existing/conflicting found? => Add a fresh new data-import row
    if not_found
      begin                                         # --- BEGIN transaction ---
        DataImportMeeting.transaction do
          result_row = DataImportMeeting.new(
            :data_import_session_id => session_id,
            :import_text    => meeting_header_row.instance_of?(Hash) ? meeting_header_row[:import_text] : '-',
            :description    => title ? title : I18n.t(:missing_data_warning, {:scope=>[:admin_import]}),
            :entry_deadline => scheduled_date,
            :are_results_acquired => true,
            :configuration_file => full_pathname,
            :notes          => notes,
            :season_id      => season_id,
            :user_id        => current_admin.id
            # TODO :challenge_number is not used!
            # TODO :is_under_25_admitted is not used!
          )
          result_row.save!                          # raise automatically an exception if save is not successful
        end
      rescue                                        # --- RESCUE (failed) transaction ---
        @phase_1_log << "\r\DataImportMeeting creation: exception caught during save!\r\n"
        @phase_1_log << "#{ $!.to_s }\r\n" if $!
        logger.error( "\r\n*** consume_txt_file(#{full_pathname}): DataImportMeeting creation: exception caught during save!" )
        logger.error( "*** #{ $!.to_s }\r\n" ) if $!
        flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
      else
        result_id = result_row.id
# DEBUG
        logger.debug( "Created data_import_meeting, ID:'#{result_id}', '#{result_row.get_verbose_name}'." )
        @phase_1_log << "Created data_import_meeting, ID:'#{result_id}', '#{result_row.get_verbose_name}'.\r\n"
        @stored_data_rows += 1
      end                                           # --- END transaction ---
    end

    result_id
  end


  # DataImportMeetingSession relation getter / adder.
  # Searches for a corresponding / existing MeetingSession row. When not found a new temp row (data_import_xxx)
  # is added.
  #
  # == Returns: the corresponding id of searched entity row,
  #   - positive if freshly added into its dedicated data_import_xxx table;
  #   - negative IDs only for already existing/commited rows in "standard" entity;
  #   - 0 only on error/unable to process.
  #
  # TODO supports only 1 meeting session per data-import file; assumes all data regards just the 1st meeting session
  #
  def search_or_add_a_corresponding_meeting_session( full_pathname, session_id, meeting_id,
                                                     meeting_dates, scheduled_date )
    result_id = 0
    result_row = nil
    not_found = true
                                                    # --- FIELD SETUP: Extract field values before the search:
    description = "#{I18n.t(:meeting_session, {:scope=>[:activerecord, :models]})} #1"
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
      result_id = - result_row.id
      not_found = false
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
                                                    # --- ADD: Nothing existing/conflicting found? => Add a fresh new data-import row
    if not_found
      begin                                         # --- BEGIN transaction ---
        field_hash = {
          :data_import_session_id => session_id,
          :import_text  => ( meeting_dates.instance_of?(String) && meeting_dates.size > 0 ? meeting_dates : '-' ),
          :scheduled_date => scheduled_date,
          :warm_up_time => warm_up_time,
          :begin_time => begin_time,
          :description => description,
          :session_order  => 1,
          :user_id => current_admin.id
          # TODO :notes is not used!
          # TODO :swimming_pool_id is not used!
        }.merge(
          meeting_id.to_i < 0 ?  { :meeting_id => -meeting_id } : { :data_import_meeting_id => meeting_id }
        )

        DataImportMeetingSession.transaction do
          result_row = DataImportMeetingSession.new( field_hash )
          result_row.save!                          # raise automatically an exception if save is not successful
        end
      rescue                                        # --- RESCUE (failed) transaction ---
        @phase_1_log << "\r\DataImportMeetingSession creation: exception caught during save!\r\n"
        @phase_1_log << "#{ $!.to_s }\r\n" if $!
        logger.error( "\r\n*** consume_txt_file(#{full_pathname}): DataImportMeetingSession creation: exception caught during save!" )
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


  # DataImportMeetingProgram relation getter / adder.
  # Searches for a corresponding / existing MeetingProgram row. When not found a new temp row (data_import_xxx)
  # is added.
  #
  # == Returns: the corresponding id of searched entity row,
  #   - positive if freshly added into its dedicated data_import_xxx table;
  #   - negative IDs only for already existing/commited rows in "standard" entity;
  #   - 0 only on error/unable to process.
  #
  def search_or_add_a_corresponding_meeting_program( full_pathname, session_id, meeting_session_id,
                                                     header_row, header_index, gender_type_id,
                                                     category_type_id, stroke_type_id, length_in_meters,
                                                     scheduled_date, is_a_relay, detail_rows_size )
    result_id = 0
    result_row = nil
    not_found = true
                                                    # --- FIELD SETUP: Extract field values before the search:
    # NOTE:
    # header_row[:fields] => [ :distance, :style, :gender, :category_group, :base_time ]

    import_text = header_row[:import_text]
                                                    # Note: header_index will give a new event_order for each combination of [ :distance, :style, :gender, :category_group ]
    event_order = header_index + 1                  # (Actually, this counts each single Heat as an event)
    base_time   = header_row[:fields][:base_time]
    mins, secs, hds = FinResultParserTools.parse_mins_secs_hds_from_result_time( base_time )
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
      :length_in_meters => length_in_meters,
      :stroke_type_id   => stroke_type_id,
      :is_a_relay       => is_a_relay
    ).first.id                                      # |=> 'MASTER FIN'.id
    accreditation_time_type_id = AccreditationTimeType::LAST_RACE_ID

                                                    # --- SEARCH for any existing/conflicting rows (DO NOT create forcibly one each time)
    if ( meeting_session_id < 0 )                   # We can search in non-data_import table only when the value is negative! (only data_import tables have references to both type of tables)
# DEBUG
#      logger.debug( "Seeking existing MeetingProgram..." )
#      @phase_1_log << "Seeking existing MeetingProgram...\r\n"
      result_row = MeetingProgram.where(              # ASSERT: there can be only 1 row keyed by this tuple:
        [ "(meeting_session_id = ?) AND (event_type_id = ?) AND (category_type_id = ?) AND (gender_type_id = ?)",
          -meeting_session_id, event_type_id, category_type_id, gender_type_id ]
      ).first
    end

    if result_row                                   # We must differentiate the result: positive for data_import tables only, negative otherwise
      result_id = - result_row.id
      not_found = false
    else                                            # Search also inside data_import_xxx table counterpart when unsuccesful:
# DEBUG
#      logger.debug( "Seeking existing DataImportMeetingProgram..." )
#      @phase_1_log << "Seeking existing DataImportMeetingProgram...\r\n"
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
      end
    end
                                                    # --- ADD: Nothing existing/conflicting found? => Add a fresh new data-import row
    if not_found
      begin                                         # --- BEGIN transaction ---
# DEBUG
#        logger.debug( "Adding new DataImportMeetingProgram with: event_type_id=#{event_type_id}, order=#{header_index}, #{header_row[:fields][:distance].to_i} mt., stroke_type_id=#{stroke_type_id}, category_type_id=#{category_type_id}..." )
        field_hash = {
          :data_import_session_id => session_id,
          :import_text => import_text,
          :event_order => event_order,
          :begin_time  => begin_time,
          :event_type_id => event_type_id,
          :category_type_id => category_type_id,
          :gender_type_id => gender_type_id,
          :accreditation_time_type_id => accreditation_time_type_id,
          :minutes  => mins,
          :seconds  => secs,
          :hundreds => hds,
          :user_id => current_admin.id
        }.merge(
          meeting_session_id.to_i < 0 ?  { :meeting_session_id => -meeting_session_id } : { :data_import_meeting_session_id => meeting_session_id }
        )

        DataImportMeetingProgram.transaction do
          result_row = DataImportMeetingProgram.new( field_hash )
          result_row.save!                          # raise automatically an exception if save is not successful
        end
      rescue                                        # --- RESCUE (failed) transaction ---
        @phase_1_log << "\r\DataImportMeetingProgram creation: exception caught during save!\r\n"
        @phase_1_log << "event_type_id = #{ event_type_id.inspect }\r\n" if event_type_id
        @phase_1_log << "field_hash = #{ field_hash.inspect }\r\n" if field_hash
        @phase_1_log << "#{ $!.to_s }\r\n" if $!
        logger.error( "\r\n*** consume_txt_file(#{full_pathname}): DataImportMeetingProgram creation: exception caught during save!" )
        logger.error( "*** #{ $!.to_s }\r\n" ) if $!
        flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
      else
        result_id = result_row.id
# DEBUG
#        logger.debug( "Created data_import_meeting_program, ID:'#{result_id}', '#{result_row.get_verbose_name}'." )
#        @phase_1_log << "Created data_import_meeting_program, ID:'#{result_id}', '#{result_row.get_verbose_name}'.\r\n"
        @stored_data_rows += 1
      end                                           # --- END transaction ---
    end

    result_id
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
                                                       gender_type_id, category_type_id )
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
    team_id    = search_or_add_a_corresponding_team( session_id, season_id, team_name )
    badge_id   = search_or_add_a_corresponding_badge(
        session_id, athlete_badge, season_id, team_id, swimmer_id,
        category_type_id, AccreditationTimeType::LAST_RACE_ID
    )
                                                # Retrieve team_badge_number from team_affiliation, but only if the team name was found in Team: (team_affiliations require an existing team)
    ta = TeamAffiliation.where(:team_id => -team_id, :season_id => season_id).first if (team_id.to_i < 0)
    team_badge_number = ta ? ta.number : nil

    rank              = detail_row[:fields][:result_position]
    result_time       = detail_row[:fields][:result_time]
    result_score      = ( detail_row[:fields][:result_score] ).gsub(/\,/, '.').to_f
    is_play_off       = true
    is_out_of_race    = FinResultParserTools.parse_out_of_race_from_result_time( rank )
    is_disqualified   = FinResultParserTools.parse_disqualified_from_result_time( result_time )
    dsq_code_type_id  = is_disqualified ? FinResultParserTools.parse_disqualification_code_type_id_from_result_time( result_time ) : nil
    mins, secs, hds   = FinResultParserTools.parse_mins_secs_hds_from_result_time( result_time )
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
      logger.debug( "Seeking existing MeetingIndividualResult..." )
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
      logger.debug( "Seeking existing DataImportMeetingIndividualResult..." )
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
        field_hash = {
          :data_import_session_id => session_id,
          :import_text  => import_text,
          :athlete_name => swimmer_name,
          :team_name    => team_name,
          :athlete_badge_number => athlete_badge,
          :team_badge_number    => team_badge_number,
          :year_of_birth => swimmer_year,
          :rank => rank.to_i,                       # Note that 'Fuori gara'.to_i = 0
          :is_play_off      => is_play_off,
          :is_out_of_race   => is_out_of_race,      # From ranking only ('Fuori gara')
          :is_disqualified  => is_disqualified,     # any DSQ possible code
          :disqualification_code_type_id => dsq_code_type_id,
          :standard_points  => standard_points,
          :meeting_points   => meeting_points,
          :minutes  => mins,
          :seconds  => secs,
          :hundreds => hds,
          :result_type_id   => ( is_play_off ? ResultType::FINALS_ID : ResultType::HEAT_ID ),
          :user_id => current_admin.id
        }.merge(
          meeting_program_id < 0 ? { :meeting_program_id => -meeting_program_id } : { :data_import_meeting_program_id => meeting_program_id }
        ).merge(
          swimmer_id.to_i < 0 ?  { :swimmer_id => -swimmer_id } : { :data_import_swimmer_id => swimmer_id }
        ).merge(
          team_id.to_i < 0 ?     { :team_id => -team_id } : { :data_import_team_id => team_id }
        ).merge(
          badge_id.to_i < 0 ?    { :badge_id => -badge_id } : { :data_import_badge_id => badge_id }
        )

        DataImportMeetingIndividualResult.transaction do
          result_row = DataImportMeetingIndividualResult.new( field_hash )
          result_row.save!                          # raise automatically an exception if save is not successful
        end
      rescue                                        # --- RESCUE (failed) transaction ---
        @phase_1_log << "\r\DataImportMeetingIndividualResult creation: exception caught during save!\r\n"
        @phase_1_log << "#{ $!.to_s }\r\n" if $!
        logger.error( "\r\n*** consume_txt_file(#{full_pathname}): DataImportMeetingIndividualResult creation: exception caught during save!" )
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
                                                          detail_row, detail_row_idx, detail_rows_size )
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
    result_score  = ( detail_row[:fields][:result_score] ).gsub(/\,/, '.').to_f
    team_id       = search_or_add_a_corresponding_team( session_id, season_id, team_name )

    is_play_off     = true
    is_out_of_race  = FinResultParserTools.parse_out_of_race_from_result_time( rank )
    is_disqualified = FinResultParserTools.parse_disqualified_from_result_time( result_time )
    dsq_code_type_id  = is_disqualified ? FinResultParserTools.parse_disqualification_code_type_id_from_result_time( result_time ) : nil
    mins, secs, hds = FinResultParserTools.parse_mins_secs_hds_from_result_time( result_time )
    standard_points = result_score
    meeting_points  = result_score
    rank = rank.to_i                                # Note that 'Fuori gara'.to_i = 0

                                                    # --- SEARCH for any existing/conflicting rows (DO NOT create forcibly one each time)
    if (meeting_program_id < 0) && (team_id < 0)
# DEBUG
      logger.debug( "Seeking existing MeetingRelayResult..." )
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
      logger.debug( "Seeking existing DataImportMeetingRelayResult..." )
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
        field_hash = {
          :data_import_session_id => session_id,
          :import_text  => import_text,
          :is_play_off      => is_play_off,
          :is_out_of_race   => is_out_of_race,
          :is_disqualified  => is_disqualified,
          :disqualification_code_type_id => dsq_code_type_id,
          :standard_points  => standard_points,
          :meeting_points   => meeting_points,
          :rank     => rank,
          :minutes  => mins,
          :seconds  => secs,
          :hundreds => hds,
          :result_type_id   => ( is_play_off ? ResultType::FINALS_ID : ResultType::HEAT_ID ),
          :user_id => current_admin.id
        }.merge(
          meeting_program_id.to_i < 0 ? { :meeting_program_id => -meeting_program_id } : { :data_import_meeting_program_id => meeting_program_id }
        ).merge(
          team_id.to_i < 0 ? { :team_id => -team_id } : { :data_import_team_id => team_id }
        )

        DataImportMeetingRelayResult.transaction do
          result_row = DataImportMeetingRelayResult.new( field_hash )
          result_row.save!                          # raise automatically an exception if save is not successful
        end
      rescue                                        # --- RESCUE (failed) transaction ---
        @phase_1_log << "\r\DataImportMeetingRelayResult creation: exception caught during save!\r\n"
        @phase_1_log << "#{ $!.to_s }\r\n" if $!
        logger.error( "\r\n*** consume_txt_file(#{full_pathname}): DataImportMeetingRelayResult creation: exception caught during save!" )
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
                                                        detail_row, detail_row_idx, detail_rows_size )
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
    team_id       = search_or_add_a_corresponding_team( session_id, season_id, team_name )
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
    #         :team_id => -team_id, 
    #         :is_out_of_race => false, :is_disqualified => false
    #     )
                                                    # Collect ALL meeting_sessions IDs:
    meeting_ss    = ( meeting_id < 0 ? MeetingSession.where( :meeting_id => -meeting_id ) : [] )
    di_meeting_ss = DataImportMeetingSession.where(
      [ "(data_import_session_id = ?) AND (#{meeting_id < 0 ? '' : 'data_import_'}meeting_id = ?)",
        session_id,
        (meeting_id < 0 ? -meeting_id : meeting_id) ]
    )
    meeting_ss_ids    = meeting_ss.collect{ |row| row.id }
    di_meeting_ss_ids = di_meeting_ss.collect{ |row| row.id }
                                                    # Collect ALL meeting_programs IDs:
# FIXME !!!!
    meeting_prgs    = MeetingProgram.only_relays.where( :meeting_session_id => meeting_ss_ids )
    di_meeting_prgs = DataImportMeetingProgram.only_relays.where(
      [ '(meeting_session_id IN (?)) OR (data_import_meeting_session_id IN (?))',
        meeting_ss_ids, di_meeting_ss_ids ]
    )
    meeting_prgs_ids    = meeting_prgs.collect{ |row| row.id }
    di_meeting_prgs_ids = di_meeting_prgs.collect{ |row| row.id }
                                                    # Collect ALL relay results:
    relay_results += MeetingRelayResult.is_valid_for_score.where(
      :meeting_program_id => meeting_prgs_ids,
      :team_id => -team_id
    ) if ( team_id < 0 )

    relay_results += DataImportMeetingRelayResult.is_valid_for_score.where(
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
#      @phase_1_log << "Seeking existing MeetingTeamScore...\r\n"
      result_row = MeetingTeamScore.where(          # ASSERT: there can be only 1 row keyed by this tuple:
        [ "(meeting_id = ?) AND (team_id = ?)",
          -meeting_id, -team_id ]
      ).first
    end

    if result_row                                   # We must differentiate the result: positive for data_import tables only, negative otherwise
      result_id = - result_row.id
      not_found = false
    else                                            # Search also inside data_import_xxx table counterpart when unsuccesful:
# DEBUG
      logger.debug( "Seeking existing DataImportMeetingTeamScore..." )
#      @phase_1_log << "Seeking existing DataImportMeetingTeamScore...\r\n"
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
      end
    end
                                                    # --- ADD: Nothing existing/conflicting found? => Add a fresh new data-import row
    if not_found
      begin                                         # --- BEGIN transaction ---
        field_hash = {
          :data_import_session_id   => session_id,
          :import_text              => import_text,
          :total_individual_points  => result_score,
          :total_relay_points       => total_relay_points.to_f,
          :rank     => rank.to_i,
          :user_id  => current_admin.id
        }.merge(
          meeting_id.to_i < 0 ? { :meeting_id => -meeting_id } : { :data_import_meeting_id => meeting_id }
        ).merge(
          team_id.to_i < 0 ? { :team_id => -team_id } : { :data_import_team_id => team_id }
        )

        DataImportMeetingTeamScore.transaction do
          result_row = DataImportMeetingTeamScore.new( field_hash )
          result_row.save!                          # raise automatically an exception if save is not successful
        end
      rescue                                        # --- RESCUE (failed) transaction ---
        @phase_1_log << "\r\DataImportMeetingTeamScore creation: exception caught during save!\r\n"
        @phase_1_log << "#{ $!.to_s }\r\n" if $!
        logger.error( "\r\n*** consume_txt_file(#{full_pathname}): DataImportMeetingTeamScore creation: exception caught during save!" )
        logger.error( "*** #{ $!.to_s }\r\n" ) if $!
        flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
      else
        result_id = result_row.id
# DEBUG
#        logger.debug( "Created :data_import_meeting_team_scores, ID:'#{result_id}'." )
#        @phase_1_log << "Created :data_import_meeting_team_scores, ID:'#{result_id}'.\r\n"
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
    last_name, first_name = nil
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
    result_row = Swimmer.where(
      [ 
        "(year_of_birth = ?) AND (complete_name LIKE ?)",
        swimmer_year, complete_name+'%'
      ]
    ).first
    if result_row                                   # We must differentiate the result: negative for Swimmer, positive for DataImportSwimmer
      result_id = - result_row.id
      not_found = false
# DEBUG
#      logger.debug( "Swimmer found! (ID=#{result_id})" )
    else                                            # Search also inside DataImportSwimmer when unsuccesful:
      result_row = DataImportSwimmer.where(
        [ "(data_import_session_id = ?) AND (year_of_birth = ?) AND (complete_name LIKE ?)",
          session_id, swimmer_year, complete_name+'%'
        ]
      ).first
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
            :data_import_session_id => session_id,
            :import_text    => "#{swimmer_name}, #{swimmer_year}",
            :last_name      => last_name,
            :first_name     => first_name,
            :complete_name  => complete_name,
            :year_of_birth  => swimmer_year,
            :gender_type_id => gender_type_id,
            :user_id => current_admin.id
          )
          result_row.save!                          # raise automatically an exception if save is not successful
        end
      rescue                                        # --- RESCUE (failed) transaction ---
        @phase_1_log << "\r\DataImportSwimmer creation: exception caught during save! (Data: #{complete_name}='#{last_name}'+'#{first_name}', #{swimmer_year})\r\n"
        @phase_1_log << "#{ $!.to_s }\r\n" if $!
        logger.error( "\r\n*** consume_txt_file: DataImportSwimmer creation: exception caught during save! (Data: #{swimmer_name}='#{last_name}'+'#{first_name}', #{swimmer_year})" )
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
  # == Returns: the corresponding id of searched entity row,
  #   - positive if freshly added into its dedicated data_import_xxx table;
  #   - negative IDs only for already existing/commited rows in "standard" entity;
  #   - 0 only on error/unable to process.
  #
  def search_or_add_a_corresponding_team( session_id, season_id, team_name )
    return 0 if team_name.nil? || team_name.size < 2
    result_id = 0
    not_found = true
                                                    # --- FIELD SETUP: Extract field values before the search:
# DEBUG
#    logger.debug( "Seeking Team '#{team_name}'..." )
#    @phase_1_log << "Seeking Team '#{team_name}'...\r\n"

# [Steve, 20131008]
# FIXME WE SHOULD MIND the name / editable_name relation AND/OR MAYBE SEARCH
#       ALSO in TeamAffiliation for existance, before dismissing an empty result as "not_found",
#       SINCE the key name MAY CHANGE in BETWEEN SEASONS!

                                                    # --- SEARCH for any existing/conflicting rows (DO NOT create forcibly one each time)
    team_affiliation = TeamAffiliation.where( ["(name LIKE ?)", team_name+'%'] ).first

    result_row = team_affiliation ? 
                 team_affiliation.team :
                 Team.where( ["(name LIKE ?)", team_name+'%'] ).first

    if result_row                                   # We must differentiate the result: negative for Team, positive for DataImportTeam
      result_id = - result_row.id
      not_found = false
# DEBUG
#      logger.debug( "Team found! (ID=#{result_id})" )
                                                    # Check if there is (& there must be) a corresponding TeamAffiliation: if missing, add it for current season
      team_affiliation = TeamAffiliation.where(
        :team_id => result_row.id,
        :season_id  => season_id
      ).first unless team_affiliation

      unless team_affiliation                       # When missing, we must add the TeamAffiliation row for this season!
        begin                
          TeamAffiliation.transaction do
            team_affiliation = TeamAffiliation.new(
              :name       => result_row.name,
              :must_compute_ober_cup => false,
              :is_autofilled  => true,              # signal that we have guessed some of the values
              :team_id    => result_row.id,
              :season_id  => season_id,
              :user_id    => current_admin.id
              # FIXME Unable to guess team affiliation number (not filled-in, to be added by hand)
            )
            # (ASSERT: assuming TeamAffiliation DOES NOT exist if the Team row is missing)
            team_affiliation.save!                  # raise automatically an exception if save is not successful
          end
        rescue
          @phase_1_log << "\r\DataImportTeam, TeamAffiliation creation: exception caught during save! (Name:'#{team_name}')\r\n"
          @phase_1_log << "#{ $!.to_s }\r\n" if $!
          logger.error( "\r\n*** consume_txt_file: DataImportTeam, TeamAffiliation creation: exception caught during save! (Name:'#{team_name}')" )
          logger.error( "*** #{ $!.to_s }\r\n" ) if $!
          flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
        end
      end # (END unless team_affiliation)

    else                                            # result_row.nil? Search also inside DataImportTeam when unsuccesful:
      result_row = DataImportTeam.where(
        [ "(data_import_session_id = ?) AND (name LIKE ?)",
          session_id, team_name+'%' ]
      ).first
      if result_row
        result_id = result_row.id
        not_found = false
# DEBUG
#        logger.debug( "DataImportTeam found! (ID=#{result_id})" )
      end
    end
                                                    # --- ADD: Nothing existing/conflicting found? => Add a fresh new data-import row
    if not_found
      city_id = search_or_add_a_corresponding_city(
        session_id,
        FinResultParserTools.guess_city_from_team_name(team_name)
      )
      begin                                         # --- BEGIN transaction ---
# DEBUG
 #       logger.debug( "Team not found: creating new DataImportTeam row..." )
        field_hash = {
          :data_import_session_id => session_id,
          :import_text => team_name,
          :name => team_name,
          :user_id => current_admin.id
        }.merge(
          city_id.to_i < 0 ? { :city_id => -city_id } : { :data_import_city_id => city_id }
        )

        DataImportTeam.transaction do
          result_row = DataImportTeam.new( field_hash )
          result_row.save!                          # raise automatically an exception if save is not successful
        end
      rescue                                        # --- RESCUE (failed) transaction ---
        @phase_1_log << "\r\DataImportTeam creation: exception caught during save! (Name:'#{team_name}')\r\n"
        @phase_1_log << "#{ $!.to_s }\r\n" if $!
        logger.error( "\r\n*** consume_txt_file: DataImportTeam creation: exception caught during save! (Name:'#{team_name}')" )
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
  # corresponding Badge is searched for.
  # Whenever none is found a new one is added to the temp table data_import_badge.
  #
  # == Returns: the corresponding id of searched entity row,
  #   - positive if freshly added into its dedicated data_import_xxx table;
  #   - negative IDs only for already existing/commited rows in "standard" entity;
  #   - 0 only on error/unable to process.
  #
  def search_or_add_a_corresponding_badge( session_id, badge_code, season_id, team_id, swimmer_id,
                                           category_type_id, accreditation_time_type_id )
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
          :data_import_session_id => session_id,
          :import_text => badge_code,
          :number => badge_code,
          :category_type_id => category_type_id,
          :accreditation_time_type_id => accreditation_time_type_id,
          :season_id => season_id,
          :user_id => current_admin.id
        }.merge(
          swimmer_id.to_i < 0 ? { :swimmer_id => -swimmer_id } : { :data_import_swimmer_id => swimmer_id }
        ).merge(
          team_id.to_i < 0 ?    { :team_id => -team_id } : { :data_import_team_id => team_id }
        )

        DataImportBadge.transaction do
          result_row = DataImportBadge.new( field_hash )
          result_row.save!                          # raise automatically an exception if save is not successful
        end
      rescue                                        # --- RESCUE (failed) transaction ---
        @phase_1_log << "\r\DataImportBadge creation: exception caught during save! (Number:'#{badge_code}')\r\n"
        @phase_1_log << "#{ $!.to_s }\r\n" if $!
        logger.error( "\r\n*** consume_txt_file: DataImportBadge creation: exception caught during save! (Number='#{badge_code}')" )
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
    result_row = City.where( ["(name LIKE ?) AND (area LIKE ?) AND (country_code LIKE ?)", name+'%', area+'%', country_code+'%'] ).first
    if result_row                                   # We must differentiate the result: negative for City, positive for DataImportCity
      result_id = - result_row.id
      not_found = false
# DEBUG
#      logger.debug( "City found! (ID=#{result_id})" )
    else                                            # Search also inside DataImportTeam when unsuccesful:
      result_row = DataImportCity.where(
        [ "(data_import_session_id = ?) AND (name LIKE ?) AND (area LIKE ?) AND (country_code LIKE ?)",
          session_id, name+'%', area+'%', country_code+'%' ]
      ).first
      if result_row
        result_id = result_row.id
        not_found = false
# DEBUG
#        logger.debug( "DataImportCity found! (ID=#{result_id})" )
      end
    end
                                                    # --- ADD: Nothing existing/conflicting found? => Add a fresh new data-import row
    if not_found
      begin                                         # --- BEGIN transaction ---
# DEBUG
#        logger.debug( "City not found: creating new DataImportCity row..." )
        DataImportCity.transaction do
          result_row = DataImportCity.new(
            :data_import_session_id => session_id,
            :import_text => city_name,
            :name => name,
            :zip => zip,
            :area => area,
            :country => country,
            :country_code => country_code,
            :user_id => current_admin.id
          )
          result_row.save!                          # raise automatically an exception if save is not successful
        end
      rescue                                        # --- RESCUE (failed) transaction ---
        @phase_1_log << "\r\DataImportCity creation: exception caught during save! (#{names.inspect})\r\n"
        @phase_1_log << "#{ $!.to_s }\r\n" if $!
        logger.error( "\r\n*** consume_txt_file: DataImportCity creation: exception caught during save! (#{names.inspect})" )
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


  # Commit method for DataImportMeeting / Meeting.
  # Commits the rows of the entity from the data-import temp. table to the actual
  # entity destination table.
  #  
  # == Returns:
  # +true+ if ok; +false+ on error/unable to save
  #
  def commit_data_import_meeting( data_import_session_id )
    di_records = DataImportMeeting.where( :data_import_session_id => data_import_session_id )
    result_id  = 0
    is_ok = true
    committed_row = nil
    if di_records
      di_records.each do |di_row|
# DEBUG
#        logger.debug( "\r\nCommitting #{di_row.class.name} = '#{di_row.description}'..." )
        begin                                       # --- BEGIN transaction ---
          Meeting.transaction do
            committed_row = Meeting.new(
              :description    => di_row.description,
              :entry_deadline => di_row.entry_deadline,
              :is_autofilled  => true,              # signal that we have guessed some of the values (for instance, the begin/scheduled times)
              :are_results_acquired => di_row.are_results_acquired,
              :configuration_file => di_row.configuration_file,
              :notes          => di_row.notes,
              :season_id      => di_row.season_id,
              :user_id        => di_row.user_id
              # TODO :challenge_number is not used!
              # TODO :is_under_25_admitted is not used!
            )
            committed_row.save!                     # raise automatically an exception if save is not successful
          end
          result_id = committed_row.id
                                                    # Update dependancy: |=> data_import_meeting_session(meeting)
          DataImportMeetingSession.where(
            :data_import_meeting_id => di_row.id
          ).update_all( :meeting_id => result_id )
                                                    # Update dependancy: |=> data_import_meeting_team_scores(meeting)
          DataImportMeetingTeamScore.where(
            :data_import_meeting_id => di_row.id
          ).update_all( :meeting_id => result_id )

        rescue                                      # --- RESCUE (failed) transaction ---
          is_ok = false
          @phase_2_log << "\r\n#{di_row.class.name} commit: exception caught during save!\r\n"
          @phase_2_log << "#{ $!.to_s }\r\n" if $!
          logger.error( "\r\n*** #{di_row.class.name} commit: exception caught during save!" )
          logger.error( "*** #{ $!.to_s }\r\n" ) if $!
          flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
        else
# DEBUG
#          logger.debug( "Committed #{committed_row.class.name}, ID:#{result_id}, '#{committed_row.description}'." )
#          @phase_2_log << "Committed #{committed_row.class.name}, ID:#{result_id}, '#{committed_row.description}'.\r\n"
          @committed_data_rows += 1
        end                                         # --- END transaction ---
      end
    end
    is_ok
  end
  # ---------------------------------------------------------------------------


  # Commit method for DataImportMeetingSession / MeetingSession.
  # Commits the rows of the entity from the data-import temp. table to the actual
  # entity destination table.
  #  
  # == Returns:
  # +true+ if ok; +false+ on error/unable to save
  #
  # == Dependancy:
  #   |=> meeting_session(meeting)
  #
  def commit_data_import_meeting_session( data_import_session_id )
    di_records = DataImportMeetingSession.where( :data_import_session_id => data_import_session_id )
    result_id  = 0
    is_ok = true
    committed_row = nil
    if di_records
      di_records.each do |di_row|
# DEBUG
#        logger.debug( "\r\nCommitting #{di_row.class.name} = '#{di_row.description}'..." )
        begin                                       # --- BEGIN transaction ---
          MeetingSession.transaction do
            committed_row = MeetingSession.new(
              :session_order  => di_row.session_order,
              :scheduled_date => di_row.scheduled_date,
              :warm_up_time   => di_row.warm_up_time,
              :begin_time     => di_row.begin_time,
              :is_autofilled  => true,              # signal that we have guessed some of the values (for instance, the begin/scheduled times)
              :description    => di_row.description,
              :meeting_id     => di_row.meeting_id,
              :user_id        => di_row.user_id
              # TODO :notes is not used!
              # TODO :swimming_pool_id is not used!
            )
            committed_row.save!                     # raise automatically an exception if save is not successful
          end
          result_id = committed_row.id
                                                    # Update dependancy: |=> data_import_meeting_program(meeting_session)
          DataImportMeetingProgram.where(
            :data_import_meeting_session_id => di_row.id
          ).update_all( :meeting_session_id => result_id )

        rescue                                      # --- RESCUE (failed) transaction ---
          is_ok = false
          @phase_2_log << "\r\n#{di_row.class.name} commit: exception caught during save!\r\n"
          @phase_2_log << "#{ $!.to_s }\r\n" if $!
          logger.error( "\r\n*** #{di_row.class.name} commit: exception caught during save!" )
          logger.error( "*** #{ $!.to_s }\r\n" ) if $!
          flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
        else
# DEBUG
#          logger.debug( "Committed #{committed_row.class.name}, ID:#{result_id}, '#{committed_row.description}'." )
#          @phase_2_log << "Committed #{committed_row.class.name}, ID:#{result_id}, '#{committed_row.description}'.\r\n"
          @committed_data_rows += 1
        end                                         # --- END transaction ---
      end
    end
    is_ok
  end
  # ---------------------------------------------------------------------------


  # Commit method for DataImportMeetingProgram / MeetingProgram.
  # Commits the rows of the entity from the data-import temp. table to the actual
  # entity destination table.
  #  
  # == Returns:
  # +true+ if ok; +false+ on error/unable to save
  #
  # == Dependancy:
  #   |=> meeting_program(meeting_session)
  #
  def commit_data_import_meeting_program( data_import_session_id )
    di_records = DataImportMeetingProgram.where( :data_import_session_id => data_import_session_id )
    result_id  = 0
    is_ok = true
    committed_row = nil
    if di_records
      di_records.each do |di_row|
# DEBUG
#        logger.debug( "\r\nCommitting #{di_row.class.name} = '#{di_row.get_short_name}'..." )
        begin                                       # --- BEGIN transaction ---
          MeetingProgram.transaction do
            committed_row = MeetingProgram.new(
              :event_order => di_row.event_order,
              :begin_time  => di_row.begin_time,
              :is_autofilled  => true,              # signal that we have guessed some of the values (for instance, the begin/scheduled times)
              :meeting_session_id => di_row.meeting_session_id,
              :event_type_id      => di_row.event_type_id,
              :category_type_id   => di_row.category_type_id,
              :gender_type_id     => di_row.gender_type_id,
              :accreditation_time_type_id => di_row.accreditation_time_type_id,
              :minutes  => di_row.minutes,
              :seconds  => di_row.seconds,
              :hundreds => di_row.hundreds,
              :user_id  => di_row.user_id
            )
            committed_row.save!                     # raise automatically an exception if save is not successful
          end
          result_id = committed_row.id
                                                    # Update dependancy: |=> data_import_meeting_individual_results(meeting_program)
          DataImportMeetingIndividualResult.where(
            :data_import_meeting_program_id => di_row.id
          ).update_all( :meeting_program_id => result_id )
                                                    # Update dependancy: |=> data_import_meeting_relay_results(meeting_program)
          DataImportMeetingRelayResult.where(
            :data_import_meeting_program_id => di_row.id
          ).update_all( :meeting_program_id => result_id )

        rescue                                      # --- RESCUE (failed) transaction ---
          is_ok = false
          @phase_2_log << "\r\n#{di_row.class.name} commit: exception caught during save!\r\n"
          @phase_2_log << "#{ $!.to_s }\r\n" if $!
          logger.error( "\r\n*** #{di_row.class.name} commit: exception caught during save!" )
          logger.error( "*** #{ $!.to_s }\r\n" ) if $!
          flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
        else
# DEBUG
#          logger.debug( "Committed #{committed_row.class.name}, ID:#{result_id}, '#{committed_row.get_short_name}'." )
#          @phase_2_log << "Committed #{committed_row.class.name}, ID:#{result_id}, '#{committed_row.get_short_name}'.\r\n"
          @committed_data_rows += 1
        end                                         # --- END transaction ---
      end
    end
    is_ok
  end
  # ---------------------------------------------------------------------------


  # Commit method for DataImportCity / City.
  # Commits the rows of the entity from the data-import temp. table to the actual
  # entity destination table.
  #  
  # == Returns:
  # +true+ if ok; +false+ on error/unable to save
  #
  def commit_data_import_cities( data_import_session_id )
    di_records = DataImportCity.where( :data_import_session_id => data_import_session_id )
    result_id  = 0
    is_ok = true
    committed_row = nil
    if di_records
      di_records.each do |di_row|
# DEBUG
#        logger.debug( "\r\nCommitting #{di_row.class.name} = '#{di_row.name}'..." )
        begin                                       # --- BEGIN transaction ---
          City.transaction do
            committed_row = City.new(
              :name     => di_row.name,
              :zip      => di_row.zip,
              :area     => di_row.area,
              :country  => di_row.country,
              :country_code => di_row.country_code,
              :user_id  => di_row.user_id
            )
            committed_row.save!                     # raise automatically an exception if save is not successful
          end
          result_id = committed_row.id
                                                    # Update dependancy: |=> data_import_teams(city)
          DataImportTeam.where(
            :data_import_city_id => di_row.id
          ).update_all( :city_id => result_id )

        rescue                                      # --- RESCUE (failed) transaction ---
          is_ok = false
          @phase_2_log << "\r\n#{di_row.class.name} commit: exception caught during save!\r\n"
          @phase_2_log << "#{ $!.to_s }\r\n" if $!
          logger.error( "\r\n*** #{di_row.class.name} commit: exception caught during save!" )
          logger.error( "*** #{ $!.to_s }\r\n" ) if $!
          flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
        else
# DEBUG
#          logger.debug( "Committed #{committed_row.class.name}, ID:#{result_id}, '#{committed_row.name}'." )
#          @phase_2_log << "Committed #{committed_row.class.name}, ID:#{result_id}, '#{committed_row.name}'.\r\n"
          @committed_data_rows += 1
        end                                         # --- END transaction ---
      end
    end
    is_ok
  end
  # ---------------------------------------------------------------------------


  # Commit method for DataImportTeam / Team / TeamAffiliation.
  # Commits the rows of the entity from the data-import temp. table to the actual
  # entity destination table.
  #  
  # == Returns:
  # +true+ if ok; +false+ on error/unable to save
  #
  # == Dependancy:
  #   |=> teams(city)
  #
  def commit_data_import_teams( data_import_session_id, season_id )
    di_records = DataImportTeam.where( :data_import_session_id => data_import_session_id )
    result_id  = 0
    is_ok = true
    committed_row, additional_row = nil
    if di_records
      di_records.each do |di_row|
# DEBUG
#        logger.debug( "\r\nCommitting #{di_row.class.name} = '#{di_row.name}'..." )
        begin                                       # --- BEGIN transaction ---
          Team.transaction do
            committed_row = Team.new(
              :name             => di_row.name,
              :editable_name    => di_row.name,     # (let's initialize this with the data-import name)
              :name_variations  => di_row.name,
              :city_id => di_row.city_id,
              :user_id => di_row.user_id
              # TODO notes is not used
            )
            committed_row.save!                     # raise automatically an exception if save is not successful
          end
          result_id = committed_row.id
                                                    # We must add also a new TeamAffiliation row for this season!
          TeamAffiliation.transaction do            # Create dependancy: |=> team_affiliations(team, season)
            additional_row = TeamAffiliation.new(
              :name       => committed_row.name,
              :must_compute_ober_cup => false,
              :is_autofilled  => true,              # signal that we have guessed some of the values
              :team_id    => result_id,
              :season_id  => season_id,
              :user_id    => committed_row.user_id
              # FIXME Unable to guess team affiliation number (not filled-in, to be added by hand)
            )
            # (ASSERT: assuming TeamAffiliation DOES NOT exist if the Team row is missing)
            additional_row.save!                    # raise automatically an exception if save is not successful
          end
                                                    # Update dependancy: |=> data_import_badges(swimmer, team, category, season)
          DataImportBadge.where(
            :data_import_team_id => di_row.id
          ).update_all( :team_id => result_id )

          DataImportMeetingIndividualResult.where(
            :data_import_team_id => di_row.id
          ).update_all( :team_id => result_id )
          DataImportMeetingRelayResult.where(
            :data_import_team_id => di_row.id
          ).update_all( :team_id => result_id )
          DataImportMeetingTeamScore.where(
            :data_import_team_id => di_row.id
          ).update_all( :team_id => result_id )

        rescue                                      # --- RESCUE (failed) transaction ---
          is_ok = false
          @phase_2_log << "\r\n#{di_row.class.name} commit: exception caught during save!\r\n"
          @phase_2_log << "#{ $!.to_s }\r\n" if $!
          logger.error( "\r\n*** #{di_row.class.name} commit: exception caught during save!" )
          logger.error( "*** #{ $!.to_s }\r\n" ) if $!
          flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
        else
# DEBUG
#          logger.debug( "Committed #{committed_row.class.name}, ID:#{result_id}, '#{committed_row.name}' + #{additional_row.class.name} for Season ID #{season_id}." )
#          @phase_2_log << "Committed #{committed_row.class.name}, ID:#{result_id}, '#{committed_row.name}' + #{additional_row.class.name} for Season ID #{season_id}.\r\n"
          @committed_data_rows += 1
        end                                         # --- END transaction ---
      end
    end
    is_ok
  end
  # ---------------------------------------------------------------------------


  # Commit method for DataImportSwimmer / Swimmer.
  # Commits the rows of the entity from the data-import temp. table to the actual
  # entity destination table.
  #  
  # == Returns:
  # +true+ if ok; +false+ on error/unable to save
  #
  def commit_data_import_swimmers( data_import_session_id )
    di_records = DataImportSwimmer.where( :data_import_session_id => data_import_session_id )
    result_id  = 0
    is_ok = true
    committed_row = nil
    if di_records
      di_records.each do |di_row|
# DEBUG
#        logger.debug( "\r\nCommitting #{di_row.class.name} = '#{di_row.complete_name}'..." )
        begin                                       # --- BEGIN transaction ---
          Swimmer.transaction do
            committed_row = Swimmer.new(
              :last_name      => di_row.last_name,
              :first_name     => di_row.first_name,
              :complete_name  => di_row.complete_name,
              :year_of_birth  => di_row.year_of_birth,
              :gender_type_id => di_row.gender_type_id,
              :user_id        => di_row.user_id
            )
            committed_row.save!                     # raise automatically an exception if save is not successful
          end
          result_id = committed_row.id
                                                    # Update dependancy: |=> data_import_badges(swimmer, team, category, season)
          DataImportBadge.where(
            :data_import_swimmer_id => di_row.id
          ).update_all( :swimmer_id => result_id )

          DataImportMeetingIndividualResult.where(
            :data_import_swimmer_id => di_row.id
          ).update_all( :swimmer_id => result_id )

        rescue                                      # --- RESCUE (failed) transaction ---
          is_ok = false
          @phase_2_log << "\r\n#{di_row.class.name} commit: exception caught during save!\r\n"
          @phase_2_log << "#{ $!.to_s }\r\n" if $!
          logger.error( "\r\n*** #{di_row.class.name} commit: exception caught during save!" )
          logger.error( "*** #{ $!.to_s }\r\n" ) if $!
          flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
        else
# DEBUG
#          logger.debug( "Committed #{committed_row.class.name}, ID:#{result_id}, '#{committed_row.complete_name}'." )
#          @phase_2_log << "Committed #{committed_row.class.name}, ID:#{result_id}, '#{committed_row.complete_name}'.\r\n"
          @committed_data_rows += 1
        end                                         # --- END transaction ---
      end
    end
    is_ok
  end


  # Commit method for DataImportBadge / Badge.
  # Commits the rows of the entity from the data-import temp. table to the actual
  # entity destination table.
  #  
  # == Returns:
  # +true+ if ok; +false+ on error/unable to save
  #
  # == Dependancy:
  #   |=> badges(swimmer, team, category, season)
  #
  def commit_data_import_badges( data_import_session_id )
    di_records = DataImportBadge.where( :data_import_session_id => data_import_session_id )
    result_id  = 0
    is_ok = true
    committed_row = nil
    if di_records
      di_records.each do |di_row|
# DEBUG
#        logger.debug( "\r\nCommitting #{di_row.class.name} = '#{di_row.number}'..." )
        begin                                       # --- BEGIN transaction ---
          Badge.transaction do
            committed_row = Badge.new(
              :number   => di_row.number,
              :category_type_id => di_row.category_type_id,
              :accreditation_time_type_id => di_row.accreditation_time_type_id,
              :swimmer_id => di_row.swimmer_id,
              :team_id    => di_row.team_id,
              :season_id  => di_row.season_id,
              :user_id    => di_row.user_id
            )
            # ASSERT: assuming season_id is always positive (chosen by admin during data-import)
            committed_row.save!                     # raise automatically an exception if save is not successful
          end
          result_id = committed_row.id

          DataImportMeetingIndividualResult.where(
            :data_import_badge_id => di_row.id
          ).update_all( :badge_id => result_id )

        rescue                                      # --- RESCUE (failed) transaction ---
          is_ok = false
          @phase_2_log << "\r\n#{di_row.class.name} commit: exception caught during save!\r\n"
          @phase_2_log << "#{ $!.to_s }\r\n" if $!
          logger.error( "\r\n*** #{di_row.class.name} commit: exception caught during save!" )
          logger.error( "*** #{ $!.to_s }\r\n" ) if $!
          flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
        else
# DEBUG
#          logger.debug( "Committed #{committed_row.class.name}, ID:#{result_id}, '#{committed_row.number}'." )
#          @phase_2_log << "Committed #{committed_row.class.name}, ID:#{result_id}, '#{committed_row.number}'.\r\n"
          @committed_data_rows += 1
        end                                         # --- END transaction ---
      end
    end
    is_ok
  end
  # ---------------------------------------------------------------------------


  # Commit method for DataImportMeetingIndividualResult / MeetingIndividualResult.
  # Commits the rows of the entity from the data-import temp. table to the actual
  # entity destination table.
  #  
  # == Returns:
  # +true+ if ok; +false+ on error/unable to save
  #
  # == Dependancy:
  #   |=> meeting_individual_results(meeting_program)
  #
  def commit_data_import_meeting_individual_results( data_import_session_id )
    di_records = DataImportMeetingIndividualResult.where( :data_import_session_id => data_import_session_id )
    result_id  = 0
    is_ok = true
    committed_row = nil
    if di_records
      di_records.each do |di_row|
# DEBUG
#        logger.debug( "\r\nCommitting #{di_row.class.name} = '#{di_row.athlete_name}', pts. #{di_row.meeting_points}..." )
        begin                                       # --- BEGIN transaction ---
          MeetingIndividualResult.transaction do
            committed_row = MeetingIndividualResult.new(
              :athlete_name => di_row.athlete_name,
              :team_name    => di_row.team_name,
              :athlete_badge_number => di_row.athlete_badge_number,
              :team_badge_number    => di_row.team_badge_number,
              :year_of_birth => di_row.year_of_birth,
              :rank     => di_row.rank,
              :is_play_off      => di_row.is_play_off,
              :is_out_of_race   => di_row.is_out_of_race,
              :is_disqualified  => di_row.is_disqualified,
              :disqualification_code_type_id => di_row.disqualification_code_type_id,
              :standard_points  => di_row.standard_points,
              :meeting_points   => di_row.meeting_points,
              :minutes  => di_row.minutes,
              :seconds  => di_row.seconds,
              :hundreds => di_row.hundreds,
              :meeting_program_id => di_row.meeting_program_id,
              :result_type_id     => di_row.result_type_id,
              :swimmer_id => di_row.swimmer_id,
              :team_id    => di_row.team_id,
              :badge_id   => di_row.badge_id,
              :user_id    => di_row.user_id
            )
            committed_row.save!                     # raise automatically an exception if save is not successful
          end
          result_id = committed_row.id

        rescue                                      # --- RESCUE (failed) transaction ---
          is_ok = false
          @phase_2_log << "\r\n#{di_row.class.name} commit: exception caught during save!\r\n"
          @phase_2_log << "#{ $!.to_s }\r\n" if $!
          logger.error( "\r\n*** #{di_row.class.name} commit: exception caught during save!" )
          logger.error( "*** #{ $!.to_s }\r\n" ) if $!
          flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
        else
# DEBUG
#          logger.debug( "Committed #{committed_row.class.name}, ID:#{result_id}, '#{committed_row.athlete_name}', pts. #{committed_row.meeting_points}." )
#          @phase_2_log << "Committed #{committed_row.class.name}, ID:#{result_id}, '#{committed_row.athlete_name}', pts. #{committed_row.meeting_points}.\r\n"
          @committed_data_rows += 1
        end                                         # --- END transaction ---
      end
    end
    is_ok
  end
  # ---------------------------------------------------------------------------


  # Commit method for DataImportMeetingRelayResult / MeetingRelayResult.
  # Commits the rows of the entity from the data-import temp. table to the actual
  # entity destination table.
  #  
  # == Returns:
  # +true+ if ok; +false+ on error/unable to save
  #
  # == Dependancy:
  #   |=> meeting_relay_results(meeting_program)
  #
  def commit_data_import_meeting_relay_results( data_import_session_id )
    di_records = DataImportMeetingRelayResult.where( :data_import_session_id => data_import_session_id )
    result_id  = 0
    is_ok = true
    committed_row = nil
    if di_records
      di_records.each do |di_row|
# DEBUG
#        logger.debug( "\r\nCommitting #{di_row.class.name} = team_id: #{di_row.team_id}, pts. #{di_row.meeting_points}..." )
        begin                                       # --- BEGIN transaction ---
          MeetingRelayResult.transaction do
            committed_row = MeetingRelayResult.new(
              :meeting_program_id => di_row.meeting_program_id,
              :is_play_off      => di_row.is_play_off,
              :is_out_of_race   => di_row.is_out_of_race,
              :is_disqualified  => di_row.is_disqualified,
              :disqualification_code_type_id => di_row.disqualification_code_type_id,
              :standard_points  => di_row.standard_points,
              :meeting_points   => di_row.meeting_points,
              :result_type_id   => di_row.result_type_id,
              :team_id  => di_row.team_id,
              :rank     => di_row.rank,
              :minutes  => di_row.minutes,
              :seconds  => di_row.seconds,
              :hundreds => di_row.hundreds,
              :user_id  => di_row.user_id
            )
            committed_row.save!                     # raise automatically an exception if save is not successful
          end
          result_id = committed_row.id

        rescue                                      # --- RESCUE (failed) transaction ---
          is_ok = false
          @phase_2_log << "\r\n#{di_row.class.name} commit: exception caught during save!\r\n"
          @phase_2_log << "#{ $!.to_s }\r\n" if $!
          logger.error( "\r\n*** #{di_row.class.name} commit: exception caught during save!" )
          logger.error( "*** #{ $!.to_s }\r\n" ) if $!
          flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
        else
# DEBUG
#          logger.debug( "Committed #{committed_row.class.name}, ID:#{result_id}, team_id: #{committed_row.team_id}, pts. #{committed_row.meeting_points}." )
#          @phase_2_log << "Committed #{committed_row.class.name}, ID:'#{result_id}', team_id: #{committed_row.team_id}, pts. #{committed_row.meeting_points}.\r\n"
          @committed_data_rows += 1
        end                                         # --- END transaction ---
      end
    end
    is_ok
  end
  # ---------------------------------------------------------------------------


  # Commit method for DataImportMeetingTeamScore / MeetingTeamScore.
  # Commits the rows of the entity from the data-import temp. table to the actual
  # entity destination table.
  #  
  # == Returns:
  # +true+ if ok; +false+ on error/unable to save
  #
  # == Dependancy:
  #   |=> meeting_team_scores(meeting)
  #
  def commit_data_import_meeting_team_score( data_import_session_id )
    di_records = DataImportMeetingTeamScore.where( :data_import_session_id => data_import_session_id )
    result_id  = 0
    is_ok = true
    committed_row = nil
    if di_records
      di_records.each do |di_row|
# DEBUG
#        logger.debug( "\r\nCommitting #{di_row.class.name} = team_id: #{di_row.team_id}, pts. #{di_row.total_individual_points}..." )
        begin                                       # --- BEGIN transaction ---
          MeetingTeamScore.transaction do
            committed_row = MeetingTeamScore.new(
              :meeting_id => di_row.meeting_id,
              :team_id  => di_row.team_id,
              :rank     => di_row.rank,
              :total_individual_points  => di_row.total_individual_points,
              :total_relay_points   => di_row.total_relay_points,
              :user_id  => di_row.user_id
            )
            committed_row.save!                     # raise automatically an exception if save is not successful
          end
          result_id = committed_row.id

        rescue                                      # --- RESCUE (failed) transaction ---
          is_ok = false
          @phase_2_log << "\r\n#{di_row.class.name} commit: exception caught during save!\r\n"
          @phase_2_log << "#{ $!.to_s }\r\n" if $!
          logger.error( "\r\n*** #{di_row.class.name} commit: exception caught during save!" )
          logger.error( "*** #{ $!.to_s }\r\n" ) if $!
          flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
        else
# DEBUG
#          logger.debug( "Committed #{committed_row.class.name}, ID:#{result_id}, team_id: #{committed_row.team_id}, pts. #{committed_row.total_individual_points}." )
#          @phase_2_log << "Committed #{committed_row.class.name}, ID:#{result_id}, team_id: #{committed_row.team_id}, pts. #{committed_row.total_individual_points}.\r\n"
          @committed_data_rows += 1
        end                                         # --- END transaction ---
      end
    end
    is_ok
  end
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------
end
