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
  def new_entity( name, parent_context = nil )
    @last_unique_id += 1
    entity = V3::EntityDAO.new( @last_unique_id, name, parent_context )
    parent_context.entity_list[ name ] = entity if parent_context.instance_of?( V3::ContextDAO )
    @entity_list[ @last_unique_id ] = entity
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
end
