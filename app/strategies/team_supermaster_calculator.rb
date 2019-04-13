require 'wrappers/timing'

#
# == TeamSupermasterCalculator
#
# Pattern to calcolate team Supermaster score
# FIN supermaster has rules:
# For each team swimmer are considered the 3 best event scores
# swam in different event_types without reguarding pool_type.
# Only swimmers with at least 3 differet event types are considered
# Only over 25 years swimmer are considered,
# so for the neo M25 only meetings swam after 01/01 are valid results
#
# @author   Leega
# @version  6.093
#
class TeamSupermasterCalculator

  # These must be initialized on creation:
  attr_reader :team_affiliation

  # These can be edited later on:
  attr_accessor :team, :season, :team_supermaster_dao, :u25_year, :min_m25_date, :got_swimmer_results

  # Initialization
  #
  # == Params:
  # The team affiliation to check scores for
  #
  def initialize( team_affiliation )
    @team_affiliation = team_affiliation
    @season = team_affiliation.season
    @team = team_affiliation.team

    @u25_year = season.end_date.year - 25
    @min_m25_date = Date.new( season.end_date.year, 1, 1 )

    @got_swimmer_results  = false
    @swimmer_results      = []
    @team_supermaster_dao = []
  end
  #-- --------------------------------------------------------------------------
  #++

  # Get the team swimmer results for the given season
  #   select -- mir.id, ms.scheduled_date
  # 	mir.swimmer_id, s.complete_name, ct.code, et.code, -- s.year_of_birth,
  #     max(mir.standard_points),
  # 	max(concat(lpad(mir.standard_points, 7, '0'), '-', lpaD(mir.minutes, 2, '0'), '''', lpaD(mir.seconds, 2, '0'), '"', lpaD(mir.hundreds, 2, '0'), '-', ms.meeting_id, '-', date_format(ms.scheduled_date, '%d/%m/%Y')))
  # from meeting_individual_results mir
  # 	join meeting_programs mp on mp.id = mir.meeting_program_id
  #     join meeting_events me on me.id = mp.meeting_event_id
  #     join meeting_sessions ms on ms.id = me.meeting_session_id
  #     join event_types et on et.id = me.event_type_id
  # 	join category_types ct on ct.id = mp.category_type_id
  #     join swimmers s on s.id = mir.swimmer_id
  # where mir.team_affiliation_id = 5197
  # 	and mir.standard_points > 0
  #     and (s.year_of_birth < 1984 or ms.scheduled_date >= '2019-01-01')
  # group by mir.swimmer_id, s.complete_name, et.code, ct.code-- , s.year_of_birth
  # order by 2, 5 desc;
  #
  def get_swimmer_results()
    # Find out valid results
    @got_swimmer_results  = true
    @swimmer_results = @team_affiliation.
      meeting_individual_results.
      joins( :swimmer, meeting_program: [:category_type, meeting_event: [:event_type, :meeting_session]] ).
      where(["standard_points > 0 and (swimmers.year_of_birth < ? or meeting_sessions.scheduled_date >= ?)", @u25_year, @min_date.to_s ] ).
      group("meeting_individual_results.swimmer_id, swimmers.complete_name, event_types.code, category_types.code").
      select("meeting_individual_results.swimmer_id,
        swimmers.complete_name,
        category_types.code as category_type_code,
        event_types.code as event_type_code,
        max(meeting_individual_results.standard_points) as standard_points,
        max(concat(lpad(meeting_individual_results.standard_points, 7, '0'), ';', lpaD(meeting_individual_results.minutes, 2, '0'), ':', lpaD(meeting_individual_results.seconds, 2, '0'), ':', lpaD(meeting_individual_results.hundreds, 2, '0'), ';', meeting_sessions.meeting_id, ';', date_format(meeting_sessions.scheduled_date, '%Y-%m-%d'))) as event_detail").
      order(2, 5).
      to_a
  end
  #-- -------------------------------------------------------------------------
  #++

  # Organize swimmer results in a dao
  # Consider only max num_events results for score calculation
  # A swimmer is included in team score if num_events valid events swam
  #
  def parse_swimmer_results( num_events = 3 )
    prev_swimmers = 0
    get_swimmer_results if @swimmer_results.size == 0
    @swimmer_results.each do |swimmer_result|
      if swimmer_result.swimmer_id != prev_swimmers
        # Creates new swimmer element
        prev_swimmers = swimmer_result.swimmer_id
        sts = SupermasterTeamSwimmerDAO.new( swimmer_result.swimmer_id )
        sts.set_swimmer_data( swimmer_result.complete_name, swimmer_result.category_type_code )
      end

      # Checks if max event number has been reached
      if sts.get_results_count < num_events
        # Adds event result details
        details = extract_event_detail( swimmer_result.event_detail )
        sts.add_result_detail( details[:meeting_id], details[:scheduled_date], swimmer_result.event_type_code, details[:time_swam], swimmer_result.standard_points )
      end
    end
  end

  # Extracts event details from concat sql response
  # Structure:
  # - standard_points
  # - time_swam (string mm:ss:cc)
  # - meeting_id
  # - scheduled_date (string '%Y/%m/%d')
  #
  def extract_event_detail( sql_response )
    details = sql_response.split(';')
    standard_points = details[0].to_f
    time_swam_detail = details[1].split(':')
    time_swam = Timing.new( time_swam_detail[2], time_swam_detail[1], time_swam_detail[0] )
    meeting_id = details[2].to_i
    scheduled_date = Date.parse( details[3] )
    { :standard_points => standard_points, :time_swam => time_swam, :meeting_id => meeting_id, :scheduled_date => scheduled_date }
  end
end
