# encoding: utf-8
require 'fileutils'                                 # Used to process filenames
require 'common/format'
require 'wrappers/timing'


=begin

= SwimmersController

  - version:  4.00.405
  - author:   Steve A., Leega

=end
class SwimmersController < ApplicationController

  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_user_from_token!, except: [:index, :radio]
  before_filter :authenticate_user!, except: [:index, :radio] # Devise HTTP log-in strategy
  # Parse parameters:
  before_filter :verify_parameter, except: [:index]
  #-- -------------------------------------------------------------------------
  #++

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
  #-- -------------------------------------------------------------------------
  #++

  # Radiography for a specified swimmer id: main ID card "Radiography" tab rendering.
  #
  # == Params:
  # id: the swimmer id to be processed
  #
  def radio
    # --- "Radiography" tab: ---
    @team_ids = @swimmer.teams.collect{|row| row.id }.uniq
    @swimmer = SwimmerDecorator.decorate( @swimmer )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Radiography for a specified swimmer id: "Medals" tab rendering
  #
  # == Params:
  # id: the swimmer id to be processed
  #
  def medals
    @swimmer = SwimmerDecorator.decorate( @swimmer )
    # TODO REFACTOR this using the new Decorator:
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
    # TODO create a table with all the medals divided by event type / pool type
  end
  #-- -------------------------------------------------------------------------
  #++


  # Radiography for a specified swimmer id: "Best timings" tab rendering
  #
  # == Params:
  # id: the swimmer id to be processed
  #
  def best_timings
    @swimmer = SwimmerDecorator.decorate( @swimmer )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Radiography for a specified swimmer id: "Misc" tab rendering
  # FIN standard point calculation
  #
  # == Params:
  # id: the swimmer id to be processed
  #
  def misc
    @swimmer = SwimmerDecorator.decorate( @swimmer )
    # --- "Misc" tab: ---
    @current_season = Season.get_last_season_by_type( 'MASFIN' )
    @standard_points = -1                           # Init score with a non-displayable value
    @swimmer_category = @swimmer.get_category_type_for_season( @current_season.id )
    @swimmer_gender = @swimmer.gender_type

    if request.post?                                # === POST: ===
      pool_type_id  = params[:pool_type] && params[:pool_type][:id] ? params[:pool_type][:id].to_i : 0
      event_type_id = params[:event_type] && params[:event_type][:id] ? params[:event_type][:id].to_i : 0
      unless ( pool_type_id > 0 && event_type_id > 0 )
        flash[:error] = I18n.t(:missing_request_parameter)
        redirect_to( swimmer_misc_path(@swimmer) ) and return
      end
      @current_pool = PoolType.find_by_id( pool_type_id )
      @current_event = EventType.find_by_id( event_type_id )
      minutes  = params[:minutes] ? params[:minutes].to_i : -1
      seconds  = params[:seconds] ? params[:seconds].to_i : -1
      hundreds = params[:hundreds] ? params[:hundreds].to_i : -1
      @timing = Timing.new( hundreds, seconds, minutes )

      if @timing && @timing.to_hundreds > 0
        # Verify event is ammissible for pool type
        if @current_event.events_by_pool_types.where(pool_type_id: pool_type_id).count > 0
          score_calculation = ScoreCalculator.new( @swimmer, @current_season, @current_pool, @current_event )
          @standard_points = score_calculation.get_fin_score( @timing )
          @current_time_standard = score_calculation.get_time_standard

          # - Render the result with verbose cosmetics data such as
          #   base time, world record holder, national record holder,
          #   personal best, seasonal best, team record, link to standard FIN base points, more?!?

          # Retrieve team records
          team_rc = RecordCollector.new( team: @swimmer.get_current_team(@current_season) )
          @team_record = RecordCollectionDecorator.decorate(
            team_rc.collect_from_records_having(
              @current_pool.code,
              @current_event.code,
              @swimmer_category.code,
              @swimmer_gender.code
            )
          ).to_complete_html_list

          # Retrieve swimmer personal best
          swimmer_rc = RecordCollector.new( swimmer: @swimmer )
          @swimmer_record = RecordCollectionDecorator.decorate(
            swimmer_rc.collect_from_results_having(
              @current_pool.code,
              @current_event.code,
              @swimmer_category.code,
              @swimmer_gender.code
            )
          ).to_complete_html_list

          # Retrieve team records
          season_rc = RecordCollector.new( season: @current_season )
          @season_record = RecordCollectionDecorator.decorate(
            season_rc.collect_from_records_having(
              @current_pool.code,
              @current_event.code,
              @swimmer_category.code,
              @swimmer_gender.code
            )
          ).to_complete_html_list
        else
          flash[:error] = I18n.t('radiography.wrong_event_or_pool')
          redirect_to( swimmer_misc_path(@swimmer) ) and return
        end
      else
        flash[:error] = I18n.t('radiography.wrong_timing')
        redirect_to( swimmer_misc_path(@swimmer) ) and return
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Verifies that a swimmer id is provided as parameter; otherwise
  # redirects to the home page.
  # Assigns the @swimmer instance when successful.
  #
  # == Params:
  # id: the swimmer id to be processed by most of the methods (see before filter above)
  #
  def verify_parameter
    set_swimmer
    unless ( @swimmer )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to(:back) and return
    end
  end

  # Verifies that a swimmer id is provided as a parameter to this controller.
  # Assigns the @swimmer instance when successful.
  #
  # == Controller Params:
  # id: the swimmer id to be processed by most of the methods (see before filter above)
  #
  def set_swimmer
    @swimmer = Swimmer.find_by_id( params[:id].to_i )
  end
  #-- -------------------------------------------------------------------------
  #++
end
