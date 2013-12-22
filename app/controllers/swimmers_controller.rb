# encoding: utf-8
require 'fileutils'                                 # Used to process filenames
require 'common/format'


class SwimmersController < ApplicationController

  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_user!, :verify_parameter
  # ---------------------------------------------------------------------------


  # Radiography for a specified swimmer id: main "Radiography" tab rendering
  #
  # == Params:
  # :id => the swimmer id to be processed
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
  # :id => the swimmer id to be processed
  #
  def medals
    # --- "Medals" tab: ---
    # TODO Count gold medals
    # TODO Count silver medals
    # TODO Count bronze medals
    # TODO Count 4th places

    # TODO Collect "Palmares": find all Championship holders having swimmer id = swimmer_id
    
    # FIXME this has not been tested yet:
    all_championships_records = MeetingIndividualResult.includes(
      :season, :event_type, :category_type, :gender_type, :pool_type
    ).is_valid.select(
      'seasons.id, meeting_program_id, swimmer_id, min(minutes*6000 + seconds*100 + hundreds) as timing, event_types.code, category_types.code, gender_types.code, pool_types.code'
    ).group(
      'seasons.id, event_types.code, category_types.code, gender_types.code, pool_types.code'
    )
    # TODO filter all_championships_records and find out how many records this swimmer still holds (if any)
  end
  # ---------------------------------------------------------------------------


  # Radiography for a specified swimmer id: "Best timings" tab rendering
  #
  # == Params:
  # :id => the swimmer id to be processed
  #
  def best_timings
    # --- "Best timings" tab: ---
    # TODO Collect all best timings for each swam style, divided for each pool type
  end
  # ---------------------------------------------------------------------------


  # Radiography for a specified swimmer id: "All the races" tab rendering
  #
  # == Params:
  # :id => the swimmer id to be processed
  #
  def all_races
    # --- "All the races" tab: ---
    # TODO Collect all the races swam for each style, divided for each pool type
  end
  # ---------------------------------------------------------------------------


  # Radiography for a specified swimmer id: "Misc" tab rendering
  #
  # == Params:
  # :id => the swimmer id to be processed
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
  # :id => the swimmer id to be processed
  #
  def verify_parameter
    swimmer_id = params[:id].to_i
    @swimmer = ( swimmer_id > 0 ) ? Swimmer.find_by_id( swimmer_id ) : nil
    unless ( @swimmer )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( root_path() ) and return
    end
  end
  # ---------------------------------------------------------------------------
end
