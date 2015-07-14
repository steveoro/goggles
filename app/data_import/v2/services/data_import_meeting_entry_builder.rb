# encoding: utf-8

require 'common/format'
require_relative '../../../data_import/v2/strategies/result_time_parser'
require_relative '../../../data_import/v2/services/data_import_entity_builder'
require_relative '../../../data_import/v2/services/data_import_team_builder'
require_relative '../../../data_import/v2/services/data_import_swimmer_builder'
require_relative '../../../data_import/v2/services/data_import_badge_builder'
require_relative '../../../data_import/v2/dao/csi_result_dao'


=begin

= V2::DataImportMeetingEntryBuilder

  - Goggles framework vers.:  4.00.761
  - author: Steve A.

 Specialized +DataImportEntityBuilder+ for searching (or adding brand new)
 MeetingEntry entity rows.

=end
class V2::DataImportMeetingEntryBuilder < V2::DataImportEntityBuilder

  # Searches for an existing MeetingEntry given the parameters, or it adds a new one,
  # if none are found.
  #
  # == Returns
  # +nil+ in case of invalid parameters
  # #result_id as:
  #     - positive (#id) for a freshly added row into DataImportMeetingEntry;
  #     - negative (- #id) for a matching existing or commited row in MeetingEntry;
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
#    puts "MENTRY - build_from_parameters: data_import_session ID: #{data_import_session.id}"
#    puts "- parsed detail_row: #{detail_row.inspect}"
#    puts "- gender_type: #{gender_type.inspect}"
#    puts "- category_type: #{category_type.inspect}"
#    puts "- MPRG: #{meeting_program.inspect}"

    self.build( data_import_session ) do
      entity  MeetingEntry

      set_up do
        @import_text   = nil
        swimmer_name   = nil
        swimmer_year   = nil
        team_name      = nil
        athlete_badge  = nil
        entry_time     = nil

        if detail_row.instance_of?( Hash )
          # NOTE:
          # detail_row[:fields] => [
          #    :entry_order, :swimmer_name, :category_code, :team_name, entry_time
          # ]
          @import_text    = detail_row[:import_text]
          # FIXME Do we have to ignore entry order for FIN entries too, like we do for CSI entries?
          @entry_order    = detail_row[:fields][:entry_order]
          swimmer_name    = detail_row[:fields][:swimmer_name]
          swimmer_year    = detail_row[:fields][:swimmer_year]
          team_name       = detail_row[:fields][:team_name]
          # Make sure the badge code is never nil:
          athlete_badge   = detail_row[:fields][:swimmer_badge].to_s.size < 1 ? '?' : detail_row[:fields][:swimmer_badge]
          entry_time      = detail_row[:fields][:entry_time]
          @is_entry_no_time = entry_time.nil? || entry_time == ''
        elsif detail_row.instance_of?( CsiResultDAO )
          @import_text    = detail_row.to_s
          @entry_order    = nil
          swimmer_name    = detail_row.complete_name
          swimmer_year    = detail_row.year_of_birth
          team_name       = detail_row.team_name
          # Make sure the badge code is never nil:
          athlete_badge   = detail_row.badge_code.to_s.size < 1 ? '?' : detail_row.badge_code
          entry_time      = detail_row.decorated_entry_time
          @is_entry_no_time = detail_row.is_entry_no_time
        end
# DEBUG
#        puts "\r\n- detail_row...: #{detail_row.inspect}"
#        puts "- team_name........: '#{team_name}'"
#        puts "- entry_time.......: #{entry_time}"

        team_builder  = V2::DataImportTeamBuilder.build_from_parameters(
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
        ta_builder = V2::DataImportTeamAffiliationBuilder.build_from_parameters(
          data_import_session,
          @team,
          season
        )
        @team_affiliation   = ta_builder.result_row

        swimmer_builder = V2::DataImportSwimmerBuilder.build_from_parameters(
          data_import_session,
          swimmer_name,
          swimmer_year,
          gender_type,
          category_type,
          force_team_or_swimmer_creation
        )
        @swimmer = swimmer_builder.result_row if swimmer_builder
        unless @swimmer
          set_result( nil )
          raise ArgumentError.new("Swimmer '#{swimmer_name}' not found or unable to create it!\r\ndetail row: #{detail_row.inspect}")
        end

        badge_builder = V2::DataImportBadgeBuilder.build_from_parameters(
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
        if @is_entry_no_time
          @mins, @secs, @hds = [0, 0, 0]
        else
          result_parser = nil
          if detail_row.instance_of?( Hash )
            result_parser = V2::ResultTimeParser.new( '', entry_time ).parse
          elsif detail_row.instance_of?( CsiResultDAO )
            result_parser = V2::ResultTimeParser.new( '', entry_time, detail_row ).parse
          end
          @mins, @secs, @hds = result_parser.mins_secs_hds_array
        end
# DEBUG
#        puts "\r\n- @mins: #{@mins}, @secs: #{@secs}, @hds: #{@hds}"
      end


      search do
# DEBUG
#        puts( "Seeking existing MeetingEntry..." )
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
#        puts "Search failed: adding new MeetingEntry with: @swimmer=#{@swimmer.complete_name}, @team=#{@team.name}, badge: #{@badge.inspect}..."

        attributes_for_creation(
          data_import_session_id:         data_import_session.id,
          import_text:                    @import_text,
          start_list_number:              @entry_order,
          athlete_name:                   @swimmer ? @swimmer.complete_name : nil,
          athlete_badge_number:           @badge   ? @badge.number          : nil,
          year_of_birth:                  @swimmer ? @swimmer.year_of_birth : nil,
          team_name:                      @team    ? @team.name             : nil,
#          team_badge_number:              nil, # (missing)
          is_no_time:                     @is_entry_no_time,
          entry_time_type_id:             @entry_time_type_id,
          minutes:                        @mins,
          seconds:                        @secs,
          hundreds:                       @hds,
#          lane_number:                    nil, # (missing)
#          heat_number:                    nil, # (missing)
#          heat_arrival_order:             nil, # (missing)
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
end
