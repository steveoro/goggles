require 'wrappers/timing'

#
# == SwimmerStats
#
# Pattern to retrieve team statistic data
# Team statis are those shown in team's radio tab
#
# @author   Leega
#
class TeamStats
  # These must be initialized on creation:
  attr_reader :team, :stats

  # These can be edited later on:
  #attr_accessor :current_seasons, :presence_data, :swimmers_summary

  # Initialization
  #
  # == Params:
  # An instance of season
  #
  def initialize( team )
    @team       = team
    @stats = nil

    # Those key are used to manage query results and produce linked event and team data at view time
    @meeting_keys   = [:meeting_date, :meeting_id, :meeting_description, :federation_code]
  end

  # Retrieve data from DB using the current seasons
  # Use one single query to decrease db access
  # Force team_id and seasons ids in the query before execute
  # If non current seasons set no data will be retrieved
  #
  def retrieve_data
    @stats = nil

    # Define query for data retrieve.
    # Query is defined in a way that should be easily execute in an SQL client
    # So swimmer_id will be forced in a second step
    data_retrieve_query = "
      select st.short_name as federation_name,
        min(concat(ms.scheduled_date, ':', ms.meeting_id, ':', m.description, ':', ft.code)) as min_date,
        max(concat(ms.scheduled_date, ':', ms.meeting_id, ':', m.description, ':', ft.code)) as max_date,
        count(distinct ta.id) as affiliations_count,
        count(distinct ms.meeting_id) as meetings_count
      from meeting_individual_results mir
        join meeting_programs mp on mp.id = mir.meeting_program_id
        join meeting_events me on me.id = mp.meeting_event_id
        join meeting_sessions ms on ms.id = me.meeting_session_id
        join meetings m on m.id = ms.meeting_id
        join team_affiliations ta on ta.id = mir.team_affiliation_id
        join seasons s on s.id = ta.season_id
        join season_types st on st.id = s.season_type_id
        join federation_types ft on ft.id = st.federation_type_id
      where mir.team_id = VAR_TEAM_ID
      group by st.short_name;
    "

    # Prepare data retrieve query with swimmer as parameter
    data_retrieve_query.gsub!('VAR_TEAM_ID', @team.id.to_s)

    # Retrieve data
    @stats = ActiveRecord::Base.connection.exec_query(data_retrieve_query)
  end

  # Gets a swimmer stats dao populated with data retrieve result
  #
  def get_team_stats_dao
    tsd = TeamStatsDAO.new( @team )

    #retrieve_data if @stats.nil?
    if !@stats.nil?
      # Cycle between federations to populate DAO
      @stats.each do |federation_stats|
        # Creates a new federation team stats
        fts = TeamStatsDAO::DataTeamStatsDAO.new()

        # Generals
        fts.meetings_count    = federation_stats['meetings_count'].to_i
        fts.first_meeting_dao = get_item_data( federation_stats['first_meeting_data'], @meeting_keys )
        fts.last_meeting_dao  = get_item_data( federation_stats['last_meeting_data'], @meeting_keys )

        # Individual results
        fts.individuals.meters_swam       = federation_stats['individual_meters'].to_i
        fts.individuals.time_swam         = federation_stats['individual_hundreds'].to_i + (federation_stats['individual_seconds'].to_i * 100) + (federation_stats['individual_minutes'].to_i * 6000)
        fts.individuals.disqualifications = federation_stats['individual_disqualified_count'].to_i

        # Relay results
        fts.relays.meters_swam        = federation_stats['relay_meters'].to_i
        fts.relays.time_swam          = federation_stats['relay_hundreds'].to_i + (federation_stats['relay_seconds'].to_i * 100) + (federation_stats['relay_minutes'].to_i * 6000)
        fts.relays.disqualifications  = federation_stats['relay_disqualified_count'].to_i

        tsd.add_federation_data( federation_stats['federation_name'], fts )
      end
    end

    tsd
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
