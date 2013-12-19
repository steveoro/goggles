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
    # TODO Collect teams list w/ latest affiliations
    # TODO Compute current category
    # TODO Count meeting presence
    # TODO Count meeting results
    # TODO Count total meters swam
    # TODO Count total race time
    # TODO Collect first race swam
    # TODO Collect last race swam
    # TODO Get highest score w/ meeting info

    # TODO Count total records among team
    # TODO Count how many disqualifications he/she has
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


  protected


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
