class MeetingsController < ApplicationController

  require 'common/format'


  # Index/Search action
  #
  def index
    @title = I18n.t(:index_title, {:scope=>[:meeting]})
    @meetings_grid = initialize_grid(
      Meeting,
      :include => [:season, :season_type],
      :order => 'meetings.description',
      :order_direction => 'asc',
      :per_page => 20
    )
  end
  # ----------------------------------------------------------------------------

  # Show all details regarding a single Meeting row
  # Assumes params[:id] refers to a specific Meeting row.
  #
  def show_full
    @meeting = ( params[:id].to_i > 0 ) ? Meeting.find_by_id( params[:id].to_i ) : nil
    unless ( @meeting )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( meetings_path() ) and return
    end
    
    @meeting_programs_list = @meeting.meeting_programs.order(:event_order).includes( :event_type, :stroke_type ).select( :event_type_id ).collect{ |row|
      row.event_type
    }.uniq

#    @meeting_programs = @meeting.meeting_programs

    # @full_results_grid = initialize_grid(
      # @meeting.meeting_programs,
      # # :include => [
          # # :meeting_program, :result_type,
          # # :swimmer, :team,
          # # :badge, :disqualification_code_type
      # # ],
      # :order => 'event_order',
      # :per_page => 30
    # )

    # @relay_results_grid = initialize_grid(
      # MeetingRelayResult,
      # :conditions => {:meeting_program_id => @meeting_program.id},
      # :include => [
          # :meeting_program, :result_type,
          # :team, :disqualification_code_type
      # ],
      # :order => 'meeting_relay_results.rank',
      # :per_page => 30
    # )
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
