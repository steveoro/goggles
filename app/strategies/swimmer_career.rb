#
# == SwimmerCareer
#
# Pattern to retrieve swimmer career
# Swimmer's carrer is intended as the list of swimmer results ordered by date
# Results will be also separate by pool type and event type
#
# @author   Leega
#
class SwimmerCareer
  # These must be initialized on creation:
  attr_reader :swimmer, :to_date, :from_date

  # These can be edited later on:
  attr_accessor :data_retrieved, :passage_keys

  # Initialization
  #
  # == Params:
  # An instance of swimmer
  # The ending date to search (now if not specified)
  # The starting date to search (no limit if not specified)
  #
  def initialize( swimmer, to_date = Date.today(), from_date = 0 )
    @swimmer   = swimmer
    @to_date   = to_date
    @from_date = from_date

    @data_retrieved   = nil

    # Passage concat string structure
    @passage_keys = [
      :length_in_meters,
      :minutes, :seconds, :hundreds,
      :minutes_from_start, :seconds_from_start, :hundreds_from_start
    ]
  end

  # Retrieve data from DB using the current seasons
  # Use one single query to decrease db access
  # Force team_id and seasons ids in the query before execute
  # If non current seasons set no data will be retrieved
  #
  def retrieve_data
    @data_retrieved = nil

    # Define query for data retrieve.
    # Query is defined in a way that should be easily execute in an SQL client
    # So swimmer_id and dtae interval will be forced in a second step
    data_retrieve_query = "
    select m.id as meeting_id,
    	m.description as meeting_name,
    	m.header_date as meeting_date,
      ft.code as federation_code,
      ct.code as category_code,
      pt.code as pool_code,
      et.code as event_code,
      et.style_order as event_order,
      mir.id as result_id,
      mir.minutes,
      mir.seconds,
      mir.hundreds,
      mir.is_disqualified,
      mir.is_personal_best,
      mir.updated_at,
      (select group_concat(pt.length_in_meters, ';', p.minutes, ';', p.seconds, ';', p.hundreds, ';', p.minutes_from_start, ';', p.seconds_from_start, ';', p.hundreds_from_start)
      from passages p
    	join passage_types pt on pt.id = p.passage_type_id
      where p.meeting_individual_result_id = mir.id
      group by p.meeting_individual_result_id
      ) as passages
    from meeting_individual_results mir
    	join badges b on b.id = mir.badge_id
      join category_types ct on ct.id = b.category_type_id
      join seasons s on s.id = b.season_id
      join season_types st on st.id = s.season_type_id
      join federation_types ft on ft.id = st.federation_type_id
    	join meeting_programs mp on mp.id = mir.meeting_program_id
    	join meeting_events me on me.id = mp.meeting_event_id
    	join meeting_sessions ms on ms.id = me.meeting_session_id
      join meetings m on m.id = ms.meeting_id
    	join event_types et on et.id = me.event_type_id
      join pool_types pt on pt.id = mp.pool_type_id
    where mir.swimmer_id = VAR_SWIMMER_ID
    	and m.header_date between 'VAR_FROM_DATE' and 'VAR_TO_DATE'
    order by pt.code, m.header_date, et.style_order;
    "

    # Prepare data retrieve query with swimemr and date inteval as parameters
    data_retrieve_query.gsub!('VAR_SWIMMER_ID', @swimmer.id.to_s)
    data_retrieve_query.gsub!('VAR_TO_DATE', @to_date.to_s)
    data_retrieve_query.gsub!('VAR_FROM_DATE', @from_date.to_s)

    # Retrieve data
    @data_retrieved = ActiveRecord::Base.connection.exec_query(data_retrieve_query)
  end

  # Gets swimmer's career (results) dao populated with data retrieve result
  #
  def set_swimmer_career_dao
    sc = SwimmerCareerDAO.new( @swimmer, @to_date, @fronm_date )

    #retrieve_data if @data_retrieved.nil?
    if !@data_retrieved.nil?
      # Cycle between retrieved data to populate DAO
      @data_retrieved.each do |result|
        # if pool_type not exists create it
        pool_code = result['pool_code']
        pool = sc.get_pool( pool_code )
        pool = sc.add_pool( pool_code ) if !pool

        # Add meeting data to pool collection if not present
        meeting_id = result['meeting_id'].to_i
        pool.add_meeting( meeting_id, result['meeting_date'], result['meeting_name'], result['federation_code'], result['category_code'] ) if !pool.meetings.has_key?( meeting_id )

        # Add result data to meeting collection (never already present)
        time_swam = Timing.new( result['hundreds'].to_i, result['seconds'].to_i, result['minutes'].to_i )
        event_code = result['event_code']
        pool.add_result( meeting_id, result['result_id'].to_i, result['event_order'].to_i, event_code, time_swam, result['is_disqualified'], result['is_personal_best'] )

        # Add passages if present
        if result['passages'] != 'null'
          resultDAO = pool.get_result( meeting_id, event_code )
          extract_passages( passage_keys, result['passages'] ).each do |passage|
            time_pass = Timing.new( passage[:hundreds], passage[:seconds], passage[:minutes] )
            time_from_start = Timing.new( passage[:hundreds_from_start], passage[:seconds_from_start], passage[:minutes_from_start] )
            resultDAO.add_passage( passage[:length_in_meters], time_pass, time_from_start )
          end
        end

        # Sets max updated at value
        sc.updated_at = result['updated_at'] if sc.updated_at = 0 || sc.updated_at < result['updated_at']
      end
    end
    sc
  end

  # Extract passages data from concat string retrieved data
  # Concat string should cotain:
  # - null if no passages
  # - a set, comma separated, of
  # - length_in_meters;minutes;seconds;hundreds;minutes_from_start;seconds_from_start;hundreds_from_start if passage present
  #   eg: 50;0;34;12;0;34;12,100;0;37;2;1;11;14,150;0;39;56;1;50;70,200;0;40;53;2;31;23
  #
  def extract_passages( keys, passage_list = 'null' )
    passages = []
    if passage_list && passage_list != 'null'
      passage_list.split(',').each do |passages_data|
        passages << extract_passage( keys, passages_data )
      end
    end
    passages
  end

  # Extract single passage data from ';' concat string
  # - length_in_meters;minutes;seconds;hundreds;minutes_from_start;seconds_from_start;hundreds_from_start if passage present
  #
  def extract_passage( keys, passages = 'null' )
    passage = {}
    if passages != 'null'
      passage_data = passages.split(';')
      if passage_data.size == keys.size
        count = 0
        keys.each do |key|
          passage[key] = passage_data[count].to_i
          count += 1
        end
      end
    end
    passage
  end
  #-- --------------------------------------------------------------------------
  #++
end
