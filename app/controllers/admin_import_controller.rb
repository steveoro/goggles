# encoding: utf-8
require 'fileutils'                                 # Used to process filenames
require 'common/format'
require 'parsers/data_importer'


class AdminImportController < ApplicationController

  layout 'admin_import'

  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_admin!
  # ---------------------------------------------------------------------------


  # Destroys an existing Data-import session
  #
  def kill_import_session
    DataImporter.destroy_data_import_session( params[:id].to_i, logger ) if params[:id]
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
  # - <tt>:force_meeting_creation</tt> => true/not nil to enable the creation of missing Meeting / MeetingSession rows (Season is assumed to be always pre-existent)
  # - <tt>:force_team_creation</tt> => true/not nil to enable the creation of missing Team / TeamAssociation rows
  #
  def step2_checkout
# DEBUG
#    logger.debug "\r\n\r\n!! ------ admin_import::step2_checkout -----"
#    logger.debug "PARAMS: #{params.inspect}"
#    logger.debug "FILENAME...: #{params[:datafile].original_filename if params[:datafile]}"
    @season_id = 0                                  # (Must retrieve Season ID from form parameters)
    @force_missing_meeting_creation = false

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
      force_missing_meeting_creation = ( params[:force_meeting_creation].to_i > 0 )
      force_missing_team_creation = ( params[:force_team_creation].to_i > 0 )
      @season_description = '?'
      begin
        season = Season.find_by_id(@season_id)
        @season_description = season.description if season
      rescue
      end

      tmp_file = params[:datafile].tempfile         # (This is an ActionDispatch::Http::UploadedFile object)
      destination_filename = File.join( "public/uploads", params[:datafile].original_filename )
      FileUtils.cp tmp_file.path, destination_filename
                                                    # === Create a new data-import session and consume the file: ===
      data_importer = DataImporter.new( logger, flash, current_admin.id )
      data_import_session = data_importer.consume_txt_file(
        destination_filename, season, force_missing_meeting_creation,
        force_missing_team_creation
      )
                                                    # Session retrieval successful? Head on to phase #2 and let the component handle the rest:
      @data_import_session_id = data_import_session ? data_import_session.id : nil

    else                                            # -- CASE ELSE: form not-fully completed
      flash[:notice] = I18n.t(:nothing_to_do_upload_something, {:scope=>[:admin_import]})
      redirect_to( goggles_di_step1_status_path() ) and return
    end
                                                    # -- CHECK OUTCOME: something went awfully wrong? Redirect:
    if @data_import_session_id.nil?
      if data_import_session                        # Store the log, if possible
        data_import_session.phase_1_log = data_importer.get_phase_1_log()
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

    data_importer = DataImporter.new( logger, flash, current_admin.id )
    is_ok = data_importer.commit( data_import_session )

    @phase_2_log  = data_importer.get_phase_2_log()
    @import_log   = data_importer.get_import_log()
    @committed_data_rows = data_importer.get_committed_data_rows()

    unless is_ok
      redirect_to( goggles_di_step1_status_path() ) and return
    end
  end
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------
end
