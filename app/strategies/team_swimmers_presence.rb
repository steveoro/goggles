require 'wrappers/timing'

#
# == TeamSwimmersPresence
#
# Pattern to retrieve team's swimmers presence in a given sets of seasons
# The team's swimmers presence is intended to summarize for each swimmer the amout of meetings, events and relays
# showing relative costs and payments
#
# @author   Leega
#
class TeamSwimmersPresence

  # These must be initialized on creation:
  attr_reader :team_id

  # These can be edited later on:
  attr_accessor :current_seasons, :presence_data

  # Initialization
  #
  # == Params:
  # An instance of season
  #
  def initialize(team_id)
    @team_id = team_id
    @current_seasons = nil
    @presence_data = nil
  end

  # Get seasons for given header year
  # If no header year gets open seasons today according to seasons method
  # Check out only for seasons with valid team affiliation for given team
  #
  def get_seasons(header_year = nil)
    @current_seasons = if header_year
      Season.where( "exists(select 1 from team_affiliations ta where ta.team_id = #{@team_id} and ta.season_id = id) and header_year LIKE '#{header_year}%'" ).includes(season_type: :federation_type)
    else
      Season.is_not_ended.where( "exists(select 1 from team_affiliations ta where ta.team_id = #{@team_id} and ta.season_id = id").includes(season_type: :federation_type)
    end
  end

  # Pick the current seasons ids if any, return 0 elsewhere
  #
  def pick_season_ids
    @current_seasons && @current_seasons.count > 0 ? @current_seasons.map{ |season| season.id }.join(',') : '0'
  end

  # Retrieve data from DB using the current seasons
  # Use one single query to decrease db access
  # Force team_id and seasons ids in the query before execute
  # If non current seasons set no data will be retrieved
  #
  def retrieve_data
    @presence_data = nil
    seasons_ids = pick_season_ids
    if seasons_ids != '0'
      # Define query for data retrieve.
      # Query is defined in a weay that should be easily execute in an SQL client
      # So team_id and seasons_id will be forced in a second step
      data_retrieve_query = '
        select bdg.swimmer_id, bdg.id as badge_is, bdg.season_id, s.complete_name, bdg.has_to_pay_fees,
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
        order by bdg.season_id, s.complete_name
        '

      # Prepare data retrieve query with team and seasons as parameters
      data_retrieve_query.gsub!('VAR_TEAM_ID', @team_id.to_s)
      data_retrieve_query.gsub!('VAR_SEASON_IDS', seasons_ids)

      # Retrieve data
      @presence_data = ActiveRecord::Base.connection.exec_query(data_retrieve_query)
    end
    !@presence_data.nil?
  end
  #-- --------------------------------------------------------------------------
  #++
end
