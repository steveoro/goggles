# encoding: utf-8

=begin

= ContextDAO

  - Goggles framework vers.:  4.00.809
  - author: Steve A.

 DAO class for a generic context resulting from the parsing of a group of data-import
 text token.

 "Contexts" are essentially groups of entities, stored inside an hash, which
 define parsing contexts for "children" tokens contained within their scope.

 It's up to the parsing strategy to define what is what and what should be used
 to detect context beginnings and endings.

=end
class ContextDAO

  attr_reader   :id,                                # unique integer ID for this context
                :name,                              # Symbol representing the context key, as defined in the parser defs.
                :parent_context                     # Parent ContextDAO (when defined) or nil

  attr_accessor :text_token,                        # text buffer used for the parsing, initially empty
                :entity_list                        # Hash list of entities parsed for this context

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

end
