# encoding: utf-8

=begin

= EntityDAO

  - Goggles framework vers.:  4.00.809
  - author: Steve A.

 DAO class for a generic entity resulting from the parsing of a data-import text
 token.

=end
class EntityDAO


  attr_reader   :id,                                # unique integer ID for this entity
                :name,                              # Symbol representing the entity field key, as defined in the parser defs.
                :parent_context                     # Parent ContextDAO (when defined) or nil

  attr_accessor :text_token,                        # text buffer used for the parsing, initially empty
                :parsed_value,                      # result value from the parsing
                :destination_class                  # destination Class for the result value
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

end
