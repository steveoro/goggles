# encoding: utf-8


=begin

= V3::HeaderFieldsDAO

  - Goggles framework vers.:  4.00.819
  - author: Steve A.

 DAO class containing the required Meeting fields extracted from the filename
 or the header of a meeting result file.

=end
class V3::HeaderFieldsDAO

  # These must be initialized on creation:
  attr_reader :full_pathname, :prefix, :header_date, :code_name

  # These can be edited later on:
  attr_accessor :header_year, :edition, :edition_type_id, :timing_type_id
  #-- -------------------------------------------------------------------------
  #++

  # Creates a new instance.
  #
  def initialize( full_pathname, prefix, header_date, header_year, code_name )
    @full_pathname   = full_pathname
    @prefix          = prefix
    @header_date     = header_date
    @header_year     = header_year
    @code_name       = code_name
    @edition         = 0
    @edition_type_id = nil
    @timing_type_id  = nil
  end
  #-- -------------------------------------------------------------------------
  #++


  # Displays the current instance as a String.
  def to_s
    "[V3::HeaderFieldsDAO: '#{@full_pathname}' (prefix: #{@prefix}), header:#{@header_date}=>#{@header_year}, code:#{@code_name}]: " <<
    "edition: #{@edition}, ed.type:#{@edition_type_id}, timing_type_id: #{@timing_type_id})"
  end
  #-- -------------------------------------------------------------------------
  #++
end
