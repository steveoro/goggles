# encoding: utf-8

=begin

= ParseResult

  - Goggles framework vers.:  4.00.809
  - author: Steve A.

 Container class for the whole result of a data-import parsing.

=end
class ParseResult

  attr_reader   :file_name,                         # Parsed file name
                :entity_list,                       # Hash list of entities
                :context_list                       # Hash list of contexts
  #-- -------------------------------------------------------------------------
  #++


  # Builds a new instance.
  #
  def initialize( file_name )
    @file_name = file_name
    @entity_list = {}
    @context_list = {}
  end
  #-- -------------------------------------------------------------------------
  #++

end
