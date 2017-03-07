# encoding: utf-8
require 'common/format'
require 'meeting_finder'
require 'wrappers/timing'
require 'passages_batch_updater'


=begin

= MeetingsController

  - version:  6.089
  - author:   Steve A.

=end
class MeetingResultsController < ApplicationController
  # Require authorization before invoking any of this controller's actions:
  before_action :authenticate_user!, only: [:my, :edit_passages]

  # Parse parameters:
  before_action :verify_meeting
  before_action :verify_is_team_manager,  only: [:edit_passages, :edit_relay_swimmers]
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
        .where(['meeting_individual_results.team_id = ? and event_types.length_in_meters > pool_types.length_in_meters', @managed_team_ids])
        .includes( :passages )
        .map{ |mir| { mir => mir.passages } }

    # TODO
    # Should order by start-list.
    # If no start-list present should use timing
    #if @meeting.has_start_list
    #  @editable_stuff.sort{ |mir_n, mir_p| MeetingEntry.where( badge_id: mir_n.keys.first.badge_id, meeting_program_id: mir_n.keys.first.meeting_program_id ).first.get_timing <=> MeetingEntry.where( badge_id: mir_p.keys.first.badge_id, meeting_program_id: mir_n.keys.first.meeting_program_id ).first.get_timing }
    #end
  end


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
    edited_rows = params.select{ |key, value| key =~ /pas/ }
    new_rows    = params.select{ |key, value| ( key =~ /new/ || key =~ /auto/ ) && value.length > 0 }
    batch_updater = PassagesBatchUpdater.new( current_user )
    inserted_mirs = []

    # Edit existing row values:
    edited_rows.each do |key, value|
      passage_id = key.split('_').last
      batch_updater.edit_existing_passage( passage_id, value )
    end
    # Create new rows:
    new_rows.each do |key, value|
      # Verify if passage is the only one for mir and is added automatically in the view (auto)
      passage_mode = key.split('_')[0]
      mir_id = key.split('_')[1]
      passage_type_id = key.split('_').last
      batch_updater.create_new_passage( mir_id, passage_type_id, value ) if passage_mode == 'new' || inserted_mirs.include?( mir_id )
      inserted_mirs << mir_id
    end

    # Create the SQL diff file, and send it, when operated remotely:
    output_dir = File.join( Rails.root, 'public', 'output' )
    file_name = "#{DateTime.now().strftime('%Y%m%d%H%M')}" <<
                "#{ Rails.env == 'production' ? 'dev' : 'prod' }" <<
                "_update_passages_#{ @meeting.code }.diff.sql"
    full_sql_diff_path = File.join( output_dir, file_name )
    batch_updater.save_diff_file( full_sql_diff_path )
    logger.info( "\r\nLog file " + file_name + " created" )
    if Rails.env == 'production'
      AgexMailer.action_notify_mail(
        current_user,
        "update passages",
        "User #{current_user} has updated remotely the passages for his/hers managed affiliations, for meeting ID #{@meeting.id}.\r\nThe attached log file must be synchronized locally.",
        file_name,
        full_sql_diff_path
      ).deliver
    end

    # Signal any error or a successful operation:
    if batch_updater.total_errors > 0
      flash[:error] = I18n.t('something_went_wrong')
    else
      flash[:info] = I18n.t('social.changes_saved')
    end
    redirect_to( meeting_results_edit_passages_path(@meeting.id) ) and return
  end
  #-- -------------------------------------------------------------------------
  #++


  # TODO
  #
  def edit_relay_swimmers
    # Collect the list of managed Teams:
    @managed_teams = current_user.team_managers.map{ |tm| tm.team }.uniq
    @managed_team_ids = @managed_teams.map{ |team| team.id }

    # TODO
=begin
    - get possible existing MeetingRelaySwimmer rows
    - init missing rows with MeetingRelaySwimmer.new
    - setup initial values for new rows using:
      - MeetingRelayReservations when available
      - Leave no default swimmer_id when not available

    - User must be able to POST the form initialized so far
    - permit the correct params
=end
    # Array of Array: 1 row MRR => list of many MRS:
    existing_relay_swimmers = @meeting.meeting_relay_results
      .includes( :team )
      .where( ['team_id IN (?)', @managed_team_ids] )
      .map{ |mrr| mrr.meeting_relay_swimmers.to_a }

    # TODO For each MRR, add missing MRS as new instances
    # TODO For each new MRS instance,
    # TODO search for existing, corresponding Relay reservation
    # TODO init new MRS instance w/ reservation found
    # TODO else, leave empty

  end
  #-- -------------------------------------------------------------------------
  #++


  # TODO
  #
  def update_relay_swimmers
    # TODO
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

      if @meeting.meeting_individual_results.where(['meeting_individual_results.swimmer_id = ?', @swimmer.id]).count > 0 ||
        @meeting.meeting_entries.where(['meeting_entries.swimmer_id = ?', @swimmer.id]).count > 0
        @team = team
      else
        if team && (@meeting.meeting_individual_results.where(['meeting_individual_results.team_id = ?', team.id]).count > 0 ||
          @meeting.meeting_entries.where(['meeting_entries.team_id = ?', team.id]).count > 0)
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
    unless ( current_user && current_user.team_managers.count > 0 )
      flash[:error] = I18n.t(:invalid_action_request) + ' - ' + I18n.t('meeting.errors.invalid_team_manager')
      redirect_to( meetings_current_path() ) and return
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
