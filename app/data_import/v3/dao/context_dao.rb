# encoding: utf-8


=begin

= V3::ContextDAO

  - Goggles framework vers.:  4.00.819
  - author: Steve A.

 DAO class for a generic context resulting from the parsing of a group of data-import
 text token.

 "Contexts" are essentially groups of entities, stored inside an hash, which
 define parsing contexts for "children" tokens contained within their scope.

 It's up to the parsing strategy to define what is what and what should be used
 to detect context beginnings and endings.

=end
class V3::ContextDAO
  attr_reader   :id,                                # unique integer ID for this context
                :name,                              # Symbol representing the context key, as defined in the parser defs.
                :parent_context                     # Parent ContextDAO (when defined) or nil

  attr_accessor :text_token,                        # text buffer used for the parsing, initially empty (i.e.: "50 SL M35", containing text tokens of several entities: "length", "stroke_type" and "category")
                :entity_list                        # Hash list of entities parsed for this context (each entity key should be its ContextType name)
  #-- -------------------------------------------------------------------------
  #++


  # Builds a new instance, specifying the unique ID and the context name for which
  # this instant will refer to.
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
    @entity_list = {}
    @text_token = ''
    @parent_context = parent_context
  end
  #-- -------------------------------------------------------------------------
  #++

  # Checks if two instances are the same
  #
  def ==( other_object )
    return false unless other_object.respond_to?(:id) && other_object.respond_to?(:name) &&
                        other_object.respond_to?(:parent_context) &&
                        other_object.respond_to?(:text_token) && other_object.respond_to?(:entity_list)
    (
      ( self.id == other_object.id ) &&
      ( self.name == other_object.name ) &&
      ( self.parent_context == other_object.parent_context ) &&
      ( self.text_token == other_object.text_token ) &&
      ( self.entity_list == other_object.entity_list )
    )
  end


  # Convert the current instance to a readable string
  def to_s
    "[V3::ContextDAO: ID: #{@id}, #{@name}, #{@entity_list.size} entities" +
    ( @parent_context ? ", parent: '#{@parent_context.name}'" : '' ) +
    ", text_token: #{@text_token}]"
  end
  #-- -------------------------------------------------------------------------
  #++
end
