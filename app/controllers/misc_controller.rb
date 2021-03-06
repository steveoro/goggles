# encoding: utf-8
require 'common/format'
require 'wrappers/timing'


=begin

= MiscController

  - version:  6.003
  - author:   Leega, Steve A.

=end
class MiscController < ApplicationController

  # Uncomment this to make this controller available only to logged-id users with
  # an associated swimmer: (very restrictive)
  #
#  before_action :verify_parameter
  #-- -------------------------------------------------------------------------
  #++


  # #GET fin_score_calculation.
  #
  # FIN standard point calculation
  # If logged in and associated to a swimmer
  # suggests gender and category
  #
  def fin_score_calculation
    @tab_title = I18n.t('misc.fin_score_calculation')
    @current_season = Season.get_last_season_by_type( 'MASFIN' )
    @standard_points = -1                              # Init score with a non-displayable value
    @available_team_records = Hash.new

    # if user is logged in and associated to a swimmer
    # determinates default gender and category
    if current_user && current_user.swimmer
      @swimmer = current_user.swimmer.decorate if current_user
      @swimmer_category = @swimmer.get_category_type_for_season( @current_season.id )
      @swimmer_gender = @swimmer.gender_type
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # #AJAX POST-only compute_fin_score.
  #
  # Computes and renders the actual result of the FIN standard point calculation.
  #
  def compute_fin_score
    @current_season = Season.get_last_season_by_type( 'MASFIN' )
    @standard_points = -1                              # Init score with a non-displayable value
    @available_team_records = Hash.new
    # if user is logged in and associated to a swimmer
    # determinates default gender and category

    if current_user && current_user.swimmer
      @swimmer = current_user.swimmer.decorate if current_user
      @swimmer_category = @swimmer.get_category_type_for_season( @current_season.id )
      @swimmer_gender = @swimmer.gender_type
    end

    if request.xhr? && request.post?                   # === AJAX POST: ===
      category_type_id = params[:category_type_id] ? params[:category_type_id].to_i : 0
      gender_type_id   = params[:gender_type_id] ? params[:gender_type_id].to_i : 0
      pool_type_id     = params[:pool_type_id] ? params[:pool_type_id].to_i : 0
      event_type_id    = params[:event_type_id] ? params[:event_type_id].to_i : 0
      unless ( gender_type_id > 0 && category_type_id > 0 && pool_type_id > 0 && event_type_id > 0 )
        flash[:error] = I18n.t(:missing_request_parameter)
        return
      end

      @swimmer_category = CategoryType.find_by_id( category_type_id )
      @swimmer_gender = GenderType.find_by_id( gender_type_id )
      @current_pool = PoolType.find_by_id( pool_type_id )
      @current_event = EventType.find_by_id( event_type_id )
      minutes  = params[:minutes] ? params[:minutes].to_i : -1
      seconds  = params[:seconds] ? params[:seconds].to_i : -1
      hundreds = params[:hundreds] ? params[:hundreds].to_i : -1
      @timing = Timing.new( hundreds, seconds, minutes )

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
          flash[:error] = I18n.t('misc.wrong_event_or_pool')
        end
      else
        flash[:error] = I18n.t('misc.wrong_timing')
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # #GET fin_timing_calculation.
  #
  # FIN timing calculation based on given goal score
  # If logged in and associated to a swimmer
  # suggests gender and category
  #
  def fin_timing_calculation
    @tab_title = I18n.t('misc.fin_timing_calculation')
    @current_season = Season.get_last_season_by_type( 'MASFIN' )
    @timing   = Timing.new( 0 )
    @available_team_records = Hash.new

    # if user is logged in and associated to a swimmer
    # determinates default gender and category
    if current_user && current_user.swimmer
      @swimmer = current_user.swimmer.decorate if current_user
      @swimmer_category = @swimmer.get_category_type_for_season( @current_season.id )
      @swimmer_gender = @swimmer.gender_type
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # #AJAX POST compute_fin_timing.
  #
  # FIN timing calculation based on given goal score
  # If logged in and associated to a swimmer
  # suggests gender and category
  #
  def compute_fin_timing
    @current_season = Season.get_last_season_by_type( 'MASFIN' )
    @timing   = Timing.new( 0 )
    @available_team_records = Hash.new

    # if user is logged in and associated to a swimmer
    # determinates default gender and category
    if current_user && current_user.swimmer
      @swimmer = current_user.swimmer.decorate if current_user
      @swimmer_category = @swimmer.get_category_type_for_season( @current_season.id )
      @swimmer_gender = @swimmer.gender_type
    end

    if request.xhr? && request.post?                   # === AJAX POST: ===
      category_type_id = params[:category_type_id] ? params[:category_type_id].to_i : 0
      gender_type_id   = params[:gender_type_id] ? params[:gender_type_id].to_i : 0
      pool_type_id     = params[:pool_type_id] ? params[:pool_type_id].to_i : 0
      event_type_id    = params[:event_type_id] ? params[:event_type_id].to_i : 0
      unless ( gender_type_id > 0 && category_type_id > 0 && pool_type_id > 0 && event_type_id > 0 )
        flash[:error] = I18n.t(:missing_request_parameter)
        return
      end

      @swimmer_category = CategoryType.find_by_id( category_type_id )
      @swimmer_gender = GenderType.find_by_id( gender_type_id )
      @current_pool = PoolType.find_by_id( pool_type_id )
      @current_event = EventType.find_by_id( event_type_id )
      @standard_points  = params[:standard_points] ? params[:standard_points].to_f : 0.00

      if @standard_points && @standard_points > 300 && @standard_points < 1200
        # Verify event is ammissible for pool type
        if events_by_pool_type = EventsByPoolType.find_by_pool_and_event_codes( @current_pool.code, @current_event.code )
          score_calculation = ScoreCalculator.new( @current_season, @swimmer_gender, @swimmer_category, @current_pool, @current_event )
          @timing = score_calculation.get_fin_timing( @standard_points )
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
          flash[:error] = I18n.t('misc.wrong_event_or_pool')
        end
      else
        flash[:error] = I18n.t('misc.wrong_score')
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # #GET swimmer_matches
  # Swimmer matches "Duel in the pool"
  #
  # If logged in and associated to a swimmer
  # suggests locale swimmer
  #
  def swimmer_matches
    @tab_title = I18n.t('misc.swimmer_matches')
    @local_swimmer  = nil
    @visitor_swimmer = nil
    @sme             = nil
    @sme_dao         = nil

    # if user is logged in and associated to a swimmer
    if current_user && current_user.swimmer
      @local_swimmer = current_user.swimmer.decorate if current_user
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # #AJAX POST-only swimmer_matches
  #
  # Find out and show swimmer matches
  #
  def show_swimmer_matches
# DEBUG
#    puts "\r\n*********** show_swimmer_matches ***********"
#    puts params.inspect
    if request.xhr? && request.post?                   # === AJAX POST: ===
      local_swimmer_id  = params['local_swimmer'] ? params['local_swimmer']['id'].to_i : 0
      #local_swimmer_id  = 23
      visitor_swimmer_id = params['visitor_swimmer'] ? params['visitor_swimmer']['id'].to_i : 0
      #visitor_swimmer_id = 142

      unless ( local_swimmer_id > 0 && visitor_swimmer_id > 0 && Swimmer.exists?( local_swimmer_id ) && Swimmer.exists?( visitor_swimmer_id ) )
        flash[:error] = I18n.t(:missing_request_parameter)
        return
      end

      @local_swimmer  = Swimmer.find_by_id( local_swimmer_id )
      @visitor_swimmer = Swimmer.find_by_id( visitor_swimmer_id )

      @sme = SwimmerMatchEvaluator.new( @local_swimmer )
      #puts "\r\n- SME (before visitor set): " << @sme.inspect
      @sme_dao = @sme.matches_to_dao if @sme.set_visitor( @visitor_swimmer )
      #puts "\r\n- SME (AFTER visitor set): " << @sme.inspect
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # #GET training_paces_2000
  # Swimmer training pace calculation by testing 2000 meter continued swim 
  #
  def training_paces_2000
    @tab_title     = I18n.t('misc.training_paces_2000')
    @base_pace     = Timing.new( 0 )
    @stp           = nil
    @pool_type     = nil
    @time_swam     = nil
    @error_message = nil
  end
  #-- -------------------------------------------------------------------------
  #++

  # #AJAX POST-only pace_test_2000
  #
  # Calculate and show swimmer training paces
  #
  def show_training_paces_2000
# DEBUG
#    puts "\r\n*********** show_pace_test_2000 ***********"
#    puts params.inspect
    if request.xhr? && request.post?                   # === AJAX POST: ===
      test_type_code = params['test_type_code'] ? params['test_type_code'] : ''      
      test_date      = params['test_date'] ? params['test_date'] : Date.today      
      pool_type_id   = params['pool_type_id'] ? params['pool_type_id'].to_i : 0       
      minutes_swam   = params['minutes_swam'] ? params['minutes_swam'].to_i : 0
      seconds_swam   = params['seconds_swam'] ? params['seconds_swam'].to_i : 0
      hundreds_swam  = params['hundreds_swam'] ? params['hundreds_swam'].to_i : 0

      unless ( test_type_code.length > 0 ) &&  ( minutes_swam > 0 ) && ( pool_type_id && pool_type_id > 0 ) 
        #flash[:error] = I18n.t(:missing_request_parameter)
        @error_message = I18n.t('misc.dati_mancanti')
        return
      end
      unless ( minutes_swam > 20 )
        #flash[:error] = I18n.t('misc.record_del_mondo_in_allenamento')
        @error_message = I18n.t('misc.record_del_mondo_in_allenamento')
        return
      end
      
      if @error_message == nil
        @pool_type = PoolType.find( pool_type_id )
        @time_swam = Timing.new( hundreds_swam, seconds_swam, minutes_swam )
        stpc = SwimmerTrainingPaceCalculator.new( test_type_code, @time_swam )
        @base_pace = stpc.calculate_paces
        @stp = stpc.calculated_swimmer_paces
        #puts "\r\n- stp: " << @stp.inspect
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
      redirect_back( fallback_location: root_path ) and return
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
