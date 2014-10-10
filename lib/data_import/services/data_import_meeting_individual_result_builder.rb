# encoding: utf-8

require 'common/format'
require 'data_import/strategies/result_time_parser'
require 'data_import/services/data_import_entity_builder'
#require 'data_import/services/data_import_time_standard_builder'


=begin

= DataImportMeetingIndividualResultBuilder

  - Goggles framework vers.:  4.00.557
  - author: Steve A.

 Specialized +DataImportEntityBuilder+ for searching (or adding brand new)
 MeetingIndividualResult entity rows.

=end
class DataImportMeetingIndividualResultBuilder < DataImportEntityBuilder

  # Searches for an existing MeetingIndividualResult given the parameters, or it adds a new one,
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

    self.build( data_import_session ) do
      entity  MeetingIndividualResult

      set_up do
      end


      search do
# DEBUG
#        puts( "Seeking existing MeetingIndividualResult..." )
#        @phase_1_log << "Seeking existing MeetingIndividualResult...\r\n"
#        primary     [
#          "(meeting_event_id = ?) AND (category_type_id = ?) AND (gender_type_id = ?)",
#          ( @meeting_event.instance_of?(MeetingEvent) ? @meeting_event.id : 0 ),
#          category_type.id, gender_type.id
#        ]
#        secondary   [
#          "(data_import_session_id = ?) AND " +
#          "(#{meeting_session.instance_of?(MeetingSession) ? '' : 'data_import_'}meeting_session_id = ?) AND " +
#          "(event_type_id = ?) AND (category_type_id = ?) AND (gender_type_id = ?)",
#          data_import_session.id, meeting_session.id,
#          @event_type.id, category_type.id, gender_type.id
#        ]
#        default_search
# DEBUG
        puts "primary_search_ok!" if primary_search_ok?
        puts "secondary_search_ok!" if secondary_search_ok?
      end


      if_not_found do
# DEBUG
#        puts "NOT found! Adding new DataImportMeetingProgram with: event_type=#{@event_type.inspect}, order=#{header_index}, #{header_row[:fields][:distance].to_i} mt., stroke_type_id=#{stroke_type.id}, category_type_id=#{category_type.id}..."
        attributes_for_creation(
          data_import_session_id:         data_import_session,
#          user_id:                        1, # (don't care)
#          meeting_session_id:             meeting_session.instance_of?(MeetingSession)           ? meeting_session.id : nil,
#          data_import_meeting_session_id: meeting_session.instance_of?(DataImportMeetingSession) ? meeting_session.id : nil
        )
#        add_new
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
