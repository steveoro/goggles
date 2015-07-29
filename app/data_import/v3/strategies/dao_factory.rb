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
    @context_names = {}                             # Internal cache of context names for quick key retrieval
    @entity_names = {}                              # Internal cache of context names for quick key retrieval
  end
  #-- -------------------------------------------------------------------------
  #++


  # Creates a new EntityDAO, adding it to the internal list and returning its
  # instance.
  #
  # Entity names should be unique among the same context. (No check is performed about this, though.)
  # They will be converted to strings internally.
  #
  # It is convenient to merge into the entity name also, for instance, the line
  # number of the source data row, to allow multiple
  # instances of the same entity type inside the same context.
  #
  # For example, a same "result" context could hold several different entities of
  # the same type. Thus, it is imperative to include some kind of counter inside
  # the name to allow this 1-to-many relationship.
  #
  def new_entity( name, parent_context = nil )
    @last_unique_id += 1
    entity = V3::EntityDAO.new( @last_unique_id, name.to_s, parent_context )
    parent_context.entity_list[ name.to_s ] = entity if parent_context.instance_of?( V3::ContextDAO )
                                                    # Cache the key for this new entity:
    @entity_names[ get_entity_unique_name(name, parent_context) ] = @last_unique_id
    @entity_list[ @last_unique_id ] = entity
  end


  # Creates a new ContextDAO, adding it to the internal list and returning its
  # instance.
  #
  # Context names should be unique. (No check is performed about this, though.)
  # They will be converted to strings internally.
  #
  def new_context( name )
    @last_unique_id += 1
    @context_names[ name.to_s ] = @last_unique_id        # Cache the key for this new context
    @context_list[ @last_unique_id ] = V3::ContextDAO.new( @last_unique_id, name.to_s )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Retrieves the unique entity name, used internally to cache its key.
  #
  def get_entity_unique_name( name, parent_context = nil )
    "#{ parent_context ? parent_context.name : '' }-#{ name.to_s }"
  end


  # Retrieves an entity by its name, given the parent context instance.
  #
  def get_entity( name, parent_context = nil )
    id = @entity_names[ get_entity_unique_name(name, parent_context) ]
    @entity_list[ id ]
  end


  # Retrieves a context by its name.
  #
  def get_context( name )
    id = @context_names[ name ]
    @context_list[ id ]
  end
  #-- -------------------------------------------------------------------------
  #++


  # Retrieves an entity by its name and its context name.
  #
  def get_entity_by_names( name, parent_context_name = nil )
    parent_context = get_context( parent_context_name )
    get_entity( name, parent_context )
  end


  # Retrieves all the entities for a specific context name.
  #
  def get_entities_for_context_name( parent_context_name = nil )
    parent_context = get_context( parent_context_name )
    if parent_context                               # Context found? Return its entity list:
      parent_context.entity_list.values
    else                                            # Let's do a "manual" search among the entities:
      @entity_list.values.map do |entity|
        parent_name = entity.parent_context ? entity.parent_context.name : nil
        entity if parent_context_name == parent_name
      end.compact
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Dumps all the contents of the current instance to a readable string.
  # (For debugging purposes only.)
  #
  def dump_to_s
    output = "\r\n---- Factory dump: ----"
    @context_list.each do |context_key, context|
      output << "\r\n'#{context_key}': #{ context }"
    end
    output << "\r\n"
    @entity_list.each do |entity_key, entity|
      output << "\r\n'#{entity_key}': #{ entity }"
    end
    output << "\r\n-----------------------\r\n"
    output
  end
  #-- -------------------------------------------------------------------------
  #++
end
