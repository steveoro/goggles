class MeetingCalendarsController < ApplicationController

  require 'date'
  require 'common/format'


  # Index/Search action.
  #
  def index
# DEBUG
    logger.debug "\r\n\r\n!! ------ #{self.class.name}.index() -----"
    logger.debug "PARAMS: #{params.inspect}"
    @title = I18n.t(:index_title, {:scope=>[:meeting_calendar]})

    if request.xhr?                                 # Was an AJAX call? Parse parameter and retrieve season range:
      season_id = params[:season][:season_id].to_i
      team_id   = params[:team][:team_id].to_i
      year      = params[:year].to_i
      a_date    = nil
      @seasons = []

      begin
        a_date = Date.parse(params[:a_date]) if params[:a_date]
      rescue
      end
      if (season_id > 0)
        @seasons = Season.where(:id => season_id)
      elsif (team_id > 0)
        # TODO start from team and get the list of seasons: do something like Team.get_swimmer_ids_for, but for seasons
        @seasons = Season.all
      elsif (year > 0)
        @seasons = Season.where(['(YEAR(seasons.begin_date) = ?) OR (YEAR(seasons.end_date) = ?)', year, year])
      elsif (! a_date.nil?)
        @seasons = Season.where(['(YEAR(seasons.begin_date) <= ?) AND (YEAR(seasons.end_date) >= ?)', a_date, a_date])
      end
    end
                                                    # Respond according to requested format:
    respond_to do |format|
      format.html
      format.js
    end
  end
  # ----------------------------------------------------------------------------
end
