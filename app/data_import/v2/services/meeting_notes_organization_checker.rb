# encoding: utf-8


=begin

= V2::MeetingNotesOrganizationChecker

  - Goggles framework vers.:  4.00.751
  - author: Steve A.

  Service class used to check for missing Meeting#notes/organization.

  Allows to fill-in the missing values for the current DB while generating the
  SQL-diff text required to reproduce the update on another instance of the DB.

=end
class V2::MeetingNotesOrganizationChecker
  include Singleton

  # Checks if the specified instance of Meeting or DataImportMeeting has a
  # missing #notes/organization column value.
  #
  # When found +nil+ or empty, the associated Season is used to build
  # the correct header_year, the instance is updated and an SQL diff text
  # is returned.
  # It does nothing if the organization is not specified.
  #
  # Returns an empty string when no changes are made to the +meeting+
  # specified.
  #
  def self.check_and_fix( meeting, meeting_dates, organization )
    raise ArgumentError.new(
      "meeting must be either an instance of Meeting or DataImportMeeting!"
    ) unless meeting.instance_of?( Meeting ) || meeting.instance_of?( DataImportMeeting )

    if organization.nil? || organization.empty?
      ''
    else                                            # Both dates and organization are found in notes?
      if ( meeting.notes.to_s =~ Regexp.new(meeting_dates.to_s, 'i') ) &&
         ( meeting.notes.to_s =~ Regexp.new(organization, 'i') )
        ''                                          # => nothing to do
      else                                          # Something is missing? => Rebuild the notes:
        meeting.notes = meeting_dates ? "#{meeting_dates}\r\n#{organization}" : "#{organization}"
        meeting.save!
        V2::MeetingNotesOrganizationChecker.build_sql_update( meeting )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Re-creates an SQL UPDATE statement just for the notes field.
  #
  def self.build_sql_update( meeting )
    con = meeting.connection
    sql_text = "UPDATE #{ con.quote_column_name( meeting.class.table_name ) }"
    sql_text << " SET #{ con.quote_column_name('notes') }=#{ con.quote(meeting.notes.to_s) }"
    sql_text << " WHERE (#{ con.quote_column_name('id') }=#{ meeting.id });\r\n\r\n"
    sql_text
  end
  #-- -------------------------------------------------------------------------
  #++
end
