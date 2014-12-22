# encoding: utf-8

require 'common/format'
require 'data_import/strategies/result_time_parser'
require 'data_import/services/data_import_entity_builder'
require 'data_import/services/data_import_team_builder'
require 'data_import/services/data_import_swimmer_builder'
require 'data_import/services/data_import_badge_builder'


=begin

= DataImportMeetingIndividualResultBuilder

  - Goggles framework vers.:  4.00.583
  - author: Steve A.

 Specialized +DataImportEntityBuilder+ for searching (or adding brand new)
 MeetingIndividualResult entity rows.

=end
class DataImportMeetingIndividualResultBuilder < DataImportEntityBuilder

  # Searches for an existing MeetingIndividualResult given the parameters, or it adds a new one,
  # if none are found.
  #
  # == Returns
  # +nil+ in case of invalid parameters
  # #result_id as:
  #     - positive (#id) for a freshly added row into DataImportMeetingIndividualResult;
  #     - negative (- #id) for a matching existing or commited row in MeetingIndividualResult;
  #     - 0 on error/unable to process.
  #
  # @raise ArgumentError unless <tt>season</tt> and <tt>meeting_program</tt> are both not-nil.
  # @raise ArgumentError unless <tt>gender_type</tt> is a valid GenderType.
  # @raise ArgumentError unless <tt>category_type</tt> is a valid CategoryType.
  #
  def self.build_from_parameters( data_import_session, season, meeting_program,
                                  detail_row, detail_row_idx, detail_rows_size,
                                  gender_type, category_type,
                                  force_missing_team_creation = false )
    raise ArgumentError.new("Both season and meeting_program must be not nil!")          if season.nil? || meeting_program.nil?
    raise ArgumentError.new("'gender_type' must be a valid instance of GenderType!")     unless gender_type.instance_of?(GenderType)
    raise ArgumentError.new("'category_type' must be a valid instance of CategoryType!") unless category_type.instance_of?(CategoryType)
# DEBUG
#    puts "\r\n\r\nMIR - build_from_parameters: data_import_session ID: #{data_import_session.id}, parsed detail_row: #{detail_row.inspect}"
#    puts "#{meeting_program.inspect}"

    self.build( data_import_session ) do
      entity  MeetingIndividualResult

      set_up do
        @import_text  = detail_row[:import_text]
        swimmer_name  = detail_row[:fields][:swimmer_name]
        swimmer_year  = detail_row[:fields][:swimmer_year]
        team_name     = detail_row[:fields][:team_name]
        athlete_badge = detail_row[:fields][:team_code] || '?' # (Make sure the badge is never nil)
        team_builder  = DataImportTeamBuilder.build_from_parameters(
           data_import_session,
           team_name,
           season,
           force_missing_team_creation
        ) if team_name
        @team = team_builder.result_row if team_name && team_builder
        unless @team.instance_of?(Team) || @team.instance_of?(DataImportTeam)
#          @phase_1_log << "\r\nDataImportTeamBuilder: returned team_id IS nil! (And it can't be!)\r\n"
#          logger.error( "\r\nDataImportTeamBuilder: returned team_id IS nil! (And it can't be!)" )
#          flash[:error] = "#{I18n.t(:something_went_wrong)} ['team not found or nil']"
          set_result( nil ) and raise ArgumentError.new("Team not found or unable to create it!")
        end

        swimmer_builder = DataImportSwimmerBuilder.build_from_parameters(
          data_import_session,
          swimmer_name,
          swimmer_year,
          gender_type
        )
        @swimmer = swimmer_builder.result_row if swimmer_builder

        badge_builder = DataImportBadgeBuilder.build_from_parameters(
          data_import_session,
          athlete_badge,
          season,
          @team,
          @swimmer,
          category_type,
          EntryTimeType.find_by_code( EntryTimeType::TYPES_HASH[EntryTimeType::LAST_RACE_ID] )
        )
        @badge = badge_builder.result_row if @team && badge_builder
                                                    # Search or add a TeamAffiliation:
        ta_builder = DataImportTeamAffiliationBuilder.build_from_parameters(
          data_import_session,
          @team,
          season
        )
        @team_affiliation   = ta_builder.result_row

        @team_badge_number  = @team_affiliation ? @team_affiliation.number : nil
        @rank               = detail_row[:fields][:result_position]
        @result_time        = detail_row[:fields][:result_time]
        result_score        = ( detail_row[:fields][:result_score] ).gsub(/\,/, '.').to_f
        @is_play_off        = true
        result_parser       = ResultTimeParser.new( @rank, @result_time ).parse
        @is_out_of_race     = result_parser.is_out_of_race?
        @is_disqualified    = result_parser.is_disqualified?
        @dsq_code_type_id   = result_parser.disqualification_code_type_id
        @mins, @secs, @hds  = result_parser.mins_secs_hds_array
# DEBUG
#        logger.debug( "\r\nIndividual Result parsing: rank:'#{rank}', result_time:'#{result_time}', result_score:'#{result_score}'" )
#        logger.debug( "is_out_of_race:'#{is_out_of_race}', is_disqualified:'#{is_disqualified}'\r\n" )
#        @phase_1_log << "\r\nIndividual Result parsing: rank:'#{rank}', result_time:'#{result_time}', result_score:'#{result_score}'\r\n"
#        @phase_1_log << "is_out_of_race:'#{is_out_of_race}', is_disqualified:'#{is_disqualified}'\r\n\r\n"
# TODO Not sure about this:
        @standard_points = result_score
        @meeting_points  = result_score
      end


      search do
# DEBUG
#        puts( "Seeking existing MeetingIndividualResult..." )
#        @phase_1_log << "Seeking existing MeetingIndividualResult...\r\n"
        primary     [
          "(meeting_program_id = ?) AND (swimmer_id = ?) AND (team_id = ?)",
          ( meeting_program.instance_of?(MeetingProgram) ? meeting_program.id : 0 ),
          ( @swimmer.instance_of?(Swimmer)               ? @swimmer.id        : 0 ),
          ( @team.instance_of?(Team)                     ? @team.id           : 0 )
        ]
        secondary   [
          "(data_import_session_id = ?) AND " +
          "(#{meeting_program.class.name.underscore}_id = ?) AND " +
          "(#{@swimmer.class.name.underscore}_id = ?) AND " +
          "(#{@team.class.name.underscore}_id = ?)",
          data_import_session.id,
          meeting_program.id,
          @swimmer.id,
          @team.id
        ]
        default_search
# DEBUG
#        puts "primary_search_ok!" if primary_search_ok?
#        puts "secondary_search_ok!" if secondary_search_ok?
      end


      if_not_found do
# DEBUG
#        puts "Search failed: adding new MeetingIndividualResult with: @swimmer=#{@swimmer.complete_name}, @team=#{@team.name}, badge: #{@badge.inspect}..."
                                                    # Fix possible blank or missing ranking values:
        @rank = DataImportMeetingIndividualResultBuilder.fix_missing_rank(
          DataImportMeetingIndividualResult,
          data_import_session,
          meeting_program,
          @standard_points
        ) if ( @rank.to_i == 0 && @standard_points >= 0.0 && !@is_out_of_race )

        attributes_for_creation(
          data_import_session_id:         data_import_session.id,
          import_text:                    @import_text,
          athlete_name:                   @swimmer ? @swimmer.complete_name : nil,
          athlete_badge_number:           @badge   ? @badge.number          : nil,
          year_of_birth:                  @swimmer ? @swimmer.year_of_birth : nil,
          team_name:                      @team    ? @team.name             : nil,
          team_badge_number:              @team_badge_number,
          rank:                           @rank.to_i, # Note that 'Fuori gara'.to_i = 0
          is_play_off:                    @is_play_off,
          is_out_of_race:                 @is_out_of_race, # From ranking only ('Fuori gara')
          is_disqualified:                @is_disqualified, # any DSQ possible code
          disqualification_code_type_id:  @dsq_code_type_id,
          standard_points:                @standard_points,
          meeting_individual_points:      @meeting_points,
          team_points:                    0, # FIXME TODO
          goggle_cup_points:              0,
          minutes:                        @mins,
          seconds:                        @secs,
          hundreds:                       @hds,
          reaction_time:                  0,
          user_id:                        1, # (don't care)

          team_affiliation_id:            @team_affiliation.instance_of?(TeamAffiliation)       ? @team_affiliation.id  : nil,
          meeting_program_id:             meeting_program.instance_of?(MeetingProgram)          ? meeting_program.id    : nil,
          data_import_meeting_program_id: meeting_program.instance_of?(DataImportMeetingProgram)? meeting_program.id    : nil,
          swimmer_id:                     @swimmer.instance_of?(Swimmer)                        ? @swimmer.id           : nil,
          data_import_swimmer_id:         @swimmer.instance_of?(DataImportSwimmer)              ? @swimmer.id           : nil,
          team_id:                        @team.instance_of?(Team)                              ? @team.id              : nil,
          data_import_team_id:            @team.instance_of?(DataImportTeam)                    ? @team.id              : nil,
          badge_id:                       @badge.instance_of?(Badge)                            ? @badge.id             : nil,
          data_import_badge_id:           @badge.instance_of?(DataImportBadge)                  ? @badge.id             : nil
        )
        add_new
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Assuming a missing or blank rank value, this method tries to fix it in two possible
  # ways:
  #
  # 1) By searching the previous individual result row and assigning the current rank
  #    to the previous found, making both result rows figure as a "same-ranking" set of
  #    results.
  # 2) By using the total number of individual results found for the same program,
  #    in case no previous rows were found.
  #
  # This method does NOT try to insert scores inside a ranking result list, because all
  # the rows with a blank or missing rank during parsing are either disqualified results
  # (that have no rank at all) or other out-of-race cases.
  #
  # Since we do *need* the ranking for sorting the result lists by category, the
  # approach is to count all existing rows to get the missing rank when a match is not
  # found.
  #
  #
  # === Parameters:
  #
  # - entity:
  #   the entity containing the result, either a DataImportMeetingIndividualResult or
  #   a DataImportRelayResult.
  #
  # - data_import_session:
  #   the current data-import session instance.
  #
  # - meeting_program:
  #   the MeetingProgram or DataImportMeetingProgram to which the results are referring to.
  #
  # - standard_points:
  #   the parsed score of the result.
  #
  def self.fix_missing_rank( entity, data_import_session, meeting_program, standard_points )
# DEBUG
#    puts "#{entity.name}: Rank == 0! Searching previous same-scored (#{standard_points}) row to assign same rank (program ID: #{meeting_program.id})..."
#    logger.info( "#{entity.name}: Rank == 0! Searching previous same-scored row to assign same rank..." )
#    @phase_1_log << "#{entity.name}: Rank == 0! Searching previous same-scored row to assign same rank...\r\n"
    rank = 0
    prev_row = entity.where( [                      # Search for same-ranking result first:
      "(data_import_session_id = ?) AND " +
      "(#{ meeting_program.class.name.underscore }_id = ?) AND " +
      "(standard_points = ?)",
        data_import_session.id, meeting_program.id, standard_points.to_i
    ] ).last

    if prev_row                                     # Assign same rank as "previous" row:
      rank = prev_row.rank
    else                                            # Rank = tot. existing rows + 1 in same category/context:
      tot_rows = entity.where( [
        "(data_import_session_id = ?) AND " +
        "(#{ meeting_program.class.name.underscore }_id = ?)",
        data_import_session.id, meeting_program.id
      ] ).count
# DEBUG
#      puts "Previous same-scored row not found. Rank will be the total rows found so far +1 (=#{tot_rows+1})..."
#      logger.info( "Previous same-scored row not found. Rank will be the total rows found so far +1 (=#{tot_rows+1})..." )
#      @phase_1_log << "Previous same-scored row not found. Rank will be the total rows found so far +1 (=#{tot_rows+1})...\r\n"
      rank = tot_rows + 1
    end
    rank
  end
  #-- -------------------------------------------------------------------------
  #++
end
