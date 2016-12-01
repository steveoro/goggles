# encoding: utf-8
require 'common/format'
require 'extensions/wice_grid_column_string_regexped' # Used to generate simple_search query condition
require 'meeting_finder'
require 'wrappers/timing'
require 'passages_batch_updater'


=begin

= MeetingsController

  - version:  6.002
  - author:   Steve A.

=end
class MeetingsController < ApplicationController
  # Parse parameters:
  before_action :verify_meeting, only: [
      :show_full, :show_autoscroll, :show_ranking, :show_stats,
      :show_team_results, :show_swimmer_results, :show_invitation,
      :show_start_list, :show_start_list_by_category, :show_team_entries,
      :edit_passages, :update_passages
  ]

  before_action :verify_team,             only: [:show_team_results, :show_team_entries]
  before_action :verify_swimmer,          only: [:show_swimmer_results]
  before_action :verify_is_team_manager,  only: [:edit_passages]
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
    @title = if params[:text].to_s.size > 0
      I18n.t('meeting.current_title') + " ('#{ params[:text] }')"
    else
      I18n.t('meeting.current_title')
    end
    @preselected_swimmer_id = params[:swimmer_id].to_i if params[:swimmer_id]
    @preselected_team_id    = params[:team_id].to_i if params[:team_id]
    #@start_date, @end_date = if Date.today.month < 10
    #  [ "#{Date.today.year-1}-10-01", "#{Date.today.year}-09-30" ]
    #else
    #  [ "#{Date.today.year}-10-01", "#{Date.today.year+1}-09-30" ]
    #end

    @start_date = "#{Date.today.prev_day(19)}"
    @end_date   = "#{Date.today.next_month(10)}"

    # Initialize the grid:
    @meetings_grid = initialize_grid(
      Meeting,
      include: [:season, :season_type, :meeting_sessions, :swimming_pools],
      conditions: "(header_date >= '#{@start_date}') AND (header_date <= '#{@end_date}')",
      order: 'meetings.header_date',
      order_direction: 'asc',
      per_page: 25
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
    # [Steve, 20161001] We need to whitelist all parameters for the search query:
    params.permit!()
    # Clear the saved text search when request with special code:
    session[:text] = params[:text] = nil if params[:text] == '*'
    # Store the search text when it changes to something:
    session[:text] = params[:text] if params[:text].to_s.size > 0
    search_text = session[:text]
    query_swimmers_condition = nil
    query_teams_condition    = nil

    # Build-up title:
    @title = if search_text.to_s.size > 0
      I18n.t('meeting.simple_title') + " ('#{ search_text }')"
    else
      I18n.t('meeting.simple_title')
    end
    if search_text
      query_swimmers_condition = ConditionsGeneratorColumnStringRegexped.generate_query_conditions( 'swimmers', 'complete_name', search_text )
      query_teams_condition    = ConditionsGeneratorColumnStringRegexped.generate_query_conditions( 'teams', 'name', search_text )
    end

    # Assign ID highlighters based on search text (when not provided):
    if params[:swimmer_id]
      @preselected_swimmer_id = params[:swimmer_id].to_i
    elsif search_text
      serched_swimmer = Swimmer.where( query_swimmers_condition ).first
      @preselected_swimmer_id = serched_swimmer.id if serched_swimmer
    end
    if params[:team_id]
      @preselected_team_id = params[:team_id].to_i
    elsif search_text
      serched_team = Team.where( query_teams_condition ).first
      @preselected_team_id = serched_team.id if serched_team
    end

    ids = MeetingFinder.new( search_text ).search_ids()

    # Initialize the grid:
    @meetings_grid = initialize_grid(
      Meeting,
      include: [:season, :season_type, :meeting_sessions, :swimming_pools],
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
    # [Steve, 20161001] We need to whitelist all parameters for the search query:
    params.permit!()
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
      ids = swimmer.meetings.joins(:season, :season_type)
        .includes(:season, :season_type)
        .map{ |row| row.id }.uniq
    elsif @preselected_team_id
      team = Team.find_by_id( @preselected_team_id )
      ids = team.meetings.joins(:season, :season_type)
        .includes(:season, :season_type)
        .map{ |row| row.id }.uniq
    end
    # Initialize the grid:
    @meetings_grid = initialize_grid(
      Meeting,
      include: [:season, :season_type, :meeting_sessions, :swimming_pools],
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

    if ( @meeting.meeting_team_scores.count > 0 )
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
    @max_mir_updated_at = get_timestamp_from_relation_chain() # default: MIR
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
    @max_mir_updated_at = get_timestamp_from_relation_chain() # default: MIR
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
    unless ( mir.count + mrr.count > 0 )
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
    if mir.has_points.count > 0
      GenderType.individual_only.each do |gender_type|
        @top_scores["#{gender_type.code}-standard_points"] = mir.for_gender_type( gender_type ).sort_by_standard_points.first if mir.for_gender_type( gender_type ).has_points.count > 0
      end
    end
    if mir.has_points('goggle_cup_points').count > 0
      @top_scores["goggle_cup_points"] = mir.sort_by_goggle_cup.first
    end

    # Get a timestamp for the cache key:
    max_mir_updated_at = mir.count > 0 ? mir.select( "meeting_individual_results.updated_at" ).max.updated_at.to_i : 0
    max_mrr_updated_at = mrr.count > 0 ? mrr.select( "meeting_relay_results.updated_at" ).max.updated_at.to_i : 0
    @max_mir_updated_at = max_mir_updated_at >= max_mrr_updated_at ? max_mir_updated_at : max_mrr_updated_at
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
    @max_mir_updated_at = @individual_result_list.select( "meeting_individual_results.updated_at" ).max.updated_at.to_i
  end
  #-- -------------------------------------------------------------------------
  #++


  # Meeting invitation viewer
  #
  def show_invitation
    # Get a timestamp for the cache key:
    @max_mir_updated_at = get_timestamp_from_relation_chain() # default: MIR
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


  # Allows editing of the current Meeting results passages, according to the
  # current_user and its managed affiliations.
  #
  # To be reachable this action, requires that the current user is one of
  # the existing Team managers (indipendently from current season).
  #
  # The action then proceeds to fill a list of editable passages, one for
  # each MIR of the teams managed by the current user.
  #
  # If no passage row is existing for the corresponding associated MIR
  # found, a button to add a new row will be rendered instead.
  #
  # === Parameters:
  # - id: Meeting id for which the Passages must be edited
  #
  def edit_passages
    # Collect the list of managed Teams:
    @managed_teams = current_user.team_managers.map{ |tm| tm.team }.uniq
    @managed_team_ids = @managed_teams.map{ |team| team.id }

    # Collect the list of available/editable Passages, for each available MIR
    # for the managed affiliations by the current user.
    # The "editable stuff" is returned as an ordered array of Hash, where each
    # Hash item has as key the related MIR and as value its list of passages.
    @editable_stuff = @meeting.meeting_individual_results
        .sort_by_event_and_timing
        .joins( :event_type, :pool_type )
        .where(['meeting_individual_results.team_id = ? and event_types.length_in_meters > pool_types.length_in_meters', @managed_team_ids])
        .includes( :passages )
        .map{ |mir| { mir => mir.passages } }

    # TODO
    # Should order by start-list.
    # If no start-list present should use timing
    #if @meeting.has_start_list
    #  @editable_stuff.sort{ |mir_n, mir_p| MeetingEntry.where( badge_id: mir_n.keys.first.badge_id, meeting_program_id: mir_n.keys.first.meeting_program_id ).first.get_timing <=> MeetingEntry.where( badge_id: mir_p.keys.first.badge_id, meeting_program_id: mir_n.keys.first.meeting_program_id ).first.get_timing }
    #end
  end


  # Upodates or creates Meeting results passage/lap times rows, according to the
  # specified paramters.
  #
  # Assumes the POST parameters are encoded as follows:
  #
  # . edited or existing passage rows...: "pas_" + passage.id
  # . new rows to be created............: "new_" + MIR.id + "_" + passage_type.id
  #
  # This will create a diff-log file inside the default output directory, while
  # sending out an admin-email to notify the update.
  #
  # === Parameters:
  # - id: Meeting id for which the Passages must be edited
  #
  def update_passages
    edited_rows = params.select{ |key, value| key =~ /pas/ }
    new_rows    = params.select{ |key, value| ( key =~ /new/ || key =~ /auto/ ) && value.length > 0 }
    batch_updater = PassagesBatchUpdater.new( current_user )
    inserted_mirs = []

    # Edit existing row values:
    edited_rows.each do |key, value|
      passage_id = key.split('_').last
      batch_updater.edit_existing_passage( passage_id, value )
    end
    # Create new rows:
    new_rows.each do |key, value|
      # Verify if passage is the only one for mir and is added automatically in the view (auto)
      passage_mode = key.split('_')[0]
      mir_id = key.split('_')[1]
      passage_type_id = key.split('_').last
      batch_updater.create_new_passage( mir_id, passage_type_id, value ) if passage_mode == 'new' || inserted_mirs.include?( mir_id )
      inserted_mirs << mir_id
    end

    # Create the SQL diff file, and send it, when operated remotely:
    output_dir = File.join( Rails.root, 'public', 'output' )
    file_name = "#{DateTime.now().strftime('%Y%m%d%H%M')}" <<
                "#{ Rails.env == 'production' ? 'dev' : 'prod' }" <<
                "_update_passages_#{ @meeting.code }.diff.sql"
    full_sql_diff_path = File.join( output_dir, file_name )
    File.open( full_sql_diff_path, 'w' ) { |f| f.puts batch_updater.sql_diff_text_log }
    logger.info( "\r\nLog file " + file_name + " created" )
    if Rails.env == 'production'
      AgexMailer.action_notify_mail(
        current_user,
        "update passages",
        "User #{current_user} has updated remotely the passages for his/hers managed affiliations, for meeting ID #{@meeting.id}.\r\nThe attached log file must be synchronized locally.",
        file_name,
        full_sql_diff_path
      ).deliver
    end

    # Signal any error or a successful operation:
    if batch_updater.total_errors > 0
      flash[:error] = I18n.t('something_went_wrong')
    else
      flash[:info] = I18n.t('social.changes_saved')
    end
    redirect_to( meeting_edit_passages_path(@meeting.id) ) and return
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

    # Get a timestamp for the cache key:
    @max_mir_updated_at = get_timestamp_from_relation_chain() # default: MIR
  end


  # Returns an integer timestamp usable as additional cache key, sending the specified
  # message to the current instance of @meeting (assumed to be an instance of Meeting).
  #
  def get_timestamp_from_relation_chain( relation_to_send = :meeting_individual_results )
    if @meeting.send( relation_to_send ).count > 0
      timestamp = @meeting.send( relation_to_send ).select(  "#{ relation_to_send }.updated_at"  ).max.updated_at.to_i
      timestamp > @meeting.updated_at.to_i ? timestamp : @meeting.updated_at.to_i
    else
      @meeting.updated_at.to_i
    end
  end


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

      if @meeting.meeting_individual_results.where(['meeting_individual_results.swimmer_id = ?', @swimmer.id]).count > 0 ||
        @meeting.meeting_entries.where(['meeting_entries.swimmer_id = ?', @swimmer.id]).count > 0
        @team = team
      else
        if team && (@meeting.meeting_individual_results.where(['meeting_individual_results.team_id = ?', team.id]).count > 0 ||
          @meeting.meeting_entries.where(['meeting_entries.team_id = ?', team.id]).count > 0)
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

  # Verifies that a current user is one of the defined team managers.
  # (Actually, it verifies that the current user has any managed affiliation defined.)
  #
  def verify_is_team_manager
    unless ( current_user.team_managers.count > 0 )
      flash[:error] = I18n.t(:invalid_action_request) + ' - ' + I18n.t('meeting.errors.invalid_team_manager')
      redirect_to( meetings_current_path() ) and return
    end
  end
end
