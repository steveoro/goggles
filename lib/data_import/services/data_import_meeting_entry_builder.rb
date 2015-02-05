# encoding: utf-8

require 'common/format'
require 'data_import/strategies/result_time_parser'
require 'data_import/services/data_import_entity_builder'
require 'data_import/services/data_import_team_builder'
require 'data_import/services/data_import_swimmer_builder'
require 'data_import/services/data_import_badge_builder'
require 'data_import/csi_result_dao'


=begin

= DataImportMeetingEntryBuilder

  - Goggles framework vers.:  4.00.743
  - author: Steve A.

 Specialized +DataImportEntityBuilder+ for searching (or adding brand new)
 MeetingEntry entity rows.

=end
class DataImportMeetingEntryBuilder < DataImportEntityBuilder

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
#    puts "MIR - build_from_parameters: data_import_session ID: #{data_import_session.id}"
#    puts "    - parsed detail_row: #{detail_row.inspect}"
#    puts "    - gender_type: #{gender_type.inspect}"
#    puts "    - MPRG: #{meeting_program.inspect}"

#########################################
    # TODO

  end
  #-- -------------------------------------------------------------------------
  #++
end
