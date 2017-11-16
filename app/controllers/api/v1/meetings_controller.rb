# encoding: utf-8
require 'meeting_finder'


#
# R/O RESTful API controller
#
class Api::V1::MeetingsController < Api::BaseController

  respond_to :json

  # Require authorization before invoking any of this controller's actions:
  before_action :authenticate_user_from_token!
  before_action :ensure_format
  # ---------------------------------------------------------------------------


  # Returns a JSON-encoded Array of all the rows.
  # Each array element is a JSON-encoded hash of a single row.
  # The keys of the Hash are the attributes as string.
  #
  # === Additional params:
  # - 'code_like': a matching (sub)string for the Meeting.code
  # - 'header_year': the exact Meeting.header_year
  #
  def index
    # (This uses Squeel DSL syntax for where clauses)
    if params[:code_like]
      filter = "%#{params[:code_like]}%"
      @meetings = Meeting.where( ["code LIKE ?", filter] ).order( :header_date )
    else
      @meetings = Meeting.order(:header_date)
    end
    if params[:header_year]
      filter = params[:header_year].to_i
      @meetings = @teams.where( header_year: filter ).order( :header_date )
    end
    render json: @meetings
  end


  # Returns a JSON-encoded hash of all the details concerning a specified Meeting :id.
  #
  # === Params:
  # - id: the Meeting.id
  #
  # === Returns:
  # A JSON-encoded Hash with the structure:
  #
  #      {
  #        # Meeting header:
  #        id:         @meeting.id,
  #        updated_at: @meeting.updated_at.to_i,
  #        name:       @meeting.get_full_name,
  #        date:       @meeting.get_scheduled_date,
  #        season:     @meeting.get_season_type,
  #        pools:      @meeting.swimming_pools.uniq.map{ |pool| pool.get_verbose_name },
  #
  #        # Short names to be displayed on tab views or on menus, i.e.:
  #        events:     ["50 SL", "50 DO", ...],
  #        genders:    ['M','F']
  #        categories: ["SEN", "M20", "M25", ...]
  #
  #        # Actual result data for this meeting, structed in several self-contained
  #        # array of Hash, in this hierarchy:
  #        # array of events -> array of event's programs -> array of program's results
  #        results:    [
  #            {
  #              id: <event_id>,
  #              name: <displayable event name>,
  #              date: <scheduled date for event>,
  #
  #              progs: [
  #                  {
  #                    id: <program_id>,
  #                    category: <program's category displayable name>,
  #                    gender: <program's gender>,
  #
  #                    mirs: [
  #                        {
  #                          id:           mir.id,
  #                          swimmer:      mir.get_swimmer_name,
  #                          swimmer_year: mir.get_year_of_birth,
  #                          team:         mir.get_team_name,
  #                          timing:       mir.get_timing,
  #                          rank:         mir.get_rank_description,
  #                          rank_valid:   mir.is_valid_for_ranking,
  #                          passages:  [
  #                              {
  #                                id:       passage.id,
  #                                distance: passage.get_passage_distance,
  #                                timing:   passage.get_timing,
  #                                label:    passage.get_short_name
  #                              },
  #                              { # passage #2, ...
  #                              }
  #                          ],
  #                          std_points:   mir.get_formatted_standard_points,
  #                          ind_points:   mir.get_formatted_individual_points
  #                        },
  #                        { # MIR #2 and so on...
  #                        },
  #                    ],
  #
  #                    mrrs: [
  #                        {
  #                          id:           mrr.id,
  #                          team:         mrr.get_team_name,
  #                          timing:       mrr.get_timing,
  #                          rank:         mrr.get_rank_description,
  #                          rank_valid:   mrr.is_valid_for_ranking,
  #                          std_points:   mrr.get_formatted_standard_points,
  #                          met_points:   mrr.get_formatted_meeting_points
  #                        },
  #                        { # MRR #2 and so on...
  #                        },
  #                    ],
  #
  #                    entries: [
  #                        { # Entry #1
  #                          # ...
  #                          # TODO
  #                          # ...
  #                        },
  #                        { # Entry #2 and so on...
  #                        },
  #                    ]
  #                  },
  #
  #                  { # program #2 and so on...
  #                  },
  #              ]
  #            },
  #
  #            { # event #2 and so on...
  #            }
  #        ]
  #      }
  #
  def show
    @meeting    = Meeting.find(params[:id])
    # List of full event rows:
    mevs_list   = @meeting.meeting_events.includes( :event_type, :stroke_type )
                      .order( 'event_types.is_a_relay, meeting_events.event_order' )

    @result_hash = {
        # Meeting header:
        id:         @meeting.id,
        updated_at: @meeting.updated_at.to_i,
        name:       @meeting.get_full_name,
        date:       @meeting.get_scheduled_date,
        season:     @meeting.get_season_type,
        pools:      @meeting.swimming_pools.uniq.map{ |pool| pool.get_verbose_name },
        # Short names to be displayed on tab views or on menus:
        events:     mevs_list.map{ |row| row.event_type.i18n_short }
                      .uniq.compact,
        genders:    @meeting.meeting_programs.includes(:gender_type)
                      .map{ |row| row.gender_type.code }
                      .uniq.compact,
        categories: @meeting.meeting_programs.includes(:category_type)
                      .map{ |row| row.category_type.get_short_name }
                      .uniq.compact,
        # Actual result data for this meeting:
        # retrieve all results, with hierarchy
        results:    prepare_result_list( mevs_list )
    }

    render json: @result_hash
  end
  #-- -------------------------------------------------------------------------
  #++


  # Tags/Untags a specific meeting id for the current_user.
  # (JSON format) PUT-only action.
  #
  # === Params:
  # - id: the Meeting.id to be tagged/untagged for the current_user.
  #
  def tag_for_user
    meeting = Meeting.find_by_id( params[:id] )
    # Meeting found?
    if meeting && current_user
      # Meeting already tagged?
      if meeting.tags_by_user_list.include?( "u#{ current_user.id }" )
        meeting.tags_by_user_list.remove( "u#{ current_user.id }" )
      else
        meeting.tags_by_user_list.add( "u#{ current_user.id }" )
      end
      # Save and return result:
      if meeting.save
        render( status: :ok, json: { success: true } ) and return
      else
        render( status: 422, json: { success: false, error: "Error during save!" } )
      end
    end
    render( status: 422, json: { success: false, error: "Invalid parameters!" } )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Tags/Untags a specific meeting id for the specified TeamAffiliation.id.
  # (JSON format) PUT-only action.
  #
  # Keep in mind that the action in named #tag_for_team for brevity, but the
  # actual tag is tied to a TeamAffiliation id, not a Team id.
  #
  # === Params:
  # - id: the Meeting.id to be tagged/untagged for the current_user.
  # - t: the TeamAffiliation.id to be tagged/untagged for the current_user.
  #
  def tag_for_team
    meeting = Meeting.find_by_id( params[:id] )
    # Meeting found?
    if meeting && params[:t].present?
      # Meeting already tagged?
      if meeting.tags_by_team_list.include?( "ta#{ params[:t] }" )
        meeting.tags_by_team_list.remove( "ta#{ params[:t] }" )
      else
        meeting.tags_by_team_list.add( "ta#{ params[:t] }" )
      end
      # Save and return result:
      if meeting.save
        render( status: :ok, json: { success: true } ) and return
      else
        render( status: 422, json: { success: false, error: "Error during save!" } )
      end
    end
    render( status: 422, json: { success: false, error: "Invalid parameters!" } )
  end
  #-- -------------------------------------------------------------------------
  #++


  require 'rest_client'
#  require 'net/http' (not used anymore)
  require 'uri'

  # Downloads a remote data page given its URL.
  #
  # === Params:
  # - url:        the URL tp be downloaded as plain text.
  # - body_id:    the selector DIV ID(s) to be extracted as main "body".
  # - strip_id:   the selector DIV ID(s) to be stripped from the "body" extracted
  #               with the "body_id" parameter.
  #
  # === Returns:
  # The plain text payload of the page, extracted and stripped as specifed.
  #
  def download
    if params[:url].present?
      uri = URI( URI.escape( params[:url] ) )
# DEBUG
#      puts "\r\nURI..........: #{ uri.inspect }"

      # Old method: DOES NOT WORK WITH Proxy/Load-balancers redirects:
#      web_response = Net::HTTP.get_response( uri )

      logger.info("------[ api/v1/meetings#download ]------")
      logger.info("Requesting download for '#{ uri }'...")

      # Method #1
#      web_response = RestClient::Request.execute( url: uri, method: :get, verify_ssl: false) do |response, request, result, &block|
#        case response.code
#        when 200..207
#          response
#        else
#          logger.error("Response error: #{ response.code }")
#          nil
#        end
#      end

      # Method #2
      web_response = begin
        RestClient::Request.execute( url: uri, method: :get, verify_ssl: false)
      rescue
        logger.error("Response error: #{ response.code }")
        nil
      end

# DEBUG
      puts "response.....: #{ web_response.inspect }"
#      puts "response body: #{ web_response.body }"

      if web_response && web_response.respond_to?(:body) && web_response.body.present?
        logger.error("Response ok. Processing data with Nokogiri...")
        body_id   = params[:body_id].present?  ? params[:body_id]   : "#content"
        strip_id  = params[:strip_id].present? ? params[:strip_id]  : ".stampa-loca"
        html_doc = Nokogiri::HTML( web_response.body ).css( body_id )
        html_doc.css( strip_id ).unlink             # Remove non-working external href to PDF print preview or other specified DIV IDs
        render( status: :ok, json: { success: true, data: html_doc.to_html } )
      else
        render( status: 422, json: { success: false, error: "HTTP GET failed!" } )
      end
    else
      render( status: 422, json: { success: false, error: "Invalid parameters!" } )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  protected


  # Prepares the result list for the result hash of #show() given the list of
  # Meeting Events +mevs_list+.
  #
  def prepare_result_list( mevs_list )
    mevs_list.map do |event|
      {
        id:         event.id,
        name:       event.event_type.i18n_short,
        date:       event.get_scheduled_date,

        progs: event.meeting_programs.includes(:category_type, :gender_type)
          .order('category_types.age_begin').map do |prog|
             {
               id:       prog.id,
               category: prog.category_type.get_short_name,
               gender:   prog.gender_type.code,
               # MeetingIndividualResult array:
               mirs:  prog.meeting_individual_results.includes(:swimmer, :team)
                        .map do |mir|
                          mir = mir.decorate
                          {
                            id:           mir.id,
                            swimmer:      mir.get_swimmer_name,
                            swimmer_year: mir.get_year_of_birth,
                            team:         mir.get_team_name,
                            timing:       mir.get_timing,
                            rank:         mir.get_rank_description,
                            rank_valid:   mir.is_valid_for_ranking,
                            passages:     mir.get_passages
                                            .map do |passage|
                                              {
                                                id:       passage.id,
                                                distance: passage.get_passage_distance,
                                                timing:   passage.get_timing,
                                                label:    passage.get_short_name
                                              }
                                            end,
                            std_points:   mir.get_formatted_standard_points,
                            ind_points:   mir.get_formatted_individual_points
                          }
                        end,

               # MeetingRelayResult array:
               mrr:  prog.meeting_relay_results.includes(:team)
                        .map do |mrr|
                          mrr = mrr.decorate
                          {
                            id:           mrr.id,
                            team:         mrr.get_team_name,
                            timing:       mrr.get_timing,
                            rank:         mrr.get_rank_description,
                            rank_valid:   mrr.is_valid_for_ranking,
                            std_points:   mrr.get_formatted_standard_points,
                            met_points:   mrr.get_formatted_meeting_points
                          }
                        end,

               # MeetingEntries array (no decorator for MeetingEntry):
               entries:  prog.meeting_entries
                        .map do |entry|
                          {
                            id:                 entry.id,
                            swimmer:            entry.get_swimmer_name,
                            swimmer_year:       entry.get_year_of_birth,
                            team:               entry.get_team_name,
                            timing:             entry.get_timing,
                            start_list_number:  entry.start_list_number,
                            lane_number:        entry.lane_number,
                            heat_number:        entry.heat_number,
                            is_no_time:         entry.is_no_time
                          }
                        end
             }
          end
      }
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
