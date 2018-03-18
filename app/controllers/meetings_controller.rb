# encoding: utf-8
require 'common/format'
#require 'extensions/wice_grid_column_string_regexped' # Used to generate simple_search query condition
require 'meeting_finder'
require 'wrappers/timing'


=begin

= MeetingsController

  - version:  6.200
  - author:   Steve A.

=end
class MeetingsController < ApplicationController
  # Require authorization before invoking any of this controller's actions:
  before_action :authenticate_user!, only: [:my]

  # Parse parameters:
  before_action :verify_meeting, only: [
      :show_full, :show_autoscroll, :show_autoscroll_start_list,
      :show_ranking, :show_stats,
      :show_team_results, :show_swimmer_results, :show_goggle_cup_results, :show_invitation,
      :show_start_list, :show_start_list_by_category, :show_team_entries
  ]

  before_action :verify_team,             only: [:show_team_results, :show_team_results, :show_team_entries]
  before_action :verify_swimmer,          only: [:show_swimmer_results]
  #-- -------------------------------------------------------------------------
  #++


  # Enlists all "my" meetings for the current user.
  #
  # Includes:
  # - all tagged meetings (both by user_id and affiliation_id)
  # - only meetings belonging to a not-yet ended season are shown
  #
  # Besides showing all meetings tagged by a team manager for an affiliation
  # in which the current user has a badge, this allows each user to build
  # a customized calendar to check out frequently.
  #
  def my
    
    open_season_ids = Season.is_not_ended.select(:id).map{|s| s.id }
    # Refine the list of open seasons:
    browsable_season_ids = open_season_ids.select{ |season_id|
      ! current_user.find_team_affiliation_id_from_badges_for( season_id ).nil?
    } + open_season_ids.select{ |season_id|
      ! current_user.find_team_affiliation_id_from_team_managers_for( season_id ).nil?
    }
    browsable_season_ids.uniq!

=begin
    # Extract the user-tagged browsable meetings:
    @meetings = Meeting.includes( :season, :season_type, :meeting_sessions, :swimming_pools )
      .joins( :season, :season_type, :meeting_sessions, :swimming_pools )
      .where( "meetings.season_id IN (?)", browsable_season_ids )
      .tagged_with( "u#{ current_user.id }", on: :tags_by_users )
      .order( "meetings.header_date DESC" )
      .to_a

    # Add also the team-tagged browsable meetings.
    # Find the current, browsable team affiliations that may have tagged the meetings,
    # and, for each, add any tagged meeting found to the list:
    browsable_season_ids.map{ |season_id| current_user.find_team_affiliation_id_from_badges_for(season_id) }
        .compact.each do |tagger_team_affiliation_id|
          @meetings += Meeting.includes( :season, :season_type, :meeting_sessions, :swimming_pools )
            .joins( :season, :season_type, :meeting_sessions, :swimming_pools )
            .where( "meetings.season_id IN (?)", browsable_season_ids )
            .tagged_with( "ta#{ tagger_team_affiliation_id }", on: :tags_by_teams )
            .order( "meetings.header_date DESC" )
            .to_a
        end

    # Add also any already attended and closed meeting belonging to the browsable
    # seasons: (the relationship w/ swimmer is through MIRs, so the inner join is enough)
    if current_user.has_associated_swimmer?
      attended_ids = current_user.swimmer.meetings
        .where( "meetings.season_id IN (?)", browsable_season_ids )
        .map{ |meeting| meeting.id }
        .uniq
        .delete_if{ |id| @meetings.any?{|m| m.id == id } }
      if attended_ids.count > 0
        @meetings += Meeting.includes( :season, :season_type, :meeting_sessions, :swimming_pools )
          .joins( :season, :season_type, :meeting_sessions, :swimming_pools )
          .where( "meetings.id IN (?)", attended_ids )
          .order( "meetings.header_date DESC" )
          .to_a
      end
    end

    # Re-sort the modified array, *descending* order (that is: B <=> A):
    @meetings.uniq!
    @meetings.sort!{ |ma, mb| mb.header_date <=> ma.header_date }
=end   


    # Extract the user-tagged browsable meetings:
    meeting_id_list = Meeting
      .where( "meetings.season_id IN (?)", browsable_season_ids )
      .tagged_with( "u#{ current_user.id }", on: :tags_by_users )
      .select( :id, :season_id )
      .map{ |meeting| meeting.id }

    # Add also the team-tagged browsable meetings.
    # Find the current, browsable team affiliations that may have tagged the meetings,
    # and, for each, add any tagged meeting found to the list:
    browsable_season_ids
      .map{ |season_id| current_user.find_team_affiliation_id_from_badges_for(season_id) }
      .compact.each do |tagger_team_affiliation_id|
        meeting_id_list += Meeting
          .where( ["meetings.season_id IN (?)", browsable_season_ids] )
          .tagged_with( "ta#{ tagger_team_affiliation_id }", on: :tags_by_teams )
          .map{ |meeting| meeting.id }
      end

#          .where( ["meetings.id not in (?) and meetings.season_id IN (?)", meeting_id_list, browsable_season_ids] )

    # Add also any already attended and closed meeting belonging to the browsable
    # seasons: (the relationship w/ swimmer is through MIRs, so the inner join is enough)
    if current_user.has_associated_swimmer?
      meeting_id_list += current_user.swimmer.meetings
        .where( ["meetings.season_id IN (?)", browsable_season_ids] )
        .select( :id, :season_id )
        .map{ |meeting| meeting.id }
    end

#        .where( ["meetings.id not in (?) and meetings.season_id IN (?)", meeting_id_list, browsable_season_ids] )

    @calendarMeetingPicker = CalendarMeetingPicker.new( nil, nil, nil, meeting_id_list.uniq! )
    @calendarDAO = @calendarMeetingPicker.pick_meetings( 'DESC', false, current_user )
    @meetings = @calendarDAO.meetings

  end
  #-- -------------------------------------------------------------------------
  #++


  # Index of the meetings for the current sport/academic year.
  #
  # === Optional parameters:
  # - text:       a text to be added to the title in between brackets;
  # - swimmer_id: a Swimmer id to be highlighted among the results;
  # - team_id:    a Team id to be highlighted among the results.
  #
  def current
    # [Steve, 20161001] We need to whitelist all parameters for the search query:
    params.permit!()
    @start_date = "#{Date.today.prev_day(19)}"
    @end_date   = "#{Date.today.next_month(10)}"
    #@start_date = "#{Date.today.prev_day(7)}"
    #@end_date   = "#{Date.today.next_day(7)}"
    @title = if params[:text].to_s.size > 0
      I18n.t('meeting.current_title') + " ('#{ params[:text] }', #{ Format.a_date(@start_date) } ... #{ Format.a_date(@end_date) })"
    else
      I18n.t('meeting.current_title') + " (#{ Format.a_date(@start_date) } ... #{ Format.a_date(@end_date) })"
    end
    @preselected_swimmer_id = params[:swimmer_id].to_i if params[:swimmer_id]
    @preselected_team_id    = params[:team_id].to_i if params[:team_id]

    # TODO Filter by season type (1,2,3 & 7,8)

    #@meetings = Meeting.includes( :season, :season_type, :meeting_sessions, :swimming_pools )
    #    .where( "(NOT is_cancelled) AND (header_date >= '#{@start_date}') AND (header_date <= '#{@end_date}')" )
    #    .order( "meetings.header_date ASC" )
    #    .page( params[:page] || 1 )

    #@meetings = Meeting.includes(meeting_sessions: [swimming_pool: [:city], meeting_events: [event_type: [:stroke_type]]], season: [:season_type])
    #    .where( "(NOT is_cancelled) AND (header_date >= '#{@start_date}') AND (header_date <= '#{@end_date}')" )
    #    .order( "meetings.header_date ASC" )
    #    .page( params[:page] || 1 )
        
    # Calendar DAO using a costructor which selects meeting using dates
    @calendarMeetingPicker = CalendarMeetingPicker.new( nil, @start_date, @end_date )
    @calendarDAO = @calendarMeetingPicker.pick_meetings( 'DESC', false, current_user )
    @meetings = Kaminari.paginate_array(@calendarDAO.meetings).page( params[:page] || 1 )
        
  end
  #-- -------------------------------------------------------------------------
  #++


  # Meetings search index with a simple text input which searches among
  # all the descriptions and the results texts to extract the search results.
  #
  # Despite the name, this method performs some complicated & educated guesses
  # about what the user may usually want to find out.
  #
  # To achieve this, the dataset is literally constructed by collecting possibile
  # match candidates among several sub-entities linked to the row of the Meeting
  # itself.
  #
  # Currently, the method collects all the IDs of the Meetings for which the search
  # text can be matched inside:
  #
  # => meetings.description
  # => meetings.header_year
  # => meetings.notes
  # => meetings.reference_name
  #
  # => swimmers.complete_name
  #
  # => teams.name
  #
  # => meeting_events.event_type#i18n_short
  # => meeting_events.event_type#i18n_description
  #
  #
  # === Parameters:
  # - text:       the text to be searched;
  #               - stored in session[:text] when not empty;
  #               - clears session[:text] when equal to '*' (a single asterisk).
  #
  #
  # === Optional parameters:
  # - swimmer_id: a Swimmer id to be highlighted among the results;
  # - team_id:    a Team id to be highlighted among the results.
  #
  # def simple_search
    # # [Steve, 20161001] We need to whitelist all parameters for the search query:
    # params.permit!()
    # # Clear the saved text search when request with special code:
    # session[:text] = params[:text] = nil if params[:text] == '*'
    # # Store the search text when it changes to something:
    # session[:text] = params[:text] if params[:text].to_s.size > 0
    # search_text = session[:text]
    # query_swimmers_condition = nil
    # query_teams_condition    = nil
#
    # # Build-up title:
    # @title = if search_text.to_s.size > 0
      # I18n.t('meeting.simple_title') + " ('#{ search_text }')"
    # else
      # I18n.t('meeting.simple_title')
    # end
    # if search_text
      # query_swimmers_condition = ConditionsGeneratorColumnStringRegexped.generate_query_conditions( 'swimmers', 'complete_name', search_text )
      # query_teams_condition    = ConditionsGeneratorColumnStringRegexped.generate_query_conditions( 'teams', 'name', search_text )
    # end
#
    # # Assign ID highlighters based on search text (when not provided):
    # if params[:swimmer_id]
      # @preselected_swimmer_id = params[:swimmer_id].to_i
    # elsif search_text
      # serched_swimmer = Swimmer.where( query_swimmers_condition ).first
      # @preselected_swimmer_id = serched_swimmer.id if serched_swimmer
    # end
    # if params[:team_id]
      # @preselected_team_id = params[:team_id].to_i
    # elsif search_text
      # serched_team = Team.where( query_teams_condition ).first
      # @preselected_team_id = serched_team.id if serched_team
    # end
#
    # ids = MeetingFinder.new( search_text ).search_ids()
#
    # # Initialize the grid:
    # @meetings_grid = initialize_grid(
      # Meeting,
      # include: [:season, :season_type, :meeting_sessions, :swimming_pools],
      # conditions: { id: ids },
      # order: 'meetings.header_date',
      # order_direction: 'asc',
      # per_page: 20
    # )
  # end
  #-- -------------------------------------------------------------------------
  #++


  # Meetings index with full search customization support.
  #
  # Note that while other actions, such as #current or #simple_search allow the same
  # <tt>swimmer_id</tt> & <tt>team_id</tt> parameters just to highlight results in any selected meeting,
  # here these two parameters are actually used to pre-filter the dataset.
  #
  # === Optional parameters:
  # - text:       a text to be added to the title in between brackets;
  # - swimmer_id: a Swimmer id to be used as a pre-filter for domain passed to the grid;
  # - team_id:    a Team id to be used as a pre-filter for domain passed to the grid;
  #
  # def custom_search
    # # [Steve, 20161001] We need to whitelist all parameters for the search query:
    # params.permit!()
    # @title = if params[:text].to_s.size > 0
      # I18n.t('meeting.index_title') + " ('#{ params[:text] }')"
    # else
      # I18n.t('meeting.index_title')
    # end
    # @preselected_swimmer_id = params[:swimmer_id].to_i if params[:swimmer_id]
    # @preselected_team_id    = params[:team_id].to_i if params[:team_id]
    # ids = nil
    # # Prepare pre-selection parameters:
    # if @preselected_swimmer_id
      # swimmer = Swimmer.find_by_id( @preselected_swimmer_id )
      # ids = swimmer.meetings.joins(:season, :season_type)
        # .includes(:season, :season_type)
        # .map{ |row| row.id }.uniq
    # elsif @preselected_team_id
      # team = Team.find_by_id( @preselected_team_id )
      # ids = team.meetings.joins(:season, :season_type)
        # .includes(:season, :season_type)
        # .map{ |row| row.id }.uniq
    # end
    # # Initialize the grid:
    # @meetings_grid = initialize_grid(
      # Meeting,
      # include: [:season, :season_type, :meeting_sessions, :swimming_pools],
      # conditions: ids ? { id: ids } : nil,
      # order: 'meetings.header_date',
      # order_direction: 'asc',
      # per_page: 20
    # )
  # end
  #-- -------------------------------------------------------------------------
  #++


  # Show all details regarding a single Meeting
  # Assumes params[:id] refers to a specific Meeting row.
  #
  # === Optional parameters:
  # - swimmer_id: Swimmer id to be highlighted, defined only when prefiltered from previous search actions.
  # - team_id: Team id to be highlighted, defined only when prefiltered from previous search actions.
  #
  def show_full
    prepare_show_full()
  end


  # Custom "Show Full" view with automatic scrolling of the results,
  # for the specified (single) Meeting.
  # Assumes params[:id] refers to a specific Meeting row.
  #
  # === Optional parameters:
  # - swimmer_id: Swimmer id to be highlighted, defined only when prefiltered from previous search actions.
  # - team_id: Team id to be highlighted, defined only when prefiltered from previous search actions.
  #
  def show_autoscroll
    prepare_show_full()
  end
  #-- -------------------------------------------------------------------------
  #++


  # Show the ranking regarding a single Meeting
  # Assumes params[:id] refers to a specific Meeting row.
  #
  # === Optional parameters:
  # - team_id, to highlight a specific team
  #
  def show_ranking
    @preselected_team_id = params[:team_id]

    if ( @meeting.meeting_team_scores.exists? )
      @meeting_team_scores = @meeting.meeting_team_scores
        .joins( :team, :team_affiliation )
        .includes( :team, :team_affiliation )
      # [Steve, 20131231] Cannot order via SQL since rank could be blank for CSI meetings
      #  (as in  .order('meeting_team_scores.rank'))

    else
      team_scores_hash = {}
      mir = @meeting.meeting_individual_results.is_valid
      mrr = @meeting.meeting_relay_results.is_valid
                                                    # Sum all individual scores into each team score row:
      mir.each { |ind_result|
        team_score = team_scores_hash[ ind_result.team_id ] || MeetingTeamScore.new( team_id: ind_result.team_id, meeting_id: @meeting.id )
        team_score.meeting_individual_points += ind_result.standard_points
                                                    # Save the updated score into the collection Hash:
        team_scores_hash[ ind_result.team_id ] = team_score
      }
                                                    # Sum all relay scores into each team score row:
      mrr.each { |relay_result|
        team_score = team_scores_hash[ relay_result.team_id ] || MeetingTeamScore.new( team_id: relay_result.team_id, meeting_id: @meeting.id )
        team_score.meeting_relay_points += relay_result.standard_points
                                                    # Save the updated score into the collection Hash:
        team_scores_hash[ relay_result.team_id ] = team_score
      }
                                                    # Collect the individual score rows and sort them:
      @meeting_team_scores = team_scores_hash.values
    end
                                                    # Do the manual sorting of the array to assure a valorized ranking:
    @meeting_team_scores = @meeting_team_scores.sort_by do |row|
      (row.meeting_individual_points + row.meeting_relay_points + row.meeting_team_points).to_i
    end.reverse
                                                    # Finally, update ranking according to the sorted array:
    @existing_team_bonus_sum = 0
    @meeting_team_scores.each_with_index{ |team_score, index|
      team_score.rank = index + 1
      @existing_team_bonus_sum += team_score.meeting_team_points
    }

    # Get a timestamp for the cache key:
    @max_updated_at = get_timestamp_from_relation_chain() # default: MIR
  end
  #-- -------------------------------------------------------------------------
  #++


  # Computes and shows all the statistics regarding the whole Meeting.
  #
  # === Params:
  # - id: Meeting row id.
  #
  # === Optional parameters:
  # - team_id: used as a pass-throught parameter in the tabbed links,
  #               just to highlight a specific team
  #
  def show_stats
    # Using MeetingStat
    @meeting_stat_calculator = MeetingStatCalculator.new(@meeting)
    @meeting_stats = @meeting_stat_calculator.calculate

    @preselected_team_id = params[:team_id]

    # Get a timestamp for the cache key:
    @max_updated_at = get_timestamp_from_relation_chain() # default: MIR
  end
  #-- -------------------------------------------------------------------------
  #++


  # Show all details regarding a single Team for the whole Meeting.
  #
  # === Params:
  # - id: Meeting row id.
  # - team_id: Team id.
  #
  def show_team_results
                                                    # Get the events filtered by team_id:
    mir = @meeting.meeting_individual_results.for_team(@team)
    mrr = @meeting.meeting_relay_results.for_team(@team)
    unless ( mir.exists? || mrr.exists? )
      flash[:error] = I18n.t(:no_result_to_show)
      redirect_to( meetings_current_path() ) and return
    end

                                                    # Get the swimmer list and some stats:
    @meeting_team_swimmers =  mir.joins(:swimmer).includes(:swimmer)
      .group(:swimmer_id)
      .order('swimmers.complete_name ASC')
      .map{ |row| row.swimmer }

    # TODO
    # Refactor with medal_types
    @team_ranks_1 = mir.is_valid.has_rank(1).count
    @team_ranks_2 = mir.is_valid.has_rank(2).count
    @team_ranks_3 = mir.is_valid.has_rank(3).count
    @team_ranks_4 = mir.is_valid.has_rank(4).count

    # Calculate team highligths
    @team_outstanding_scores = mir.is_valid.for_over_that_score().count # Use default standard_points and 800

                                                    # Collect an Hash with the swimmer_id pointing to the description of all the events performed by each swimmer:
    meeting_team_swimmers_ids = @meeting_team_swimmers.collect{|row| row.id}
    @events_per_swimmers = {}
    meeting_team_swimmers_ids.each do |id|
      @events_per_swimmers[ id ] = mir
          .where([ 'meeting_individual_results.swimmer_id = ?', id ])
    end

    ind_event_ids = mir.map{ |row| row.meeting_event.id }.uniq
    rel_event_ids = mrr.map{ |row| row.meeting_event.id }.uniq
    event_ids = (ind_event_ids + rel_event_ids).uniq.sort
    @team_tot_events = event_ids.size
    @meeting_events_list = MeetingEvent.where( id: event_ids )
      .joins( :event_type, :stroke_type )
      .includes( :event_type, :stroke_type )
      .order( 'event_types.is_a_relay, meeting_events.event_order' )
                                                    # Add to the stats the relay results:
    @team_ranks_1 += mrr.is_valid.has_rank(1).count
    @team_ranks_2 += mrr.is_valid.has_rank(2).count
    @team_ranks_3 += mrr.is_valid.has_rank(3).count
    @team_ranks_4 += mrr.is_valid.has_rank(4).count
    @team_outstanding_scores += mrr.is_valid.for_over_that_score().count

    # Get the programs filtered by team_id:
    ind_prg_ids = MeetingIndividualResult.joins(:meeting, :meeting_program)
      .includes(:meeting, :meeting_program)
      .where([
        'meetings.id = ? AND meeting_individual_results.team_id = ?',
        @meeting.id, @team.id
      ])
      .map{ |row| row.meeting_program_id }
      .uniq

    rel_prg_ids = MeetingRelayResult.joins(:meeting, :meeting_program)
      .includes(:meeting, :meeting_program)
      .where([
        'meetings.id = ? AND meeting_relay_results.team_id = ?',
        @meeting.id, @team.id
      ])
      .map{ |row| row.meeting_program_id }
      .uniq

    prg_ids = (ind_prg_ids + rel_prg_ids).uniq.sort
    @meeting_programs_list = MeetingProgram.where( id: prg_ids )
      .joins( :event_type, :stroke_type )
      .includes( :event_type, :stroke_type )
      .order( 'event_types.is_a_relay, meeting_events.event_order' )

    # Find out top scorer
    @top_scores = {}
    if mir.has_points.exists?
      GenderType.individual_only.each do |gender_type|
        @top_scores["#{gender_type.code}-standard_points"] = mir.for_gender_type( gender_type ).sort_by_standard_points.first if mir.for_gender_type( gender_type ).has_points.exists?
      end
    end
    if mir.has_points('goggle_cup_points').exists?
      @top_scores["goggle_cup_points"] = mir.sort_by_goggle_cup.first
    end

    # Get a timestamp for the cache key:
    max_mir_updated_at = mir.exists? ? mir.select( "meeting_individual_results.updated_at" ).order(:updated_at).last.updated_at.to_i : 0
    max_mrr_updated_at = mrr.exists? ? mrr.select( "meeting_relay_results.updated_at" ).order(:updated_at).last.updated_at.to_i : 0
    @max_updated_at = max_mir_updated_at >= max_mrr_updated_at ? max_mir_updated_at : max_mrr_updated_at
  end
  #-- -------------------------------------------------------------------------
  #++


  # Show all details regarding a single Swimmer for the whole Meeting
  # === Params:
  # - id: Meeting row id.
  # - swimmer_id: Swimmer id.
  #
  def show_swimmer_results
    #@individual_result_list = MeetingIndividualResult.includes(:meeting).where(
    #  [
    #    'meetings.id = ? AND meeting_individual_results.swimmer_id = ?',
    #    @meeting.id, @swimmer.id
    #  ]
    #)
    # Check if this way is faster
    @individual_result_list = @meeting.meeting_individual_results.for_swimmer( @swimmer )
    unless ( @individual_result_list.size > 0 )
      flash[:error] = I18n.t(:no_result_to_show)
      redirect_to( meetings_current_path() ) and return
    end

    # Get a timestamp for the cache key:
    @max_updated_at = @individual_result_list.select( "meeting_individual_results.updated_at" ).order(:updated_at).last.updated_at.to_i
  end
  #-- -------------------------------------------------------------------------
  #++


  # Show meeting results for Team's Goggle Cup (if any)
  #
  # === Params:
  # - id: Meeting row id.
  # - team_id: Team id.
  #
  def show_goggle_cup_results
                                                    # Get the events filtered by team_id:
    mir = @meeting.meeting_individual_results.for_team(@team)
    unless ( mir.exists? )
      flash[:error] = I18n.t(:no_result_to_show)
      redirect_to( meetings_current_path() ) and return
    end
    
    unless @team.has_goggle_cup_at?( @meeting.header_date )
      flash[:error] = I18n.t(:no_result_to_show)
      redirect_to( meetings_current_path() ) and return
    end

    @goggle_cup = @team.get_current_goggle_cup_at( @meeting.header_date )
    unless @goggle_cup
      flash[:error] = I18n.t(:no_result_to_show)
      redirect_to( meetings_current_path() ) and return
    end
    
    # Get a timestamp for the cache key:
    @max_updated_at = mir.exists? ? mir.select( "meeting_individual_results.updated_at" ).order(:updated_at).last.updated_at.to_i : 0
  end
  #-- -------------------------------------------------------------------------
  #++

  # Meeting invitation viewer
  #
  def show_invitation
    # Get a timestamp for the cache key:
    @max_updated_at = get_timestamp_from_relation_chain() # default: MIR
  end
  #-- -------------------------------------------------------------------------
  #++


  # Meeting start list viewer
  #
  def show_start_list
    # TODO
    # Prepare the start-list according to the meeting specs
    # male/female joined and so on
    # Need specific flags on meeting events
    @meeting_events_list = @meeting.meeting_events
      .joins(:event_type, :stroke_type)
      .includes(:event_type, :stroke_type)
      .order('meeting_events.event_order')

    # TODO
    # Prepares team stats

    # Get a timestamp for the cache key:
    @max_entry_updated_at = get_timestamp_from_relation_chain(:meeting_entries)
  end


  # Meeting start list viewer, w/ autoscroll
  #
  def show_autoscroll_start_list
    # TODO
    # Prepare the start-list according to the meeting specs
    # male/female joined and so on
    # Need specific flags on meeting events
    @meeting_events_list = @meeting.meeting_events
      .joins(:event_type, :stroke_type)
      .includes(:event_type, :stroke_type)
      .order('meeting_events.event_order')
  end
  #-- -------------------------------------------------------------------------
  #++


  # Meeting start list category divided viewer
  #
  def show_start_list_by_category
    @meeting_events_list = @meeting.meeting_events
      .joins(:event_type, :stroke_type)
      .includes(:event_type, :stroke_type)
      .order('meeting_events.event_order')

    # Get a timestamp for the cache key:
    @max_entry_updated_at = get_timestamp_from_relation_chain(:meeting_entries)
  end
  #-- -------------------------------------------------------------------------
  #++


  # Meeting start list for team
  # Intended to show team swimmers distribution among sessions
  #
  def show_team_entries
    @meeting_events_list = @meeting.meeting_events
      .joins(:event_type, :stroke_type)
      .includes(:event_type, :stroke_type)
      .order('meeting_events.event_order')

    # Get a timestamp for the cache key:
    @max_entry_updated_at = get_timestamp_from_relation_chain(:meeting_entries)
  end
  #-- -------------------------------------------------------------------------
  #++


  # Search meeting results for a specific swimmer
  #
  def search_swimmer
    # [Steve, 20161001] We need to whitelist all parameters for the search query:
    params.permit!()
    @title = I18n.t(:search_by_swimmer, { scope: [:meeting] })
    @swimmers_grid = initialize_grid(
      Swimmer,
      order: 'swimmers.complete_name',
      order_direction: 'asc',
      per_page: 20
    )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Search meeting results for a specific team
  #
  def search_team
    # [Steve, 20161001] We need to whitelist all parameters for the search query:
    params.permit!()
    @title = I18n.t(:search_by_team, { scope: [:meeting] })
    @teams_grid = initialize_grid(
      Team,
      order: 'teams.name',
      order_direction: 'asc',
      per_page: 20
    )
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Prepares the instance variables for the #show_full action.
  # Used also in #show_autoscroll.
  #
  def prepare_show_full
    @preselected_swimmer_id = params[:swimmer_id]
    @preselected_team_id    = params[:team_id]

    @meeting_events_list = @meeting.meeting_events
      .joins( :meeting_session, :event_type, :stroke_type )
      .includes( :meeting_session, :event_type, :stroke_type )
      .order( 'meeting_sessions.session_order, meeting_events.event_order' )

    # Get a timestamp for the cache key, either from last MIR, last MRR (when existing),
    # last Passage (when existing) or last Relay Swimmer (when existing).
    last_mir_updated_at       = get_timestamp_from_relation_chain() # default: MIR
    last_mrr_updated_at       = get_timestamp_from_relation_chain( :meeting_relay_results )
    last_passage_updated_at   = get_timestamp_from_relation_chain( :passages )
    last_rswimmer_updated_at  = get_timestamp_from_relation_chain( :meeting_relay_swimmers )
    @max_updated_at = [
      last_mir_updated_at, last_mrr_updated_at,
      last_passage_updated_at, last_rswimmer_updated_at
    ].max
  end


  # Returns an integer timestamp usable as additional cache key, sending the specified
  # message to the current instance of @meeting (assumed to be an instance of Meeting).
  #
  def get_timestamp_from_relation_chain( relation_to_send = :meeting_individual_results )
    if @meeting.send( relation_to_send ).exists?
      timestamp = @meeting.send( relation_to_send ).select(  "#{ relation_to_send }.updated_at"  ).order(:updated_at).last.updated_at.to_i
      timestamp > @meeting.updated_at.to_i ? timestamp : @meeting.updated_at.to_i
    else
      @meeting.updated_at.to_i
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Verifies that a meeting id is provided as parameter; otherwise
  # return an invalid action request
  # Assigns the meeting instance.
  # Verifiy if user is logged and associated to a swimmer and sets preselection
  # of team and swimmer
  #
  # == Params:
  # id: the meeting id to be processed
  #
  def verify_meeting
    set_meeting_from_id
    unless ( @meeting )
      flash[:error] = I18n.t(:invalid_action_request) + ' - ' + I18n.t('meeting.errors.missing_meeting_id')
      redirect_to( meetings_current_path() ) and return
    end

    # Find preselected team and swimmer if user logged in and associated to a swimmer
    # and the swimmer or team partecipated to the meeting
    set_swimmer_from_current_user
    if @swimmer
      team = @swimmer.teams.joins(:badges).where(['badges.season_id = ?', @meeting.season_id]).first

      if @meeting.meeting_individual_results.where(['meeting_individual_results.swimmer_id = ?', @swimmer.id]).exists? ||
        @meeting.meeting_entries.where(['meeting_entries.swimmer_id = ?', @swimmer.id]).exists?
        @team = team
      else
        if team && (@meeting.meeting_individual_results.where(['meeting_individual_results.team_id = ?', team.id]).exists? ||
          @meeting.meeting_entries.where(['meeting_entries.team_id = ?', team.id]).exists?)
          # The team of the swimmer associated with the user parteciapte to the meeting
          @team = team
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Verifies that a team id is provided as parameter; otherwise
  # return an invalid action request
  # Assigns the team instance.
  #
  # == Params:
  # team_id: the team id to be processed
  #
  def verify_team
    set_team_from_team_id
    unless ( @team )
      flash[:error] = I18n.t(:invalid_action_request) + ' - ' + I18n.t('meeting.errors.missing_team_id')
      redirect_to( meetings_current_path() ) and return
    end
  end


  # Verifies that a swimmer id is provided as parameter; otherwise
  # return an invalid action request
  # Assigns the swimmer instance.
  #
  # == Params:
  # team_id: the team id to be processed
  #
  def verify_swimmer
    set_swimmer_from_swimmer_id
    unless ( @swimmer )
      flash[:error] = I18n.t(:invalid_action_request) + ' - ' + I18n.t('meeting.errors.missing_swimmer_id')
      redirect_to( meetings_current_path() ) and return
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
