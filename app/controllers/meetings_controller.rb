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
    @meeting = ( params[:id].to_i > 0 ) ? Meeting.find_by_id( params[:id].to_i ) : nil
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
    @meeting = ( params[:id].to_i > 0 ) ? Meeting.find_by_id( params[:id].to_i ) : nil
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
