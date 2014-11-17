# encoding: utf-8
require 'common/format'


=begin

= MeetingsController

  - version:  4.00.401
  - author:   Steve A.

=end
class MeetingsController < ApplicationController
  # Parse parameters:
  before_filter :verify_meeting,  only: [:show_full, :show_ranking, :show_stats, :show_team_results, :show_swimmer_results, :show_invitation]
  before_filter :verify_team,     only: [:show_team_results, :show_swimmer_results]
  before_filter :verify_swimmer,  only: [:show_swimmer_results]
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
    @title = if params[:text].to_s.size > 0
      I18n.t('meeting.current_title') + " ('#{ params[:text] }')"
    else
      I18n.t('meeting.current_title')
    end
    @preselected_swimmer_id = params[:swimmer_id].to_i if params[:swimmer_id]
    @preselected_team_id    = params[:team_id].to_i if params[:team_id]
    @start_date, @end_date = if Date.today.month < 10
      [ "#{Date.today.year-1}-10-01", "#{Date.today.year}-09-30" ]
    else
      [ "#{Date.today.year}-10-01", "#{Date.today.year+1}-09-30" ]
    end
    # Initialize the grid:
    @meetings_grid = initialize_grid(
      Meeting,
      include: [:season, :season_type],
      conditions: "(header_date >= '#{@start_date}') AND (header_date <= '#{@end_date}')",
      order: 'meetings.header_date',
      order_direction: 'asc',
      per_page: 20
    )
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
  def simple_search
    # Clear the saved text search when request with special code:
    session[:text] = params[:text] = nil if params[:text] == '*'
    # Store the search text when it changes to something:
    session[:text] = params[:text] if params[:text].to_s.size > 0
    saved_text = session[:text]
    search_text = "%#{ saved_text }%" if saved_text.to_s.size > 0

    # Build-up title:
    @title = if saved_text.to_s.size > 0
      I18n.t('meeting.simple_title') + " ('#{ saved_text }')"
    else
      I18n.t('meeting.simple_title')
    end

    # Assign ID highlighters based on search text (when not provided):
    if params[:swimmer_id]
      @preselected_swimmer_id = params[:swimmer_id].to_i
    elsif saved_text
      serched_swimmer = Swimmer.where( ["swimmers.complete_name LIKE ?", search_text] ).first
      @preselected_swimmer_id = serched_swimmer.id if serched_swimmer
    end
    if params[:team_id]
      @preselected_team_id = params[:team_id].to_i
    elsif saved_text
      serched_team = Team.where( ["teams.name LIKE ?", search_text] ).first
      @preselected_team_id = serched_team.id if serched_team
    end
    ids = []

    # Avoid query build-up if no search text is given:
    if saved_text.to_s.size > 0
      search_text = "%#{ saved_text }%"
      # Search among most-used text columns:
      ids << Meeting.where(
        [
          "(description LIKE ?) OR (header_year LIKE ?) OR (notes LIKE ?) OR (reference_name LIKE ?)",
          search_text, search_text, search_text, search_text
        ]
      ).map{ |row| row.id }.uniq

      # Search among linked Swimmers:
      ids << Meeting.includes( :swimmers ).where( ["swimmers.complete_name LIKE ?", search_text] ).map{ |row| row.id }.uniq

      # Search among linked Teams:
      ids << Meeting.includes( :teams ).where( ["teams.name LIKE ?", search_text] ).map{ |row| row.id }.uniq

      # Search among linked EventTypes:
      event_type_ids = EventType.includes(:stroke_type).find_all do |row|
        ( row.i18n_short =~ %r(#{saved_text})i ) ||
        ( row.i18n_description =~ %r(#{saved_text})i )
      end.map{ |row| row.id }
      ids << Meeting.includes( :meeting_events ).where( :'meeting_events.event_type_id' => event_type_ids ).map{ |row| row.id }.uniq
    end

    # Initialize the grid:
    @meetings_grid = initialize_grid(
      Meeting,
      include: [:season, :season_type],
      conditions: { id: ids },
      order: 'meetings.header_date',
      order_direction: 'asc',
      per_page: 20
    )
  end
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
  def custom_search
    @title = if params[:text].to_s.size > 0
      I18n.t('meeting.index_title') + " ('#{ params[:text] }')"
    else
      I18n.t('meeting.index_title')
    end
    @preselected_swimmer_id = params[:swimmer_id].to_i if params[:swimmer_id]
    @preselected_team_id    = params[:team_id].to_i if params[:team_id]
    ids = nil
    # Prepare pre-selection parameters:
    if @preselected_swimmer_id
      swimmer = Swimmer.find_by_id( @preselected_swimmer_id )
      ids = swimmer.meetings.includes(:season, :season_type).map{ |row| row.id }.uniq
    elsif @preselected_team_id
      team = Team.find_by_id( @preselected_team_id )
      ids = team.meetings.includes(:season, :season_type).map{ |row| row.id }.uniq
    end
    # Initialize the grid:
    @meetings_grid = initialize_grid(
      Meeting,
      include: [:season, :season_type],
      conditions: ids ? { id: ids } : nil,
      order: 'meetings.header_date',
      order_direction: 'asc',
      per_page: 20
    )
  end
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
    @preselected_swimmer_id = params[:swimmer_id]
    @preselected_team_id    = params[:team_id]

    @meeting_events_list = @meeting.meeting_events.includes(
      :event_type, :stroke_type
    ).order(
      'event_types.is_a_relay, meeting_events.event_order'
    )
    # Get a timestamp for the cache key:
    @max_mir_updated_at = if @meeting.meeting_individual_results.count > 0
      @meeting.meeting_individual_results.select( :updated_at )
        .max.updated_at.to_i
    else
      @meeting.updated_at
    end
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

    if ( @meeting.meeting_team_scores.count > 0 )
      @meeting_team_scores = @meeting.meeting_team_scores.includes(
        :team, :team_affiliation
      )
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
    @meeting_team_scores.sort!{ |a, b|
      (
        b.meeting_individual_points + b.meeting_relay_points + b.meeting_team_points
      ) <=> (
        a.meeting_individual_points + a.meeting_relay_points + a.meeting_team_points
      )
    }
                                                    # Finally, update ranking according to the sorted array:
    @total_team_bonus = 0
    @meeting_team_scores.each_with_index{ |team_score, index|
      team_score.rank = index + 1
      @total_team_bonus += team_score.meeting_team_points
    }
    # Get a timestamp for the cache key:
    @max_mir_updated_at = if @meeting.meeting_individual_results.count > 0
      @meeting.meeting_individual_results.select( :updated_at )
        .max.updated_at.to_i
    else
      @meeting.updated_at
    end
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
    @preselected_team_id = params[:team_id]
# DEBUG
#    logger.debug "@preselected_team_id : #{params[:team_id] }"

    teams_hash = {}
    # Stores, for each Team id as key:
    # team_id => [ [array of processed swimmer ids], Team name, Male count, female count, tot. count, is_highlighted, gold_count, silver_count, bronze_count ],
    # Sort resulting list by team name, ASC

    categories_hash = {}
    # Stores, for each category id as key:
    # category_id => [ [array of processed swimmer ids], category name, Male count, female count, tot. count ],
    # Sort resulting list by category ID, ASC

    event_types_hash = {}
    # Stores, for each EventType id as key:
    # event_type_id => [ EventType name, Male count, female count, tot. count ],
    # Sort resulting list by event_type name, ASC

    @specials_hash = {}
    # Stores, for the current meeting:
    # - :oldest_male_athlete
    # - :oldest_female_athlete
    # - :best_3_male_scores
    # - :best_3_female_scores
    # - :worst_male_score
    # - :worst_female_score

    mir = @meeting.meeting_individual_results.is_valid
                                                    # Loop upon all individual results and count the athletes, without duplicates (each athlete may have more than 1 result for its own team):
    mir.each { |ind_result|                         # "1 loop to bind them all..."
      swimmer = ind_result.swimmer
      female = swimmer.is_female ? 1 : 0
      male   = swimmer.is_male ? 1 : 0
      male_female = male + female
      gold   = ( (ind_result.rank==1) && ind_result.is_valid_for_ranking && (ind_result.meeting_individual_points>0) ? 1 : 0 )
      silver = ( (ind_result.rank==2) && ind_result.is_valid_for_ranking && (ind_result.meeting_individual_points>0) ? 1 : 0 )
      bronze = ( (ind_result.rank==3) && ind_result.is_valid_for_ranking && (ind_result.meeting_individual_points>0) ? 1 : 0 )
                                                    # Collect athletes' gender for each team:
      if teams_hash[ ind_result.team_id ].nil?
        teams_hash[ ind_result.team_id ] = [
          [ind_result.swimmer_id],
          ind_result.team.get_full_name,
          female,
          male,
          male_female,
          (ind_result.team_id == @preselected_team_id.to_i),
          gold,
          silver,
          bronze
        ]
      else
        team_arr = teams_hash[ ind_result.team_id ]
        unless team_arr[0].include?( ind_result.swimmer_id )
          team_arr[0] << ind_result.swimmer_id      # Add current result's swimmer to the "already processed list"
          team_arr[2] += female
          team_arr[3] += male
          team_arr[4] += male_female
          # idx 5 => is_highlighted
        end
                                                    # Always count the medals: (we have to count just one swimmer for each result, but we want to count all the medals)
        team_arr[6] += gold
        team_arr[7] += silver
        team_arr[8] += bronze
      end
                                                    # Collect athletes' gender for each category, without duplicates (each athlete may have more than 1 result for its own category):
      if categories_hash[ ind_result.get_category_type_id ].nil?
        categories_hash[ ind_result.get_category_type_id ] = [
          [ind_result.swimmer_id],
          ind_result.get_category_type_short_name,
          female,
          male,
          male_female
        ]
      else
        cat_arr = categories_hash[ ind_result.get_category_type_id ]
        unless cat_arr[0].include?( ind_result.swimmer_id )
          cat_arr[0] << ind_result.swimmer_id       # Add current result's swimmer to the "already processed list"
          cat_arr[2] += female
          cat_arr[3] += male
          cat_arr[4] += male_female
        end
      end
                                                    # Collect athletes' gender for each event type (each athlete will ALWAYS have just 1 result for each event type):
      if event_types_hash[ ind_result.get_event_type_id ].nil?
        event_types_hash[ ind_result.get_event_type_id ] = [
          ind_result.get_event_type_description,
          female,
          male,
          male_female
        ]
      else
        evnt_arr = event_types_hash[ ind_result.get_event_type_id ]
        evnt_arr[1] += female
        evnt_arr[2] += male
        evnt_arr[3] += male_female
      end
                                                    # Collect also the specials:
      if ( male == 1 )
        @specials_hash[ :oldest_male_athlete ] ||= swimmer
        @specials_hash[ :best_1st_male_score ] ||= ind_result
        @specials_hash[ :best_2nd_male_score ] ||= ind_result
        @specials_hash[ :best_3rd_male_score ] ||= ind_result
        @specials_hash[ :worst_male_score    ] ||= ind_result
        @specials_hash[ :oldest_male_athlete ] = swimmer    if @specials_hash[ :oldest_male_athlete ].year_of_birth > swimmer.year_of_birth
# FIXME: Use a sorted query to get first-3 best scores from ind. results!
        @specials_hash[ :best_1st_male_score ] = ind_result if @specials_hash[ :best_1st_male_score ].standard_points.to_f < ind_result.standard_points.to_f
        @specials_hash[ :best_2nd_male_score ] = ind_result if @specials_hash[ :best_2nd_male_score ].standard_points.to_f < ind_result.standard_points.to_f && ind_result.standard_points.to_f < @specials_hash[ :best_1st_male_score ].standard_points.to_f
        @specials_hash[ :best_3rd_male_score ] = ind_result if @specials_hash[ :best_3rd_male_score ].standard_points.to_f < ind_result.standard_points.to_f && ind_result.standard_points.to_f < @specials_hash[ :best_2nd_male_score ].standard_points.to_f
        @specials_hash[ :worst_male_score    ] = ind_result if @specials_hash[ :worst_male_score    ].standard_points.to_f > ind_result.standard_points.to_f && ind_result.standard_points.to_f > 0
      else
        @specials_hash[ :oldest_female_athlete ] ||= swimmer
        @specials_hash[ :best_1st_female_score ] ||= ind_result
        @specials_hash[ :best_2nd_female_score ] ||= ind_result
        @specials_hash[ :best_3rd_female_score ] ||= ind_result
        @specials_hash[ :worst_female_score    ] ||= ind_result
        @specials_hash[ :oldest_female_athlete ] = swimmer    if @specials_hash[ :oldest_female_athlete ].year_of_birth > swimmer.year_of_birth
# FIXME: Use a sorted query to get first-3 best scores from ind. results!
        @specials_hash[ :best_1st_female_score ] = ind_result if @specials_hash[ :best_1st_female_score ].standard_points.to_f < ind_result.standard_points.to_f
        @specials_hash[ :best_2nd_female_score ] = ind_result if @specials_hash[ :best_2nd_female_score ].standard_points.to_f < ind_result.standard_points.to_f && ind_result.standard_points.to_f < @specials_hash[ :best_1st_female_score ].standard_points.to_f
        @specials_hash[ :best_3rd_female_score ] = ind_result if @specials_hash[ :best_3rd_female_score ].standard_points.to_f < ind_result.standard_points.to_f && ind_result.standard_points.to_f < @specials_hash[ :best_2nd_female_score ].standard_points.to_f
        @specials_hash[ :worst_female_score    ] = ind_result if @specials_hash[ :worst_female_score    ].standard_points.to_f > ind_result.standard_points.to_f && ind_result.standard_points.to_f > 0
      end
    }
                                                    # Add also relay medals to the medal count:
    mrr = @meeting.meeting_relay_results.is_valid
    mrr.each { |rel_result|
      team_arr = teams_hash[ rel_result.team_id ]
      if team_arr
        gold   = ( rel_result.rank==1 && rel_result.is_valid_for_ranking ? 1 : 0 )
        silver = ( rel_result.rank==2 && rel_result.is_valid_for_ranking ? 1 : 0 )
        bronze = ( rel_result.rank==3 && rel_result.is_valid_for_ranking ? 1 : 0 )
        team_arr[6] += gold
        team_arr[7] += silver
        team_arr[8] += bronze
      end
    }
                                                  # Prepare the team gender count list and sort it by name:
    teams_hash.each { |key, val| val[0] = key }   # Substitute each 0-th element with the key (team_id)
    @teams_array = teams_hash.values.sort{ |a, b|  a[1] <=> b[1] }
                                                  # Prepare the category gender count list and sort it by category ID (hash key):
    @categories_array = categories_hash.keys.sort.collect{ |k| categories_hash[k] }
                                                  # Prepare the event type gender count list and sort it by name:
    @event_types_array = event_types_hash.values.sort{ |a, b|  a[0] <=> b[0] }
    # Get a timestamp for the cache key:
    @max_mir_updated_at = if @meeting.meeting_individual_results.count > 0
      @meeting.meeting_individual_results.select( :updated_at )
        .max.updated_at.to_i
    else
      @meeting.updated_at
    end
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
    mir = MeetingIndividualResult.includes(:meeting, :meeting_event).where(
      [ 'meetings.id = ? AND meeting_individual_results.team_id = ?',
        @meeting.id, @team.id ]
    )
                                                    # Get the swimmer list and some stats:
    @meeting_team_swimmers =  mir.includes(:swimmer).group(:swimmer_id).order(
      'swimmers.complete_name ASC'
    ).collect{ |row| row.swimmer }
    
    # TODO
    # Refactor with medal_types
    @team_ranks_1 = @meeting.meeting_individual_results.is_valid.has_rank(1).for_team(@team).count
    @team_ranks_2 = @meeting.meeting_individual_results.is_valid.has_rank(2).for_team(@team).count
    @team_ranks_3 = @meeting.meeting_individual_results.is_valid.has_rank(3).for_team(@team).count
    @team_ranks_4 = @meeting.meeting_individual_results.is_valid.has_rank(4).for_team(@team).count
    @team_outstanding_scores = MeetingIndividualResult.count_team_results_for( @meeting.id, @team.id, 800 )
                                                    # Collect an Hash with the swimmer_id pointing to the description of all the events performed by each swimmer:
    meeting_team_swimmers_ids = @meeting_team_swimmers.collect{|row| row.id}
    @events_per_swimmers = {}
    meeting_team_swimmers_ids.each{ |id|
      @events_per_swimmers[ id ] = mir.where(
        [ 'meeting_individual_results.swimmer_id = ?', id ]
      )
    }

    ind_event_ids = mir.collect{ |row| row.meeting_event.id }.uniq
    rel_event_ids = MeetingRelayResult.includes(:meeting, :meeting_event).where(
      [ 'meetings.id = ? AND meeting_relay_results.team_id = ?',
        @meeting.id, @team.id ]
    ).collect{ |row| row.meeting_event.id }.uniq
    event_ids = (ind_event_ids + rel_event_ids).uniq.sort
    @team_tot_events = event_ids.size
    @meeting_events_list = MeetingEvent.where( id: event_ids ).includes(
      :event_type, :stroke_type
    ).order(
      'event_types.is_a_relay, meeting_events.event_order'
    )
                                                    # Add to the stats the relay results:
    @team_ranks_1 += MeetingRelayResult.count_team_ranks_for( @meeting.id, @team.id, 1 )
    @team_ranks_2 += MeetingRelayResult.count_team_ranks_for( @meeting.id, @team.id, 2 )
    @team_ranks_3 += MeetingRelayResult.count_team_ranks_for( @meeting.id, @team.id, 3 )
    @team_ranks_4 += MeetingRelayResult.count_team_ranks_for( @meeting.id, @team.id, 4 )
    @team_outstanding_scores += MeetingRelayResult.count_team_results_for( @meeting.id, @team.id, 800 )

    # Get the programs filtered by team_id:
    ind_prg_ids = MeetingIndividualResult.includes(:meeting, :meeting_program).where(
      [ 'meetings.id = ? AND meeting_individual_results.team_id = ?',
        @meeting.id, @team.id ]
    ).collect{ |row| row.meeting_program_id }.uniq
    rel_prg_ids = MeetingRelayResult.includes(:meeting, :meeting_program).where(
      [ 'meetings.id = ? AND meeting_relay_results.team_id = ?',
        @meeting.id, @team.id ]
    ).collect{ |row| row.meeting_program_id }.uniq
    prg_ids = (ind_prg_ids + rel_prg_ids).uniq.sort
    @meeting_programs_list = MeetingProgram.where( id: prg_ids ).includes(
      :event_type, :stroke_type
    ).order(
      'event_types.is_a_relay, meeting_events.event_order'
    )
    
    # Get a timestamp for the cache key:
    @max_mir_updated_at = if @meeting.meeting_individual_results.count > 0
      @meeting.meeting_individual_results.select( :updated_at )
        .max.updated_at.to_i
    else
      @meeting.updated_at
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Show all details regarding a single Swimmer for the whole Meeting
  # === Params:
  # - id: Meeting row id.
  # - swimmer_id: Swimmer id.
  #
  def show_swimmer_results
    @individual_result_list = MeetingIndividualResult.includes(:meeting).where(
      [
        'meetings.id = ? AND meeting_individual_results.swimmer_id = ?',
        @meeting.id, @swimmer.id
      ]
    )
    unless ( @individual_result_list.size > 0 )
      flash[:error] = I18n.t(:no_result_to_show)
      redirect_to( meetings_current_path() ) and return
    end
    # Get a timestamp for the cache key:
    @max_mir_updated_at = if @meeting.meeting_individual_results.count > 0
      @meeting.meeting_individual_results.select( :updated_at )
        .max.updated_at.to_i
    else
      @meeting.updated_at
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Meeting invitation viewer
  #
  def show_invitation
  end
  #-- -------------------------------------------------------------------------
  #++


  # Search meeting results for a specific swimmer
  #
  def search_swimmer
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
    meeting_id = params[:id].to_i
    @meeting = ( meeting_id > 0 ) ? Meeting.find_by_id( meeting_id ) : nil
    unless ( @meeting )
      flash[:error] = I18n.t(:invalid_action_request) + ' - Meeting missing'
      redirect_to( meetings_current_path() ) and return
    end
    
    # Find preselected team and swimmer if user logged in and associated to a swimmer
    # and the swimmer or team partecipated to the meeting
    if current_user && current_user.swimmer
      swimmer = current_user.swimmer
      team = swimmer.teams.joins(:meetings).where(['meetings.id = ?', @meeting.id]).uniq.first
      
      if @meeting.meeting_individual_results.where(['meeting_individual_results.swimmer_id = ?', swimmer.id]).count > 0
        # The swimmer associated with the user parteciapte to the meeting
        @swimmer = swimmer
        @team = team
      else
        if team && @meeting.meeting_individual_results.where(['meeting_individual_results.team_id = ?', team.id]).count > 0
          # The team of the swimmer associated with the user parteciapte to the meeting
          @team = team
        end
      end
    end
  end

  # Verifies that a team id is provided as parameter; otherwise
  # return an invalid action request 
  # Assigns the team instance.
  #
  # == Params:
  # team_id: the team id to be processed
  #
  def verify_team
    team_id = params[:team_id].to_i
    @team = ( team_id > 0 ) ? Team.find_by_id( team_id ) : nil
    unless ( @team )
      flash[:error] = I18n.t(:invalid_action_request) + ' - Team missing: ' + team_id.to_s
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
    swimmer_id = params[:swimmer_id].to_i
    @swimmer = ( swimmer_id > 0 ) ? Swimmer.find_by_id( swimmer_id ) : nil
    unless ( @swimmer )
      flash[:error] = I18n.t(:invalid_action_request) + ' - Swimmer missing'
      redirect_to( meetings_current_path() ) and return
    end
  end
  
end
