class RecordsController < ApplicationController

  require 'date'
  require 'common/format'


  # Collect individual records among everything that has been inserted.
  # This computes an "all-time" best chart for everyone in every event type ever
  # inserted, according to the latest data available.
  #
  def for_everything
# DEBUG
    logger.debug "\r\n\r\n!! ------ #{self.class.name}.everything() -----"
    @title = I18n.t(:everything_title, {:scope=>[:records]})
    @events = EventType.order(:style_order).are_not_relays
    @category_short_names = CategoryType.are_not_relays.group(
      'season_types.code, category_types.code'
    ).includes( :season_type ).having(
      [ 'season_types.code = ?', 'MASFINA' ]
    ).sort.collect{ |r| r.short_name }

    all_records = MeetingIndividualResult.includes(
      :event_type, :category_type, :gender_type, :pool_type
    ).is_valid.select(
      'meeting_program_id, swimmer_id, min(minutes*6000 + seconds*100 + hundreds) as timing, event_types.code, category_types.code, gender_types.code, pool_types.code'
    ).group(
      'event_types.code, category_types.code, gender_types.code, pool_types.code'
    )
                                                    # Partition records in GenderType::FEMALE_ID vs. GenderType::MALE_ID:
    f_records, m_records = all_records.partition{ |individual_result| individual_result.gender_type.id == GenderType::FEMALE_ID }
                                                    # Partition records in PoolType::MT25_ID vs. PoolType::MT50_ID:
    f25_records = f_records.partition{ |individual_result| individual_result.pool_type.id == PoolType::MT25_ID }
    f50_records = f_records.partition{ |individual_result| individual_result.pool_type.id == PoolType::MT50_ID }
    m25_records = m_records.partition{ |individual_result| individual_result.pool_type.id == PoolType::MT25_ID }
    m50_records = m_records.partition{ |individual_result| individual_result.pool_type.id == PoolType::MT50_ID }
  end
  # ----------------------------------------------------------------------------


  # Collect individual records among everything that has been inserted but just
  # for the selected season_type_id.
  # This computes an "all-time" best chart for everyone associated to the specified
  # team_id, in every event type ever inserted, according to the latest data available.
  #
  def for_season_type
    redirect_to wip_path() and return
  end


  # Collect individual records among everything that has been inserted but just
  # for the selected swimmer_id.
  # This computes an "all-time" best chart for the specified swimmer_id, in every
  # event type ever inserted, according to the latest data available.
  #
  def for_swimmer
    redirect_to wip_path() and return
  end


  # Collect individual records among everything that has been inserted but just
  # for the selected team_id.
  # This computes an "all-time" best chart for everyone associated to the specified
  # team_id, in every event type ever inserted, according to the latest data available.
  #
  def for_team
# DEBUG
    logger.debug "\r\n\r\n!! ------ #{self.class.name}.for_team() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    redirect_to wip_path() and return
    ###########################################################
    @title = I18n.t(:index_title, {:scope=>[:records]})
    @records = MeetingIndividualResult.includes(
      :event_type, :category_type, :gender_type, :pool_type
    ).is_valid.select(
      'meeting_program_id, swimmer_id, min(minutes*6000 + seconds*100 + hundreds) as timing, event_types.code, category_types.code, gender_types.code, pool_types.code'
    ).group(
      'event_types.code, category_types.code, gender_types.code, pool_types.code'
    )

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
