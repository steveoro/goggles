#
# RESTful API controller
#
class Api::V1::TeamsController < ApplicationController

  respond_to :json

  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_entity_from_token!
  before_filter :authenticate_entity!                # Devise "standard" HTTP log-in strategy
  before_filter :ensure_format
  # ---------------------------------------------------------------------------


  # Return the number of meetings attended by a Team instance
  # Usage: count_meetings_team_path( :id => team_id_to_be_searched )
  #
  # === Params:
  # - :id => the Team.id
  #
  def count_meetings
    team = Team.find_by_id( params[:id] )
    if team
      render :json => team.meetings.collect{|row| row.id}.uniq.size
    else
      render :json => 0
    end
  end

  # Return the number of individual + relay results obtained by a Team instance
  # Usage: count_results_team_path( :id => team_id_to_be_searched )
  #
  # === Params:
  # - :id => the Team.id
  #
  def count_results
    team = Team.find_by_id( params[:id] )
    if team
      render :json => ( team.meeting_individual_results.count + team.meeting_relay_results.count )
    else
      render :json => 0
    end
  end


  # Combines both methods above to return a composed string
  # Usage: count_details_team_path( :id => team_id_to_be_searched )
  #
  # === Params:
  # - :id => the Team.id
  #
  def count_details
    team = Team.find_by_id( params[:id] )
    if team
      render :json => "#{I18n.t('meeting.total_attended_meetings')}: " +
                      team.meetings.collect{|row| row.id}.uniq.size.to_s +
                      ", #{I18n.t('meeting.total_results_short')}: " +
                      ( team.meeting_individual_results.count + team.meeting_relay_results.count ).to_s
    else
      render :json => ''
    end
  end
  # ---------------------------------------------------------------------------


  def index
    respond_with( @teams = Team.all )
  end
  # ---------------------------------------------------------------------------


  def new
    respond_with( @team = Team.new )
  end
  # ---------------------------------------------------------------------------


  def create
    respond_with( @team = Team.create(params[:team]) )
  end
  # ---------------------------------------------------------------------------


  def edit
    respond_with( @team = Team.find(params[:id]) )
  end
  # ---------------------------------------------------------------------------


  def update
    @team = UserTraining.find(params[:id])
    @team.update_attributes(params[:team])
    respond_with( @team )
  end
  # ---------------------------------------------------------------------------


  protected


  # Makes sure that the format for the request is an accepted one.
  def ensure_format
    unless request.xhr? || request.format.json?
      render( status: 406, json: {success: false, message: I18n.t(:api_request_must_be_json) } )
      return
    end
  end
end
