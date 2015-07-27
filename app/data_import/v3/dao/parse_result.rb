# encoding: utf-8
require_relative '../../../data_import/v3/strategies/dao_factory'

=begin

= V3::ParseResult

  - Goggles framework vers.:  4.00.815
  - author: Steve A.

 Container class for the whole result of a data-import parsing.

=end
class V3::ParseResult

  attr_reader   :file_name                          # Parsed file name
  #-- -------------------------------------------------------------------------
  #++


  # Builds a new instance.
  #
  def initialize( file_name )
    @file_name = file_name
    @factory = V3::DAOFactory.new()
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns the internal Entity hash list.
  #
  def entity_list()
    @factory.entity_list
  end

  # Returns the internal Context hash list.
  #
  def context_list()
    @factory.context_list
  end


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
  #-- -------------------------------------------------------------------------
  #++


  # Creates a new EntityDAO, adding it to the internal list and returning its
  # instance.
  #
  def new_entity( name, parent_context = nil )
    @factory.new_entity( name, parent_context )
  end

  # Creates a new ContextDAO, adding it to the internal list and returning its
  # instance.
  #
  def new_context( name )
    @factory.new_context( name )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Uses Marshal::dump to serialize the whole factory and its created instances.
  # Returns the marshaled binary data, ready to be saved on file.
  #
  def serialize
    Marshal.dump( @factory )
  end


  # Uses Marshal::load to de-serialize the whole factory and its created instances.
  # Clears and restores the whole factory from the specified binary_data.
  #
  def deserialize( binary_data )
    @factory.clear
    @factory = Marshal.load( binary_data )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Convert the current instance to a (short) readable string
  def to_s
    "[V3::ParseResult: #{@file_name}, #{@factory.context_list.size} contexts, #{@factory.entity_list.size} entities]"
  end


  # Dumps all the contents of the current instance to a readable string.
  # (For debugging purposes only.)
  #
  def dump_to_s
    output = "\r\n---- Factory dump: ----"
    @factory.context_list.each do |context_key, context|
      output << "\r\n'#{context_key}': #{ context }"
      @factory.entity_list.each do |entity_key, entity|
        output << "\r\n'#{entity_key}': #{ entity }"
      end
    end
    output << "\r\n-----------------------\r\n"
    output
  end
  #-- -------------------------------------------------------------------------
  #++
end
