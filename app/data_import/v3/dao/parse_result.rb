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
  # Wrapper for same-named method in V3::DAOFactory.
  #
  def new_entity( name, parent_context = nil )
    @factory.new_entity( name, parent_context )
  end

  # Creates a new ContextDAO, adding it to the internal list and returning its
  # instance.
  #
  # Context names should be unique. (No check is performed about this, though.)
  # They will be converted to strings internally.
  #
  # Wrapper for same-named method in V3::DAOFactory.
  #
  def new_context( name )
    @factory.new_context( name )
  end
  #-- -------------------------------------------------------------------------
  #++

  # Retrieves the unique entity name, used internally to cache its key.
  # Wrapper for same-named method in V3::DAOFactory.
  #
  def get_entity_unique_name( name, parent_context = nil )
    @factory.get_entity_unique_name( name, parent_context )
  end

  # Retrieves an entity by its name, given the parent context instance.
  # Wrapper for same-named method in V3::DAOFactory.
  #
  def get_entity( name, parent_context = nil )
    @factory.get_entity( name, parent_context )
  end

  # Retrieves a context by its name.
  # Wrapper for same-named method in V3::DAOFactory.
  #
  def get_context( name )
    @factory.get_context( name )
  end
  #-- -------------------------------------------------------------------------
  #++

  # Retrieves an entity by its name and its context name.
  # Wrapper for same-named method in V3::DAOFactory.
  #
  def get_entity_by_names( name, parent_context_name = nil )
    @factory.get_entity_by_names( name, parent_context_name )
  end


  # Retrieves all the entities for a specific context name.
  # Wrapper for same-named method in V3::DAOFactory.
  #
  def get_entities_for_context_name( parent_context_name = nil )
    @factory.get_entities_for_context_name( name, parent_context_name )
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
    @factory.dump_to_s
  end
  #-- -------------------------------------------------------------------------
  #++
end
