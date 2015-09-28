# encoding: utf-8
require 'extensions/wice_grid_column_string_regexped' # Used to generate simple_search query condition

=begin

= MeetingFinder

 - Goggles framework vers.:  4.00.825
 - author: Steve A.

 Finder (strategy) class used to retrieve lists of Meeting instances based
 upon a "simple" search query.

 The text specified in the constructor will be searched among:

 - meeting header: description, title and notes
 - meeting results: swimmer names
 - meeting results: team names

=end
class MeetingFinder

  # Constructor
  #
  # == Params:
  # - query_term: the text to be searched; returns all Meetings when no term is supplied.
  #
  def initialize( query_term = nil )
    @query_term = query_term
  end
  #-- --------------------------------------------------------------------------
  #++


  # Executes the search, returning just an array of row IDs, corresponding to the
  # Meeting rows satisfying the search term.
  #
  def search_ids
    ids = []
    # Avoid query build-up if no search text is given:
    if @query_term
      query_swimmers_condition = ConditionsGeneratorColumnStringRegexped.generate_query_conditions( 'swimmers', 'complete_name', @query_term )
      query_teams_condition    = ConditionsGeneratorColumnStringRegexped.generate_query_conditions( 'teams', 'name', @query_term )
      search_like_text = "%#{@query_term}%"

      # Search among most-used text columns in Meetings:
      ids += Meeting.where(
        [
          "(description LIKE ?) OR (header_year LIKE ?) OR (notes LIKE ?) OR (reference_name LIKE ?)",
          search_like_text, search_like_text, search_like_text, search_like_text
        ]
      ).map{ |row| row.id }.flatten.uniq

      # Search among linked Swimmers:
      ids += Meeting.includes( :swimmers ).where( query_swimmers_condition ).map{ |row| row.id }.flatten.uniq

      # Search among linked Teams:
      ids += Meeting.includes( :teams ).where( query_teams_condition ).map{ |row| row.id }.flatten.uniq

      # Search among linked EventTypes:
      event_type_ids = EventType.includes(:stroke_type).find_all do |row|
        ( row.i18n_short =~ %r(#{@query_term})i ) ||
        ( row.i18n_description =~ %r(#{@query_term})i )
      end.map{ |row| row.id }.flatten.uniq

      # Complete the list of IDs to be retrieved:
      ids += Meeting.includes( :meeting_events ).where( :'meeting_events.event_type_id' => event_type_ids )
        .map{ |row| row.id }.flatten.uniq
      # Return the results:
      ids.uniq
    else                                            # No search term:
      Meeting.select(:id).all.map{ |row| row.id }.flatten.uniq
    end
  end
  #-- --------------------------------------------------------------------------
  #++


  # Executes the search, returning full row instances
  #
  def search
    # Avoid query build-up if no search text is given:
    @query_term ? Meeting.where(id: search_ids()) : Meeting.all
  end
  #-- --------------------------------------------------------------------------
  #++
end
