# encoding: utf-8

=begin

= DAOFactory

  - Goggles framework vers.:  4.00.809
  - author: Steve A.

 Factory class for both EntityDAOs & ContextDAOs.

=end
class DAOFactory

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
    @entity_list[ @last_unique_id ] = EntityDAO.new( @last_unique_id, name )
  end


  # Creates a new ContextDAO, adding it to the internal list and returning its
  # instance.
  #
  def new_context( name )
    @last_unique_id += 1
    @context_list[ @last_unique_id ] = ContextDAO.new( @last_unique_id, name )
  end
  #-- -------------------------------------------------------------------------
  #++
end
