# encoding: utf-8
require_relative '../../../data_import/v3/strategies/dao_factory'

=begin

= V3::ParseResult

  - Goggles framework vers.:  4.00.819
  - author: Steve A.

 Container class for the whole result of a data-import parsing.

 Each ParseResult contains a list of contexts and each context may have only one
 other parent context.

 Any context that does not have any parent, is referred as a "root context".

 Each context, in turn, will usually contain more than one entity: one for each
 field value that has been recognized under its context.


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
    @serialized = false
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns +true+ if the #serialize or the #deserialize method have been
  # called at least once after the creation of new entities or contexts.
  #
  # Keep in mind that this does not guaratee the actual serialization of the
  # binary data returned by the #serialize method.
  #
  def is_serialized?()
    @serialized
  end


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
  # Wrapper for same-named method in V3::DAOFactory.
  #
  def new_entity( name, parent_context = nil )
    @serialized = false
    @factory.new_entity( name, parent_context )
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
  # Wrapper for same-named method in V3::DAOFactory.
  #
  def new_context( name, parent_context = nil )
    @serialized = false
    @factory.new_context( name, parent_context )
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
  #-- -------------------------------------------------------------------------
  #++

  # Retrieves the contexts named as indicated.
  # (i.e. "all the contexts named 'result_row'")
  #
  # Wrapper for same-named method in V3::DAOFactory.
  #
  def get_contexts_named( name )
    @factory.get_contexts_named( name )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Retrieves all the entities for a specific context name.
  # Wrapper for same-named method in V3::DAOFactory.
  #
  def get_entities_for_context( parent_context = nil )
    @factory.get_entities_for_context( parent_context )
  end


  # Retrieves all the (siblings) contexts for a specific context.
  #
  # Note that by specifying +nil+ as a parent context, will result in all root
  # context retrieved.
  # Wrapper for same-named method in V3::DAOFactory.
  #
  def get_siblings_for_context( parent_context = nil )
    @factory.get_siblings_for_context( parent_context )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Uses Marshal::dump to serialize the whole factory and its created instances.
  # Returns the marshaled binary data, ready to be saved on file.
  #
  def serialize
    @serialized = true
    Marshal.dump( @factory )
  end


  # Uses Marshal::load to de-serialize the whole factory and its created instances.
  # Clears and restores the whole factory from the specified binary_data.
  #
  def deserialize( binary_data )
    @factory.clear
    @serialized = true
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
