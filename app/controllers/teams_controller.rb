# encoding: utf-8
require 'common/format'


class TeamsController < ApplicationController

  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_entity_from_token!
  before_filter :authenticate_entity!                # Devise "standard" HTTP log-in strategy
  # ---------------------------------------------------------------------------


  # Return the number of meetings attended by a Team instance
  # Usage: count_meetings_team_path( :id => team_id_to_be_searched )
  #
  # === Params:
  # - :id => the Team.id
  #
  def count_meetings
    # TODO respond with xml, only if valid session, otherwise return nil
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
    # TODO respond with xml, only if valid session, otherwise return nil
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
    # TODO respond with xml, only if valid session, otherwise return nil
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
end
