#
# == TeamCurrentSwimmer
#
# Pattern to retrieve team current swimmers
# Team curent swimmers has to show a swimmer list containing swimmers with badge in active seasons
# with some detail data such as year of birth, age, category, badge number, etc.
#
# @author   Leega
#
class TeamCurrentSwimmers
  # These must be initialized on creation:
  attr_reader :team, :evaluation_date, :header_year

  # These can be edited later on:
  attr_accessor :data_retrieved

  # Initialization
  #
  # == Params:
  # An instance of season
  #
  def initialize( team, evaluation_date = Date.today() )
    @team             = team
    @evaluation_date  = evaluation_date
    @header_year      = Season.build_header_year_from_date( @evaluation_date )

    @data_retrieved   = nil
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
    # So swimmer_id will be forced in a second step
    data_retrieve_query = "
      -- Preselected version
      select
          s.id as swimmer_id,
          s.complete_name as swimmer_name,
          s.year_of_birth as swimmer_year,
          bd_csi.*,
          bd_fin.*,
          bd_uisp.*,
          bd_tot.meetings_total,
          bd_tot.max_updated_at
      from swimmers s
      	left join (
      		-- Subquery for CSI badges
      		select
      			bdg.swimmer_id as csi_swimmer_id,
      			ft.code as csi_federation_code,
      			ta.number as csi_affiliation_number,
            bdg.id as csi_badge_id,
      			bdg.number as csi_badge_number,
      			ct.code as csi_category_code,
      			count(distinct ms.meeting_id) as csi_meetings_count,
            bdg.updated_at as csi_max_updated_at
      		from badges bdg
      			join seasons sn on sn.id = bdg.season_id
      			join season_types st on st.id = sn.season_type_id
      			join federation_types ft on ft.id = st.federation_type_id
      			join team_affiliations ta on ta.id = bdg.team_affiliation_id
      			join category_types ct on ct.id = bdg.category_type_id
                  left join meeting_individual_results mir on mir.badge_id = bdg.id
      			left join meeting_programs mp on mp.id = mir.meeting_program_id
      			left join meeting_events me on me.id = mp.meeting_event_id
      			left join meeting_sessions ms on ms.id = me.meeting_session_id
      		where bdg.team_id = VAR_TEAM_ID
      			and sn.header_year = 'VAR_HEADER_YEAR'
                  and ft.code = 'CSI'
      		group by bdg.swimmer_id, ft.code, ta.number, bdg.id, bdg.number, ct.code
      	) bd_csi on bd_csi.csi_swimmer_id = s.id
      	left join (
      		-- Subquery for FIN badges
      		select
      			bdg.swimmer_id as fin_swimmer_id,
      			ft.code as fin_federation_code,
      			ta.number as fin_affiliation_number,
            bdg.id as fin_badge_id,
      			bdg.number as fin_badge_number,
      			ct.code as fin_category_code,
      			count(distinct mss.meeting_id) as fin_meetings_count,
            bdg.updated_at as fin_max_updated_at
      		from badges bdg
      			join seasons sn on sn.id = bdg.season_id
      			join season_types st on st.id = sn.season_type_id
      			join federation_types ft on ft.id = st.federation_type_id
      			join team_affiliations ta on ta.id = bdg.team_affiliation_id
      			join category_types ct on ct.id = bdg.category_type_id
                  left join meeting_individual_results mirs on mirs.badge_id = bdg.id
      			left join meeting_programs mps on mps.id = mirs.meeting_program_id
      			left join meeting_events mes on mes.id = mps.meeting_event_id
      			left join meeting_sessions mss on mss.id = mes.meeting_session_id
      		where bdg.team_id = VAR_TEAM_ID
      			and sn.header_year = 'VAR_HEADER_YEAR'
                  and ft.code = 'FIN'
      		group by bdg.swimmer_id, ft.code, ta.number, bdg.id, bdg.number, ct.code
      	) bd_fin on bd_fin.fin_swimmer_id = s.id
      	left join (
      		-- Subquery for UISP badges
      		select
      			bdg.swimmer_id as uisp_swimmer_id,
      			ft.code as uisp_federation_code,
      			ta.number as uisp_affiliation_number,
            bdg.id as uisp_badge_id,
      			bdg.number as uisp_badge_number,
      			ct.code as uisp_category_code,
      			count(distinct mss.meeting_id) as uisp_meetings_count,
            bdg.updated_at as uisp_max_updated_at
      		from badges bdg
      			join seasons sn on sn.id = bdg.season_id
      			join season_types st on st.id = sn.season_type_id
      			join federation_types ft on ft.id = st.federation_type_id
      			join team_affiliations ta on ta.id = bdg.team_affiliation_id
      			join category_types ct on ct.id = bdg.category_type_id
            left join meeting_individual_results mirs on mirs.badge_id = bdg.id
      			left join meeting_programs mps on mps.id = mirs.meeting_program_id
      			left join meeting_events mes on mes.id = mps.meeting_event_id
      			left join meeting_sessions mss on mss.id = mes.meeting_session_id
      		where bdg.team_id = VAR_TEAM_ID
      			and sn.header_year = 'VAR_HEADER_YEAR'
            and ft.code = 'UISP'
      		group by bdg.swimmer_id, ft.code, ta.number, bdg.id, bdg.number, ct.code
      	) bd_uisp on bd_uisp.uisp_swimmer_id = s.id
      	left join (
      		-- Subquery for global results
      		select
      			bdg.swimmer_id as swimmer_id,
      			count(distinct ms.meeting_id) as meetings_total,
            max(mir.updated_at) as max_updated_at
      		from badges bdg
            left join meeting_individual_results mir on mir.badge_id = bdg.id
      			left join meeting_programs mp on mp.id = mir.meeting_program_id
      			left join meeting_events me on me.id = mp.meeting_event_id
      			left join meeting_sessions ms on ms.id = me.meeting_session_id
      		where bdg.team_id = VAR_TEAM_ID
      		group by bdg.swimmer_id
      	) bd_tot on bd_tot.swimmer_id = s.id
      where exists (
      	select 1
          from badges b
      		join seasons sn on sn.id = b.season_id
      	where b.swimmer_id = s.id
      		and b.team_id = VAR_TEAM_ID
      		and sn.header_year = 'VAR_HEADER_YEAR')
      order by s.complete_name;
    "

    # Prepare data retrieve query with team as parameter
    data_retrieve_query.gsub!('VAR_TEAM_ID', @team.id.to_s)
    data_retrieve_query.gsub!('VAR_HEADER_YEAR', @header_year)

    # Retrieve data
    @data_retrieved = ActiveRecord::Base.connection.exec_query(data_retrieve_query)
  end

  # Gets a swimmer stats dao populated with data retrieve result
  #
  def set_team_current_swimmers_dao
    tcs = TeamCurrentSwimmersDAO.new( @team )

    #retrieve_data if @data_retrieved.nil?
    if !@data_retrieved.nil?
      # Cycle between retrieved data to populate DAO
      @data_retrieved.each do |swimmer_data|
        # Creates new affiliation if not already present
        csi_affiliation = swimmer_data['csi_affiliation_number']
        fin_affiliation = swimmer_data['fin_affiliation_number']
        uisp_affiliation = swimmer_data['uisp_affiliation_number']
        tcs.add_affiliation( swimmer_data['csi_federation_code'], csi_affiliation ) if csi_affiliation && !tcs.affiliations.has_key?( csi_affiliation )
        tcs.add_affiliation( swimmer_data['fin_federation_code'], fin_affiliation ) if fin_affiliation && !tcs.affiliations.has_key?( fin_affiliation )
        tcs.add_affiliation( swimmer_data['uisp_federation_code'], uisp_affiliation ) if uisp_affiliation && !tcs.affiliations.has_key?( uisp_affiliation )

        tcs.updated_at = swimmer_data['max_updated_at'] if swimmer_data['max_updated_at'] && swimmer_data['max_updated_at'] > tcs.updated_at

        # Creates the swimmer
        tcs.add_swimmer( swimmer_data['swimmer_id'], swimmer_data['swimmer_name'], swimmer_data['swimmer_year'], swimmer_data['meetings_total'] )
        new_swimmer = tcs.get_swimmer( swimmer_data['swimmer_id'] )

        # Add CSI badge data if present
        if swimmer_data['csi_badge_number']
          new_swimmer.add_badge( swimmer_data['csi_federation_code'], swimmer_data['csi_badge_id'], swimmer_data['csi_badge_number'], swimmer_data['csi_category_code'], swimmer_data['csi_meetings_count'] )
          tcs.updated_at = swimmer_data['csi_max_updated_at'] if swimmer_data['csi_max_updated_at'] && swimmer_data['csi_max_updated_at'] > tcs.updated_at
        end

        # Add FIN badge data if present
        if swimmer_data['fin_badge_number']
          new_swimmer.add_badge( swimmer_data['fin_federation_code'], swimmer_data['fin_badge_id'], swimmer_data['fin_badge_number'], swimmer_data['fin_category_code'], swimmer_data['fin_meetings_count'] )
          tcs.updated_at = swimmer_data['fin_max_updated_at'] if swimmer_data['fin_max_updated_at'] && swimmer_data['fin_max_updated_at'] > tcs.updated_at
        end

        # Add UISP badge data if present
        if swimmer_data['uisp_badge_number']
          new_swimmer.add_badge( swimmer_data['uisp_federation_code'], swimmer_data['uisp_badge_id'], swimmer_data['uisp_badge_number'], swimmer_data['uisp_category_code'], swimmer_data['uisp_meetings_count'] )
          tcs.updated_at = swimmer_data['uisp_max_updated_at'] if swimmer_data['uisp_max_updated_at'] && swimmer_data['uisp_max_updated_at'] > tcs.updated_at
        end
      end
    end
    tcs
  end
  #-- --------------------------------------------------------------------------
  #++
end
