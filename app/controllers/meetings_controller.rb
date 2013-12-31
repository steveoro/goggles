class MeetingsController < ApplicationController

  require 'common/format'


  # Index/Search action.
  #
  # Supports the optional parameters:
  # - :preselected_ids, to obtain an array of IDs with which pre-filter the grid results.
  # - :prefilter_swimmer, a text to be displayed for additional info regarding the pre-filtering process
  # - :swimmer_id => Swimmer id, defined only when prefiltered from previous search actions.
  # - :prefilter_team, a text to be displayed for additional info regarding the pre-filtering process
  # - :team_id => Team id, defined only when prefiltered from previous search actions.
  #
  def index
# DEBUG
    logger.debug "\r\n\r\n!! ------ #{self.class.name}.index() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    prefilter = [ params[:prefilter_swimmer], params[:prefilter_team] ].compact.join(', ')
    @title = I18n.t(:index_title, {:scope=>[:meeting]}) +
             (prefilter.size > 0 ? " (#{prefilter})" : '')
    @preselected_swimmer_id = params[:swimmer_id]
    @preselected_team_id    = params[:team_id]
    preselected_ids = params[:preselected_ids] ? params[:preselected_ids].collect{|p| p.to_i} : nil
# DEBUG
    logger.debug "@preselected_swimmer_id : #{@preselected_swimmer_id}"
    logger.debug "@preselected_team_id    : #{@preselected_team_id}"

    @meetings_grid = initialize_grid(
      (preselected_ids ? Meeting.where(:id => preselected_ids) : Meeting),
      :include => [:season, :season_type],
      :order => 'meetings.header_date',
      :order_direction => 'asc',
      :per_page => 20
    )
  end
  # ----------------------------------------------------------------------------

  # Show all details regarding a single Meeting
  # Assumes params[:id] refers to a specific Meeting row.
  #
  # Supports the optional parameters:
  # - :swimmer_id => Swimmer id to be highlighted, defined only when prefiltered from previous search actions.
  # - :team_id => Team id to be highlighted, defined only when prefiltered from previous search actions.
  #
  def show_full
    meeting_id = params[:id].to_i
    @meeting = ( meeting_id > 0 ) ? Meeting.find_by_id( meeting_id ) : nil
    unless ( @meeting )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( meetings_path() ) and return
    end
    @preselected_swimmer_id = params[:swimmer_id]
    @preselected_team_id    = params[:team_id]
# DEBUG
#    logger.debug "@preselected_swimmer_id : #{@preselected_swimmer_id}"
#    logger.debug "@preselected_team_id    : #{@preselected_team_id}"

    @meeting_events_list = @meeting.meeting_events.includes(
      :event_type, :stroke_type
    ).order(
      'event_types.is_a_relay, meeting_events.event_order'
    )
  end
  # ----------------------------------------------------------------------------


  # Show the ranking regarding a single Meeting
  # Assumes params[:id] refers to a specific Meeting row.
  #
  # Supports also the facultative params[:team_id] to highlight a specific team
  #
  def show_ranking
    meeting_id = params[:id].to_i
    @meeting = ( meeting_id > 0 ) ? Meeting.find_by_id( meeting_id ) : nil
    unless ( @meeting )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( meetings_path() ) and return
    end
    @preselected_team_id = params[:team_id]
# DEBUG
#    logger.debug "@preselected_team_id    : #{@preselected_team_id}"

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
        team_score = team_scores_hash[ ind_result.team_id ] || MeetingTeamScore.new( :team_id => ind_result.team_id, :meeting_id => meeting_id )
        team_score.meeting_individual_points += ind_result.standard_points
                                                    # Save the updated score into the collection Hash:
        team_scores_hash[ ind_result.team_id ] = team_score
      }
                                                    # Sum all relay scores into each team score row:
      mrr.each { |relay_result|
        team_score = team_scores_hash[ relay_result.team_id ] || MeetingTeamScore.new( :team_id => relay_result.team_id, :meeting_id => meeting_id )
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
  end
  # ----------------------------------------------------------------------------
  # ----------------------------------------------------------------------------


  # Computes and shows all the statistics regarding the whole Meeting.
  #
  # === Params:
  # - :id => Meeting row id.
  # - :team_id => (facultative) used as a pass-throught parameter in the tabbed links,
  #               just to highlight a specific team
  #
  def show_stats
    meeting_id = params[:id].to_i
    @meeting = ( meeting_id > 0 ) ? Meeting.find_by_id( meeting_id ) : nil
    unless ( @meeting )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( meetings_path() ) and return
    end
    @preselected_team_id = params[:team_id]
# DEBUG
#    logger.debug "@preselected_team_id : #{params[:team_id]}"

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
  end
  # ----------------------------------------------------------------------------
  # ----------------------------------------------------------------------------


  # Show all details regarding a single Team for the whole Meeting.
  #
  # === Params:
  # - :id => Meeting row id.
  # - :team_id => Team id.
  #
  def show_team_results
    @team_id = params[:team_id].to_i
    meeting_id = params[:id].to_i
    unless ( meeting_id > 0 && @team_id > 0 )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( meetings_path() ) and return
    end
                                                    # Get the meeting:
    @meeting = Meeting.find_by_id( meeting_id )
    unless ( @meeting )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( meetings_path() ) and return
    end
                                                    # Get the events filtered by team_id:
    mir = MeetingIndividualResult.includes(:meeting, :meeting_event).where(
      [ 'meetings.id = ? AND meeting_individual_results.team_id = ?',
        meeting_id, @team_id ]
    )
    @team = Team.find_by_id(@team_id)
                                                    # Get the swimmer list and some stats:
    @meeting_team_swimmers =  mir.includes(:swimmer).group(:swimmer_id).order(
      'swimmers.complete_name ASC'
    ).collect{ |row| row.swimmer }
    @team_ranks_1 = MeetingIndividualResult.count_team_ranks_for( meeting_id, @team_id, 1 )
    @team_ranks_2 = MeetingIndividualResult.count_team_ranks_for( meeting_id, @team_id, 2 )
    @team_ranks_3 = MeetingIndividualResult.count_team_ranks_for( meeting_id, @team_id, 3 )
    @team_ranks_4 = MeetingIndividualResult.count_team_ranks_for( meeting_id, @team_id, 4 )
    @team_outstanding_scores = MeetingIndividualResult.count_team_results_for( meeting_id, @team_id, 800 )
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
        meeting_id, @team_id ]
    ).collect{ |row| row.meeting_event.id }.uniq
    event_ids = (ind_event_ids + rel_event_ids).uniq.sort
    @team_tot_events = event_ids.size
    @meeting_events_list = MeetingEvent.where( :id => event_ids ).includes(
      :event_type, :stroke_type
    ).order(
      'event_types.is_a_relay, meeting_events.event_order'
    )
                                                    # Add to the stats the relay results:
    @team_ranks_1 += MeetingRelayResult.count_team_ranks_for( meeting_id, @team_id, 1 )
    @team_ranks_2 += MeetingRelayResult.count_team_ranks_for( meeting_id, @team_id, 2 )
    @team_ranks_3 += MeetingRelayResult.count_team_ranks_for( meeting_id, @team_id, 3 )
    @team_ranks_4 += MeetingRelayResult.count_team_ranks_for( meeting_id, @team_id, 4 )
    @team_outstanding_scores += MeetingRelayResult.count_team_results_for( meeting_id, @team_id, 800 )

                                                    # Get the programs filtered by team_id:
    ind_prg_ids = MeetingIndividualResult.includes(:meeting, :meeting_program).where(
      [ 'meetings.id = ? AND meeting_individual_results.team_id = ?',
        meeting_id, @team_id ]
    ).collect{ |row| row.meeting_program_id }.uniq
    rel_prg_ids = MeetingRelayResult.includes(:meeting, :meeting_program).where(
      [ 'meetings.id = ? AND meeting_relay_results.team_id = ?',
        meeting_id, @team_id ]
    ).collect{ |row| row.meeting_program_id }.uniq
    prg_ids = (ind_prg_ids + rel_prg_ids).uniq.sort
    @meeting_programs_list = MeetingProgram.where( :id => prg_ids ).includes(
      :event_type, :stroke_type
    ).order(
      'event_types.is_a_relay, meeting_events.event_order'
    )
  end
  # ----------------------------------------------------------------------------
  # ----------------------------------------------------------------------------


  # Show all details regarding a single Swimmer for the whole Meeting
  # === Params:
  # - :id => Meeting row id.
  # - :swimmer_id => Swimmer id.
  #
  def show_swimmer_results
    swimmer_id = params[:swimmer_id].to_i
    meeting_id = params[:id].to_i
    unless ( meeting_id > 0 && swimmer_id > 0 )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( meetings_path() ) and return
    end

    @meeting = Meeting.find_by_id( meeting_id )
    unless ( @meeting )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( meetings_path() ) and return
    end

    @individual_result_list = MeetingIndividualResult.includes(:meeting).where(
      [
        'meetings.id = ? AND meeting_individual_results.swimmer_id = ?',
        meeting_id, swimmer_id
      ]
    )
    unless ( @individual_result_list.size > 0 )
      flash[:error] = I18n.t(:no_result_to_show)
      redirect_to( meetings_path() ) and return
    end
    @swimmer = @individual_result_list.first.swimmer
  end
  # ----------------------------------------------------------------------------
  # ----------------------------------------------------------------------------


  # Search meeting results for a specific swimmer
  #
  def search_swimmer
    @title = I18n.t(:search_by_swimmer, {:scope=>[:meeting]})
    @swimmers_grid = initialize_grid(
      Swimmer,
      :order => 'swimmers.complete_name',
      :order_direction => 'asc',
      :per_page => 20
    )
  end
  # ----------------------------------------------------------------------------


  # Search meeting results for a specific team
  #
  def search_team
    @title = I18n.t(:search_by_team, {:scope=>[:meeting]})
    @teams_grid = initialize_grid(
      Team,
      :order => 'teams.name',
      :order_direction => 'asc',
      :per_page => 20
    )
  end
  # ----------------------------------------------------------------------------
end
