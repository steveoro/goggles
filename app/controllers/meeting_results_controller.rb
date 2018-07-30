# encoding: utf-8
require 'common/format'
require 'meeting_finder'
require 'wrappers/timing'


=begin

= MeetingsController

  - version:  6.361
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
  # The actual correlated update action is performed via API/v2/remote_edit/ AJAX call.
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
  #-- -------------------------------------------------------------------------
  #++


  # Edit view action for the meeting relay swimmers.
  #
  # The actual correlated update action is performed via API/v2/remote_edit/ AJAX call.
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
            stroke_type_id:          RelaySwimmerUpdater.get_fractionist_stroke_type_id_by( mrr.event_type.stroke_type_id, index )
          )
        )
      end
      # Add the completed list of relay swimmers to the hash, for each existing MRR:
      @relay_swimmer_hash[ mrr.id ] = relay_swimmers
    end
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
end
