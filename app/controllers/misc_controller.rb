# encoding: utf-8
require 'common/format'
require 'wrappers/timing'


=begin

= MiscController

  - version:  4.00.613
  - author:   Leega

=end
class MiscController < ApplicationController

  # FIN standard point calculation
  # If logged in and associated to a swimmer
  # suggests gender and category
  #
  def fin_score_calculation
    @tab_title = I18n.t('radiography.misc_tab')
    @current_season = Season.get_last_season_by_type( 'MASFIN' )
    @standard_points = -1                              # Init score with a non-displayable value
    
    # if user is logged in and associated to a swimmer
    # determinates default gender and category
    if current_user && current_user.swimmer
      @swimmer = current_user.swimmer.decorate if current_user
      @swimmer_category = @swimmer.get_category_type_for_season( @current_season.id )
      @swimmer_gender = @swimmer.gender_type
    end

    if request.post?                                # === POST: ===
      category_type_id = params[:category_type_id] ? params[:category_type_id].to_i : 0
      gender_type_id   = params[:gender_type_id] ? params[:gender_type_id].to_i : 0
      pool_type_id     = params[:pool_type] && params[:pool_type][:id] ? params[:pool_type][:id].to_i : 0
      event_type_id    = params[:event_type] && params[:event_type][:id] ? params[:event_type][:id].to_i : 0
      @swimmer_category = CategoryType.find_by_id( category_type_id ) if category_type_id > 0 
      @swimmer_gender = GenderType.find_by_id( gender_type_id ) if gender_type_id > 0
      @current_pool = PoolType.find_by_id( pool_type_id ) if pool_type_id > 0
      @current_event = EventType.find_by_id( event_type_id ) if event_type_id > 0
      minutes  = params[:minutes] ? params[:minutes].to_i : -1
      seconds  = params[:seconds] ? params[:seconds].to_i : -1
      hundreds = params[:hundreds] ? params[:hundreds].to_i : -1
      @timing = Timing.new( hundreds, seconds, minutes )
      unless ( gender_type_id > 0 && category_type_id > 0 && pool_type_id > 0 && event_type_id > 0 )
        flash[:error] = I18n.t(:missing_request_parameter)
        redirect_to( misc_fin_score_calculation_path ) and return
      end

      if @timing && @timing.to_hundreds > 0
        # Verify event is ammissible for pool type
        if events_by_pool_type = EventsByPoolType.find_by_pool_and_event_codes( @current_pool.code, @current_event.code )
          score_calculation = ScoreCalculator.new( @current_season, @swimmer_gender, @swimmer_category, @current_pool, @current_event )
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

          if @swimmer
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
          end
        else
          flash[:error] = I18n.t('radiography.wrong_event_or_pool')
          redirect_to( misc_fin_score_calculation_path ) and return
        end
      else
        flash[:error] = I18n.t('radiography.wrong_timing')
        redirect_to( misc_fin_score_calculation_path ) and return
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
    @swimmer = @swimmer.decorate if @swimmer
  end
  #-- -------------------------------------------------------------------------
  #++
end
