# encoding: utf-8

require 'common/format'
require 'data_import/services/data_import_entity_builder'


=begin

= DataImportSeasonBuilder

  - Goggles framework vers.:  4.00.549
  - author: Steve A.

 Specialized +DataImportEntityBuilder+ for searching (or adding brand new)
 Season entity rows.

=end
class DataImportSeasonBuilder < DataImportEntityBuilder

  # Searches for an existing Season given the parameters, or it adds a new one, if not found.
  #
  # The <tt>header_date_text</tt> is the text token containing the date of the meeting
  # results being parsed, from which the current season and its fields will be
  # deduced, assuming the date falls into a common range of dates defining an academic
  # year (from the start of September of the starting year, to the start of September of
  # the ending year).
  #
  # <tt>season_type_id</tt>, when not specified, is assumed to be ID=1 (code: 'MASFIN')
  # <tt>edition</tt>, when not specified, is assumed to be 0.
  #
  def self.build_from_parameters( data_import_session, header_date_text,
                                  season_type_id = 1, edition = 0 )
# DEBUG
#    puts "\r\nSeason, build_from_parameters: #{header_date_text}, season_type: #{season_type_id}, edition: #{edition}"
    self.build( data_import_session ) do
      entity            Season

      set_up do                                   # Set the fields:
        header_date     = Date.parse( header_date_text )
        @description    = I18n.t( 'admin_import.missing_data_warning' )
        @header_date    = header_date.kind_of?( Date ) ? header_date : Date.today
        year            = @header_date.month < 9 ? @header_date.year - 1 : @header_date.year
        # FIXME This is an approximation, it should include most of the seasons:
        @begin_date     = "#{year}-09-01" # Date.parse( "#{year}-09-01" )
        @end_date       = "#{year + 1}-09-01" # Date.parse( "#{year + 1}-08-30" )
        @header_year    = "#{year}/#{year+1}" # "#{@begin_date.year}/#{@end_date.year}",
        @season_type_id = season_type_id
        @edition        = edition
      end
                                                  # Search phase:
      search do
        primary    [
          "(season_type_id = ?) AND (begin_date >= ?) AND (end_date <= ?)",
          @season_type_id, @begin_date, @end_date
        ]
        secondary  [
          "(data_import_session_id = ?) AND (season_type_id = ?) AND (begin_date >= ?) AND (end_date <= ?)",
          @data_import_session.id, @season_type_id, @begin_date, @end_date
        ]
        default_search
      end

      attributes_for_creation(
        data_import_session_id: @data_import_session.id,
        import_text:            @header_date,
        description:            @description,
        begin_date:             @begin_date,
        end_date:               @end_date,
        season_type_id:         @season_type_id,
        header_year:            @header_year,
        edition:                @edition
      )

      if_not_found do
# DEBUG
#        puts "Creating a new DataImportSeason..."
        add_new
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
