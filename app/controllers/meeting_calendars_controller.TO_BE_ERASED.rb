# encoding: utf-8
=begin

= MeetingCalendarsController

  - version:  4.00.383
  - author:   Steve A.

=end
class MeetingCalendarsController < ApplicationController

  require 'date'
  require 'common/format'


  # Index/Search action.
  #
  def index
# DEBUG
    logger.debug "\r\n\r\n!! ------ #{self.class.name}.index() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    @title = I18n.t(:index_title, { scope: [:meeting_calendar] })
    @meetings = []

######################## FIXME use this:
# Filter by season_type (e.g. 2) & default year:
# ml = Meeting.includes(:season_type).where{ (season_types.id == 2) & (header_date >= Date.parse("2012-09-01")) & (header_date <= Date.parse("2013-07-01")) }

# Filter by team, default season_type (e.g. 2) & default year:
# ml = Meeting.includes(:season_type, :teams).where{ (teams.id == 1) & (season_types.id == 2) & (header_date >= Date.parse("2012-09-01")) & (header_date <= Date.parse("2013-07-01")) }

##################################

    if request.xhr?                                 # Was an AJAX call? Parse parameter and retrieve season range:
      season_id = params[:season][:season_id].to_i
      team_id   = params[:team][:team_id].to_i
      year      = params[:year].to_i
      a_date    = nil
      begin
        a_date = Date.parse(params[:a_date]) if params[:a_date]
      rescue
      end
      logger.debug "season_id: #{season_id}, team_id: #{team_id}, year: #{year}, a_date: #{a_date}"

      if (season_id > 0)
        @meetings = Meeting.includes(:season).joins(:season).where( id: season_id )
      elsif (team_id > 0)
        team = Team.find_by_id( team_id )
        @meetings = team ? team.meetings.includes(:season).joins(:season) : []
        if (year > 0)
          @meetings.reject!{ |meeting|
             meeting.season.begin_date.instance_of?(Date) && ( meeting.season.begin_date.year != year ) &&
             meeting.season.end_date.instance_of?(Date) && ( meeting.season.end_date.year != year )
          }
        elsif a_date.instance_of?(Date)
          @meetings.reject!{ |meeting|
             (meeting.season.begin_date.instance_of?(Date) && ( meeting.season.begin_date.year > a_date )) ||
             (meeting.season.end_date.instance_of?(Date) && ( meeting.season.end_date.year < a_date ))
          }
        end
      elsif (year > 0)
        @meetings = Meeting.includes(:season).joins(:season).where(
          [
            '(YEAR(seasons.begin_date) = ?) OR (YEAR(seasons.end_date) = ?)',
            year,
            year
          ]
        )
      elsif (! a_date.nil?)
        @meetings = Meeting.includes(:season).joins(:season).where(
          [
            '(seasons.begin_date <= ?) AND (seasons.end_date >= ?)',
            a_date,
            a_date
          ]
        )
      else
        @meetings = Meeting.includes(:season).joins(:season).all
      end
      logger.debug "@meetings.size = #{@meetings.size}\r\n"
    end
                                                    # Respond according to requested format:
    respond_to do |format|
      format.html
      format.js
    end
  end
  # ----------------------------------------------------------------------------
end
