# encoding: utf-8
require 'common/format'

require 'meeting_finder'
require 'swimmer_finder'
require 'team_finder'
require 'swimming_pool_finder'


#
# R/O RESTful API controller
#
class Api::V1::SearchController < ApplicationController

  respond_to :json

  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!                # Devise "standard" HTTP log-in strategy
  before_filter :ensure_format
  # ---------------------------------------------------------------------------


  # "Simple search" implementation: searches for the query text in all the main
  # entities.
  #
  # Returns an array of JSON-encoded Hash objects for the specified query text, one
  # for each row of Meetings, Swimmers, Teams or SwimmingPools found to be referring
  # to the query text.
  #
  # Each returned Hash will have this structure:
  #
  #    {
  #      class: ['Meeting'|'Swimmer'|'Team'|'SwimmingPool'|...]
  #      id: [id from the retrieved model]
  #      description: [get_verbose_name from the model]
  #      date:  [a relevant date from the model, either updated_at or header_date for Meetings]
  #    }
  #
  #
  # === Params:
  # - :query => the text to be searched using all the custom Finder instances available
  #
  #
  # === Sample end-point usage:
  #
  # > curl -i -H "Accept: application/json" \
  #              "http://localhost:3000/api/v1/search/simple?query=<uuencoded_query_text>&user_email=steve.alloro@whatever.com&user_token=<user_token>"
  #
  def simple
    @result = []
    # Get all swimmers related to the query text:
    swimmers = get_possible_swimmers( params[:query] )
    # Get all teams related to the query text OR the swimmers found:
    get_possible_teams( params[:query], swimmers )
    # Get all swimming pools somehow related to the query text:
    get_possible_pools( params[:query] )
    # Get all meetings somehow related to the query text:
    get_possible_meetings( params[:query] )

    respond_with( @result )
  end
  #-- -------------------------------------------------------------------------
  #++


  protected


  # Makes sure that the format for the request is an accepted one.
  def ensure_format
    unless request.xhr? || request.format.json?
      render( status: 406, json: { success: false, message: I18n.t(:api_request_must_be_json) } )
      return
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Finds all the possible Swimmer results given the query string.
  #
  # The method updates also internally the @result array instance.
  #
  # === Params
  # - query: the query string
  #
  # === Returns
  # An array of Swimmer instances
  #
  def get_possible_swimmers( query )
    swimmers = SwimmerFinder.new( params[:query] ).search()
    swimmers.each do |swimmer|
      @result << {
          class:       'Swimmer',
          id:          swimmer.id,
          description: swimmer.get_verbose_name,
          date:        Format.a_date( swimmer.updated_at )
      }
    end
    swimmers
  end


  # Finds all the possible Team results given the query string and an array
  # of already found Swimmers.
  #
  # The method updates also internally the @result array instance.
  #
  # === Params
  # - query: the query string
  # - swimmers_found: an array of Swimmer instances found so far; an empty array otherwise.
  #
  # === Returns
  # An array of Team instances
  #
  def get_possible_teams( query, swimmers_found )
    teams = TeamFinder.new( params[:query] ).search()
    # Add all the teams from the swimmer results but only if no matches where found:
    if teams.count < 1
      teams = swimmers_found.map{ |swimmer| swimmer.teams }.flatten.uniq
    end
    teams.each do |team|
      @result << {
          class:       'Team',
          id:          team.id,
          description: team.get_verbose_name,
          date:        Format.a_date( team.updated_at )
      }
    end
    teams
  end


  # Finds all the possible SwimmingPool results given the query string.
  #
  # The method updates also internally the @result array instance.
  #
  # === Params
  # - query: the query string
  #
  # === Returns
  # An array of SwimmingPool instances
  #
  def get_possible_pools( query )
    pools = SwimmingPoolFinder.new( params[:query] ).search()
    pools.each do |pool|
      @result << {
          class:       'SwimmingPool',
          id:          pool.id,
          description: pool.get_verbose_name,
          date:        Format.a_date( pool.updated_at )
      }
    end
    pools
  end


  # Finds all the possible Meeting results given the query string.
  # MeetingFinder will also search for swimmer & team results in nested entities for Meeting.
  #
  # The method updates also internally the @result array instance.
  #
  # === Params
  # - query: the query string
  #
  # === Returns
  # An array of Meeting instances
  #
  def get_possible_meetings( query )
    meetings = MeetingFinder.new( params[:query] ).search()
    meetings.each do |meeting|
      @result << {
          class:       'Meeting',
          id:          meeting.id,
          description: meeting.get_scheduled_date_with_verbose_name,
          date:        meeting.get_scheduled_date ? meeting.get_scheduled_date : meeting.header_date
      }
    end
    meetings
  end
  #-- -------------------------------------------------------------------------
  #++
end
