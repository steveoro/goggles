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
  #
  def show_pending_reservations
    @tab_title = I18n.t('team_management.pending_reservations')

    prf = PendingReservationFinder.new(current_user)
    @pending_reservations = prf.get_pending_reservations()
  end


  # Update confirmed pending reservations
  #
  def update_pending_reservations
    @reservation_ids = []

    if request.xhr? && request.post?                   # === AJAX POST: ===
      # Check out reservation to update
      params.each do |key,value|
        if key.start_with?('meeting_reservation_id:')
          #puts "\r\n-" << key + "-" + value
          @reservation_ids << key.slice(23..key.length).to_i
        end
      end

      #@reservation_ids.each do |id|
      #  puts id.to_s
      #end

      # Update reservations
      MeetingReservation.connection.update("update meeting_reservations set has_confirmed=true where id in (#{@reservation_ids.join(',')})")

      flash[:info] = I18n.t('team_management.reservations_updated')
      redirect_to( team_management_show_pending_reservations_path(id: @team.id) )
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

  # View FIN Supermaster team score (status)
  def supermaster
    @tab_title = I18n.t('team_management.fin_supermaster')

    # Find out steam affiliation. Fix-ME
    team_affiliation = @team.team_affiliations.includes(:season).where("season_id = 182").first
    tsc = TeamSupermasterCalculator.new(team_affiliation)
    tot_swimmers = tsc.parse_swimmer_results()
    @team_supermaster_scores = tsc.team_supermaster_dao.sort{|p,n| (n.get_results_count*10000 + n.get_total_score) <=> (p.get_results_count*10000 + p.get_total_score) }
    @full_events_swimmers = tsc.full_events_swimmers
    @ranking_min = 0
    @ranking_max = 9999
    @ranking_context = 9999
    @ranking_range = "A"

    # Determines the ranking context based on full_events_swimmer count
    # TODO - Store range on DB
    case @full_events_swimmers
    # Range F 25
    when 1..30
      @ranking_min = 1
      @ranking_max = 30
      @ranking_context = 25
      @ranking_range = "F"
    # Range E 50
    when 31..55
      @ranking_min = 31
      @ranking_max = 55
      @ranking_context = 50
      @ranking_range = "E"
    # Range D 75
    when 56..85
      @ranking_min = 56
      @ranking_max = 85
      @ranking_context = 75
      @ranking_range = "D"
    # Range C 100
    when 86..110
      @ranking_min = 86
      @ranking_max = 110
      @ranking_context = 100
      @ranking_range = "C"
    # Range B 125
    when 111..140
      @ranking_min = 111
      @ranking_max = 140
      @ranking_context = 125
      @ranking_range = "B"
    # Range A more than 125
    else
      @ranking_min = 140
      @ranking_max = 9999
      @ranking_context = 9999
      @ranking_range = "A"
    end

  end


  # Team's swimmers presence summary with costs if team manager
  def show_presence
    @tab_title = I18n.t('presences.title')

    # TODO Find out managed seasons
    hyp = HeaderYearPicker.new()
    @season_list = hyp.find(2015)

    # Prepare data retreiving structure
    @tsp = TeamSwimmersPresence.new( @team.id )

    # Find out current seasons for team. Use only initial year of header_year
    @current_seasons = @tsp.get_seasons( params['header_year'].present? ? params['header_year'].slice(0, 4) : nil )

    # Retrieve team presence data
    @tsp.retrieve_data
    @presence_data = @tsp.presence_data

    # Creates swimmers_summary
    @swimmers_summary = @tsp.create_swimmers_summary
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


  # Verifies that the current user is the team_manager of the selected team
  # or a current swimmer of selected team.
  # Else, returns an invalid action request.
  #
  # Sets/assigns:
  # - @is_team_swimmer, either +true+ or +false+
  #
  # == Implied parameters:
  # current_user:  user must be logged-in
  # team:  selected team
  #
  def verify_teamship
    # Bail out unless the user is a valid team manager:
    # To be a valid team manager
    # a user must be:
    # - enabled to manage the selected team
    @is_team_swimmer = false
    if verify_team_manageability
      @is_team_swimmer = true
    else
      @is_team_swimmer = current_user.swimmer.badges.where(["team_id = ? and season_id = 182", @team_id])
    end
    unless ( @is_team_swimmer )
      flash[:error] = I18n.t(:invalid_action_request) + ' - ' + I18n.t('team_management.error_no_team_swimmer')
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
