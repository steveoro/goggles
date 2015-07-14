# encoding: utf-8
require 'common/validation_error_tools'


=begin

= V2::MeetingHeaderYearChecker

  - Goggles framework vers.:  4.00.683
  - author: Steve A.

  Checker/service class for Meeting#header_year validation and fix-up.

=end
class V2::MeetingHeaderYearChecker
  include Singleton

  # Checks if the specified instance of Meeting or DataImportMeeting has
  # the #header_year.
  #
  # When found +nil+ or empty, the associated Season is used to build
  # the correct header_year, the instance is updated and an SQL diff text
  # is returned.
  #
  # Returns an empty string when no changes are made to the +meeting+
  # specified.
  #
  def self.check_and_fix( meeting )
    raise ArgumentError.new(
      "meeting must be either an instance of Meeting or DataImportMeeting!"
    ) unless meeting.instance_of?( Meeting ) || meeting.instance_of?( DataImportMeeting )

    if meeting.header_year.nil? || meeting.header_year.empty?
      if meeting.season.instance_of?( Season )
        meeting.header_year = meeting.season.build_header_year
        meeting.save!
        V2::MeetingHeaderYearChecker.build_sql_update( meeting )
      else                                          # Missing Season link:
        # [Steve, 20141221] Future DEV: add support for rebuilding header_year from data_import_season link.
        # (assuming data_import_season is available)
        raise ArgumentError.new( "Meeting w/o header_year found, but season link unavailable!" )
      end
    elsif meeting.valid?
      ''
    else                                          # We do not recover here other cases:
      # Recurse error and throw an exception:
      raise ArgumentError.new(
        "Invalid meeting found, but not from a missing header_year!\r\n" <<
        ValidationErrorTools.recursive_error_for( meeting_event )
      )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Re-creates an SQL UPDATE statement just for the header_year field.
  #
  def self.build_sql_update( meeting )
    con = meeting.connection
    sql_text = "UPDATE #{ con.quote_column_name( meeting.class.table_name ) }"
    sql_text << " SET #{ con.quote_column_name('header_year') }=#{ con.quote(meeting.header_year) }"
    sql_text << " WHERE (#{ con.quote_column_name('id') }=#{ meeting.id });\r\n\r\n"
    sql_text
  end
  #-- -------------------------------------------------------------------------
  #++
end
