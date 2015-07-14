# encoding: utf-8

require 'common/format'
require_relative '../../../data_import/v2/strategies/result_time_parser'
require_relative '../../../data_import/v2/services/data_import_entity_builder'
require_relative '../../../data_import/v2/services/data_import_team_builder'
require_relative '../../../data_import/v2/services/data_import_meeting_individual_result_builder'


=begin

= V2::DataImportMeetingRelayResultBuilder

  - Goggles framework vers.:  4.00.713
  - author: Steve A.

 Specialized +DataImportEntityBuilder+ for searching (or adding brand new)
 MeetingRelayResult entity rows.

=end
class V2::DataImportMeetingRelayResultBuilder < V2::DataImportEntityBuilder

  # Searches for an existing MeetingRelayResult given the parameters, or it adds a new one,
  # if none are found.
  #
  # == Returns
  # +nil+ in case of invalid parameters
  # #result_id as:
  #     - positive (#id) for a freshly added row into the secondary entity;
  #     - negative (- #id) for a matching existing or commited row in the primary entity;
  #     - 0 on error/unable to process.
  #
  # @raise ArgumentError unless <tt>season</tt> and <tt>meeting_program</tt> are both not-nil.
  #
  def self.build_from_parameters( data_import_session, season, meeting_program,
                                  detail_row, detail_row_idx, detail_rows_size,
                                  force_team_or_swimmer_creation = false )
    raise ArgumentError.new("Both season and meeting_program must be not nil!") if season.nil? || meeting_program.nil?
# DEBUG
#    puts "\r\n\r\nMRR -- build_from_parameters: data_import_session ID: #{data_import_session.id}, parsed detail_row: #{detail_row.inspect}"
#    puts "#{meeting_program.inspect}"
#    puts "=> #{meeting_program.get_full_name}"

    self.build( data_import_session ) do
      entity  MeetingRelayResult

      set_up do
        @import_text = detail_row[:import_text]
        rank         = detail_row[:fields][:result_position]
        @team_name   = detail_row[:fields][:team_name]
        result_time  = detail_row[:fields][:result_time]
        result_score = detail_row[:fields][:result_score].to_s.gsub(/\,/, '.').to_f
        team_builder = V2::DataImportTeamBuilder.build_from_parameters(
           data_import_session,
           @team_name,
           season,
           force_team_or_swimmer_creation
        ) if @team_name
        @team = team_builder.result_row if @team_name && team_builder
        unless @team.instance_of?(Team) || @team.instance_of?(DataImportTeam)
#          @phase_1_log << "\r\nDataImportTeamBuilder: returned team_id IS nil! (And it can't be!)\r\n"
#          logger.error( "\r\nDataImportTeamBuilder: returned team_id IS nil! (And it can't be!)" )
#          flash[:error] = "#{I18n.t(:something_went_wrong)} ['team not found or nil']"
          set_result( nil ) and raise ArgumentError.new("Team not found or unable to create it!")
        end
        result_parser      = V2::ResultTimeParser.new( rank, result_time ).parse
        @is_play_off       = true
        @is_out_of_race    = result_parser.is_out_of_race?
        @is_disqualified   = result_parser.is_disqualified?
        @dsq_code_type_id  = result_parser.disqualification_code_type_id
        @mins, @secs, @hds = result_parser.mins_secs_hds_array
        @standard_points   = result_score
        @meeting_points    = result_score
        @rank              = rank.to_i              # Note that 'Fuori gara'.to_i = 0
        ta_builder = V2::DataImportTeamAffiliationBuilder.build_from_parameters(
          data_import_session,
          @team,
          season
        )
        @team_affiliation  = ta_builder.result_row
#        puts "Before search: @team.id: #{@team.id}, @rank: #{@rank}, @mins: #{@mins}, @secs: #{@secs}, @hds: #{@hds})..."
      end


      search do
# DEBUG
#        puts( "Seeking existing MeetingRelayResult (meeting_program.id: #{meeting_program.id}, @team.id: #{@team.id}, @rank: #{@rank}, @mins: #{@mins}, @secs: #{@secs}, @hds: #{@hds})..." )
#        puts "==> List: #{MeetingRelayResult.where(team_id: @team.id).inspect}"
        primary     [
          "(meeting_program_id = ?) AND (team_id = ?) AND " +
          "(minutes = ?) AND (seconds = ?) AND (hundreds = ?)",
          ( meeting_program.instance_of?(MeetingProgram) ? meeting_program.id : 0 ),
          ( @team.instance_of?(Team)                     ? @team.id           : 0 ),
          @mins, @secs, @hds
        ]
        secondary   [
          "(data_import_session_id = ?) AND " +
          "(#{meeting_program.instance_of?(MeetingProgram) ? '' : 'data_import_'}meeting_program_id = ?) AND " +
          "(#{@team.instance_of?(Team)                     ? '' : 'data_import_'}team_id = ?) AND " +
          "(minutes = ?) AND (seconds = ?) AND (hundreds = ?)",
          data_import_session.id,
          meeting_program.id,
          @team.id,
          @mins, @secs, @hds
        ]
        default_search
# DEBUG
#        puts "primary_search_ok!" if primary_search_ok?
#        puts "secondary_search_ok!" if secondary_search_ok?
      end


      if_not_found do
# DEBUG
#        puts "Search failed: adding new MeetingRelayResult with: @team=#{@team.name}..."
                                                    # Fix possible blank or missing ranking values:
        @rank = V2::DataImportMeetingIndividualResultBuilder.fix_missing_rank(
          DataImportMeetingRelayResult,
          data_import_session,
          meeting_program,
          @standard_points
        ) if ( @rank == 0 && @standard_points >= 0.0 && !@is_out_of_race )

        attributes_for_creation(
          data_import_session_id:         data_import_session.id,
          import_text:                    @import_text,
          is_play_off:                    @is_play_off,
          is_out_of_race:                 @is_out_of_race,
          is_disqualified:                @is_disqualified,
          disqualification_code_type_id:  @dsq_code_type_id,
          standard_points:                @standard_points,
          meeting_points:                 @meeting_points,
          rank:                           @rank,
          minutes:                        @mins,
          seconds:                        @secs,
          hundreds:                       @hds,
          relay_header:                   @team_name,
          # TODO FUTURE DEV:
          reaction_time:                  0,
#          entry_time_type_id:            nil,
          user_id:                        1, # (don't care)

          team_affiliation_id:            @team_affiliation.instance_of?(TeamAffiliation)       ? @team_affiliation.id : nil,
          meeting_program_id:             meeting_program.instance_of?(MeetingProgram)          ? meeting_program.id   : nil,
          data_import_meeting_program_id: meeting_program.instance_of?(DataImportMeetingProgram)? meeting_program.id   : nil,
          team_id:                        @team.instance_of?(Team)                              ? @team.id             : nil,
          data_import_team_id:            @team.instance_of?(DataImportTeam)                    ? @team.id             : nil
        )
        add_new
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
