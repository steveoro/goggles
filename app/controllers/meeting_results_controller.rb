# encoding: utf-8
require 'common/format'
require 'meeting_finder'
require 'wrappers/timing'
require 'passages_batch_updater'
require 'relay_swimmer_batch_updater'


=begin

= MeetingsController

  - version:  6.349
  - author:   Steve A.

=end
class MeetingResultsController < ApplicationController
  # Require authorization before invoking any of this controller's actions:
  before_action :authenticate_user!
  # Parse parameters:
  before_action :verify_meeting
  before_action :verify_is_team_manager
  #-- -------------------------------------------------------------------------
  #++


  # Allows editing of the current Meeting results passages, according to the
  # current_user and its managed affiliations.
  #
  # To be reachable this action, requires that the current user is one of
  # the existing Team managers (indipendently from current season).
  #
  # The action then proceeds to fill a list of editable passages, one for
  # each MIR of the teams managed by the current user.
  #
  # If no passage row is existing for the corresponding associated MIR
  # found, a button to add a new row will be rendered instead.
  #
  # === Parameters:
  # - id: Meeting id for which the Passages must be edited
  #
  def edit_passages
    # Collect the list of managed Teams:
    @managed_teams = current_user.team_managers.map{ |tm| tm.team }.uniq
    @managed_team_ids = @managed_teams.map{ |team| team.id }

    # Collect the list of available/editable Passages, for each available MIR
    # for the managed affiliations by the current user.
    # The "editable stuff" is returned as an ordered array of Hash, where each
    # Hash item has as key the related MIR and as value its list of passages.
    @editable_stuff = @meeting.meeting_individual_results
        .sort_by_event_and_timing
        .joins( :event_type, :pool_type )
        .where( [
          '(meeting_individual_results.team_id IN (?)) AND (event_types.length_in_meters > pool_types.length_in_meters)',
          @managed_team_ids
        ] )
        .includes( :passages )
        .to_a
        .map{ |mir| { mir => mir.passages } }
# DEBUG
#    puts "\r\n\r\n--- @editable_stuff: ---\r\n#{ @editable_stuff.inspect }\r\n"
    # TODO Use a dedicated DAO class instead of this ugly Hash

    # TODO
    # Should order by start-list.
    # If no start-list present should use timing
    #if @meeting.has_start_list
    #  @editable_stuff.sort{ |mir_n, mir_p| MeetingEntry.where( badge_id: mir_n.keys.first.badge_id, meeting_program_id: mir_n.keys.first.meeting_program_id ).first.get_timing <=> MeetingEntry.where( badge_id: mir_p.keys.first.badge_id, meeting_program_id: mir_n.keys.first.meeting_program_id ).first.get_timing }
    #end
  end

  alias_method :edit_passages2, :edit_passages


  # Upodates or creates Meeting results passage/lap times rows, according to the
  # specified paramters.
  #
  # Assumes the POST parameters are encoded as follows:
  #
  # . edited or existing passage rows...: "pas_" + passage.id
  # . new rows to be created............: "new_" + MIR.id + "_" + passage_type.id
  #
  # This will create a diff-log file inside the default output directory, while
  # sending out an admin-email to notify the update.
  #
  # === Parameters:
  # - id: Meeting id for which the Passages must be edited
  #
  def update_passages
# DEBUG
#    logger.debug( "\r\n\r\n!! ------ #{self.class.name} - update_relay_swimmers -----" )
#    logger.debug( "> #{params.inspect}\r\n" )
    edited_rows = params.select{ |key, value| key =~ /pas/ }
    new_rows    = params.select{ |key, value| ( key =~ /new/ || key =~ /auto/ ) && value.length > 0 }
    batch_updater = PassagesBatchUpdater.new( current_user )
    inserted_mirs = []

    # Edit existing row values:
    edited_rows.each do |key, value|
      passage_id = key.split('_').last
      batch_updater.edit_existing_passage!( passage_id, value )
    end
    # Create new rows:
    new_rows.each do |key, value|
      # Verify if passage is the only one for mir and is added automatically in the view (auto)
      passage_mode = key.split('_')[0]
      mir_id = key.split('_')[1]
      passage_type_id = key.split('_').last
      batch_updater.create_new_passage!( mir_id, passage_type_id, value ) if passage_mode == 'new' || inserted_mirs.include?( mir_id )
      inserted_mirs << mir_id
    end

    # Serialize updater.sql_diff_text_log in a dedicated log file if there are any changes logged:
    if batch_updater.edited_passages > 0 || batch_updater.new_passages > 0 ||
       batch_updater.destroyed_passages > 0 || batch_updater.total_errors > 0
      # Force cache update in production (generated development script doesn't really need this)
      # by updating the meeting #updated_at attribute, in order to expire the cache key:
      @meeting.touch
      # Create the SQL diff file, and send it, when operated remotely:
      output_dir = get_output_folder()
      file_name = get_timestamped_env_filename( "update_passages_#{ @meeting.code }_#{ current_user.id }.diff.sql" )
      full_sql_diff_path = File.join( output_dir, file_name )
      serialize_and_deliver_diff_file( batch_updater, "update PASSAGES", full_sql_diff_path )
      # Signal also locally if any error occurred:
      if batch_updater.total_errors > 0
        flash[:error] = I18n.t('passages.generic_some_rows_changes_were_ignored')
      else
        flash[:info] = I18n.t('passages.changes_saved')
      end
    end
    redirect_to( meeting_results_edit_passages_path(@meeting.id) ) and return
  end
  #-- -------------------------------------------------------------------------
  #++


  # Edit view action for the meeting relay swimmers.
  #
  def edit_relay_swimmers
    # Collect the list of managed Teams:
    @managed_teams = current_user.team_managers.map{ |tm| tm.team }.uniq
    @managed_team_ids = @managed_teams.map{ |team| team.id }
    @mrrs = @meeting.meeting_relay_results
      .includes(:team, :meeting_event, :event_type, :pool_type, :season)
      .joins(:team, :meeting_event, :event_type, :pool_type, :season)
      .where( ['team_id IN (?)', @managed_team_ids] )
    @relay_swimmer_hash = {}

    @mrrs.each do |mrr|
      needed_swimmer_count = mrr.event_type.partecipants
      relay_swimmers = []
      # Fill-in the relay swimmers either with new instances or with existing ones:
      ( 1 .. needed_swimmer_count ).each do |index|
        existing_relay_swimmer = MeetingRelaySwimmer.where( meeting_relay_result_id: mrr.id, relay_order: index ).first
        relay_swimmers << (
          existing_relay_swimmer ||
          MeetingRelaySwimmer.new(
            meeting_relay_result_id: mrr.id,
            relay_order:             index,
            stroke_type_id:          RelaySwimmerBatchUpdater.get_fractionist_stroke_type_id_by( mrr.event_type.stroke_type_id, index )
          )
        )
      end
      # Add the completed list of relay swimmers to the hash, for each existing MRR:
      @relay_swimmer_hash[ mrr.id ] = relay_swimmers
    end
  end

  alias_method :edit_relay_swimmers2, :edit_relay_swimmers
  #-- -------------------------------------------------------------------------
  #++


  # Update action for the meeting relay swimmers as a single, scripted batch process.
  #
  # In order for a row to be updated, at least the swimmer ID must be specified.
  # (That is, the user won't be able to save just the associated timing without
  #  selecting an associated swimmer id too.)
  #
  # Rows set to be updated without the swimmer ID set will be considered as "errors",
  # as well as rows with a wrongly chosen swimmer ID, which does not result as
  # having a badge for the same season and team for the currently processed MRR.
  # (This is to prevent data-corruption attacks with forged requests.)
  #
  # Rows considered as "errors" won't stop internally the batch updater and will
  # be simply ignored.
  #
  # The action aborts as soon as an invalid MRR ID is specified.
  #
  # The action is scripted to allow synchronization with any DB server.
  #
  def update_relay_swimmers
# DEBUG
#    logger.debug( "\r\n\r\n!! ------ #{self.class.name} - update_relay_swimmers -----" )
#    logger.debug( "> #{params.inspect}\r\n" )
=begin
    PARAMS Format example:
    <ActionController::Parameters {
      [...]
      "swimmer_id"=>{"25566_1"=>"19099", "25566_2"=>"550", [...]
      },
      "swimmer_id_25566_1_name"=>"SWIMMER NAME 1", "timing_25566_1"=>"28\"00",
      "swimmer_id_25566_2_name"=>"SWIMMER NAME 2", "timing_25566_2"=>"40\"00",
      [...]
    }
=end
    # Prepare the updater instance:
    batch_updater = RelaySwimmerBatchUpdater.new( current_user )
    can_continue = true

    if params['swimmer_id'].present?
      # For each selected swimmer...
      params['swimmer_id'].each do |composed_key, swimmer_id|
        # composed_key expected format example:
        #       <MRR.id>_<relay_order> => <swimmer_id> ... .. "25566_1"=>"19099"
        mrr_id, relay_order = composed_key.split('_').map{ |i| i.to_i }
        timing_text = params["timing_#{ composed_key }"]
# DEBUG
#        puts "\r\n\r\n- composed_key: <#{ composed_key }>"
#        puts "- mrr_id: <#{ mrr_id }>, relay_order: #{ relay_order }, timing_text: <#{ timing_text }>"
        mrr = MeetingRelayResult.find_by_id( mrr_id.to_i )
        if mrr && can_continue
          # We need to check if the specified swimmer has a badge viable for the current MRR.
          # (Note that this check is actually duplicated again inside the batch_updater since
          #  there's no guaratee that the generic caller - in this case *this* action -
          #  will comply with it. It's a safeguard against possible data corruption or
          #  forged requests with non-empty but invalid swimmer IDs.)
          team_id = mrr.team_id
          season_id = mrr.season.id
          badge = Badge.where( team_id: team_id, season_id: season_id, swimmer_id: swimmer_id.to_i ).first
          if badge
            # Are we editing an existing row? Or do we need to create a new one?
            mrs = MeetingRelaySwimmer.where(meeting_relay_result_id: mrr.id, relay_order: relay_order).first
            if mrs                                  # --- Edit existing row ---
              batch_updater.edit_existing_row( mrr, mrs, swimmer_id, badge.id, timing_text )
            else                                    # --- Create new row ---
              batch_updater.create_new_row( mrr, relay_order, swimmer_id, badge.id, timing_text )
            end
          else
            # Not necessarily an error: no swimmer ID chosen (yet) or no badge found for this season:
            batch_updater.add_sql_diff_comment("Swimmer ID '#{ swimmer_id }' null or badge not found for season: #{ season_id }, team: #{ team_id } - no editing for MRR.id: #{ mrr.id }, relay_order: #{ relay_order }")
            # Set the flash error in case the swimmer choice was non-valid (and no actual rows were processed - so, no diff file at all, no error count):
            if swimmer_id.present? && badge.nil?
              flash[:error] = I18n.t('passages.relay_some_rows_changes_were_ignored')
            end
          end
        else
          # MRR not found! As soon as we find an invalid DOM ID, we bail out:
          batch_updater.add_sql_diff_comment( I18n.t('passages.some_relay_result_not_found') + " (MRR id: #{ mrr_id })" )
          flash[:error] = I18n.t('passages.some_relay_result_not_found')
          can_continue = false
        end
      end
    end

    # Serialize updater.sql_diff_text_log in a dedicated log file if there are any changes logged:
    if batch_updater.processed_rows > 0 || batch_updater.errors_count > 0
      # Force cache update in production (generated development script doesn't really need this)
      # by updating the meeting #updated_at attribute, in order to expire the cache key:
      @meeting.touch
      # Create the SQL diff file, and send it, when operated remotely:
      output_dir = get_output_folder()
      file_name = get_timestamped_env_filename( "update_relay_swimmers_#{ @meeting.code }_#{ current_user.id }.diff.sql" )
      full_sql_diff_path = File.join( output_dir, file_name )
      serialize_and_deliver_diff_file( batch_updater, "update RELAY SWIMMERS", full_sql_diff_path )
      # Signal also locally if any error occurred:
      if batch_updater.errors_count > 0
        flash[:error] = I18n.t('passages.relay_some_rows_changes_were_ignored')
      else
        flash[:info] = I18n.t('passages.changes_saved')
      end
    end
    redirect_to( meeting_results_edit_relay_swimmers_path(@meeting.id) ) and return
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Verifies that a meeting id is provided as parameter; otherwise
  # return an invalid action request
  # Assigns the meeting instance.
  # Verifiy if user is logged and associated to a swimmer and sets preselection
  # of team and swimmer
  #
  # == Params:
  # id: the meeting id to be processed
  #
  def verify_meeting
    set_meeting_from_id
    unless ( @meeting )
      flash[:error] = I18n.t(:invalid_action_request) + ' - ' + I18n.t('meeting.errors.missing_meeting_id')
      redirect_to( meetings_current_path() ) and return
    end

    # Find preselected team and swimmer if user logged in and associated to a swimmer
    # and the swimmer or team partecipated to the meeting
    set_swimmer_from_current_user
    if @swimmer
      team = @swimmer.teams.joins(:badges).where(['badges.season_id = ?', @meeting.season_id]).first

      if @meeting.meeting_individual_results.where(['meeting_individual_results.swimmer_id = ?', @swimmer.id]).exists? ||
        @meeting.meeting_entries.where(['meeting_entries.swimmer_id = ?', @swimmer.id]).exists?
        @team = team
      else
        if team && (@meeting.meeting_individual_results.where(['meeting_individual_results.team_id = ?', team.id]).exists? ||
          @meeting.meeting_entries.where(['meeting_entries.team_id = ?', team.id]).exists?)
          # The team of the swimmer associated with the user parteciapte to the meeting
          @team = team
        end
      end
    end
  end


  # Verifies that a current user is one of the defined team managers.
  # (Actually, it verifies that the current user has any managed affiliation defined.)
  #
  def verify_is_team_manager
    unless ( current_user && current_user.team_managers.exists? )
      flash[:error] = I18n.t(:invalid_action_request) + ' - ' + I18n.t('meeting.errors.invalid_team_manager')
      redirect_to( meetings_current_path() ) and return
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Creates the SQL diff file using an SqlConvertable-compatible instance (must respond
  # to #sql_diff_text_log) and sends the file via mail if the current environment
  # is in production mode.
  #
  def serialize_and_deliver_diff_file( sql_convertable, mail_title, full_diff_pathname )
    sql_convertable.save_diff_file( full_diff_pathname )
    base_filename = File.basename( full_diff_pathname )
    logger.info( "\r\nLog file '#{ base_filename }' created" )
    if Rails.env == 'production'
      # Send the DB diff file to the SysOp
      AgexMailer.action_notify_mail(
        current_user,
        mail_title,
        "User #{current_user}, #{ mail_title }, meeting ID: #{ @meeting.id }.\r\nThe attached log file must be synchronized locally.",
        base_filename,
        full_diff_pathname
      ).deliver
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
