# encoding: utf-8

require 'fileutils'
require 'common/format'

require_relative '../../../data_import/v2/dao/header_fields_dao'


=begin

= FilenameParser

  - Goggles framework vers.:  4.00.629
  - author: Steve A.

 Strategy class dedicated to extracting required Meeting fields
 from result file names.

=== Typical usage:

    header_fields_dao = FilenameParser.new( full_pathname ).parse

=end
class FilenameParser

  attr_reader :full_pathname, :prefix, :header_date, :header_year, :code_name
  #-- -------------------------------------------------------------------------
  #++

  # Creates a new instance.
  def initialize( full_pathname )
    @full_pathname = full_pathname
    @prefix = ''
    @header_date = nil
    @header_year = nil
    @code_name = ''
  end
  #-- -------------------------------------------------------------------------
  #++

  # Parses the data-import header fields encoded in the filename.
  # This method assumes data-import filename format as follows:
  #
  # <prefix><date_ISO><code_name><.extension>
  #
  # - prefix:    a variable length (usually 3 chars) prefix, stating the format of the data
  # - date_ISO:  the encoded date of the data, in ISO-format without separators ("YYYYmmdd")
  # - code_name: a variable length string code, which identifies the Meeting, indipendently from season or year
  #              any additional part in the code, separated from the rest by a '-',
  #              will be ignored (thus "bologna" and "bologna-sample" will result in
  #              the same "bologna" code)
  # - extension: usually, "txt"
  #
  # This method updates the corresponding member variables.
  #
  # Keep in mind that this assumes that most (if not all) Championships start in
  # September. The parsing of the #header_year may fail for special Autumn events,
  # like some FINA Championships during the years (they start in September but
  # are relative to the previous academic year).
  #
  # For the above reason the #header_year field can be edited or adjusted later on
  # on the HeaderFieldsDAO instance returned.
  #
  # == Returns:
  # - an HeaderFieldsDAO DAO on header_date parsing success.
  #
  # @raise ArgumentError on invalid or un-parsable header_date (header_date & header_year cannot be nil).
  #
  def parse()
    ext  = File.extname( @full_pathname )
    name = File.basename( @full_pathname, ext )
    date_start_idx = name =~ /\d{8}/
    code_start_idx = name =~ /(?<=\d{8})\D/
    @prefix    = name[ 0 .. date_start_idx-1 ] if date_start_idx
    @code_name = name[ code_start_idx .. name.size ] if code_start_idx
    @code_name = @code_name.split('-')[0]
    begin
      @header_date = Date.parse( name[date_start_idx .. code_start_idx-1] )
    rescue
      raise ArgumentError.new("Unable to parse header_date!")
    end
    year = @header_date.month < 9 ? @header_date.year - 1 : @header_date.year
    @header_year = "#{year}/#{year+1}"

    HeaderFieldsDAO.new( @full_pathname, @prefix, @header_date, @header_year, @code_name )
  end
  #-- -------------------------------------------------------------------------
  #++
end
