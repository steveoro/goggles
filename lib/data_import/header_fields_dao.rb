# encoding: utf-8


=begin

= HeaderFieldsDAO

  - Goggles framework vers.:  4.00.515
  - author: Steve A.

 DAO class containing the required Meeting fields extracted from the filename
 or the header of a meeting result file.

=end
class HeaderFieldsDAO

  # These must be initialized on creation:
  attr_reader :full_pathname, :prefix, :header_date, :code_name

  # These can be set later on:
  attr_accessor :header_year, :edition, :edition_type_id, :timing_type_id
  #-- -------------------------------------------------------------------------
  #++

  # Creates a new instance.
  def initialize( full_pathname, prefix, header_date, code_name )
    @full_pathname   = full_pathname
    @prefix          = prefix
    @header_date     = header_date
    @code_name       = code_name
    @header_year     = nil
    @edition         = nil
    @edition_type_id = nil
    @timing_type_id  = nil
  end
  #-- -------------------------------------------------------------------------
  #++

end
