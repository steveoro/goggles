# encoding: utf-8
require 'fileutils'                                 # Used to process filenames
require 'common/format'
require 'wrappers/timing'


=begin

= SwimmersController

  - version:  6.200
  - author:   Steve A., Leega

=end
class SwimmersController < ApplicationController

  # Require authorization before invoking any of this controller's actions:
#  before_action :authenticate_user_from_token!, except: [:index, :radio]
  before_action :authenticate_user!, except: [:index, :radio] # Devise HTTP log-in strategy
  # Parse parameters:
  before_action :verify_parameter, except: [:index]
  before_action :find_last_updated_mir, except: [:index, :trainings]
  #-- -------------------------------------------------------------------------
  #++

  # Index/Search action
  #
  # def index
    # # [Steve, 20161001] We need to whitelist all parameters for the search query:
    # params.permit!()
    # @title = I18n.t('swimmers.search_swimmers')
    # # @swimmers_grid = initialize_grid(
      # # Swimmer,
      # # order: 'swimmers.complete_name',
      # # order_direction: 'asc',
      # # per_page: 20
    # # )
  # end
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
  # Show the swimmer medal standing
  # presenting by season type and by event (and pool) type
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
            .exists?
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


# FIXME / TODO REMOVE THIS, SINCE IT'S NOT USED ANYMORE (route has been commented-out too)

  # Radiography for a specified swimmer id: "Records" tab rendering
  #
  # == Params:
  # id: the swimmer id to be processed
  #
  # TODO Show the record held by swimmer summary
  #
  # def records
    # # --- "Medals" tab: ---
    # @tab_title = I18n.t('radiography.records_tab')
    # @tot_season_records_for_this_swimmer = 0
    # @seasonal_record_collection = []
#
    # # TODO Until we'll have finished FIN import this scan will be used
    # # for CSI only.
    # # FIXME this has not been tested yet:
    # #all_championships_records = MeetingIndividualResult.includes(
    # #  :season, :event_type, :category_type, :gender_type, :pool_type
    # #).is_valid.select(
    # #  'seasons.id, meeting_program_id, swimmer_id, min(minutes*6000 + seconds*100 + hundreds) as timing, event_types.code, category_types.code, gender_types.code, pool_types.code'
    # #).group(
    # #  'seasons.id, event_types.code, category_types.code, gender_types.code, pool_types.code'
    # #)
                                                    # # Filter all_championships_records and find out how many records this swimmer still holds (if any)
    # # FIXME this has not been tested yet:
    # #all_championships_records.each{ | mir |
    # #  @tot_season_records_for_this_swimmer += 1 if (mir.swimmer_id == @swimmer.id)
    # #}
#
    # @swimmer.season_types.uniq.each do |season_type|
      # # Creates an hash for seasonal medals
      # seasonal_records = Hash.new
      # seasonal_records[:season_type] = season_type.get_full_name
      # seasonal_records[:tot_season_records] = 0
#
      # # FIXME this has not been tested yet:
      # #all_championships_records.each{ | mir |
      # #  if mir.season_type && (mir.swimmer_id == @swimmer.id) && (mir.season_type.id == season_type.id)
      # #    seasonal_medals[:tot_season_records] += 1
      # #  end
      # #}
      # @seasonal_record_collection << seasonal_records
    # end
  # end
  # #-- -------------------------------------------------------------------------
  # #++

# *****************************************************************************
# XXX KEPT ONLY AS REFERENCE - New implementation (below) is 10-90msec faster
# *****************************************************************************

  # Radiography for a specified swimmer id: "Best timings" tab rendering
  #
  # Implementation using the PersonalBestCollector (older strategy class)
  #
  # == Params:
  # id: the swimmer id to be processed
  #
  # def best_timings # XXX SLOWER than implementation below
    # # --- "Best Timings" tab: ---
    # @tab_title = I18n.t('radiography.best_timings_tab')
    # current_season = Season.get_last_season_by_type( 'MASFIN' )
#
    # # Leega.
    # # TODO: Delegate to an AJAX function. I've removed the prevoius AJAX call
    # collector = PersonalBestCollector.new( @swimmer )
#
    # # Collect personal bests
    # collector.full_scan do |this, events_by_pool_type|
      # this.collect_from_all_category_results_having( events_by_pool_type, 'SPB' )
    # end
#
    # # Collect last result
    # collector.full_scan do |this, events_by_pool_type|
      # this.collect_last_results_having( events_by_pool_type, 'SLP' )
    # end
#
    # # Collect seasonal bests
    # collector.set_start_date( current_season.begin_date )
    # collector.set_end_date( current_season.end_date )
    # collector.full_scan do |this, events_by_pool_type|
      # this.collect_from_all_category_results_having( events_by_pool_type, 'SSB' )
    # end
#
    # @grid_builder = PersonalBestGridBuilder.new( collector )
  # end
  #-- -------------------------------------------------------------------------
  #++

  # XXX WIP: A-B testing Best-timings view versions:
  # Radiography for a specified Swimmer id: "Best timings" tab rendering
  #
  # Implementation using the SwimmerPersonalBestFinder (newest strategy class)
  #
  # == Params:
  # id: the swimmer id to be processed
  #
  def best_timings
    @tab_title = I18n.t('radiography.best_timings_tab')

    if @swimmer.meeting_individual_results.exists?
      @best_finder = SwimmerPersonalBestFinder.new( @swimmer )
      @max_updated_at = find_last_updated_mir
    end
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
    @full_history_by_date = {}
    @full_history_events = {}
                                                    # Cycles between pool types suitable for meetings:
    PoolType.only_for_meetings.each do |pool_type|
      pool_code = pool_type.code
                                                    # Collect results for the current pool type:
      #mirs = @swimmer.meeting_individual_results
      #  .joins(meeting_program: [:pool_type, meeting_event: [:event_type, :meeting_session]])
      #  .for_pool_type( pool_type )
      #  .sort_by_date
      #  #.select([:id, :minutes, :seconds, :hundreds, :is_personal_best])

      mirs=@swimmer.meeting_individual_results
        .joins(meeting_program: [:pool_type, meeting_event: [:event_type, :meeting_session]])
        .includes(:meeting, :stroke_type, :passages)
        .where(['pool_types.id = ?', pool_type.id])
        .order("meeting_sessions.scheduled_date")

      # *event_by_date* structure:
      # The structure is an array of hashes with elements formed by
      # the meeting (meeting) that contains the meeting reference
      # and the event_type_codes ("50SL", "50FA", etc.) that
      # contains the meeting_individual_result swam in the event_type
      # at the meeting.
      # TODO Refactor that structure as a collection, like personal bests

      event_list = []                               # Initi event list
      event_by_date = []                            # Init lists of events
      @full_history_events[ pool_code ] = []

      mirs.each do |meeting_individual_result|
        event_code = meeting_individual_result.event_type.code
        event_name = meeting_individual_result.event_type.i18n_short
        found_idx = event_by_date.rindex{ |meeting_hash| meeting_hash[:meeting] == meeting_individual_result.meeting }
        mir_with_pass = { :mir => meeting_individual_result }
        mir_with_pass[:passages] = meeting_individual_result.passages if meeting_individual_result.passages.exists?
        
        # If it's the first meeting result found, we create a new element:
        if found_idx
          event_by_date[ found_idx ][ event_code ] = mir_with_pass
        # ...Else, we add the result for the event type:
        else
          event_by_date << {
            :meeting      => meeting_individual_result.meeting,
            :meeting_link => meeting_individual_result.meeting.decorate.get_linked_full_name_with_date,
            event_code    => mir_with_pass
          }
        end

        # Same as above, but for the collection of events used in the graphs:
        found_idx = @full_history_events[ pool_code ].rindex{ |event_hash| event_hash[:label] == event_name }
        if found_idx
          @full_history_events[ pool_code ][ found_idx ][:data] += 1
        else
          @full_history_events[ pool_code ] << {
            :label => event_name,
            :data  => 1
          }
        end
        
        # Keep distinct events list
        event_list << event_code if !event_list.include?( event_code )
      end

      # Sort event type list by event type style order
      #event_list.sort!{ |el_prev, el_next| EventType.find_by_code(el_prev) <=> EventType.find_by_code(el_next) }
      event_list = EventType.sort_list_by_style_order( event_list )
      @full_history_by_date[ pool_code ] = [ event_list, event_by_date ]
    end
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
        .select(
            'meeting_individual_results.id', 'minutes', 'seconds', 'hundreds', 'rank',
            'standard_points', 'reaction_time', 'meeting_program_id',
            'is_personal_best'
        )
      # This is used only for the graphs:
      results_by_date = @swimmer.meeting_individual_results
        .is_valid.sort_by_date( 'ASC' )
        .for_event_by_pool_type( events_by_pool_type )
        .select(
            'meeting_individual_results.id', 'minutes', 'seconds', 'hundreds', 'rank',
            'standard_points', 'reaction_time', 'meeting_program_id',
            'is_personal_best'
        )

      # If has results collect passages and prepares hash for index table
      # [Steve, 20160929] If we use #count here below, instead of #size, ActiveRecord will try
      # to convert results_by_time.count into a query and this will yield an error. Stick with #size here:
      if results_by_time.size > 0
        # Collect all passages
        passages = Passage.joins( :event_type, :pool_type, :passage_type )
          .where( swimmer_id: @swimmer.id )
          .where( ['event_types.id = ? AND pool_types.id = ?', events_by_pool_type.event_type_id, events_by_pool_type.pool_type_id] )
          .select(
            'meeting_individual_result_id', 'passage_type_id',
            'minutes', 'seconds', 'hundreds',
            'passage_types.length_in_meters'
          )

        # Collects the passage list
        passages_list = passages.select( 'passage_types.length_in_meters' )
            .map{ |pt| pt.length_in_meters }.uniq.sort

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
      @full_history_by_event[hash_key] = [
        passages_list,
        results_by_time,
        passages,
        events_by_pool_type.i18n_description,
        results_by_date
      ]
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Radiography for a specified swimmer id: "Supermaster" tab rendering.
  # Show FIN supermaster results and main rankings
  # Main rankings are:
  # - Supermaster  -> Best different event types 5 results
  # - Ironmaster   -> All event types best results (one per type)
  # - Team ranking -> Best different event types 3 results with at least 3 meetings
  #
  # == Params:
  # id: the swimmer id to be processed
  #
  # header_year: typically nil, it's a current date override for when checking
  #      for @swimmer badges in current season (mainly used only inside specs
  #      to test a couple of edge conditions)
  #
  def supermaster
    # --- "Supermaster" tab: ---
    @tab_title   = I18n.t('supermaster.supermaster')
    @season_type = SeasonType.find_by_code('MASFIN')

    params.permit! # (No unsafe params can be passed)
    @header_year = params['header_year'].nil? ? Season.build_header_year_from_date : params['header_year'].to_i
    @badge       = @swimmer.badges.for_season_type( @season_type ).for_year( @header_year ).first
    if @badge.nil?
      #flash[:error] = I18n.t('swimmers.no_associated_badge_found')
      @errore = I18n.t('swimmers.no_associated_badge_found')
      @badge = @swimmer.badges.for_season_type( @season_type ).sort_by_season('DESC').first
      @header_year = @badge.season.header_year
      if @badge.nil?
        redirect_back( fallback_location: root_path ) and return
      end
    end

    @season           = @badge.season
    @team             = @badge.team
    # Check for overrides
    @team_affiliation = if params['header_year'].present?
      @team.team_affiliations.for_season_type( @season_type ).for_year( @header_year ).first
    else
      @team.get_current_affiliation( @season_type )
    end
    @meetings = @badge.meetings.sort_by_date.distinct
    @sssc = SwimmerSeasonalScoreCalculator.new( @swimmer, @season )
    @meeting_individual_results = @sssc.get_results
  end


  # Radiography for a specified swimmer id: "Regional ER CSI" tab rendering.
  # Show regional Emilia Romagna CSI results stats and explanation
  #
  # == Params:
  # id: the swimmer id to be processed
  #
  # header_year: typically nil, it's a current date override for when checking
  #      for @swimmer badges in current season (mainly used only inside specs
  #      to test a couple of edge conditions)
  #
  def regionalercsi
    # --- "Regional ER CSI" tab: ---
    @tab_title   = I18n.t('regionalercsi.title')
    @season_type = SeasonType.find_by_code('MASCSI')

    params.permit! # (No unsafe params can be passed)
    @header_year = params['header_year'].nil? ? Season.build_header_year_from_date : params['header_year'].to_i
    @badge       = @swimmer.badges.for_season_type( @season_type ).for_year( @header_year ).first
    if @badge.nil?
      #flash[:error] = I18n.t('swimmers.no_associated_badge_found')
      @errore = I18n.t('swimmers.no_associated_badge_found')
      @badge = @swimmer.badges.for_season_type( @season_type ).sort_by_season('DESC').first
      @header_year = @badge.season.header_year
      if @badge.nil?
        redirect_back( fallback_location: swimmer_radio_path ) and return
      end
    end

    @season           = @badge.season
    @team             = @badge.team
    # Check for overrides
    @team_affiliation = if params['header_year'].present?
      @team.team_affiliations.for_season_type( @season_type ).for_year( @header_year ).first
    else
      @team.get_current_affiliation( @season_type )
    end
    @swimmer_score = EnhanceIndividualRankingDAO::EIRSwimmerScoreDAO.new( @swimmer, @season )

    # Creates managed event list
    @events_list = []
    EventsByPoolType.not_relays.for_pool_type_code( '25' ).distance_more_than(50).distance_less_than(800).sort_by_event.each do |events_by_pool_type|
      @events_list << events_by_pool_type.event_type
    end
    @events_list = @events_list.delete_if{|e| e.code == '200FA' || e.code == '200RA' || e.code == '200DO' || e.code == '400MI' }

  end


  # Radiography for a specified swimmer id: "Goggle cup" tab rendering.
  # Show results which concurrs in current goggle cup score, if any
  # For each result, ordered by goggle cup points show google cup point
  # and event datas
  #
  # == Params:
  # id: the swimmer id to be processed
  #
  def current_goggle_cup
    # --- "Goggle cup" tab: ---
    @tab_title = @goggle_cups_tab_title

    # Verify if present current goggle cup or some closed editions
    if @goggle_cups.size == 0 and @swimmer.goggle_cups.size > 0
      @errore = I18n.t('swimmers.no_associated_goggle_cup_found')
      year = @swimmer.goggle_cups.sort_goggle_cup_by_year('DESC').first.season_year
      @swimmer.goggle_cups.each do |goggle_cup|
        @goggle_cups << goggle_cup if ( goggle_cup.season_year == year && !@goggle_cups.include?(goggle_cup) )
      end
      @tab_title = I18n.t('radiography.goggle_cup_closed')
    end
  end


  # Radiography for a specified swimmer id: "Goggle cup" tab rendering.
  # Show results which concurrs in current goggle cup score, if any
  # For each result, ordered by goggle cup points show google cup point
  # and event datas
  #
  # == Params:
  # id: the swimmer id to be processed
  # goggle_cup_id: the goggle_cup id to be processed
  #
  # TODO Verify if it's better using the same view for current and closed
  def closed_goggle_cup
    # --- "Closed Goggle cup" tab (not shown): ---
    unless ( params[:goggle_cup_id] ) && GoggleCup.exists?( params[:goggle_cup_id].to_i )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_back( fallback_location: root_path ) and return
    end

    @tab_title = I18n.t('radiography.goggle_cup_closed')

    @goggle_cups = []
    @goggle_cups << GoggleCup.find( params[:goggle_cup_id].to_i )
  end


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

    # FIXME [Steve] DISABLE the tab even before doing a redirect on the action
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
      flash[:error] = I18n.t('swimmers.no_associated_goggler_found')
      redirect_back( fallback_location: root_path ) and return
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
    unless @swimmer
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_back( fallback_location: root_path ) and return
    end
    set_goggle_cups
  end

  # Find out the last update of meeting_individual result
  #
  def find_last_updated_mir
    @max_updated_at = @swimmer.meeting_individual_results.exists? ? @swimmer.meeting_individual_results.sort_by_updated_at('DESC').first.updated_at : 0
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

  def set_goggle_cups
    @goggle_cups = []

    # Find out swimmer's current(s) goggle cup, if any
    #
    @swimmer.goggle_cups.is_current.each do |goggle_cup|
      @goggle_cups << goggle_cup if !@goggle_cups.include?(goggle_cup)
    end
    @goggle_cups_tab_title = @goggle_cups.size == 1 ? @goggle_cups.first.description : I18n.t('radiography.goggle_cup_tab')
  end
  #-- -------------------------------------------------------------------------
  #++
end
