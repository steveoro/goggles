# encoding: utf-8
require_relative '../../../data_import/v3/dao/context_dao'
require_relative '../../../data_import/v3/dao/entity_dao'
require_relative '../../../data_import/v3/dao/parse_result'


=begin

= V3::DAOFactory

  - Goggles framework vers.:  4.00.819
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
  # Context names can be duplicated, to allow multiple child-contexts holding
  # different values of the same group of entities.
  #
  # The suggested way to process the contexts is as a sequential list.
  # (i.e. scanning all the contexts named "result_row" for result values)
  #
  def new_context( name, parent_context = nil )
    @last_unique_id += 1
    @context_list[ @last_unique_id ] = V3::ContextDAO.new( @last_unique_id, name.to_s, parent_context )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Retrieves the unique entity name, used internally to cache its key.
  #
  def get_entity_unique_name( name, parent_context = nil )
    "#{ parent_context ? "#{parent_context.id}-#{parent_context.name}" : '' }-#{ name.to_s }"
  end


  # Retrieves an entity by its name, given the parent context instance.
  #
  def get_entity( name, parent_context = nil )
    id = @entity_names[ get_entity_unique_name(name, parent_context) ]
    @entity_list[ id ]
  end
  #-- -------------------------------------------------------------------------
  #++


  # Retrieves the contexts named as indicated.
  # (i.e. "all the contexts named 'result_row'")
  #
  def get_contexts_named( name )
    @context_list.values.map{ |context| context if context.name == name }.compact
  end
  #-- -------------------------------------------------------------------------
  #++


  # Retrieves all the entities for a specific context.
  #
  def get_entities_for_context( parent_context = nil )
    if parent_context.instance_of?( V3::ContextDAO )# Context specified? Return its entity list:
      parent_context.entity_list.values
    else                                            # Let's do a "manual" search among the entities:
      # [Steve, 20150805] This check allows, so far, to have "root entities" laying around,
      # waiting to be fetched. 'Still don't know if it's a really useful feature at all...
      @entity_list.values.map do |entity|
        entity if entity.parent_context == parent_context
      end.compact
    end
  end


  # Retrieves all the (siblings) contexts for a specific context.
  #
  # Note that by specifying +nil+ as a parent context, will result in all root
  # context retrieved.
  #
  def get_siblings_for_context( parent_context = nil )
    @context_list.values.map do |context|
      context if context.respond_to?(:parent_context) && (context.parent_context == parent_context)
    end.compact
  end
  #-- -------------------------------------------------------------------------
  #++


  # Dumps all the contents of the current instance to a readable string.
  # (For debugging purposes only.)
  #
  def dump_to_s
    output = "\r\n---- Factory dump: ----"
    @context_list.each do |context_key, context|
      if context.parent_context.instance_of?( V3::ContextDAO )
        output << "\r\n(#{context.parent_context.id}) => '#{context_key}': #{ context }"
      else
        output << "\r\n'#{context_key}': #{ context }"
      end
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
