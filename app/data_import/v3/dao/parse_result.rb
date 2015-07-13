# encoding: utf-8

=begin

= V3::ParseResult

  - Goggles framework vers.:  4.00.815
  - author: Steve A.

 Container class for the whole result of a data-import parsing.

=end
class V3::ParseResult

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

  # Checks if two instances are the same
  #
  def ==( other_object )
    return false unless other_object.respond_to?(:file_name) && other_object.respond_to?(:entity_list) &&
                        other_object.respond_to?(:context_list)
    (
      ( self.file_name == other_object.file_name ) &&
      ( self.entity_list == other_object.entity_list ) &&
      ( self.context_list == other_object.context_list )
    )
  end


  # Convert the current instance to a readable string
  def to_s
    "[V3::ParseResult: #{@file_name}, #{@entity_list.size} entities, #{@context_list.size} contexts]"
  end
  #-- -------------------------------------------------------------------------
  #++


  # Uses Marshal::dump to serialize the whole factory and its created instances.
  # Returns the marshaled binary data, ready to be saved on file.
  #
  def serialize
    # TODO
  end


  # Uses Marshal::load to de-serialize the whole factory and its created instances.
  # Clears and restores the whole factory from the specified binary_data.
  #
  def deserialize( binary_data )
    # TODO deserialize
    # TODO re-fill from scratch both lists
    # TODO rebuild a parse_result instance from the unmarshalled data
  end
  #-- -------------------------------------------------------------------------
  #++

end
