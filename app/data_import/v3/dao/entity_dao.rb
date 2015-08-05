# encoding: utf-8

=begin

= V3::EntityDAO

  - Goggles framework vers.:  4.00.819
  - author: Steve A.

 DAO class for a generic entity resulting from the parsing of a data-import text
 token.

=end
class V3::EntityDAO


  attr_reader   :id,                                # unique integer ID for this entity
                :name,                              # Symbol representing the entity field key, as defined in the parser defs.
                :parent_context                     # Parent ContextDAO (when defined) or nil

  attr_accessor :text_token,                        # text buffer used for the parsing, initially empty (i.e.: "SL", stroke_types.code)
                :parsed_value,                      # result value from the actual parsing (i.e.: 1, stroke_types.id - filled only during later phases of the data-import procedure)
                :destination_class                  # destination Class for the result value (i.e.: StrokeType - filled only during later phases of the data-import procedure)
  #-- -------------------------------------------------------------------------
  #++


  # Builds a new instance, specifying the unique ID and the field name for which
  # this entitiy will hold the parsed value.
  #
  # - id should be allocated by an external factory, keeping track of all
  #   the instantiated contexts.
  #
  # - name should correspond to the key used to parse the context group from
  #   the parsed text token (which typically may comprise several rows of text).
  #
  # - parent_context can either be +nil+ or an instance of ContextDAO.
  #
  def initialize( id, name, parent_context = nil )
    @id = id
    @name = name
    @text_token = ''
    @parsed_value = nil
    @parent_context = parent_context
    @destination_class = nil
  end
  #-- -------------------------------------------------------------------------
  #++

  # Checks if two instances are the same
  #
  def ==( other_object )
    return false unless other_object.respond_to?(:id) && other_object.respond_to?(:name) &&
                        other_object.respond_to?(:parent_context) &&
                        other_object.respond_to?(:text_token) && other_object.respond_to?(:parsed_value) &&
                        other_object.respond_to?(:destination_class)
    (
      ( self.id == other_object.id ) &&
      ( self.name == other_object.name ) &&
      ( self.parent_context == other_object.parent_context ) &&
      ( self.text_token == other_object.text_token ) &&
      ( self.parsed_value == other_object.parsed_value ) &&
      ( self.destination_class == other_object.destination_class )
    )
  end


  # Convert the current instance to a readable string
  def to_s
    "[V3::EntityDAO: ID: #{@id}, #{@name}, value: #{@parsed_value}" +
    ( @parent_context ? ", parent: '#{@parent_context.name}'" : '' ) +
    ", text_token: #{@text_token}]"
  end
  #-- -------------------------------------------------------------------------
  #++
end
