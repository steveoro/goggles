# encoding: utf-8
require 'fileutils'                                 # Used to process filenames
require 'common/format'


class SwimmersController < ApplicationController

  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_entity_from_token!, except: [:index, :radio]
  before_filter :authenticate_entity!, except: [:index, :radio] # Devise HTTP log-in strategy
  # Parse parameters:
  before_filter :verify_parameter, except: [:index]
  before_filter :verify_parameter, except: [:index]
  # ---------------------------------------------------------------------------


  # Index/Search action
  #
  def index
    @title = I18n.t('swimmers.search_swimmers')
    @swimmers_grid = initialize_grid(
      Swimmer,
      order: 'swimmers.complete_name',
      order_direction: 'asc',
      per_page: 20
    )
  end
  # ----------------------------------------------------------------------------


  # Radiography for a specified swimmer id: main ID card "Radiography" tab rendering.
  #
  # == Params:
  # id: the swimmer id to be processed
  #
  def radio
    # --- "Radiography" tab: ---
    @team_ids = @swimmer.teams.collect{|row| row.id }.uniq
                                                    # Retrieve all records for the Swimmer Team(s)
    all_teams_records = MeetingIndividualResult.includes(
      :event_type, :category_type, :gender_type, :pool_type
    ).is_valid.where(
      [ 'team_id IN (?)', @team_ids ]
    ).select(
      'meeting_program_id, team_id, swimmer_id, min(minutes*6000 + seconds*100 + hundreds) as timing, event_types.code, category_types.code, gender_types.code, pool_types.code'
    ).group(
      'team_id, event_types.code, category_types.code, gender_types.code, pool_types.code'
    )
                                                    # Count how many Team records are held by this swimmer:
    @tot_team_records_for_this_swimmer = 0
    all_teams_records.each{ | mir |
      @tot_team_records_for_this_swimmer += 1 if (mir.swimmer_id == @swimmer.id)
    }
  end
  # ---------------------------------------------------------------------------


  # Radiography for a specified swimmer id: "Medals" tab rendering
  #
  # == Params:
  # id: the swimmer id to be processed
  #
  def medals
    # --- "Medals" tab: ---
    @gold_medals   = MeetingIndividualResult.count_swimmer_ranks_for( @swimmer.id, 1 )
    @silver_medals = MeetingIndividualResult.count_swimmer_ranks_for( @swimmer.id, 2 )
    @bronze_medals = MeetingIndividualResult.count_swimmer_ranks_for( @swimmer.id, 3 )
    @wooden_medals = MeetingIndividualResult.count_swimmer_ranks_for( @swimmer.id, 4 )
                                                    # Collect "Palmares": find all Championship holders having swimmer id = swimmer_id
    # FIXME this has not been tested yet:
    all_championships_records = MeetingIndividualResult.includes(
      :season, :event_type, :category_type, :gender_type, :pool_type
    ).is_valid.select(
      'seasons.id, meeting_program_id, swimmer_id, min(minutes*6000 + seconds*100 + hundreds) as timing, event_types.code, category_types.code, gender_types.code, pool_types.code'
    ).group(
      'seasons.id, event_types.code, category_types.code, gender_types.code, pool_types.code'
    )
                                                    # Filter all_championships_records and find out how many records this swimmer still holds (if any)
    # FIXME this has not been tested yet:
   @tot_season_records_for_this_swimmer = 0         # Count how many Season records are held by this swimmer:
    all_championships_records.each{ | mir |
      @tot_season_records_for_this_swimmer += 1 if (mir.swimmer_id == @swimmer.id)
    }

    # TODO Collect actual Palmares array (displayed on a table)
  end
  # ---------------------------------------------------------------------------


  # Radiography for a specified swimmer id: "Best timings" tab rendering
  #
  # == Params:
  # id: the swimmer id to be processed
  #
  def best_timings
    # --- "Best timings" tab: ---
    # TODO Collect all best timings for each swam style, divided for each pool type
  end
  # ---------------------------------------------------------------------------


  # Radiography for a specified swimmer id: "All the races" tab rendering
  #
  # == Params:
  # id: the swimmer id to be processed
  #
  def all_races
    # --- "All the races" tab: ---                  # Collect all the races swam for each style, divided for each pool type:
    swimmer_mirs = MeetingIndividualResult.is_valid.where( swimmer_id: @swimmer.id )
    @mirs_in_25mt = swimmer_mirs.joins( :pool_type ).where( ['pool_types.id = ?', PoolType::MT25_ID])
    @mirs_in_50mt = swimmer_mirs.joins( :pool_type ).where( ['pool_types.id = ?', PoolType::MT50_ID])

    # TODO get all the partial timings for each race & display them on a grid
  end
  # ---------------------------------------------------------------------------


  # Radiography for a specified swimmer id: "Misc" tab rendering
  #
  # == Params:
  # id: the swimmer id to be processed
  #
  def misc
    # --- "Misc" tab: ---
    # TODO
  end
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------


  private


  # Verifies that a swimmer id is provided as parameter; otherwise
  # redirects to the home page.
  # Assigns the @swimmer instance when successful.
  #
  # == Params:
  # id: the swimmer id to be processed by most of the methods (see before filter above)
  #
  def verify_parameter
    swimmer_id = params[:id].to_i
    @swimmer = ( swimmer_id > 0 ) ? Swimmer.find_by_id( swimmer_id ) : nil
    unless ( @swimmer )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to(:back) and return
    end
  end
  # ---------------------------------------------------------------------------
end
