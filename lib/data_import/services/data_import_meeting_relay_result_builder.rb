# encoding: utf-8

require 'common/format'
require 'data_import/strategies/result_time_parser'
require 'data_import/services/data_import_entity_builder'
require 'data_import/services/data_import_team_builder'
require 'data_import/services/data_import_swimmer_builder'
require 'data_import/services/data_import_badge_builder'


=begin

= DataImportMeetingIndividualResultBuilder

  - Goggles framework vers.:  4.00.561
  - author: Steve A.

 Specialized +DataImportEntityBuilder+ for searching (or adding brand new)
 MeetingRelayResult entity rows.

=end
class DataImportMeetingRelayResultBuilder < DataImportEntityBuilder

  # Searches for an existing MeetingRelayResult given the parameters, or it adds a new one,
  # if none are found.
  #
  # == Returns
  #   #result_id as:
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
#    puts "\r\n\r\nMRR - build_from_parameters: data_import_session ID: #{data_import_session.id}, parsed detail_row: #{detail_row.inspect}"
#    puts "#{meeting_program.inspect}"

    self.build( data_import_session ) do
      entity  MeetingRelayResult

      set_up do
        # TODO
      end


      search do
# DEBUG
        puts( "Seeking existing MeetingRelayResult..." )
        # TODO
        primary     [
          # "(meeting_program_id = ?) AND (swimmer_id = ?) AND (team_id = ?)",
          # ( meeting_program.instance_of?(MeetingProgram) ? meeting_program.id : 0 ),
          # ( @swimmer.instance_of?(Swimmer)               ? @swimmer.id        : 0 ),
          # ( @team.instance_of?(Team)                     ? @team.id           : 0 )
        ]
        secondary   [
          # "(data_import_session_id = ?) AND " +
          # "(#{meeting_program.instance_of?(MeetingProgram) ? '' : 'data_import_'}meeting_program_id = ?) AND " +
          # "(#{@swimmer.instance_of?(Swimmer)               ? '' : 'data_import_'}swimmer_id = ?) AND " +
          # "(#{@team.instance_of?(Team)                     ? '' : 'data_import_'}team_id = ?)",
          # data_import_session.id,
          # meeting_program.id,
          # @swimmer.id,
          # @team.id
        ]
#        default_search
# DEBUG
        puts "primary_search_ok!" if primary_search_ok?
        puts "secondary_search_ok!" if secondary_search_ok?
      end


      if_not_found do
# DEBUG
        puts "Search failed: adding new MeetingRelayResult with: TODO..."
        attributes_for_creation(
          data_import_session_id:         data_import_session.id,
          import_text:                    @import_text,
          user_id:                        1, # (don't care)
#          meeting_program_id:             meeting_program.instance_of?(MeetingProgram)          ? meeting_program.id  : nil,
#          data_import_meeting_program_id: meeting_program.instance_of?(DataImportMeetingProgram)? meeting_program.id  : nil,
#          swimmer_id:                     @swimmer.instance_of?(Swimmer)                        ? @swimmer.id         : nil,
#          data_import_swimmer_id:         @swimmer.instance_of?(DataImportSwimmer)              ? @swimmer.id         : nil,
#          team_id:                        @team.instance_of?(Team)                              ? @team.id            : nil,
#          data_import_team_id:            @team.instance_of?(DataImportTeam)                    ? @team.id            : nil,
#          badge_id:                       @badge.instance_of?(Badge)                            ? @badge.id           : nil,
#          data_import_badge_id:           @badge.instance_of?(DataImportBadge)                  ? @badge.id           : nil
        )
#        add_new
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
