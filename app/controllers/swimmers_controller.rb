# encoding: utf-8
require 'fileutils'                                 # Used to process filenames
require 'common/format'
require 'wrappers/timing'


=begin

= SwimmersController

  - version:  4.00.515
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
    @tab_title = I18n.t('radiography.medals_tab')
    @medal_types = MedalType.sort_by_rank
    @seasonal_medal_collection = []
    @event_medal_collection = {}

    # TODO
    # Refactor this part using medal_types
    # Collects total for summary section
    # To ensure cool render add the uri image resource too medal_types!
    @gold_medals   = @swimmer.get_total_gold_medals
    @silver_medals = @swimmer.get_total_silver_medals
    @bronze_medals = @swimmer.get_total_bronze_medals
    @wooden_medals = @swimmer.get_total_wooden_medals

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

    # Collects medals for season types and presents in a table
    # with total columns
    @swimmer.season_types.uniq.each do |season_type|
      # Creates an hash for seasonal medals
      seasonal_medals = Hash.new
      seasonal_medals[:season_type] = season_type.get_full_name

      # Cycles between medal types
      @medal_types.map{ |medal_type| medal_type.rank }.each do |medal_rank|
        seasonal_medals[medal_rank] = @swimmer.meeting_individual_results
          .is_valid
          .for_season_type(season_type)
          .has_rank(medal_rank.to_i)
          .count
      end

      # FIXME this has not been tested yet:
      seasonal_medals[:tot_season_records] = 0
      all_championships_records.each{ | mir |
        seasonal_medals[:tot_season_records] += 1 if (mir.swimmer_id == @swimmer.id && mir.season_type.id == season_type.id)
      }

      @seasonal_medal_collection << seasonal_medals
    end

    # Coolect medals for event types and presents in a table
    # with total columns
    PoolType.only_for_meetings.each do |pool_type|
      # Divides events by pool type
      @event_medal_collection[pool_type.code] = []
      pool_type.events_by_pool_types.not_relays.each do |events_by_pool_type|
        # Collects events for pool type
        event_medals = {}
        if @swimmer.meeting_individual_results
            .is_valid
            .for_event_by_pool_type(events_by_pool_type)
            .count > 0
          event_medals[:event_type] = events_by_pool_type.event_type_i18n_short

          # Cycles between medal types
          @medal_types.map{ |medal_type| medal_type.rank }.each do |medal_rank|
            event_medals[medal_rank] = @swimmer.meeting_individual_results
              .is_valid
              .for_event_by_pool_type(events_by_pool_type)
              .has_rank(medal_rank.to_i)
              .count
          end
        end

        # Consider event only if is present at least one medal
        @event_medal_collection[pool_type.code] << event_medals if event_medals.size > 0
      end
    end
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
  # Creates a grid, splitted by pool type, with the events as columns and
  # the meetings attended in cronological order as rows
  #
  # == Params:
  # id: the swimmer id to be processed
  #
  def full_history_1
    # --- "Full History by date" tab: ---
    @tab_title = I18n.t('radiography.full_history_by_date')

    # Cycles between pool types suitable for meetings
    @full_history_by_date = Hash.new
    PoolType.only_for_meetings.each do |pool_type|
      # Collect results for the pool type
      mirs = @swimmer.meeting_individual_results
        .joins(:event_type)
        .for_pool_type( pool_type )
        .sort_by_date
        .select([:id, :minutes, :seconds, :hundreds])

      # The event_by_date structure
      # The structure is an array of hashes with elements formed by
      # the meeting (meeting) that contains the meeting reference
      # and the event_type_codes ("50SL", "50FA", etc.) that
      # contains the meeting_individual_result swam in the event_type
      # at the meeting.
      # TODO Refactor that structure as a collection, like personal bests
      event_by_date = []
      mirs.each do |meeting_individul_result|
        # If thi is the first meeting result creates a new element, else add the result for the event type
        found = event_by_date.rindex{ |meeting_hash| meeting_hash[:meeting] == meeting_individul_result.meeting }
        if found
          event_by_date[found][meeting_individul_result.event_type.code] = meeting_individul_result
        else
          new_hash = {}
          new_hash[:meeting] = meeting_individul_result.meeting
          new_hash[meeting_individul_result.event_type.code] = meeting_individul_result
          event_by_date << new_hash
        end
      end

      # Collect event types swam to create grid structure
      event_list = mirs.select('event_types.code').map{ |mir| mir.event_type.code }.uniq

      # Sort event type list by event type style order
      #event_list.sort!{ |el_prev, el_next| EventType.find_by_code(el_prev) <=> EventType.find_by_code(el_next) }
      event_list = EventType.sort_list_by_style_order( event_list )
      @full_history_by_date[pool_type.code] = [event_list, event_by_date]
    end

    # TODO
    # Evidenziate personal bests
    # Should be better to have information already stored in mirs
    # even calculate it run time
  end
  #-- -------------------------------------------------------------------------
  #++


  # Radiography for a specified swimmer id: "Full History: analysis" tab rendering.
  # Create a grid for each event_by_pool_type swam
  # For each show all results and passages ordered by timing descending
  # The columns of every event_by_pool_type will meeting, timing
  # reaction time, standard points, position, passage splits
  # So every event shown will be different.
  # The structure of event grids will depends on passages configuration
  #
  # == Params:
  # id: the swimmer id to be processed
  #
  def full_history_2
    # --- "Full History by time" tab: ---
    @tab_title = I18n.t('radiography.full_history_by_event')

    # Prepares an array for the index table
    # Every element of the array is an hash with style and event list arrays
    # with pool type code as key
    # Eg:
    # [
    #   { stroke_type: 'SL',
    #     stroke_code: 'SL',
    #     25: {50, 100, 200, 800},
    #     50: {50, 200, 800},
    #   }
    #   { stroke_type: 'FA',
    #     stroke_code: 'FA',
    #     25: {50, 100},
    #     50: {50, 100},
    #   }
    #   ...
    # ]
    @index_table = []

    # Creates an hash with event_by_pool_type as code
    # Every element is an array of hashes
    # Every hash element of the array has:
    # - meeting
    # - result
    # - passages
    # Cycles between pool types suitable for meetings
    @full_history_by_event = Hash.new
    EventsByPoolType.only_for_meetings.not_relays.sort_by_event.each do |events_by_pool_type|
      #hash_key = events_by_pool_type.i18n_description
      hash_key = events_by_pool_type.get_key
      results_by_time = @swimmer.meeting_individual_results
        .for_event_by_pool_type( events_by_pool_type )
        .sort_by_timing( 'ASC' )
        .select([:id, :minutes, :seconds, :hundreds, :rank, :standard_points, :reaction_time, :meeting_program_id])

      # If has results collect passages and prepares hash for index table
      if results_by_time.count > 0
        # Collect all passages
        passages = Passage.joins(:event_type, :pool_type, :passage_type)
          .where(swimmer: @swimmer)
          .where(['event_types.id = ? AND pool_types.id = ?', events_by_pool_type.event_type_id, events_by_pool_type.pool_type_id])
          .select([:meeting_individual_result_id, :passage_type_id, :minutes, :seconds, :hundreds])
          .select('passage_types.length_in_meters')

        # Collects the passage list
        passages_list = passages.select('passage_types.length_in_meters').map{ |pt| pt.length_in_meters }.uniq.sort

        # Adds the event type in the hash index table
        stroke_type_code = events_by_pool_type.stroke_type_code
        stroke_type_des = events_by_pool_type.stroke_type_i18n_description
        pool_type_des = events_by_pool_type.pool_type_i18n_verbose
        event_type_dist = events_by_pool_type.event_type_length_in_meters
        stroke_index = @index_table.rindex{ |hash_element| hash_element[:stroke_type] == stroke_type_des }
        if stroke_index
          # The stroke type already exist. Check for the pool type
          if @index_table[stroke_index][pool_type_des]
            # The pool type already exists. Check for event type and, if not, add
            @index_table[stroke_index][pool_type_des] << event_type_dist if not @index_table[stroke_index][pool_type_des].rindex(event_type_dist)
          else
            # Creates the pool type with event
            @index_table[stroke_index][pool_type_des] = [event_type_dist]
          end
        else
          # Creates the element for the stroke type
          new_hash = Hash.new
          new_hash[:stroke_type] = stroke_type_des
          new_hash[:stroke_code] = stroke_type_code
          new_hash[pool_type_des] = [event_type_dist]
          @index_table << new_hash
        end
      else
        passages = nil
        passages_list = []
      end

      # Create has element with event type by pool data
      @full_history_by_event[hash_key] = [passages_list, results_by_time, passages, events_by_pool_type.i18n_description]
    end
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


  # Radiography for a specified swimmer id: "Trainings" tab rendering
  # Swimmer training stats
  # Training summary:
  # Summarizes the distance and duration of trinings in significant oeriods
  # FIXME
  # Now uses global, last season, last month, last week and last training
  # Maybe better to define swimmer-dependent significant periods such as
  # macricycle, mesocycle and so on starting at a given date
  #
  # == Params:
  # id: the swimmer id to be processed
  #
  def trainings
    @tab_title = I18n.t('radiography.trainings_tab')

    # FIXME
    # Needs to be a full goggler (swimmer associated with a user)
    # Needs to be a the user associated swimmer or a buddy with training sharing
    if @swimmer.associated_user
      # Compute total training distances
      current_season = Season.get_last_season_by_type( 'MASFIN' )

      @global_distance = {:distance => 0, :duration => 0, :number => 0, :avg_distance => 0, :avg_duration => 0, :avg_100_meters => 0}
      @season_distance = {:distance => 0, :duration => 0, :number => 0, :avg_distance => 0, :avg_duration => 0, :avg_100_meters => 0}
      @last_month      = {:distance => 0, :duration => 0, :number => 0, :avg_distance => 0, :avg_duration => 0, :avg_100_meters => 0}
      @last_week       = {:distance => 0, :duration => 0, :number => 0, :avg_distance => 0, :avg_duration => 0, :avg_100_meters => 0}
      @last_training   = {:distance => 0, :duration => 0, :avg_100_meters => 0}

      @global_distance[:number] = @swimmer.associated_user.user_training_stories.count
      @swimmer.associated_user.user_training_stories.each do |user_training_story|
        distance = user_training_story.user_training.total_distance
        duration = user_training_story.user_training.esteemed_total_seconds

        @global_distance[:distance] += distance
        @global_distance[:duration] += duration

        # FIXME
        # Maybe better show akways from last Monday
        if user_training_story.swam_date >= ( Date.today - 7 )
          @last_week[:distance] += distance
          @last_week[:duration] += duration
          @last_week[:number] += 1
        end

        # FIXME
        # Maybe better show akways from the first day of current month
        if user_training_story.swam_date >= ( Date.today.prev_month )
          @last_month[:distance] += distance
          @last_month[:duration] += duration
          @last_month[:number] += 1
        end

        if user_training_story.swam_date >= current_season.begin_date
          @season_distance[:distance] += distance
          @season_distance[:duration] += duration
          @season_distance[:number] += 1
        end
      end

      if @global_distance[:number] > 0
        @last_training[:distance] = @swimmer.associated_user.user_training_stories.sort_by_date.last.user_training.total_distance
        @last_training[:duration] = @swimmer.associated_user.user_training_stories.sort_by_date.last.user_training.esteemed_total_seconds
      end

      # Compute average distance per training
      @global_distance[:avg_distance] = @global_distance[:distance] / @global_distance[:number] if @global_distance[:number].to_i > 0
      @season_distance[:avg_distance] = @season_distance[:distance] / @season_distance[:number] if @season_distance[:number].to_i > 0
      @last_month[:avg_distance]      = @last_month[:distance] / @last_month[:number] if @last_month[:number].to_i > 0
      @last_week[:avg_distance]       = @last_week[:distance] / @last_week[:number] if @last_week[:number].to_i > 0

      # Compute average duration per training
      @global_distance[:avg_duration] = @global_distance[:duration] / @global_distance[:number] if @global_distance[:number].to_i > 0
      @season_distance[:avg_duration] = @season_distance[:duration] / @season_distance[:number] if @season_distance[:number].to_i > 0
      @last_month[:avg_duration]      = @last_month[:duration] / @last_month[:number] if @last_month[:number].to_i > 0
      @last_week[:avg_duration]       = @last_week[:duration] / @last_week[:number] if @last_week[:number].to_i > 0

      # Compute average 100 meters performance
      @global_distance[:avg_100_meters] = @global_distance[:avg_duration] / ( @global_distance[:avg_distance] / 100 ) if @global_distance[:avg_distance].to_i > 0
      @season_distance[:avg_100_meters] = @season_distance[:avg_duration] / ( @season_distance[:avg_distance] / 100 ) if @season_distance[:avg_distance].to_i > 0
      @last_month[:avg_100_meters]      = @last_month[:avg_duration] / ( @last_month[:avg_distance] / 100 ) if @last_month[:avg_distance].to_i > 0
      @last_week[:avg_100_meters]       = @last_week[:avg_duration] / ( @last_week[:avg_distance] / 100 ) if @last_week[:avg_distance].to_i > 0
      @last_training[:avg_100_meters]   = @last_training[:duration] / ( @last_training[:distance] / 100 ) if @last_training[:distance].to_i > 0
    else
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to(:back) and return
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
