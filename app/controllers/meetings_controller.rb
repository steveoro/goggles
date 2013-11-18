class MeetingsController < ApplicationController

  require 'common/format'


  # Index/Search action
  #
  def index
    @title = I18n.t(:index_title, {:scope=>[:meeting]})
    @meetings_grid = initialize_grid(
      Meeting,
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
  def show_full
    meeting_id = params[:id].to_i
    @meeting = ( meeting_id > 0 ) ? Meeting.find_by_id( meeting_id ) : nil
    unless ( @meeting )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( meetings_path() ) and return
    end

    @meeting_events_list = @meeting.meeting_events.includes(
      :event_type, :stroke_type
    ).order(
      'event_types.is_a_relay, meeting_events.event_order'
    )
  end
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
    @team = mir.first.team
                                                    # Get the swimmer list and some stats:
    @meeting_team_swimmers =  mir.includes(:swimmer).group(:swimmer_id).order(
      'swimmers.complete_name ASC'
    ).collect{ |row| row.swimmer }
    @team_ranks_1 = MeetingIndividualResult.count_team_ranks_for( meeting_id, @team_id, 1 )
    @team_ranks_2 = MeetingIndividualResult.count_team_ranks_for( meeting_id, @team_id, 2 )
    @team_ranks_3 = MeetingIndividualResult.count_team_ranks_for( meeting_id, @team_id, 3 )
    @team_ranks_4 = MeetingIndividualResult.count_team_ranks_for( meeting_id, @team_id, 4 )
    @team_outstanding_scores = MeetingIndividualResult.count_team_results_for( meeting_id, @team_id, 750 )
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
    @team_outstanding_scores += MeetingRelayResult.count_team_results_for( meeting_id, @team_id, 750 )

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


  # Show details action
  # Assumes params[:id] refers to a specific Meeting row.
  #
  def show
    @meeting = ( params[:id].to_i > 0 ) ? Meeting.find_by_id( params[:id].to_i ) : nil
    unless ( @meeting )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( meetings_path() ) and return
    end

    @season_type_id = @meeting.season.season_type_id if @meeting.season
    @meeting_programs_grid = initialize_grid(
      MeetingProgram,
      :conditions => ['meeting_sessions.meeting_id = ?', @meeting.id],
      :include => [:meeting_session, :event_type, :category_type, :gender_type],
      :order => 'meeting_programs.event_order', # 'meeting_sessions.session_order',
      :per_page => 20
    )
  end
  # ----------------------------------------------------------------------------
end
