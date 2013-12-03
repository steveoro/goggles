class MeetingCalendarsController < ApplicationController

  require 'date'
  require 'common/format'


  # Index/Search action.
  #
  def index
# DEBUG
    logger.debug "\r\n\r\n!! ------ #{self.class.name}.index() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    @title = I18n.t(:index_title, {:scope=>[:meeting_calendar]})
    @seasons = []

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
        @seasons = Season.where(:id => season_id)
      elsif (team_id > 0)
        team = Team.find_by_id( team_id )
        @seasons = team ? team.seasons.uniq : []
        if (year > 0)
          @seasons.reject!{ |season|
             season.begin_date.instance_of?(Date) && ( season.begin_date.year != year ) &&
             season.end_date.instance_of?(Date) && ( season.end_date.year != year )
          }
        elsif a_date.instance_of?(Date)
          @seasons.reject!{ |season|
             (season.begin_date.instance_of?(Date) && ( season.begin_date.year > a_date )) ||
             (season.end_date.instance_of?(Date) && ( season.end_date.year < a_date ))
          }
        end
      elsif (year > 0)
        @seasons = Season.where(['(YEAR(seasons.begin_date) = ?) OR (YEAR(seasons.end_date) = ?)', year, year])
      elsif (! a_date.nil?)
        @seasons = Season.where(['(seasons.begin_date <= ?) AND (seasons.end_date >= ?)', a_date, a_date])
      else
        @seasons = Season.all
      end
      logger.debug "@seasons.size = #{@seasons.size}\r\n"
    end
                                                    # Respond according to requested format:
    respond_to do |format|
      format.html
      format.js
    end
  end
  # ----------------------------------------------------------------------------
end
