# encoding: utf-8

require_relative '../../../strategies/sql_converter'


=begin

= V2::DataImportEntityBuilder

  - Goggles framework vers.:  4.00.751
  - author: Steve A.

  Service/DSL implementation oriented to build data-import entities, required
  by the "phase 2" of the data-import procedure.


=== Typical usage:

  Define a new 'build process', by specifying the existing data-import session.
  Provide a block as parameter, which will define the 'build' process, invoking
  in turn:

    - An #entity statement, to define the entity involved;

    - A #set_up scope, with the custom logic defining the field values used for the
      search and the row creation process.

    - A #search scope, containing:
      - at least, a #primary statement with the condition to seek for an existing row in
        the primary entity, having the values defined above;
      - a #secondary condition statement, with similar conditions, but used for the
        secondary/'data-import' entity;
      - the type of search or the action to be taken in this scope, typically
        a call to #default_search will suffice.

    - Any #custom_logic scope (if required), with any block that must be executed
      anywhere during the build process.

    - A #entity_for_creation statement, to define the entity used for row creation (see below);
      (when not called, the default is to use the secondary or 'data-import' entity for row creation)

    - An #attributes_for_creation statement, with the attributes hash used for creating
      a new row (in case all the searches are negative).

    - An #if_not_found scope, to define any action taken when the candidates are not
      found (typically, a call to #add_new).


=== Example (for entity Season):

    builder = V2::DataImportEntityBuilder.build( data_import_session ) do
      # Entity definition step:
      entity                    Season

      # Column value acquisition/definition step:
      set_up do
        @header_date = compute_a_value_for_header_date
        @other_field = another_compute
        # [...]
      end

      search do
        # Search done on 'seasons':
        primary                 ['where clause 1', @header_date, @other_field]

        # Search done on 'data_import_seasons':
        secondary               ['where clause 2', @data_import_session.id, @header_date, @other_field]

        # Type of search performed:
        default_search
      end

      # Attributes for adding a new row into 'data_import_seasons':
      attributes_for_creation(
        data_import_session_id: @data_import_session.id,
        import_text:            @header_date,
        description:            @description,
        begin_date:             @begin_date,
        end_date:               @end_date,
        season_type_id:         @season_type_id,
        header_year:            @header_year,
        edition:                @edition
      )

      # Action to be taken when the search block is unsuccessful:
      if_not_found do
        add_new
      end
    end

    builder.result_row  # => the instance found or created (nil on error)
    builder.result_id   # => the ID of the row either found or created; 0 on error, negative if the row was found in the primary entity.

=end
class V2::DataImportEntityBuilder
  include SqlConverter

  # Common basic scope builder
  class BasicScope
    def initialize( builder, &block )
      @builder = builder
      @builder.instance_eval( &block )
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Creates and parses all the actions accepted by a 'search' scope.
  class SearchScope < BasicScope
    def method_missing( method_name, *args, &block )
      if [
        :primary, :secondary, :search_for, :default_search,
        :primary_search_ok?, :secondary_search_ok?, :set_result
      ].include?( method_name )
        @builder.instance_eval( &block )
      else
        super
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Creates and parses all the actions accepted by a 'if_not_found' scope.
  class IfNotFoundScope < BasicScope
    def method_missing( method_name, *args, &block )
      if [
        :if_not_found, # (accepts also nested IFs)
        :search, :primary_search_ok?, :secondary_search_ok?, :set_result,
        :set_up, # (accepts also nested SET_UPs)
        :entity_for_creation, :attributes_for_creation, :add_new
      ].include?( method_name )
        @builder.instance_eval( &block )
      else
        super
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Creates and parses all the actions accepted by a 'custom_logic' scope.
  class CustomLogicScope < BasicScope
    # (nothing needed for the moment -- same as BasicScope, accepts anything)
  end
  #-- -------------------------------------------------------------------------
  #++


  attr_reader :data_import_session, :result_row, :result_id
  #-- -------------------------------------------------------------------------
  #++


  # Attempts to find a matching entity row or creates a new one, if missing.
  # Requires a mandatory block.
  #
  def self.build( data_import_session, &block )
    raise ArgumentError.new(
      "DataImportEntityBuilder requires a valid DataImportSession instance and a block!"
    ) unless block_given? && data_import_session.instance_of?( DataImportSession )
    V2::DataImportEntityBuilder.new( data_import_session, &block )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Creates a new 'set_up' scope for the specified block.
  #
  def set_up( &block )
    V2::DataImportEntityBuilder::BasicScope.new( self, &block )
  end

  # Creates a new 'search' scope for the specified block.
  #
  def search( &block )
    V2::DataImportEntityBuilder::SearchScope.new( self, &block )
  end

  # Creates a new 'custom_logic' scope for the specified block.
  #
  def custom_logic( &block )
    V2::DataImportEntityBuilder::CustomLogicScope.new( self, &block )
  end

  # Creates a new 'if_not_found' scope for the specified block.
  #
  def if_not_found( &block )
    V2::DataImportEntityBuilder::IfNotFoundScope.new( self, &block ) if result_not_found?
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns true if a "corresponding entity row" has not been found yet.
  #
  def result_not_found?
    @result_id.to_i == 0
  end

  # Returns true if a matching entity row has been found inside the
  # primary entity defined.
  #
  def primary_search_ok?
    @result_id.to_i < 0
  end

  # Returns true if a matching entity row has been found inside the
  # secondary entity defined.
  #
  def secondary_search_ok?
    @result_id.to_i > 0
  end

  # Sets the entity associated with the build process.
  #
  def entity( entity_class )
    @primary_entity = entity_class
  end

  # Getter for the secondary entity associated with the build process.
  # The entity used for the creation of a new row has the precedence in
  # defining what "secondary entity" actually refers to.
  #
  def secondary_entity
    @secondary_entity = @creation_entity || "DataImport#{@primary_entity}".constantize
  end
  #-- -------------------------------------------------------------------------
  #++


  # Sets the search condition for the entity itself (the 'primary' table, not its
  # data-import counterpart).
  #
  # == Example:
  # - Entity: Season => condition will be applied on table 'seasons'.
  #
  def primary( condition )
    @primary_search_condition = condition
  end

  # Sets the search condition for the data-import entity.
  # Set this to nil to skip the "secondary search" phase.
  #
  # == Example:
  # - Entity: Season => condition will be applied on table 'data_import_seasons'.
  #
  def secondary( condition )
    @secondary_search_condition = condition
  end


  # Performs a search for an existing row for the specified +entity+, using the
  # +search_condition+.
  #
  # == Returns: the corresponding id of the found row (on the specified entity);
  #   - a negative ID when found on a primary entity;
  #   - a positive ID when found on a data-import entity (the choice is made
  #     simply by looking at the model name);
  #   - 0 when not found.
  #
  def search_for( entity, search_condition )
    @result_id = 0
# DEBUG
#    puts "Seeking existing #{entity.name} with #{search_condition.inspect}\r\n"
    @data_import_session.phase_1_log << "Seeking existing #{entity.name} with #{search_condition.inspect}\r\n"
    set_result( entity.where( search_condition ).first )
# DEBUG
#    puts "#{entity.name} found! (ID: #{@result_row.id})\r\n" if @result_row
    @data_import_session.phase_1_log << "#{entity.name} found! (ID: #{@result_row.id})\r\n" if @result_row
    @result_id
  end

  # Sets the #result_row and #result_id members accordingly, clearing them
  # if the result_row is nil.
  #
  # === Values for #result_id:
  #   - a negative ID when found on a primary entity;
  #   - a positive ID when found on a data-import entity (the choice is made
  #     simply by looking at the model name);
  #   - 0 when not found.
  #
  def set_result( result_row )
    if result_row
      @result_row = result_row
      # We must differentiate the result: positive for a 'data_import' entity, negative otherwise
      @result_id = @result_row.id * (result_row.class.name =~ /DataImport/ ? 1 : -1)
    else
      @result_row = nil
      @result_id = 0
    end
  end


  # Default implementation for the "full search" of a "corresponding entity row".
  #
  # First searches in the primary entity and then the secondary, but only
  # if the @secondary_search_condition has been set.
  #
  # == Returns:
  # The method updates directly the @result_row and @result_id members.
  # The actual result returned is the result from the last invocation of #search_for.
  #
  def default_search
    search_for( @primary_entity, @primary_search_condition )
                                                    # Nothing found? Do a secondary search:
    search_for( secondary_entity, @secondary_search_condition ) if ( @secondary_search_condition && result_not_found? )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Sets the entity used to create a new row.
  #
  def entity_for_creation( entity_class )
    @creation_entity = entity_class
  end

  # Attributes hash used during the creation of a new row.
  #
  def attributes_for_creation( attributes_hash )
    @attributes_hash = attributes_hash
  end


  # Creates a new 'data-import' row.
  #
  # This method should not be used directly: it's called internally during the
  # #build process.
  #
  # == Returns: the corresponding id of the created row (on a data-import/secondary entity);
  #   - an always positive ID for a successful row creation;
  #   - 0 only on error/unable to process.
  #
  def add_new()
    @result_id = 0
    @result_row = nil
    # Initialize log columns if found still undefined:
    @data_import_session.phase_2_log ||= ''
    @data_import_session.sql_diff    ||= ''

    begin
      secondary_entity.transaction do
        @result_row = secondary_entity.new( @attributes_hash )
        @result_row.save!
      end
    rescue
# DEBUG
#      puts "\r\n#{secondary_entity.name} creation: exception caught during save!\r\n"
#      puts "#{ $!.to_s }\r\n" if $!
      @data_import_session.phase_2_log << "\r\n#{secondary_entity.name} creation: exception caught during save!\r\n"
      @data_import_session.phase_2_log << "#{ $!.to_s }\r\n" if $!
    else
      if @result_row
        @result_id = @result_row.id
# DEBUG
#        puts "Added new #{secondary_entity.name}, ID:#{@result_id}.\r\n"
        @data_import_session.phase_2_log << "Added new #{secondary_entity.name}, ID:#{@result_id}.\r\n"

        # Log the SQL diff statement only if the creation entity is not actually a
        # "secondary" one, but the actual serialization destination for the attributes
        # (During phase-2, this may happen only for meeting_events, time_standards
        #  and data_import_team_aliases):
        #
        # Also, TeamAffiliation SQL diff creation is skipped during pre-commit phase
        # (which corresponds to last completed phase == 12), because we need to
        # store the SQL diff *after* the Team creation using the @additional_row
        # feature of the V2::DataImportEntityCommitter, which allows to specify which
        # additional row should be processed as an additional SQL-diff creation parameter.
        #
        # [Convoluted explanation of the reason why:]
        # (...Otherwise, in some rare cases in which the TeamAffiliation gets created
        # only during phase 3, we may produce an SQL which is not executable due
        # to the affiliation INSERT statement referencing the Team ID created on
        # the next line, because in the implementation we need to launch the builder
        # for the affiliation *before* the Team is actually committed.)
        if ( secondary_entity.name =~ /Alias/ ) ||
           (
             (@data_import_session.phase == 12) &&
             (secondary_entity.name =~ /DataImport|TeamAffiliation/).nil?
           ) ||
           ( (@data_import_session.phase != 12) &&
             (secondary_entity.name =~ /DataImport/).nil?
           )
          @data_import_session.sql_diff << to_sql_insert( @result_row, false ) # (No user comment)
        end
        @data_import_session.total_data_rows += 1
      else
# DEBUG
#        puts "ERROR: Add transaction block returned a nil row! (This will result in ID: 0)\r\n"
        @data_import_session.phase_2_log << "ERROR: Add transaction block returned a nil row! (This will result in ID: 0)\r\n"
      end
    end

    @data_import_session.save!
    @result_id
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Creates a new instance.
  #
  def initialize( data_import_session, &block )
    @data_import_session = data_import_session
    # Evaluate the block passed within the context of this instance:
    instance_eval( &block )
  end
  #-- -------------------------------------------------------------------------
  #++
end
