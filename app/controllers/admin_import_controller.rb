# encoding: utf-8
require 'fileutils'                                 # Used to process filenames
require 'common/format'
require 'data_import/strategies/data_importer'
require 'data_import/strategies/team_analysis_result_processor'


=begin

= AdminImportController

  - version:  4.00.683
  - author:   Steve A.

=end
class AdminImportController < ApplicationController

  layout 'admin_import'

  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_admin!
  #-- -------------------------------------------------------------------------
  #++


  # Destroys an existing Data-import session
  #
  def kill_import_session
    data_import_session = DataImportSession.find_by_id( params[:id].to_i )
    if data_import_session
      DataImporter.new( logger, flash, data_import_session ).destroy_data_import_session
    end
    redirect_to( goggles_di_step1_status_path() )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Data Import Wizard: START / STATUS
  # Phase #1: upload text file / Select an existing Data-import session
  #
  def step1_status                                   # Retrieve current sessions for the current user and list them:
# DEBUG
#    logger.debug "\r\n\r\n!! ------ admin_import::step1_status -----"
#    logger.debug "current_admin: #{current_admin.inspect}"
    @existing_import_sessions = DataImportSession.where( user_id: current_admin.id )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Data Import Wizard: Phase-1.1, called only if some problematic team names
  # are found dubious or mis-matched.
  #
  # This is actually displayed as "Phase 1.1 - Team Analysis" (Review/confirm not-found or dubious Team names)
  #
  def step1_1_analysis
# DEBUG
#    logger.debug "\r\n\r\n!! ------ admin_import::step1_1_analysis -----"
#    logger.debug "PARAMS: #{params.inspect}"
                                                    # Propagate forward (phase-3) the parameters from Phase-1, if any:
    @force_missing_meeting_creation = ( (params[:force_meeting_creation] == 'true') || (params[:force_meeting_creation].to_i > 0) )
    @force_missing_team_creation    = ( (params[:force_team_creation] == 'true') || (params[:force_team_creation].to_i > 0) )
    if ( params[:id].to_i > 0 )
      @data_import_session = DataImportSession.find_by_id( params[:id].to_i )
      @analysis_results = DataImportTeamAnalysisResult.where( data_import_session_id: @data_import_session.id )
    else
      @data_import_session = nil
      @analysis_results = []
    end
  end


  # Data Import Wizard: Parallel Phase-1.1 Team-Analysis Commit Phase.
  # (Invoked after the alternative phase-2 outcome, when the Team-Analysis
  # phase has been triggered. This action has no associated view.)
  #
  # This is called after "Phase 1.1 - Team Analysis" and before "Phase 2 - Manual check"
  #
  def step1_1_commit
# DEBUG
    logger.debug "\r\n\r\n!! ------ admin_import::step1_1_commit -----"
    logger.debug "PARAMS: #{params.inspect}"
    overridden_alias_actions = {}
    confirmed_actions_ids    = []
    data_import_session_id   = 0
    must_go_back_on_commit   = false
    is_ok = true
                                                    # Parse parameters:
    params.each do |key, value|
      data_import_session_id = value.to_i if ( key.to_sym == :data_import_session_id)
      if ( key.to_s =~ /id_/i )
        confirmed_actions_ids << ( key.to_s.split('id_')[1] ).to_i
      end
      must_go_back_on_commit = value.to_i > 0 if ( key.to_sym == :must_go_back)
    end

    force_missing_meeting_creation = (params[:force_meeting_creation] == 'true') || (params[:force_meeting_creation].to_i > 0)
    force_missing_team_creation    = (params[:force_team_creation] == 'true')    || (params[:force_team_creation].to_i > 0)
    # [Steve] The following override hash has the structure:
    #
    # params[:alias_ids] => {
    #   analysis_result.id.to_s => overridden_alias_team_id.to_s,
    #   #...
    # }
    overridden_alias_actions = params['alias_ids'] if params['alias_ids'].instance_of?( ActiveSupport::HashWithIndifferentAccess )
# DEBUG
#    logger.debug "\r\ndata_import_session_id: #{data_import_session_id}"
#    logger.debug "Confirmed IDs: #{confirmed_actions_ids.inspect}"
#    logger.debug "Overridden Alias IDs: #{overridden_alias_actions.inspect}\r\n- params['alias_ids']: #{params['alias_ids'].class.name}\r\n- params['alias_ids']: #{params['alias_ids'].inspect}"
    data_import_session = DataImportSession.find( data_import_session_id )
    data_importer       = DataImporter.new( logger, flash, data_import_session )
# TODO /WIP ****** ADD  DataImportSwimmerAnalysisResult generation sub-phase to DataImporter!

    result_processor    = TeamAnalysisResultProcessor.new( logger, flash )

# TODO /WIP ****** ADD HERE the invocation to a new SwimmerAnalysisResultProcessor
# TODO - SwimmerAnalysisResultProcessor
# TODO - DataImportSwimmerAnalysisResult rendering is separate form (as for DataImportTeamAnalysisResult)

                                                    # retrieve results from dedicated table:
    @all_results = DataImportTeamAnalysisResult.where( data_import_session_id: data_import_session_id )

    # For each confirmed result, execute the suggested actions (either the team
    # alias is confirmed, or a new Team w/ affiliation must be created from scratch):
    @all_results.each do |team_analysis_result|
      is_confirmed = confirmed_actions_ids.include?( team_analysis_result.id )
      team_alias_override_id = overridden_alias_actions.has_key?( team_analysis_result.id.to_s ) ?
                               overridden_alias_actions[ team_analysis_result.id.to_s ].to_i :
                               nil
                                                    # Execute the suggested actions:
      is_ok = result_processor.run(
        team_analysis_result,
        is_confirmed,
        team_alias_override_id
      )
    end

    data_importer.set_team_analysis_logs(
      result_processor.process_log,
      result_processor.sql_executable_log
    )
                                                    # Write the log files anyway:
    data_importer.write_analysis_logfile( is_ok )
    data_importer.write_sql_diff_logfile
# DEBUG
#    logger.debug("\r\n- is_ok: #{is_ok}, data_import_session_id: #{data_import_session_id}")
                                                    # Redirect to next action accordingly:
    if is_ok
      flash[:info] = I18n.t('admin_import.team_analysis_completed')
      if must_go_back_on_commit                     # Since we are aborting full-data import, we need to clean up the broken session:
        data_importer.destroy_data_import_session
      else                                          # Clear just the results from the session if everything is ok:
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
#        data_import_session.phase_1_log_will_change!
        data_import_session.phase_1_log << result_processor.process_log
#        data_import_session.sql_diff_will_change!
        data_import_session.sql_diff    << result_processor.sql_executable_log
        data_import_session.phase = 11              # Update "last completed phase" indicator in session (11 = 1.1)
        data_import_session.save!
        DataImportTeamAnalysisResult.delete_all( data_import_session_id: data_import_session_id )
        redirect_to(
          goggles_di_step2_checkout_path(
            id:                     data_import_session_id,
            force_meeting_creation: force_missing_meeting_creation  ? '1' : '0',
            force_team_creation:    '1' # After the Team analysis, we can serialize the missing teams (WAS: force_missing_team_creation     ? '1' : '0' )
          )
        ) and return
      end
    else
      redirect_to( goggles_di_step1_status_path() ) and return
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Data Import Wizard: from Phase 1.0 to => Phase #1.1 || #2.0 (depending on parsing)
  #
  # This action implements the full file parsing/digest of the datafile, with two
  # possible outcomes:
  #
  # - Phase 1.1) Team Analysis ("fall-back" case)
  # - Phase 2.0) Manual review of the data (best case scenario case and next step)
  #
  # The last completed phase in each one must be #1.2 ("serialization", which is executed
  # nevertheless, even though a Team Analysis is found to be necessary with a consequent
  # "fall back" to phase 1.1).
  #
  # This is also a "safe action": it does nothing if phase #2.0 has been already
  # reached, yielding directly the edit/review grid if the selected data-import
  # session has found as ready for phase 2.
  #
  # [Steve, 20141103]
  # Keep in mind that the name of the action reflects the final view rendered at the
  # end of the process (which is relative to the manual checkout at phase #2.0), but
  # the implementation regards actually what has to be done *before* the manual
  # review grid can be considered ready to be rendered.
  # (So, yes, the name is actually confusing and the whole process requires a ton
  # more of refactoring)
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
    logger.debug "\r\n\r\n!! ------ admin_import::step2_checkout -----"
    logger.debug "PARAMS: #{params.inspect}"
#    logger.debug "FILENAME...: #{params[:datafile].original_filename if params[:datafile] }"
    filename_to_be_parsed = nil
    @data_import_session  = nil
    data_importer         = nil
    season_id = 0
                                                    # === CASE 1: CONTINUATION SESSION. Id parameter present? We then assume a session is already in progress.
    if params[:id]                                  # Get season from the session:
      @data_import_session = DataImportSession.find_by_id( params[:id].to_i )
      season_id = @data_import_session.season_id if @data_import_session.instance_of?( DataImportSession )
      if ( season_id.to_i < 1 )
        flash[:info] = I18n.t( 'admin_import.season_not_saved_in_session' )
        redirect_to( goggles_di_step1_status_path() ) and return
      end
                                                    # === CASE 2: STARTING SESSION. Datafile parameter present? Copy the file to its destination.
    elsif params[:datafile]                         # Get season from form parameters:
      season_id = params[:season][:season_id].to_i if params[:season] # Retrieve season_id from parameters
      tmp_file  = params[:datafile].tempfile        # (This is an ActionDispatch::Http::UploadedFile object)
      filename_to_be_parsed = File.join( "public/uploads", params[:datafile].original_filename )
      FileUtils.cp tmp_file.path, filename_to_be_parsed
                                                    # === CASE ELSE: Error. Form not-fully completed.
    else
      flash[:info] = I18n.t( 'admin_import.nothing_to_do_upload_something' )
      redirect_to( goggles_di_step1_status_path() ) and return
    end

                                                    # === (Re-)Launch phase_1_parse if we can/must do it:
    if filename_to_be_parsed || ( @data_import_session && (@data_import_session.phase.to_i < 12) )
      force_missing_meeting_creation = (params[:force_meeting_creation] == 'true') || (params[:force_meeting_creation].to_i > 0)
      force_missing_team_creation    = (params[:force_team_creation] == 'true')    || (params[:force_team_creation].to_i > 0)
      filename_to_be_parsed          = @data_import_session.file_name if filename_to_be_parsed.nil? && @data_import_session
                                                    # Create a new data-import session to consume the datafile:
      data_importer = DataImporter.new( logger, flash, @data_import_session )
      data_importer.set_up(
        full_pathname:                  filename_to_be_parsed,
        force_missing_meeting_creation: force_missing_meeting_creation,
        force_missing_team_creation:    force_missing_team_creation,
        # do_not_consume_file:           false, # (default)
        current_admin_id:               current_admin.id
      )
                                                    # -- PHASE 1.0:
      data_importer.phase_1_parse
                                                    # -- PHASE 1.2:
      @data_import_session = data_importer.phase_1_2_serialize
# DEBUG
#      logger.debug("\r\nAFTER PHASE 1.2\r\n- data_import_session: #{@data_import_session.id}")
#      logger.debug("\r\n- data_importer.data_import_session: #{data_importer.data_import_session.id}")
      if data_importer.has_team_analysis_results
        flash[:info] = I18n.t( 'admin_import.team_analysis_needed' )
        redirect_to(
            goggles_di_step1_1_analysis_path(
                id:                     data_importer.data_import_session.id,
                force_meeting_creation: force_missing_meeting_creation ? '1' : nil,
                force_team_creation:    force_missing_team_creation    ? '1' : nil
            )
        ) and return
      end
    end
                                                    # -- CHECK OUTCOME: something went awfully wrong? Redirect:
    redirect_to( goggles_di_step1_status_path() ) and return unless @data_import_session
                                                    # -- PHASE 2.0 (MANUAL REVIEW) BEGIN:
                                                    # Compute the filtering parameters:
    ap = AppParameter.get_parameter_row_for( :data_import )
    @max_view_height = ap.get_view_height()
    if @data_import_session.season
      @season_description = @data_import_session.season.description
    elsif @data_import_session.data_import_season
      @season_description = @data_import_session.data_import_season.description
    else
      @season_description = '?'
    end

    # [Steve, 20141219] Retrieve the associated Meeting#id, if available, used in
    # grid filtering for some of the drop-down combo lists (specifically, which
    # meeting session are enlisted, for example):
    di_prg = DataImportMeetingProgram.where( data_import_session_id: @data_import_session.id ).first
    @meeting_id = di_prg.meeting_session ? di_prg.meeting_session.meeting_id : 0
  end
  #-- -------------------------------------------------------------------------
  #++


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
    logger.debug "\r\n\r\n!! ----- admin_import::step3_commit -----"
    logger.debug "PARAMS: #{params.inspect}"
                                                    # Retrieve data_import_session ID from parameters
    data_import_session_id = params[:data_import_session_id]
    unless ( data_import_session_id.to_i > 0 )
      flash[:info] = I18n.t( 'admin_import.missing_session_parameter' )
      redirect_to( goggles_di_step1_status_path() ) and return
    end

    data_import_session = DataImportSession.find_by_id( data_import_session_id )
    season_id = data_import_session.season_id if data_import_session.instance_of?( DataImportSession )
    if ( season_id.to_i < 1 )
      flash[:info] = I18n.t( 'admin_import.season_not_saved_in_session' )
      redirect_to( goggles_di_step1_status_path() ) and return
    end
# DEBUG
    logger.debug("\r\n- data_import_session: #{data_import_session.inspect}")

    data_importer = DataImporter.new( logger, flash, data_import_session )
                                                    # -- PHASE 3.0:
    is_ok = data_importer.phase_3_commit()

    redirect_to( goggles_di_step1_status_path() ) and return unless is_ok
    @import_log = data_importer.import_log          # (get combined import log)
  end
  #-- -------------------------------------------------------------------------
  #++
end
