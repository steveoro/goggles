# encoding: utf-8

require 'common/format'
require_relative '../../../data_import/v2/strategies/result_time_parser'
require_relative '../../../data_import/v2/services/data_import_entity_builder'
require_relative '../../../data_import/v2/services/data_import_team_builder'
require_relative '../../../data_import/v2/services/data_import_swimmer_builder'
require_relative '../../../data_import/v2/services/data_import_badge_builder'
require_relative '../../../data_import/v2/dao/csi_result_dao'


=begin

= DataImportMeetingIndividualResultBuilder

  - Goggles framework vers.:  4.00.797
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
                                  force_team_or_swimmer_creation = false )
    raise ArgumentError.new("Both season and meeting_program must be not nil!")          if season.nil? || meeting_program.nil?
    raise ArgumentError.new("'gender_type' must be a valid instance of GenderType!")     unless gender_type.instance_of?(GenderType)
    raise ArgumentError.new("'category_type' must be a valid instance of CategoryType!") unless category_type.instance_of?(CategoryType)
# DEBUG
#    puts "\r\n========================================================================================================================="
#    puts "MIR - build_from_parameters: data_import_session ID: #{data_import_session.id}"
#    puts "    - parsed detail_row: #{detail_row.inspect}"
#    puts "    - gender_type: #{gender_type.inspect}"
#    puts "    - MPRG: #{meeting_program.inspect}"

    self.build( data_import_session ) do
      entity  MeetingIndividualResult

      set_up do
        @import_text  = nil
        swimmer_name  = nil
        swimmer_year  = nil
        team_name     = nil
        athlete_badge = nil
        result_time   = nil
        @team_points   = 0

        if detail_row.instance_of?( Hash )
          @import_text  = detail_row[:import_text]
          swimmer_name  = detail_row[:fields][:swimmer_name]
          swimmer_year  = detail_row[:fields][:swimmer_year]
          team_name     = detail_row[:fields][:team_name]
          # Make sure the badge code is never nil:
          athlete_badge = detail_row[:fields][:team_code].to_s.size < 1 ? '?' : detail_row[:fields][:team_code]
          @rank         = detail_row[:fields][:result_position]
          result_time   = detail_row[:fields][:result_time]
          result_score  = detail_row[:fields][:result_score].to_s.gsub(/\,/, '.').to_f
          @standard_points = result_score
          @meeting_points  = result_score
        elsif detail_row.instance_of?( CsiResultDAO )
          @import_text  = detail_row.to_s
          swimmer_name  = detail_row.complete_name
          swimmer_year  = detail_row.year_of_birth
          team_name     = detail_row.team_name
          # Make sure the badge code is never nil:
          athlete_badge = detail_row.badge_code.to_s.size < 1 ? '?' : detail_row.badge_code
          @rank         = detail_row.rank
          result_time   = detail_row.decorated_result_time
          # [Steve, 20150520] Score must result 0 if the current program/event is "out of race"
          if ( @rank.to_i == 0 ) ||
             ( meeting_program.is_out_of_race ) ||
             ( meeting_program.respond_to?(:meeting_event) &&
               meeting_program.meeting_event &&
               meeting_program.meeting_event.is_out_of_race )
            @standard_points = 0
            @meeting_points  = 0
            @team_points     = 0
          else
            # [Steve, 20150524] TODO Use a DB table to store these 2 formulas,
            # since these may change from championship to championship.
            result_score   = 100 - ( @rank.to_i - 1 ) * 5
            result_score   = 0 if result_score < 0
            @team_points   = 16 - ( @rank.to_i - 1 ) * 2
            @team_points   = 2 if @team_points < 2
            @standard_points = 0
            @meeting_points  = result_score
          end
        end
# DEBUG
#        puts "\r\n- detail_row...: #{detail_row.inspect}"
#        puts "- team_name........: '#{team_name}'"
#        puts "- athlete_badge....: '#{athlete_badge}'"
#        puts "- result_time......: #{result_time}"
#        puts "- @meeting_points..: #{@meeting_points}"

        team_builder  = DataImportTeamBuilder.build_from_parameters(
           data_import_session,
           team_name,
           season,
           force_team_or_swimmer_creation
        ) if team_name
        @team = team_builder.result_row if team_name && team_builder
        unless @team.instance_of?(Team) || @team.instance_of?(DataImportTeam)
          set_result( nil )
          raise ArgumentError.new("Team '#{team_name}' not found or unable to create it!\r\ndetail_row: #{detail_row.inspect}")
        end
                                                    # Search or add a TeamAffiliation:
        ta_builder = DataImportTeamAffiliationBuilder.build_from_parameters(
          data_import_session,
          @team,
          season
        )
        @team_affiliation   = ta_builder.result_row

        swimmer_builder = DataImportSwimmerBuilder.build_from_parameters(
          data_import_session,
          swimmer_name,
          swimmer_year,
          gender_type,
          category_type,
          force_team_or_swimmer_creation
        )
# DEBUG
#        puts "\r\n- swimmer_builder: #{swimmer_builder.inspect}"
        @swimmer = swimmer_builder.result_row if swimmer_builder
        unless @swimmer
          set_result( nil )
          raise ArgumentError.new("Swimmer '#{swimmer_name}' not found or unable to create it!\r\ndetail row: #{detail_row.inspect}")
        end

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
        unless @badge
          set_result( nil )
          raise ArgumentError.new("Badge '#{athlete_badge}' not found or unable to create it!\r\ndetail row: #{detail_row.inspect}\r\n@swimmer: #{@swimmer.inspect}\r\n@team #{@team.inspect}")
        end
        # >> ASSERT: @team, @swimmer & @badge must ALL be defined after this point <<

        @team_badge_number  = @team_affiliation ? @team_affiliation.number : nil
        @is_play_off        = true
        result_parser       = nil

        if detail_row.instance_of?( Hash )
          result_parser = ResultTimeParser.new( @rank, result_time ).parse
        elsif detail_row.instance_of?( CsiResultDAO )
          result_parser = ResultTimeParser.new( @rank, result_time, detail_row ).parse
        end
        @is_out_of_race     = result_parser.is_out_of_race?
        @is_disqualified    = result_parser.is_disqualified?
        @dsq_code_type_id   = result_parser.disqualification_code_type_id
        @mins, @secs, @hds  = result_parser.mins_secs_hds_array
# DEBUG
#        logger.debug( "\r\nIndividual Result parsing: rank:'#{rank}', result_time:'#{result_time}', @meeting_points:'#{@meeting_points}'" )
#        logger.debug( "is_out_of_race:'#{is_out_of_race}', is_disqualified:'#{is_disqualified}'\r\n" )
#        @phase_1_log << "\r\nIndividual Result parsing: rank:'#{rank}', result_time:'#{result_time}', @meeting_points:'#{@meeting_points}'\r\n"
#        @phase_1_log << "is_out_of_race:'#{is_out_of_race}', is_disqualified:'#{is_disqualified}'\r\n\r\n"
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
          team_points:                    @team_points,
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
