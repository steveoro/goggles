# encoding: utf-8
require 'fileutils'                                 # Used to process filenames
require 'common/format'
require 'data_import/strategies/data_importer'


=begin

= AdminImportController

  - version:  4.00.383
  - author:   Steve A.

=end
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
    @existing_import_sessions = DataImportSession.where( user_id: current_admin.id )
  end
  # ---------------------------------------------------------------------------


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
      render( text: "<span class=\"label label-info\">#{curr_label}</span><div class=\"bar\" style=\"width: #{percent}%;\"></div>" )

    else
      flash[:info] = I18n.t(:invalid_action_request)
      redirect_to( goggles_di_step1_status_path() ) and return
    end
  end
  # ---------------------------------------------------------------------------


  # Alternative phase-2 outcome from phase-1, if some problematic team names
  # are found.
  #
  # This is actually displayed as "Phase 1.1 - Team Analysis" (Review/confirm not-found or dubious Team names)
  #
  def step2_analysis
# DEBUG
    logger.debug "\r\n\r\n!! ------ admin_import::step2_analysis -----"
    logger.debug "PARAMS: #{params.inspect}"
                                                    # Propagate forward (phase-3) the parameters from Phase-1, if any:
    @force_missing_meeting_creation = ( (params[:force_meeting_creation] == 'true') || (params[:force_meeting_creation].to_i > 0) )
    @force_missing_team_creation    = ( (params[:force_team_creation] == 'true') || (params[:force_team_creation].to_i > 0) )
    if ( params[:id].to_i > 0 )
      @data_import_session_id = params[:id].to_i
      @analysis_results = DataImportTeamAnalysisResult.where( data_import_session_id: @data_import_session_id )
    else
      @data_import_session_id = 0
      @analysis_results = []
    end
  end
  # ---------------------------------------------------------------------------


  # Data Import Wizard: Phase#2 (file parsing & consequent manual review of the data)
  # Scan each data-import row and parse it, preparing its "preview" columns.
  #
  # This is actually displayed as "Phase 2 - Manual data check" (edit imported data before committing)
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
#    logger.debug "FILENAME...: #{params[:datafile].original_filename if params[:datafile] }"
    filename_to_be_parsed = nil
    data_import_session   = nil
    data_importer         = nil
    force_missing_meeting_creation = ( (params[:force_meeting_creation] == 'true') || (params[:force_meeting_creation].to_i > 0) )
    force_missing_team_creation    = ( (params[:force_team_creation] == 'true') || (params[:force_team_creation].to_i > 0) )
    season_id = 0                                  # (Possibly retrieve Season ID from form parameters; otherwise, parse it from filename)
    season = nil
    @season_description = '?'

                                                    # === CASE 1: id parameter present? We then assume a session is already in progress:
    if params[:id]
      data_import_session = DataImportSession.find_by_id( params[:id].to_i )
      season_id = data_import_session.season_id if ( data_import_session && data_import_session.respond_to?( :season_id ) )
# DEBUG
#      logger.debug "SEASON.....: ID=#{season_id}"
#      logger.debug "!! ---------------------------\r\n\r\n"
      if ( season_id.to_i < 1 )
        flash[:info] = I18n.t(:season_not_saved_in_session, { scope: [:admin_import] })
        redirect_to( goggles_di_step1_status_path() ) and return
      end
      begin
        season = Season.find_by_id(season_id)
        @season_description = season.description if season
      rescue
      end

                                                    # === CASE 2: datafile parameter present? Copy the file to its destination:
    elsif params[:datafile]
      season_id = params[:season][:season_id].to_i if params[:season] # Retrieve season_id from parameters
# DEBUG
#      logger.debug "SEASON.....: #{params[:season].inspect} (from params), ID=#{season_id}"
#      logger.debug "!! ---------------------------\r\n\r\n"
      if ( season_id.to_i > 0 )
        begin
          season = Season.find_by_id(season_id)
          @season_description = season.description if season
        rescue
        end
      end

      tmp_file = params[:datafile].tempfile         # (This is an ActionDispatch::Http::UploadedFile object)
      filename_to_be_parsed = File.join( "public/uploads", params[:datafile].original_filename )
      FileUtils.cp tmp_file.path, filename_to_be_parsed

                                                    # === CASE ELSE: form not-fully completed
    else
      flash[:info] = I18n.t(:nothing_to_do_upload_something, { scope: [:admin_import] })
      redirect_to( goggles_di_step1_status_path() ) and return
    end

                                                    # === Re-launch consume_txt_file if we can/must do it:
    if filename_to_be_parsed || ( data_import_session && (data_import_session.phase.to_i < 1) )
      filename_to_be_parsed = data_import_session.file_name if filename_to_be_parsed.nil? && data_import_session
                                                    # Create a new data-import session to consume the datafile:
      data_importer = DataImporter.new( logger, flash, current_admin.id )
                                                    # If data_import_session is existing, it will be "continued" (restarted, depending on last finished phase)
      data_import_session = data_importer.consume_txt_file(
        filename_to_be_parsed, season,
        force_missing_meeting_creation, force_missing_team_creation,
        false,                                      # Do NOT consume local data files (this is the default value for server runs)
        data_import_session
      )
      if data_importer                              # First, update the DB-based phase log whenever possible:
        if data_importer.season && (season_id.to_i < 0)
          season_id = data_importer.season.id
          @season_description = data_importer.season.description
        end
        DataImportSession.where(
            id: data_importer.get_created_data_import_session_id
        ).update_all( :phase_1_log => data_importer.get_phase_1_log() )
        data_importer.clear_team_analysis_and_sql_log()
        data_importer.to_logfile()                  # Update the additional file-based logs

        if data_importer.has_team_analysis_results
          flash[:info] = I18n.t('admin_import.team_analysis_needed')
          redirect_to(
              goggles_di_step2_analysis_path(
                  id: data_importer.get_created_data_import_session_id,
                  force_meeting_creation: force_missing_meeting_creation ? '1' : nil,
                  force_team_creation: force_missing_team_creation ? '1' : nil
              )
          ) and return
        end
      end
    end
                                                    # Session successful? Head on to phase #2 and let the component handle the rest:
    @data_import_session_id = data_import_session ? data_import_session.id : nil

                                                    # -- CHECK OUTCOME: something went awfully wrong? Redirect:
    redirect_to( goggles_di_step1_status_path() ) and return if @data_import_session_id.nil?
                                                    # Compute the filtering parameters:
    ap = AppParameter.get_parameter_row_for( :data_import )
    @max_view_height = ap.get_view_height()
  end
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------


  # Data Import Wizard: Parallel Phase-3 Team-Analysis Commit Phase.
  # (Invoked after the alternative phase-2 outcome, when the Team-Analysis
  # phase has been triggered.)
  #
  # This is called after "Phase 1.1 - Team Analysis" and before "Phase 2 - Manual check"
  #
  def step3_analysis_commit
# DEBUG
    logger.debug "\r\n\r\n!! ------ admin_import::step3_analysis_commit -----"
    logger.debug "PARAMS: #{params.inspect}"
    is_ok = true
    data_import_session_id = 0
    must_go_back_on_commit = false
    confirmed_actions_ids = []
    overridden_alias_actions = {}

# FIXME Create a dedicated Strategy/Service class for all this mess (keep it separate from the rest of the app -- for the moment "lib/parsers" may suffice)
                                                    # Parse parameters:
    params.each{ |key, value|
      data_import_session_id = value.to_i if ( key.to_sym == :data_import_session_id)
      if ( key.to_s =~ /id_/i )
        confirmed_actions_ids << ( key.to_s.split('id_')[1] ).to_i
      end
      must_go_back_on_commit = value.to_i > 0 if ( key.to_sym == :must_go_back)
    }
    force_missing_meeting_creation = ( (params[:force_meeting_creation] == 'true') || (params[:force_meeting_creation].to_i > 0) )
    force_missing_team_creation    = ( (params[:force_team_creation] == 'true') || (params[:force_team_creation].to_i > 0) )
    # [Steve] The following override hash has the structure:
    # params[:alias_ids] => { analysis_result.id.to_s => overridden_alias_team_id.to_s, ... }
    overridden_alias_actions = params[:alias_ids] if params[:alias_ids].instance_of?(Hash)
# DEBUG
    logger.debug "\r\ndata_import_session_id: #{data_import_session_id}"
    logger.debug "Confirmed IDs: #{confirmed_actions_ids.inspect}"
    logger.debug "Overridden Alias IDs: #{overridden_alias_actions.inspect}"

    team_analysis_log  = ''
    equivalent_sql_log = ''
    team_analysis_ext  = '.team_commit.log'
    equivalent_sql_ext = '.team_commit.sql'
    data_import_session = DataImportSession.find( data_import_session_id )
    log_filename = File.join(                       # Compute log filename using data file as a start:
      File.join(Rails.root, 'log'),
      (File.basename(data_import_session.file_name).split('.')[0])
    )
                                                    # retrieve results from dedicated table:
    @all_results = DataImportTeamAnalysisResult.where( data_import_session_id: data_import_session_id )
    @all_results.each { |result|                    # For each confirmed result, do the suggested actions:
      is_confirmed = confirmed_actions_ids.include?( result.id )
# DEBUG
      logger.debug "\r\nProcessing #{is_confirmed ? 'CONFIRMED' : 'unconfirmed'} #{result}..."
      team_name = result.searched_team_name
      if ( overridden_alias_actions.has_key?( result.id.to_s ) )
        team_id = overridden_alias_actions[ result.id.to_s ].to_i
        result.chosen_team_id = team_id
        result.rebuild_sql_text()                   # (No need to save the instance, since rows will be deleted at the end -- and if something goes wrong, hopefully we still have the log files...)
        logger.debug "Using overridden alias team_id=#{team_id} for '#{team_name}'..."
      else
        team_id = result.chosen_team_id
      end
      season_id = result.desired_season_id
                                                    # -- Can ADD new Team? (Default action for unconfirmed results)
      if ( (! is_confirmed) || result.can_insert_team )
        begin
          Team.transaction do                       # Let's make sure other threads have not already done what we want to do:
            if ( Team.where(name: team_name).none? )
              committed_row = Team.new(
                name: team_name,
                editable_name: team_name,     # (let's initialize this with the data-import name)
                name_variations: team_name,
                user_id: current_admin.id
                # XXX Unable to guess city id (not filled-in, to be added by hand)
              )
              committed_row.save!                   # raise automatically an exception if save is not successful
              team_id = committed_row.id            # update the team_id with the actual value that shold be used probably also below
            else
              logger.info( "\r\n*** admin_import::step3_analysis_commit: WARNING: skipping Team creation because was (unexpectedly) found already existing! (Name:'#{team_name}')" )
            end
          end
        rescue
          logger.error( "\r\n*** admin_import::step3_analysis_commit: exception caught during Team save! (Name:'#{team_name}')" )
          logger.error( "*** #{ $!.to_s }\r\n" ) if $!
          flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
          is_ok = false
        end
      end
                                                    # -- Can ADD new Team Alias?
      if ( is_confirmed && result.can_insert_alias )
        raise "DataImportTeamAlias creation: unable to proceed! 'team_id' unexpectedly zero or nil!" if team_id.to_i < 1
        begin
          DataImportTeamAlias.transaction do       # Let's make sure other threads have not already done what we want to do:
            if ( DataImportTeamAlias.where(name: team_name, team_id: team_id).none? )
              committed_row = DataImportTeamAlias.new(
                name: team_name,
                team_id: team_id
              )
              committed_row.save!                   # raise automatically an exception if save is not successful
            else
              logger.info( "\r\n*** admin_import::step3_analysis_commit: WARNING: skipping DataImportTeamAlias creation because was (unexpectedly) found already existing! (Name:'#{team_name}', team_id:#{team_id})" )
            end
          end
        rescue
          logger.error( "\r\n*** admin_import::step3_analysis_commit: exception caught during DataImportTeamAlias save! (Name:'#{team_name}', team_id:#{team_id})" )
          logger.error( "*** #{ $!.to_s }\r\n" ) if $!
          flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
          is_ok = false
        end
      end
                                                    # -- Can ADD new TeamAffiliation?
      if ( is_confirmed && result.can_insert_affiliation )
        raise "TeamAffiliation creation: unable to proceed! 'team_id' unexpectedly zero or nil!" if team_id.to_i < 1
        begin
          TeamAffiliation.transaction do            # Let's make sure other threads have not already done what we want to do:
            if ( TeamAffiliation.where(
                    team_id: team_id,
                    season_id: season_id
                 ).none? )
              committed_row = TeamAffiliation.new(
                name: team_name,           # Use the actual provided (and searched) name instead of the result_row.name
                team_id: team_id,
                season_id: season_id,
                is_autofilled: true,             # signal that we have guessed some of the values
                must_calculate_goggle_cup: false,
                user_id: current_admin.id
                # XXX Unable to guess team affiliation number (not filled-in, to be added by hand)
              )
              committed_row.save!                   # raise automatically an exception if save is not successful
            else
              logger.info( "\r\n*** admin_import::step3_analysis_commit: WARNING: skipping TeamAffiliation creation because was (unexpectedly) found already existing! (Name:'#{team_name}', team_id:#{team_id}, season_id:#{season_id})" )
            end
          end
        rescue
          logger.error( "\r\n*** admin_import::step3_analysis_commit: exception caught during TeamAffiliation save! (Name:'#{team_name}', team_id:#{team_id}, season_id:#{season_id})" )
          logger.error( "*** #{ $!.to_s }\r\n" ) if $!
          flash[:error] = "#{I18n.t(:something_went_wrong)} ['#{ $!.to_s }']"
          is_ok = false
        end
      end
                                                    # Rebuild corrected log files:
      if ( is_confirmed )
        team_analysis_log  += result.analysis_log_text
        equivalent_sql_log += result.sql_text
      else
        team_analysis_log  += "\r\n-------------------------------------------------------------------------------------------------------------\r\n" +
                              "                    [[[ '#{team_name}' ]]]  -- search overridden:\r\n\r\n" +
                              "   => NOT FOUND.\r\n"
        equivalent_sql_log += "INSERT INTO data_import_team_aliases (name,team_id,created_at,updated_at) VALUES\r\n" +
                              "    ('#{team_name}','#{team_name}','','','',1,CURDATE(),CURDATE());\r\n"
      end
    }

    if is_ok
      if must_go_back_on_commit                     # Since we are aborting full-data import, we need to clean up the broken session:
        DataImporter.destroy_data_import_session( data_import_session_id: data_import_session_id )
      else                                          # Clear just the results from the session if everything is ok:
        DataImportTeamAnalysisResult.delete_all( data_import_session_id: data_import_session_id )
      end
      team_analysis_ext  += '.ok'
      equivalent_sql_ext += '.ok'
      flash[:info] = I18n.t('admin_import.team_analysis_completed')
    end
                                                    # Write the log files, if there's any content:
    DataImporter.to_analysis_logfile( log_filename, team_analysis_log, team_analysis_ext )
    DataImporter.to_sql_executable_logfile( log_filename, equivalent_sql_log, equivalent_sql_ext )
                                                    # Either, go on with data-import or go back to the status page:
    if is_ok && (! must_go_back_on_commit)
      redirect_to( goggles_di_step2_checkout_path(
          id: data_import_session_id,
          force_meeting_creation: force_missing_meeting_creation ? '1' : '0',
          force_team_creation: force_missing_team_creation ? '1' : '0'
      ) ) and return
    else
      redirect_to( goggles_di_step1_status_path() ) and return
    end
  end
  # ---------------------------------------------------------------------------


  # Data Import Wizard: phase #3 (Phase #2 is manual review of the parsed data)
  # On editable data grid final commit, do the actual data import into destination table,
  # logging every error or mismatch and finally displaying it on the dedicated view.
  #
  # This is the final ("Commit") phase of the data-import process.
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
      flash[:info] = I18n.t(:missing_session_parameter, { scope: [:admin_import] })
      redirect_to( goggles_di_step1_status_path() ) and return
    end

    data_import_session = DataImportSession.find_by_id( data_import_session_id )
    # ASSERT: assert_not_nil( data_import_session )
    season_id = data_import_session.season_id if ( data_import_session && data_import_session.respond_to?( :season_id ) )
    if ( season_id.to_i < 1 )
      flash[:info] = I18n.t(:season_not_saved_in_session, { scope: [:admin_import] })
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
