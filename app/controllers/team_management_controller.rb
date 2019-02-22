# encoding: utf-8
require 'common/format'

=begin

= MeetingReservationsController

  - version:  6.361
  - author:   Leega

Requisiti:
0. esiste TM x season curr x 1 team
1. TM deve scegliere il team => da view team, clicca su 'manage'
2. controller filtered su season curr
3. le affiliation le deve avere già create l'Admin; il TM può editare solo valori tipo numero cartellino.
4. fare view separate da team radio (xke cntrl è diverso), con 4 tab, 1 x azione; se ad es., affiliation manca, fare rendering partial con button x fare ping ad admin x avere affiliation mancante.

=end

class TeamManagementController < ApplicationController

  # Require authorization before invoking any of this controller's actions:
  before_action :authenticate_user!

  # Parse team parameter:
  before_action :verify_parameters

  # Verify if valid team maneger:
  before_action :verify_team_manageability

  # Show pending reservations
  # Shows meeting reservations not confirmed
  # Pending reservations are those not cionfirmed for meeting without results
  #
  def show_pending_reservations
    @tab_title = I18n.t('team_management.pending_reservations')
    
    @pending_reservations = MeetingEventReservation.
      joins( :meeting, :swimmer, meeting_event: [:event_type, meeting_session: :swimming_pool] ).
      joins("INNER JOIN meeting_reservations on meeting_reservations.meeting_id = meeting_event_reservations.meeting_id and meeting_reservations.badge_id = meeting_event_reservations.badge_id").
      where( is_doing_this: true, team_id: 1, meeting_reservations: {has_confirmed: false}, meetings: {are_results_acquired: false} ).
      select( :meeting_id, :swimmer_id, :suggested_minutes, :suggested_seconds, :suggested_hundreds, "meetings.header_date", "meetings.entry_deadline", "meetings.description", "swimmers.complete_name", "meeting_events.event_type_id", "event_types.code", "'' as notes", "swimming_pools.pool_type_id").
      order("meetings.header_date", "swimmers.complete_name").to_a
    
    @pending_reservations.each do |reservation|
      if MeetingIndividualResult.joins( meeting_event: { meeting_session: { swimming_pool: [:city, :pool_type] }} ).
        where([ "meeting_events.event_type_id = ? and pool_types.id = ?", reservation.event_type_id, reservation.pool_type_id ]).
        where(
          swimmer_id: reservation.swimmer_id, 
          minutes: reservation.suggested_minutes, 
          seconds: reservation.suggested_seconds, 
          hundreds: reservation.suggested_hundreds ).exists?
        mir = MeetingIndividualResult.joins( meeting_event: { meeting_session: { swimming_pool: [:city, :pool_type] }} ).
          where([ "meeting_events.event_type_id = ? and pool_types.id = ?", reservation.event_type_id, reservation.pool_type_id ]).
          where(
            swimmer_id: reservation.swimmer_id, 
            minutes: reservation.suggested_minutes, 
            seconds: reservation.suggested_seconds, 
            hundreds: reservation.suggested_hundreds ).
            select("meeting_sessions.scheduled_date", "cities.name", "pool_types.code").
            order( :created_at ).last
        reservation[:notes] = Format.a_date( mir.scheduled_date ) + ' ' + mir.name + ' (' + mir.code + ')'
      else
        reservation[:notes] = I18n.t('team_management.manual')
      end
    end
  end


  def edit_team
    @tab_title = I18n.t('team_management.edit_team')
  end


  def update_team
    if request.put?
      if @team.update( team_params )
        flash[:info] = I18n.t('changes_saved_ok')
      redirect_to( team_radio_path(id: @team.id) ) and return
      else
        flash[:error] = I18n.t('changes_saved_error')
      end

    else
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( team_radio_path(id: @team.id) ) and return
    end
  end


  def edit_affiliation
  end


  def update_affiliation
  end


  def edit_badges
  end


  def create_badge
  end


  def update_badges
  end


  def edit_lap_template
  end


  def update_app_template
  end

  private


  # Verifies that a team id is provided as parameter
  # Else, returns an invalid action request.
  #
  # Sets/assigns:
  # - @team, a valid Team instance
  #
  # == Params:
  # id: the team id to be processed
  #
  def verify_parameters
    set_team
    unless ( @team )
      flash[:error] = I18n.t(:invalid_action_request) + ' - ' + I18n.t('meeting.errors.missing_team_id')
      redirect_back( fallback_location: root_path ) and return
    end
  end

  # Verifies that the current user is the team_manager of the selected team.
  # Else, returns an invalid action request.
  #
  # Sets/assigns:
  # - @is_valid_team_manager, either +true+ or +false+
  #
  # == Implied parameters:
  # current_user:  user must be logged-in and either be a team-manager
  # team:  selected team
  #
  def verify_team_manageability
    # Bail out unless the user is a valid team manager:
    # To be a valid team manager
    # a user must be:
    # - enabled to manage the selected team
    @is_valid_team_manager = TeamManagerValidator.can_manage_team?( current_user, @team )
    unless ( @is_valid_team_manager )
      flash[:error] = I18n.t(:invalid_action_request) + ' - ' + I18n.t('meeting.errors.invalid_team_manager')
      redirect_to( team_radio_path(id: @team.id) ) and return
    end
  end


  # Verifies that a team id is provided as a parameter to this controller.
  # Assigns the @team instance when successful.
  #
  # == Controller Params:
  # id: the team id to be processed by most of the methods (see before filter above)
  #
  def set_team
    @team = Team.find_by_id( params[:id].to_i )
    #@team = @team.decorate if @team
  end
  #-- -------------------------------------------------------------------------
  #++


  # Strong parameters checking for the team update parameters
  def team_params
    params.permit(
      :address, :zip, :city_id,
      :home_page_url, :e_mail,
      :contact_name, :phone_number, :phone_mobile, :fax_number,
      :notes
    )
  end
  #-- -------------------------------------------------------------------------
  #++
end
