# encoding: utf-8
require 'common/format'

require 'meeting_finder'
require 'swimmer_finder'
require 'swimmer_fuzzy_finder'
require 'team_finder'
require 'swimming_pool_finder'



=begin

= SearchController

  Search-dedicated controller.

  - version:  6.072
  - author:   Steve A.

=end
class SearchController < ApplicationController

  # If an unlogged user makes these much requests for a single session (cleared on the DB each night)
  # the next one will be presented a ReCAPTCHA with the reminder to log-in to avoid it
  MAX_FREE_REQUESTS_BEFORE_CAPTCHA = 4

  # Max returned results per group. If more than this are found, another request
  # should be made manually.
  RESULTS_LIMIT = 8

  before_action :count_requests, only: [:smart]


  # Collects all ranked results according to the specified query parameter ('q').
  #
  # Dual-phase action:
  # - Phase 1: GET => renders search form
  # - Phase 2: XHR GET => renders AJAX grid with result, expects parameter 'q'.
  #
  # === Params
  # - 'q': the query string
  # - 'u': '1' for an unlimited search, anything else forces RESULTS_LIMIT for each result block
  # - 'e': entity type for the specialized search ('s': swimmers, 't': team, 'p': pool, 'm': meeting)
  # - 'f': 1 == captcha fail (used only in the views)
  #
  def smart
# DEBUG
#    logger.debug( "\r\n\r\n!! ------ #{self.class.name} -----" )
#    logger.debug( "> #{params.inspect}" )
    # AJAX call? Parse parameter and retrieve records range:
    if request.xhr? && params['q'].present?
      @query = params['q']
      @limitless = ( params['u'] == '1' )
      prepare_query_results( params['q'], params['e'] )
    end
    # Respond according to requested format (GET request => .html, AJAX request => .js)
    respond_to do |format|
      format.html
      format.js
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Same as #smart, but for abusing users or bots. (It uses a ReCAPTCHA verification.)
  #
  # === Params
  # - 'q': the query string
  # - 'u': '1' for an unlimited search, anything else forces RESULTS_LIMIT for each result block
  # - 'e': entity type for the specialized search ('s': swimmers, 't': team, 'p': pool, 'm': meeting)
  # - 'f': 1 == captcha fail (used only in the views)
  #
  def smart_with_captcha
    # Avoid crashes if the captcha site key is nil:
    redirect_to search_smart_path( q: params['q'], u: params['u'], e: params['e'] ) and return if Rails.application.secrets.recaptcha_site_key.nil?
# DEBUG
#    logger.debug( "\r\n\r\n!! ------ #{self.class.name} -----" )
#    logger.debug( "> #{params.inspect}" )
    # AJAX call? Parse parameter and retrieve records range:
    if request.xhr? && params['q'].present?
      @captcha_ok = verify_recaptcha
      @query = params['q']
      @limitless = ( params['u'] == '1' )

      if @captcha_ok
        prepare_query_results( params['q'], params['e'] )
      else
        @swimmers = []
        @teams = []
        @pools = []
        @meetings = []
      end
    end
    # Respond according to requested format (GET request => .html, AJAX request => .js)
    respond_to do |format|
      format.html
      format.js
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Count requests coming from same-IP origin.
  #
  def count_requests
    # Don't count requests for legitimate and logged-in users:
    # (but only if captcha key is defined)
    return if user_signed_in? || Rails.application.secrets.recaptcha_site_key.nil?
# DEBUG
#    logger.debug( "\r\n------------------------------------------" )
#    logger.debug( "- IP: #{ request.ip }" )
#    logger.debug( "- Remote IP: #{ request.remote_ip }" )
#    logger.debug( "- Headers: #{ request.headers['HTTP_USER_AGENT'].inspect }" )
#    logger.debug( "- Session Req. count: #{ session[ request.ip ] }" )
#    logger.debug( "------------------------------------------" )
    # Increase request count:
    session[ request.ip ] = session[ request.ip ] ? session[ request.ip ] + 1 : 1
    redirect_to search_smart_with_captcha_path( q: params['q'], u: params['u'], e: params['e'], f: 1 ) and return if session[ request.ip ] > MAX_FREE_REQUESTS_BEFORE_CAPTCHA
  end
  #-- -------------------------------------------------------------------------
  #++


  # Prepares the class members holding the results found from the query.
  #
  # === Params
  # - query: the query string
  # - entity: an entity code for the "specialized" search ('s': swimmers, 't': team, 'p': pool, 'm': meeting)
  #
  def prepare_query_results( query, entity )
    # Get all swimmers related to the query text:
    @swimmers = (entity.nil? || entity == 's') ? get_possible_swimmers( params['q'], @limitless ) : []
    # Get all teams related to the query text OR the swimmers found:
    @teams    = (entity.nil? || entity == 't') ? get_possible_teams( params['q'], @swimmers, @limitless ) : []
    # Get all swimming pools somehow related to the query text:
    @pools    = (entity.nil? || entity == 'p') ? get_possible_pools( params['q'], @limitless ) : []
    # Get all meetings somehow related to the query text:
    @meetings = (entity.nil? || entity == 'm') ? get_possible_meetings( params['q'], @limitless ) : []
  end
  #-- -------------------------------------------------------------------------
  #++


  # Finds all the possible Swimmer results given the query string.
  #
  # === Params
  # - query: the query string
  # - no_limit: +true+ for an unlimited search (nil, default: false)
  #
  # === Returns
  # An array of decorated Swimmer instances
  #
  def get_possible_swimmers( query, no_limit = false )
    result = []
    swimmers = SwimmerFuzzyFinder.call( complete_name: query, limit: (no_limit ? nil : RESULTS_LIMIT) )
    result += swimmers.map{|s| s.decorate }
    # Re-sort the modified array:
    result.sort!{ |sa, sb| sa.get_full_name <=> sb.get_full_name }
    result
  end


  # Finds all the possible Team results given the query string and an array
  # of already found Swimmers.
  #
  # === Params
  # - query: the query string
  # - swimmers_found: an array of Swimmer instances found so far; an empty array otherwise.
  # - no_limit: +true+ for an unlimited search (nil, default: false)
  #
  # === Returns
  # An array of decorated Team instances
  #
  def get_possible_teams( query, swimmers_found, no_limit = false )
    result = []
    teams = TeamFinder.new( query, no_limit ? nil : RESULTS_LIMIT ).search()
    # Add all the teams from the swimmer results but only if no matches where found:
    if teams.count < 1
      teams = swimmers_found.map{ |swimmer| swimmer.teams }.flatten.uniq
    end
    result += teams.map{|t| t.decorate }
    # Re-sort the modified array:
    result.sort!{ |ta, tb| ta.get_full_name <=> tb.get_full_name }
    result
  end


  # Finds all the possible SwimmingPool results given the query string.
  #
  # === Params
  # - query: the query string
  # - no_limit: +true+ for an unlimited search (nil, default: false)
  #
  # === Returns
  # An array of decorated SwimmingPool instances
  #
  def get_possible_pools( query, no_limit = false )
    result = []
    pools = SwimmingPoolFinder.new( query, no_limit ? nil : RESULTS_LIMIT ).search()
    result += pools.map{|p| p.decorate }
    # Re-sort the modified array:
    result.sort!{ |pa, pb| pa.get_full_name <=> pb.get_full_name }
    result
  end


  # Finds all the possible Meeting results given the query string.
  # MeetingFinder will also search for swimmer & team results in nested entities for Meeting.
  #
  # === Params
  # - query: the query string
  # - no_limit: +true+ for an unlimited search (nil, default: false)
  #
  # === Returns
  # An array of Meeting instances
  #
  def get_possible_meetings( query, no_limit = false )
    result = []
    meetings = MeetingFinder.new( query, no_limit ? nil : RESULTS_LIMIT ).search()
    meetings.distinct!
    result += meetings.map{|m| m.decorate }
    # Re-sort the modified array:
    result.sort!{ |ma, mb| mb.header_date <=> ma.header_date }
    result
  end
  #-- -------------------------------------------------------------------------
  #++
end
