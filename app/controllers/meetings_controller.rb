class MeetingsController < ApplicationController

  require 'common/format'


  def index
  end
  # ----------------------------------------------------------------------------


  # Search any meeting and show the records found.
  #
  def search
# DEBUG
    logger.debug "\r\n\r\n!! ------ search() -----"
    logger.debug "PARAMS: #{params.inspect}\r\n"

    if request.xhr?
      query_members = []
      query_params  = []

      if params['season']
        query_members << '(season_id = ?)'
        query_params << params['season']['id']

      elsif params['season_type']
        query_members << '(seasons.season_type_id = ?)'
        query_params << params['season_type']['id']

      elsif params['date_from']
        query_members << '(entry_deadline >= ?)'
        query_params << params['date_from']

      elsif params['date_to']
        query_members = '(entry_deadline <= ?)'
        query_params << params['date_to']
      end
# DEBUG
      logger.debug "query_members: #{query_members.inspect}"
      logger.debug "query_params:  #{query_params.inspect}\r\n"

      if (query_members.size < 1)
        @meetings = Meeting.all()
      else
        @meetings = Meeting.includes(:season, :season_type).where( query_members.join(' AND '), query_params )
      end
      # (Automagically executes 'search.js.erb')

    else
      flash[:notice] = I18n.t(:invalid_action_request)
      redirect_to( meetings_calendar_path() ) and return
    end
  end
  # ----------------------------------------------------------------------------
end
