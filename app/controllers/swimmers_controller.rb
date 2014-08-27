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
    @tab_title = I18n.t('radiography.radio_tab')
  end
  #-- -------------------------------------------------------------------------
  #++


  # Radiography for a specified swimmer id: "Medals" tab rendering
  #
  # == Params:
  # id: the swimmer id to be processed
  #
  def medals
    # --- "Medals" tab: ---
    @swimmer = SwimmerDecorator.decorate( @swimmer )
    @tab_title = I18n.t('radiography.medals_tab')
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
    # --- "Best Timings" tab: ---
    @swimmer = SwimmerDecorator.decorate( @swimmer )
    @tab_title = I18n.t('radiography.best_timings_tab')
    current_season = Season.get_last_season_by_type( 'MASFIN' )

    # Leega.
    # TODO: Delegate to an AJAX function. I've removed the prevoius AJAX call
    collector = PersonalBestCollector.new( @swimmer )

    # Collect personal bests
    collector.full_scan do |this, events_by_pool_type|
      this.collect_from_all_category_results_having( events_by_pool_type, 'SPB' )
    end

    # Collect last result
    collector.full_scan do |this, events_by_pool_type|
      this.collect_last_results_having( events_by_pool_type, 'SLP' )
    end

    # Collect seasonal bests
    collector.set_start_date( current_season.begin_date )
    collector.set_end_date( current_season.end_date )
    collector.full_scan do |this, events_by_pool_type|
      this.collect_from_all_category_results_having( events_by_pool_type, 'SSB' )
    end

    @grid_builder = PersonalBestGridBuilder.new( collector )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Radiography for a specified swimmer id: "Full History: career" tab rendering.
  #
  # == Params:
  # id: the swimmer id to be processed
  #
  def full_history_1
    # --- "Full History" tab: ---
    @swimmer = SwimmerDecorator.decorate( @swimmer )
    @tab_title = I18n.t('radiography.full_history_tab1')
    @all_mirs = MeetingIndividualResult.sort_by_date('ASC').where( swimmer_id: @swimmer.id )

    # TODO
    # - Group all MIR swam by pool type
    # - Group all MIR swam by event codes
    # - Count total MIR swam, group by pool type
    # - Count total MIR swam, group by event code
    # - For each event code swam (50FA, 50SL, ...)
    #   => draw a scatter graph w/ 1 series x pool type (x: date, y: MIR timing)
    #   => for each point, on-mouse-over tooltip w/ HTML details for the MIR + links to the corresponding #full_show of the meeting
  end
  #-- -------------------------------------------------------------------------
  #++


  # Radiography for a specified swimmer id: "Full History: analysis" tab rendering.
  #
  # == Params:
  # id: the swimmer id to be processed
  #
  def full_history_2
    # --- "Full History" tab: ---
    @swimmer = SwimmerDecorator.decorate( @swimmer )
    @tab_title = I18n.t('radiography.full_history_tab2')
    @all_mirs = MeetingIndividualResult.where( swimmer_id: @swimmer.id )

    # TODO
    # - Collect all @swimmer MIRs
    # - Group all MIR swam by pool type
    # - Group all MIR swam by event codes
    # - Count total MIR swam, group by pool type
    # - Count total MIR swam, group by event code
    # - For each event code swam (50FA, 50SL, ...)
    #   => draw a scatter graph w/ 1 series x pool type (x: date, y: MIR timing)
    #   => for each point, on-mouse-over tooltip w/ HTML details for the MIR + links to the corresponding #full_show of the meeting
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
    # --- "Misc" tab: ---
    @swimmer = SwimmerDecorator.decorate( @swimmer )
    @tab_title = I18n.t('radiography.misc_tab')
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
        if events_by_pool_type = EventsByPoolType.find_by_pool_and_event_codes( @current_pool.code, @current_event.code )
          score_calculation = ScoreCalculator.new( @swimmer, @current_season, @current_pool, @current_event )
          @standard_points = score_calculation.get_fin_score( @timing )
          @current_time_standard = score_calculation.get_time_standard

          # TODO
          # Retrieves world record
          @world_record = I18n.t('coming_soon')

          # TODO
          # Retrieves national record
          @national_record = I18n.t('coming_soon')

          # Retrieve seasonal records:
          #seasonal_record_rc = RecordCollector.new( season: @current_season )
          seasonal_record_rc = RecordCollector.new( start_date: @current_season.begin_date, end_date: @current_season.end_date )
          @seasonal_record = RecordCollectionDecorator.decorate(
            seasonal_record_rc.collect_from_results_having(
              @current_pool.code,
              @current_event.code,
              @swimmer_category.code,
              @swimmer_gender.code,
              'SOR'
            )
          ).to_complete_html_list

          # Retrieve swimmer personal best:
          # Scan all time results, without category
          personal_best_pb = PersonalBestCollector.new( @swimmer )
          @personal_best = PersonalBestCollectionDecorator.decorate(
            personal_best_pb.collect_from_all_category_results_having(
              events_by_pool_type,
              'SPB'
            )
          ).to_short_meeting_html_list

          # Retrieves seasonal best for swimmer for all current seasons
          seasonal_best_pb = PersonalBestCollector.new( @swimmer, start_date: @current_season.begin_date, end_date: @current_season.end_date )
          @seasonal_best = PersonalBestCollectionDecorator.decorate(
            seasonal_best_pb.collect_from_all_category_results_having(
              events_by_pool_type,
              'SSB'
            )
          ).to_short_meeting_html_list

          # Retrieve team records:
          available_teams = @swimmer.get_teams
          @available_team_records = Hash.new
          available_teams.each do |team|
            team_rc = RecordCollector.new( team: team )
            team_record = RecordCollectionDecorator.decorate(
              team_rc.collect_from_records_having(
                @current_pool.code,
                @current_event.code,
                @swimmer_category.code,
                @swimmer_gender.code,
                'TTB'
              )
            ).to_complete_html_list
            @available_team_records[team] = team_record
          end
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
