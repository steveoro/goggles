# encoding: utf-8

require 'common/format'
require_relative '../../../data_import/v2/strategies/result_time_parser'
require_relative '../../../data_import/v2/services/data_import_entity_builder'
require_relative '../../../data_import/v2/services/data_import_team_builder'
require_relative '../../../data_import/v2/services/data_import_meeting_individual_result_builder'


=begin

= V2::DataImportMeetingTeamScoreBuilder

  - Goggles framework vers.:  4.00.767
  - author: Steve A.

 Specialized +DataImportEntityBuilder+ for searching (or adding brand new)
 MeetingTeamScore entity rows.

=end
class V2::DataImportMeetingTeamScoreBuilder < V2::DataImportEntityBuilder

  # Searches for an existing MeetingTeamScore given the parameters, or it adds a new one,
  # if none are found.
  #
  # == Returns
  # +nil+ in case of invalid parameters
  # #result_id as:
  #     - positive (#id) for a freshly added row into the secondary entity ('data_import_' table);
  #     - negative (- #id) for a matching existing or commited row in the primary entity;
  #     - 0 on error/unable to process.
  #
  # @raise ArgumentError unless <tt>season</tt> and <tt>meeting_program</tt> are both not-nil.
  #
  def self.build_from_parameters( data_import_session, season, meeting,
                                  detail_row, detail_row_idx, detail_rows_size,
                                  force_team_or_swimmer_creation = false )
    raise ArgumentError.new("Both season and meeting_program must be not nil!") if season.nil? || meeting.nil?
# DEBUG
#    puts "\r\n\r\nMeetingTeamScore (Ranking) -- build_from_parameters: data_import_session ID: #{data_import_session.id}, parsed detail_row: #{detail_row.inspect}"
#    puts "#{meeting.inspect}"
#    puts "=> #{meeting.get_full_name}"

    self.build( data_import_session ) do
      entity  MeetingTeamScore

      set_up do
        @import_text = detail_row[:import_text]
        # [Steve, 20141017] This field is currently not used here:
#        @team_code   = detail_row[:fields][:team_code]
        @team_name   = detail_row[:fields][:team_name]
        # result_time  = detail_row[:fields][:result_time]
        team_builder = V2::DataImportTeamBuilder.build_from_parameters(
           data_import_session,
           @team_name,
           season,
           force_team_or_swimmer_creation
        ) if @team_name
        @team = team_builder.result_row if team_builder
        unless @team.instance_of?(Team) || @team.instance_of?(DataImportTeam)
#          @phase_1_log << "\r\nDataImportMeetingTeamScoreBuilder: returned team_id IS nil! (And it can't be!)\r\n"
#          logger.error( "\r\nDataImportMeetingTeamScoreBuilder: returned team_id IS nil! (And it can't be!)" )
#          flash[:error] = "#{I18n.t(:something_went_wrong)} ['team not found or nil']"
          set_result( nil ) and raise ArgumentError.new("Team not found or unable to create it!")
        end

        relay_results = V2::DataImportMeetingTeamScoreBuilder.get_all_relay_results(
          data_import_session,
          meeting,
          @team
        )
        relay_scores = relay_results.collect{ |row| row.meeting_points.to_f }
        @total_relay_points = relay_scores.inject{ |sum, score| sum + score }
        @result_score = detail_row[:fields][:result_score].to_s
          .gsub( /\.(?<thousand>\d{3})/, '\k<thousand>' )
          .gsub( /\,/, '.' )
          .to_f

        ta_builder = V2::DataImportTeamAffiliationBuilder.build_from_parameters(
          data_import_session,
          @team,
          season
        )
        @team_affiliation = ta_builder.result_row
        puts "Before search: @team.id: #{@team.id} ('#{@team_name}'), @total_relay_points: #{@total_relay_points}, @result_score: #{@result_score}..."
      end


      search do
# DEBUG
#        puts( "Seeking existing MeetingTeamScore..." )
        primary     [
          "(meeting_id = ?) AND (team_id = ?)",
          meeting.instance_of?(Meeting) ? meeting.id : 0,
          @team.instance_of?(Team)      ? @team.id : 0
        ]
        secondary   [
          "(data_import_session_id = ?) AND " +
          "(#{meeting.instance_of?(Meeting) ? '' : 'data_import_'}meeting_id = ?) AND " +
          "(#{@team.instance_of?(Team)      ? '' : 'data_import_'}team_id = ?)",
          data_import_session, meeting.id, @team.id
        ]
        default_search
# DEBUG
#        puts "primary_search_ok!" if primary_search_ok?
#        puts "secondary_search_ok!" if secondary_search_ok?
      end


      if_not_found do
# DEBUG
#        puts "Search failed: adding new MeetingTeamScore with: @team=#{@team.name}..."
                                                    # Fix possible blank or missing ranking values:
        @rank = V2::DataImportMeetingTeamScoreBuilder.fix_missing_rank(
          data_import_session,
          meeting
        ) if ( @rank == 0 )

        attributes_for_creation(
          data_import_session_id:         data_import_session.id,
          import_text:                    @import_text,
          sum_individual_points:          @result_score,
          sum_relay_points:               @total_relay_points.to_f,
          # sum_team_points:              TODO
          # meeting_individual_points:    TODO
          # meeting_relay_points:         TODO
          # meeting_team_points:          TODO
          # season_individual_points:     TODO
          # season_relay_points:          TODO
          # season_team_points:           TODO
          # team_affiliation_id: nil # (it will be updated upon Team/TeamAffiliation commit)
          rank:                           @rank.to_i,
          season_id:                      season.id,
          user_id:                        1, # (don't care)

          team_affiliation_id:            @team_affiliation.instance_of?(TeamAffiliation) ? @team_affiliation.id  : nil,
          meeting_id:                     meeting.instance_of?(Meeting)                   ? meeting.id            : nil,
          data_import_meeting_id:         meeting.instance_of?(DataImportMeeting)         ? meeting.id            : nil,
          team_id:                        @team.instance_of?(Team)                        ? @team.id              : nil,
          data_import_team_id:            @team.instance_of?(DataImportTeam)              ? @team.id              : nil
        )
        add_new
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Retrieves all the relay results available for a specific meeting, both from primary
  # and from secondary entities, thus including both already committed and uncommitted
  # results.
  # (This is to support multiple sessions of data-import.)
  #
  # === Parameters:
  # - data_import_session: the current DataImportSession being processed.
  # - meeting: the Meeting instance to be processed.
  # - team: the Team or DataImportTeam instance to be processed.
  #
  # === Returns:
  # An array of MeetingRelayResult and/or DataImportMeetingRelayResult instances.
  #
  # === Internal notes:
  # [Steve, 20131010]
  # The convoluted method belown is an example on how to retrieve ALL relay results
  # among different "destination" entities, even if we are importing *partial* results from other
  # (additional) meeting_sessions while we have already committed previous ones.
  # We want *all* the relay results, both from committed and uncommitted entites.
  #
  # Normally (not during a data-import use-case), a simple line as the following would be
  # enough to get the seeked results:
  #
  #     relay_results = meeting.meeting_relay_results.where(
  #         team_id: team.id,
  #         is_out_of_race: false, is_disqualified: false
  #     )
  #
  def self.get_all_relay_results( data_import_session, meeting, team )
    relay_results = []
                                                    # Collect ALL meeting_sessions IDs:
    meeting_ss_ids = meeting.instance_of?(Meeting) ? MeetingSession.where( meeting_id: meeting.id ).map{ |row| row.id } : []
    di_meeting_ss_ids = DataImportMeetingSession.where(
      [
        "(data_import_session_id = ?) AND (#{meeting.instance_of?(Meeting) ? '' : 'data_import_'}meeting_id = ?)",
        data_import_session.id, meeting.id
      ]
    ).map{ |row| row.id }
                                                    # Collect ALL meeting_programs IDs:
    meeting_prgs_ids = MeetingProgram.includes(:meeting_session).only_relays.where(
      '(meeting_events.meeting_session_id IN (?))',
      meeting_ss_ids
    ).map{ |row| row.id }

    di_meeting_prgs_ids = DataImportMeetingProgram.only_relays.where(
      [ '(meeting_session_id IN (?)) OR (data_import_meeting_session_id IN (?))',
        meeting_ss_ids, di_meeting_ss_ids ]
    ).map{ |row| row.id }
                                                    # Collect ALL relay results:
    relay_results += MeetingRelayResult.is_valid.where(
      meeting_program_id: meeting_prgs_ids,
      team_id: team.id
    ) if team.instance_of?(Team)

    relay_results += DataImportMeetingRelayResult.is_valid.where(
      [
        "(#{team.instance_of?(Team) ? '' : 'data_import_'}team_id = ?) AND " +
        "( (meeting_program_id IN (?)) OR (data_import_meeting_program_id IN (?)) )",
        team.id, meeting_prgs_ids, di_meeting_prgs_ids
      ]
    )
    relay_results
  end
  #-- -------------------------------------------------------------------------
  #++


  # Assuming a missing or blank rank value, this method tries to fix it in two possible
  # ways:
  #
  # 1) By searching the last assigned (data-import) team score row and assigning its rank
  #    to the current processed row.
  # 2) In case no previous rows were found, the resulting rank is the total number
  #    of team scores existing for this particural meeting, +1.
  #    (This fail-back case may generate wrong values in case there's at least a tie-in
  #     or two same-ranking scores in between the existing rows.)
  #
  # This method does NOT try to insert scores inside a ranking result list, because all
  # the rows with a blank or missing rank during parsing have been found to be either
  # disqualified results or team with no points (that have no rank at all) or some
  # other special "out-of-race" cases.
  #
  # Since we do *need* the ranking for sorting the result lists, basically the approach
  # taken is to count all existing rows to get the missing rank when a match is not
  # found.
  #
  # === Parameters:
  #
  # - data_import_session:
  #   the current data-import session instance.
  #
  # - meeting:
  #   the Meeting or DataImportMeeting to which the team scores are referring.
  #
  def self.fix_missing_rank( data_import_session, meeting )
# DEBUG
#    puts "Team scores: Rank == 0! Searching previous same-scored row to assign same rank (meeting ID: #{meeting.id})..."
#    logger.info( "#{entity.name}: Rank == 0! Searching previous same-scored row to assign same rank..." )
#    @phase_1_log << "#{entity.name}: Rank == 0! Searching previous same-scored row to assign same rank...\r\n"
    rank = 0
    existing_rows = DataImportMeetingTeamScore.where(
      [
        "(data_import_session_id = ?) AND " +
        "(#{ meeting.class.name.underscore }_id = ?)",
        data_import_session.id, meeting.id
      ]
    )
    if existing_rows.last
      rank = existing_rows.last.rank
    else
      rank = existing_rows.count + 1
    end
    rank
  end
  #-- -------------------------------------------------------------------------
  #++
end
