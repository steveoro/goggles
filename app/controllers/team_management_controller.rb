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

    # Collection of swimmer data presence
    @presence_data = []
    @swimmers_summary = []

    # TODO Find out managed seasons
    hyp = HeaderYearPicker.new()
    @season_list = hyp.find(2018)

    # Find out current seasons for team
    @current_seasons = if params['header_year'].present?
      Season.where( "header_year LIKE '#{ params['header_year'].to_i }%'" ).includes(season_type: :federation_type)
    else
      Season.is_not_ended.includes(season_type: :federation_type)
    end

    # Check if no current season
    if @current_seasons && @current_seasons.count > 0
      # Define query for data retrieve.
      # Use one single query to decrease db access
      data_retrieve =
      'select bdg.swimmer_id, bdg.id as badge_is, bdg.season_id, s.complete_name, bdg.has_to_pay_fees,
  	  sum(case when prm.mir + prm.res > 0 then 1 else 0 end) as mtg_count,
  	  (case when prm.badge_id is not null then sum(case when prm.mir >= prm.res then prm.mir else prm.res end) else 0 end) as mir_count,
      (case when prm.badge_id is not null then sum(prm.rel) else 0 end) as rel_count,
      (case when bdg.has_to_pay_badge and ssn.badge_fee > 0 then ssn.badge_fee else 0 end) as badge_fee,
      sum(case when bdg.has_to_pay_fees and mtg.meeting_fee > 0 and (prm.mir + prm.res) > 0 then mtg.meeting_fee else 0 end) as mtg_fee,
      sum(case when bdg.has_to_pay_fees and mtg.event_fee > 0 then (case when prm.mir >= prm.res then prm.mir else prm.res end) * mtg.event_fee else 0 end) as mir_fee,
      sum(case when bdg.has_to_pay_relays and prm.badge_id is not null then round(prm.rel * mtg.relay_fee / 4, 2) else 0 end) as rel_fee,
      (case when bdg.has_to_pay_fees then (select sum(bp.amount) from badge_payments bp where bp.badge_id = bdg.id) else 0 end) as payments,
      (case when bdg.has_to_pay_fees then (select max(bp.payment_date) from badge_payments bp where bp.badge_id = bdg.id) else null end) as last_payment,
      (case when bdg.has_to_pay_fees then (select count(bp.id) from badge_payments bp where bp.badge_id = bdg.id) else 0 end) as num_payments
      from swimmers s
      join badges bdg on bdg.swimmer_id = s.id
      join seasons ssn on ssn.id = bdg.season_id
  	  left join
      (select b.id as badge_id, b.swimmer_id, m.id as meeting_id,
        (select count(mir.id)
        from meeting_individual_results mir
          join meeting_programs mp on mp.id = mir.meeting_program_id
          join meeting_events me on me.id = mp.meeting_event_id
          join meeting_sessions ms on ms.id = me.meeting_session_id
        where mir.badge_id = b.id
      	and ms.meeting_id = m.id) as mir,
        (select count(mer.id)
        from meeting_event_reservations mer
      	join meeting_reservations mr on mr.meeting_id = mer.meeting_id and mr.badge_id = mer.badge_id
        where mer.badge_id = b.id
      	and mer.meeting_id = m.id
          and mer.is_doing_this
          and mr.has_confirmed) as res,
        (select count(mrs.id)
        from meeting_relay_swimmers mrs
      	join meeting_relay_results mrr on mrr.id = mrs.meeting_relay_result_id
          join meeting_programs mp on mp.id = mrr.meeting_program_id
          join meeting_events me on me.id = mp.meeting_event_id
          join meeting_sessions ms on ms.id = me.meeting_session_id
        where mrs.badge_id = b.id
      	and ms.meeting_id = m.id) as rel
       from badges b
          join meetings m on m.season_id = b.season_id
       where b.team_id = VAR_TEAM_ID
      	and b.season_id in (VAR_SEASON_IDS)
       group by b.id, b.swimmer_id, m.id
       having mir > 0 or res > 0 or rel > 0
      ) as prm on prm.badge_id = bdg.id
      	left join meetings mtg on mtg.id = prm.meeting_id
      where bdg.team_id = VAR_TEAM_ID
       	and bdg.season_id in (VAR_SEASON_IDS)
      group by prm.swimmer_id, prm.badge_id, bdg.season_id, s.complete_name, bdg.has_to_pay_fees
      order by bdg.season_id, s.complete_name'

      # Prepare data retrieve query with team and seasons as parameters
      data_retrieve.gsub!('VAR_TEAM_ID', @team.id.to_s)
      data_retrieve.gsub!('VAR_SEASON_IDS', @current_seasons.map{ |season| season.id }.join(','))

      # Reatrieve data
      @presence_data = ActiveRecord::Base.connection.exec_query(data_retrieve)

      # Combine data in a structure with swimmer and total datas
      @presence_data.reject{ |e| e['has_to_pay_fees'] <= 0 }.each do |swimmer_presence|
        swimmer_index = @swimmers_summary.index{ |e| e['swimmer_id'] == swimmer_presence['swimmer_id'] }
        if swimmer_index.nil?
          new_element = {}
          new_element['swimmer_id']    = swimmer_presence['swimmer_id']
          new_element['complete_name'] = swimmer_presence['complete_name']
          new_element['tot_costs']     = swimmer_presence['badge_fee'] + swimmer_presence['mtg_fee'] + swimmer_presence['mir_fee'] + swimmer_presence['rel_fee']
          new_element['num_payments']  = swimmer_presence['num_payments']
          new_element['payments']      = swimmer_presence['payments'].nil? ? 0 : swimmer_presence['payments']
          new_element['last_payment']  = swimmer_presence['last_payment']
          new_element['num_badges']    = 1
          @swimmers_summary << new_element
        else
          @swimmers_summary[swimmer_index]['tot_costs']    += swimmer_presence['badge_fee'] + swimmer_presence['mtg_fee'] + swimmer_presence['mir_fee'] + swimmer_presence['rel_fee']
          @swimmers_summary[swimmer_index]['num_payments'] += swimmer_presence['num_payments']
          @swimmers_summary[swimmer_index]['payments']     += swimmer_presence['payments'].nil? ? 0 : swimmer_presence['payments']
          @swimmers_summary[swimmer_index]['last_payment'] = swimmer_presence['last_payment'] if swimmer_presence['last_payment'] && (@swimmers_summary[swimmer_index]['last_payment'].nil? || swimmer_presence['last_payment'] > @swimmers_summary[swimmer_index]['last_payment'])
          @swimmers_summary[swimmer_index]['num_badges']   += 1
        end
      end
      #@swimmers_summary.sort!{ |p,n| p['num_badges'].to_s + p['complete_name'] <=> n['num_badges'].to_s + n['complete_name'] }
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
