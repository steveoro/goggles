#
# == SwimmerMedals
#
# Pattern to retrieve swimmers statistic data
# Swimemr statis are those sown in swimemr's radio tab
#
# @author   Leega
#
class SwimmerMedals
  # These must be initialized on creation:
  attr_reader :swimmer, :swimmer_medals

  # These can be edited later on:
  #attr_accessor :current_seasons, :presence_data, :swimmers_summary

  # Initialization
  #
  # == Params:
  # An instance of season
  #
  def initialize(swimmer)
    @swimmer        = swimmer
    @swimmer_medals = nil
  end

  # Retrieve data from DB using the current seasons
  # Use one single query to decrease db access
  # Force team_id and seasons ids in the query before execute
  # If non current seasons set no data will be retrieved
  #
  def retrieve_data
    @swimmer_medals = nil
    # Define query for data retrieve.
    # Query is defined in a way that should be easily execute in an SQL client
    # So swimmer_id will be forced in a second step
    data_retrieve_query = '
    select
      et.is_a_relay as is_a_relay,
    	st.short_name as season_type,
      pt.code as pool_code,
      et.style_order as style_order,
      et.code as event_code,
    	sum(case when mir.rank = 1 then 1 else 0 end) as golds,
    	sum(case when mir.rank = 2 then 1 else 0 end) as silvers,
    	sum(case when mir.rank = 3 then 1 else 0 end) as bronzes,
    	sum(case when mir.rank = 4 then 1 else 0 end) as woodens
    from meeting_individual_results mir
    	join meeting_programs mp on mp.id = mir.meeting_program_id
    	join meeting_events me on me.id = mp.meeting_event_id
      join event_types et on et.id = me.event_type_id
      join pool_types pt on pt.id = mp.pool_type_id
      join badges b on b.id = mir.badge_id
      join seasons s on s.id = b.season_id
      join season_types st on st.id = s.season_type_id
    where not mir.is_disqualified
    	and mir.swimmer_id = VAR_SWIMMER_ID
    group by et.is_a_relay, st.short_name, pt.code, et.style_order, et.code
    union
    select
    	et.is_a_relay as is_a_relay,
    	st.short_name as season_type,
        pt.code as pool_code,
        et.style_order as style_order,
        et.code as event_code,
    	sum(case when mrr.rank = 1 then 1 else 0 end) as golds,
    	sum(case when mrr.rank = 2 then 1 else 0 end) as silvers,
    	sum(case when mrr.rank = 3 then 1 else 0 end) as bronzes,
    	sum(case when mrr.rank = 4 then 1 else 0 end) as woodens
    from meeting_relay_swimmers mrs
    	join meeting_relay_results mrr on mrr.id = mrs.meeting_relay_result_id
    	join meeting_programs mp on mp.id = mrr.meeting_program_id
    	join meeting_events me on me.id = mp.meeting_event_id
        join event_types et on et.id = me.event_type_id
        join pool_types pt on pt.id = mp.pool_type_id
        join badges b on b.id = mrs.badge_id
        join seasons s on s.id = b.season_id
        join season_types st on st.id = s.season_type_id
    where not mrr.is_disqualified
    	and mrs.swimmer_id = VAR_SWIMMER_ID
    group by et.is_a_relay, st.short_name, pt.code, et.style_order, et.code;
    '

    # Prepare data retrieve query with swimmer as parameter
    data_retrieve_query.gsub!('VAR_SWIMMER_ID', @swimmer.id.to_s)

    # Retrieve data
    @swimmer_medals = ActiveRecord::Base.connection.exec_query(data_retrieve_query).to_a.first
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
