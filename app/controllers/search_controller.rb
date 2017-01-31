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

  - version:  6.070
  - author:   Steve A.

=end
class SearchController < ApplicationController

  # If an unlogged user makes these much requests for a single session (cleared on the DB each night)
  # the next one will be presented a ReCAPTCHA with the reminder to log-in to avoid it
  MAX_FREE_REQUESTS_BEFORE_CAPTCHA = 4

  before_action :count_requests, only: [:smart]


  # Collects all ranked results according to the specified query parameter ('q').
  #
  # Dual-phase action:
  # - Phase 1: GET => renders search form
  # - Phase 2: XHR GET => renders AJAX grid with result, expects parameter 'q'.
  #
  def smart
# DEBUG
#    logger.debug( "\r\n\r\n!! ------ #{self.class.name} -----" )
#    logger.debug( "> #{params.inspect}" )
    # AJAX call? Parse parameter and retrieve records range:
    if request.xhr? && params['q'].present?
      prepare_query_results( params['q'] )
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
  def smart_with_captcha
# DEBUG
#    logger.debug( "\r\n\r\n!! ------ #{self.class.name} -----" )
#    logger.debug( "> #{params.inspect}" )
    # AJAX call? Parse parameter and retrieve records range:
    if request.xhr? && params['q'].present?
      @captcha_ok = verify_recaptcha
      if @captcha_ok
        prepare_query_results( params['q'] )
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
    return if user_signed_in?
# DEBUG
#    logger.debug( "\r\n------------------------------------------" )
#    logger.debug( "- IP: #{ request.ip }" )
#    logger.debug( "- Remote IP: #{ request.remote_ip }" )
#    logger.debug( "- Headers: #{ request.headers['HTTP_USER_AGENT'].inspect }" )
#    logger.debug( "- Session Req. count: #{ session[ request.ip ] }" )
#    logger.debug( "------------------------------------------" )
    # Increase request count:
    session[ request.ip ] = session[ request.ip ] ? session[ request.ip ] + 1 : 1
    redirect_to search_smart_with_captcha_path( q: params['q'], f: 1 ) and return if session[ request.ip ] > MAX_FREE_REQUESTS_BEFORE_CAPTCHA
  end
  #-- -------------------------------------------------------------------------
  #++


  # Count requests coming from same-IP origin.
  #
  def prepare_query_results( query )
    # Get all swimmers related to the query text:
    @swimmers = get_possible_swimmers( params['q'] )
    # Get all teams related to the query text OR the swimmers found:
    @teams = get_possible_teams( params['q'], @swimmers )
    # Get all swimming pools somehow related to the query text:
    @pools = get_possible_pools( params['q'] )
    # Get all meetings somehow related to the query text:
    @meetings = get_possible_meetings( params['q'] )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Finds all the possible Swimmer results given the query string.
  #
  # === Params
  # - query: the query string
  #
  # === Returns
  # An array of decorated Swimmer instances
  #
  def get_possible_swimmers( query )
    result = []
    swimmers = SwimmerFuzzyFinder.call( complete_name: query )
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
  #
  # === Returns
  # An array of decorated Team instances
  #
  def get_possible_teams( query, swimmers_found )
    result = []
    teams = TeamFinder.new( query ).search()
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
  #
  # === Returns
  # An array of decorated SwimmingPool instances
  #
  def get_possible_pools( query )
    result = []
    pools = SwimmingPoolFinder.new( query ).search()
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
  #
  # === Returns
  # An array of Meeting instances
  #
  def get_possible_meetings( query )
    result = []
    meetings = MeetingFinder.new( query ).search()
    meetings.uniq!
    result += meetings.map{|m| m.decorate }
    # Re-sort the modified array:
    result.sort!{ |ma, mb| ma.header_date <=> mb.header_date }
    result
  end
  #-- -------------------------------------------------------------------------
  #++
end
