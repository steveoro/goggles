require 'wrappers/timing'

#
# == SwimmerStats
#
# Pattern to retrieve swimmers statistic data
# Swimemr statis are those sown in swimemr's radio tab
#
# @author   Leega
#
class SwimmerStats
  include Rails.application.routes.url_helpers

  # These must be initialized on creation:
  attr_reader :swimmer, :swimmer_stats

  # These can be edited later on:
  #attr_accessor :current_seasons, :presence_data, :swimmers_summary

  # Initialization
  #
  # == Params:
  # An instance of season
  #
  def initialize(swimmer)
    @swimmer       = swimmer
    @swimmer_stats = nil

    # Those key are used to manage query results and produce linked event and team data at view time
    @event_keys     = [:standard_points, :meeting_id, :event_code, :event_date, :federation_code, :meeting_description]
    @meeting_keys   = [:meeting_date, :meeting_id, :meeting_description, :federation_code]
  end

  # Retrieve data from DB using the current seasons
  # Use one single query to decrease db access
  # Force team_id and seasons ids in the query before execute
  # If non current seasons set no data will be retrieved
  #
  def retrieve_data
    @swimmer_stats = nil
    # Define query for data retrieve.
    # Query is defined in a weay that should be easily execute in an SQL client
    # So team_id and seasons_id will be forced in a second step
    data_retrieve_query = "
    select
        sum(sbs.meeting_count) as meetings_count,
        sum(sbs.mir_count) as individual_count,
        sum(case when sbs.fed_code = 'FIN' then sbs.total_points else 0 end) as total_fin_points,
        sum(sbs.individual_minutes) as individual_minutes,
        sum(sbs.individual_seconds) as individual_seconds,
        sum(sbs.individual_hundreds) as individual_hundreds,
        sum(sbs.individual_meters) as individual_meters,
        sum(sbs.individual_disqualified_count) as individual_disqualified_count,
        max(sbs.max_points) as max_fin_points_data,
        min(case when sbs.fed_code = 'FIN' and substr(sbs.min_points, 1, 4) <> '0.00' then sbs.min_points else '9999:99999999' end) as min_fin_points_data,
        sum(case when sbs.fed_code = 'FIN' and sbs.event_count >= 18 then 1 else 0 end) as irons_count,
    	  group_concat(distinct sbs.team_name_and_id separator ', ') as teams_name_and_ids,
        min(sbs.min_date) as first_meeting_data,
        max(sbs.max_date) as last_meeting_data,
        sum(sbr.mrr_count) as relays_count,
        sum(sbr.relay_minutes) as relay_minutes,
        sum(sbr.relay_seconds) as relay_seconds,
        sum(sbr.relay_hundreds) as relay_hundreds,
        sum(sbr.relay_meters) as relay_meters,
        sum(sbr.relay_disqualified_count) as relay_disqualified_count,
        group_concat(crb.current_team separator ', ') as current_teams,
        group_concat(crb.current_category separator ', ') as current_categories
    -- Individual results
    from (
    	select mir.swimmer_id, mir.badge_id, ft.code as fed_code,
        concat(t.editable_name, ':', t.id) as team_name_and_id,
    		count(distinct ms.meeting_id) as meeting_count,
    		count(mir.id) as mir_count,
    		sum(mir.standard_points) as total_points,
    		sum(mir.minutes) as individual_minutes,
    		sum(mir.seconds) as individual_seconds,
    		sum(mir.hundreds) as individual_hundreds,
    		sum(et.length_in_meters) as individual_meters,
    		sum(mir.is_disqualified) as individual_disqualified_count,
    		max(concat(mir.standard_points, ':', m.id, ':', et.code, ':', ms.scheduled_date, ':', ft.code, ':', m.description)) as max_points,
    		min(concat(mir.standard_points, ':', m.id, ':', et.code, ':', ms.scheduled_date, ':', ft.code, ':', m.description)) as min_points,
    		count(distinct et.code) as event_count,
        min(concat(ms.scheduled_date, ':', m.id, ':', m.description, ':', ft.code)) as min_date,
        max(concat(ms.scheduled_date, ':', m.id, ':', m.description, ':', ft.code)) as max_date
    	from meeting_individual_results mir
    		join meeting_programs mp on mp.id = mir.meeting_program_id
    		join meeting_events me on me.id = mp.meeting_event_id
    		join meeting_sessions ms on ms.id = me.meeting_session_id
    		join category_types ct on ct.id = mp.category_type_id
    		join event_types et on et.id = me.event_type_id
    		join meetings m on m.id = ms.meeting_id
    		join seasons s on s.id = m.season_id
    		join season_types st on st.id = s.season_type_id
    		join federation_types ft on ft.id = st.federation_type_id
    		join badges b on b.id = mir.badge_id
    		join teams t on t.id = b.team_id
    	where mir.swimmer_id = VAR_SWIMMER_ID
    	group by mir.swimmer_id, mir.badge_id, ft.code, concat(t.editable_name, ':', t.id)
    ) as sbs
    -- Relays
    left join (
    	select mrs.swimmer_id, mrs.badge_id,
    		count(mrr.id) as mrr_count,
    		sum(mrs.minutes) as relay_minutes,
    		sum(mrs.seconds) as relay_seconds,
    		sum(mrs.hundreds) as relay_hundreds,
    		sum(et.phase_length_in_meters) as relay_meters,
    		sum(mrr.is_disqualified) as relay_disqualified_count
    	from meeting_relay_swimmers mrs
    		join meeting_relay_results mrr on mrr.id = mrs.meeting_relay_result_id
    		join meeting_programs mp on mp.id = mrr.meeting_program_id
    		join meeting_events me on me.id = mp.meeting_event_id
    		join event_types et on et.id = me.event_type_id
    	where mrs.swimmer_id = VAR_SWIMMER_ID
    	group by mrs.swimmer_id, mrs.badge_id
    ) as sbr on sbr.badge_id = sbs.badge_id
    -- Current team and category
    left join (
    	select b.id as badge_id,
    		concat(t.editable_name, ':', t.id) as current_team,
        ct.code as current_category
    	from badges b
    	join seasons s on s.id = b.season_id
    	join category_types ct on ct.id = b.category_type_id
    	join teams t on t.id = b.team_id
    	where b.swimmer_id = VAR_SWIMMER_ID
    		and s.end_date > curdate()
    ) as crb on crb.badge_id = sbs.badge_id
    where sbs.swimmer_id = VAR_SWIMMER_ID
    group by sbs.swimmer_id;
    "

    # Prepare data retrieve query with swimmer as parameter
    data_retrieve_query.gsub!('VAR_SWIMMER_ID', @swimmer.id.to_s)

    # Retrieve data
    @swimmer_stats = ActiveRecord::Base.connection.exec_query(data_retrieve_query).to_a.first
  end

  # Gets a swimmer stats dao populated with data retrieve result
  #
  def get_swimmers_stats_dao
    ssd = SwimmerStatsDAO.new( @swimmer )
    ssd.prepare_structure

    #retrieve_data if @swimmer_stats.nil?
    if !@swimmer_stats.nil?
      # Individual results
      ssd.swimmer_stats[:meetings_count]           = @swimmer_stats['meetings_count'].to_i
      ssd.swimmer_stats[:individual_results_count] = @swimmer_stats['individual_count'].to_i
      ssd.swimmer_stats[:meters_swam]              = @swimmer_stats['individual_meters'].to_i
      ssd.swimmer_stats[:time_swam]                = @swimmer_stats['individual_hundreds'].to_i + (@swimmer_stats['individual_seconds'].to_i * 100) + (@swimmer_stats['individual_minutes'].to_i * 6000)
      ssd.swimmer_stats[:disqualifications]        = @swimmer_stats['individual_disqualified_count'].to_i
      # Use an array and made the link in html directly to avoid DB read
      #ssd.swimmer_stats[:team_names]               = get_linked_teams( @swimmer_stats['teams_name_and_ids'] )
      #ssd.swimmer_stats[:first]                    = nil
      #ssd.swimmer_stats[:last]                     = nil
      ssd.swimmer_stats[:teams_hash]               = get_items_hash( @swimmer_stats['teams_name_and_ids'] )
      ssd.swimmer_stats[:first_meeting_hash]       = get_item_data( @swimmer_stats['first_meeting_data'], @meeting_keys )
      ssd.swimmer_stats[:last_meeting_hash]        = get_item_data( @swimmer_stats['last_meeting_data'], @meeting_keys )

      # Relay results
      ssd.swimmer_stats[:relay_results_count]      = @swimmer_stats['relays_count'].to_i
      ssd.swimmer_stats[:relay_meters_swam]        = @swimmer_stats['relay_meters'].to_i
      ssd.swimmer_stats[:relay_time_swam]          = @swimmer_stats['relay_hundreds'].to_i + (@swimmer_stats['relay_seconds'].to_i * 100) + (@swimmer_stats['relay_minutes'].to_i * 6000)
      ssd.swimmer_stats[:relay_disqualifications]  = @swimmer_stats['relay_disqualified_count'].to_i

      # FIN statistics
      ssd.swimmer_stats[:iron_masters]             = @swimmer_stats['irons_count'].to_i
      ssd.swimmer_stats[:tot_fin_points]           = @swimmer_stats['total_fin_points'].to_i
      # Use an array and made the link in hatml directly to avoid DB read
      #ssd.swimmer_stats[:worst_fin]                = nil
      #ssd.swimmer_stats[:best_fin]                 = nil
      ssd.swimmer_stats[:worst_fin_hash]           = get_item_data( @swimmer_stats['min_fin_points_data'], @event_keys )
      ssd.swimmer_stats[:best_fin_hash]            = get_item_data( @swimmer_stats['max_fin_points_data'], @event_keys )

      # Currents
      ssd.swimmer_stats[:current_teams_hash]       = get_items_hash( @swimmer_stats['current_teams'] )
      ssd.swimmer_stats[:current_categories_array] = get_distinct_items( @swimmer_stats['current_categories'] )
    end

    ssd
  end

  # Creates an hash of an item list in wich items are comma separated and
  # item elements are semicolon separated couples value:key
  # like 'PIPPO:1, PLUTO:2'
  # Returns an empty hash if no items
  #
  def get_items_hash( comma_separated_list )
    item_hash = Hash.new()
    if comma_separated_list
      comma_separated_list.split(', ').each do |item_name_and_id|
        item_data = item_name_and_id.split(':')
        item_hash[item_data[1]] = item_data[0]
      end
    else
      item_hash = nil
    end
    item_hash
  end

  # Creates an array of comma separated items
  # Returns nil if no items
  #
  def get_distinct_items( comma_separated_list )
    array = nil
    array = comma_separated_list.split(', ').uniq if comma_separated_list
    array
  end

  # Creates an array of items array in wich items are comma separated and
  # item elements are semiclon separated lik 'PIPPO:1:PRIMO, PLUTO:2:SECONDO'
  # Returns nil if no items
  #
  def get_item_data( data_list, data_tags )
    item_data = Hash.new()
    #ms.scheduled_date, ':', m.id, ':', m.description, ':', ft.code
    #event_data_tags = [:date, :meeting_id, :meeting_description, :federation_code]
    if data_list
      data_list.split(':').each_with_index do |value, index|
        tag = data_tags[index]
        item_data[tag] = value
      end
    else
      item_data = nil
    end
    item_data
  end
  #-- --------------------------------------------------------------------------
  #++
end
