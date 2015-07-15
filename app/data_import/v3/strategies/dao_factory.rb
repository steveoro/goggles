# encoding: utf-8
require_relative '../../../data_import/v3/dao/context_dao'
require_relative '../../../data_import/v3/dao/entity_dao'
require_relative '../../../data_import/v3/dao/parse_result'


=begin

= V3::DAOFactory

  - Goggles framework vers.:  4.00.815
  - author: Steve A.

 Factory class for both EntityDAOs & ContextDAOs.

=end
class V3::DAOFactory

  attr_reader   :entity_list,                       # Entity hash list
                :context_list                       # Context hash list:
  #-- -------------------------------------------------------------------------
  #++


  # Builds a new instance, resetting the internal counters.
  #
  def initialize()
    clear
  end


  # Clears both the internal lists of entities and contexts.
  #
  def clear
    @entity_list = {}
    @context_list = {}
    @last_unique_id = 0
  end
  #-- -------------------------------------------------------------------------
  #++


  # Creates a new EntityDAO, adding it to the internal list and returning its
  # instance.
  #
  def new_entity( name )
    @last_unique_id += 1
    @entity_list[ @last_unique_id ] = V3::EntityDAO.new( @last_unique_id, name )
  end


  # Creates a new ContextDAO, adding it to the internal list and returning its
  # instance.
  #
  def new_context( name )
    @last_unique_id += 1
    @context_list[ @last_unique_id ] = V3::ContextDAO.new( @last_unique_id, name )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns a V3::ParseResult wrapper object referencing the currently generated
  # lists of contexts and entities.
  #
  # The specified +file_name+ is passed directly into the generated object.
  #
  def to_parse_result( file_name )
    result = V3::ParseResult.new( file_name )
    result.entity_list.merge!( self.entity_list )
    result.context_list.merge!( self.context_list )
    result
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
