# encoding: utf-8
require 'common/format'


=begin

= ResultsController

  - version:  4.00.383
  - author:   Steve A.

=end
class ResultsController < ApplicationController

  # Index/Search action
  #
  def index
    # TODO
    redirect_to wip_path() and return
    # @title = I18n.t(:results)
    # @results_grid = initialize_grid(
      # Meeting,
      # include: [:season, :season_type],
      # order: 'meetings.description',
      # order_direction: 'asc',
      # per_page: 10
    # )
  end
  # ----------------------------------------------------------------------------


  # Show details action.
  # Assumes params[:id] refers to a specific MeetingProgram row.
  #
  def show
    @meeting_program = ( params[:id].to_i > 0 ) ? MeetingProgram.find_by_id( params[:id].to_i ) : nil
    unless ( @meeting_program )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( results_path() ) and return
    end

    @individual_results_grid = initialize_grid(
      MeetingIndividualResult,
      :conditions => {meeting_program_id: @meeting_program.id},
      include: [
          :meeting_program, :result_type,
          :swimmer, :team,
          :badge, :disqualification_code_type
      ],
      order: 'meeting_individual_results.rank',
      per_page: 30
    )

    @relay_results_grid = initialize_grid(
      MeetingRelayResult,
      :conditions => {meeting_program_id: @meeting_program.id},
      include: [
          :meeting_program, :result_type,
          :team, :disqualification_code_type
      ],
      order: 'meeting_relay_results.rank',
      per_page: 30
    )
  end
  # ----------------------------------------------------------------------------
end
