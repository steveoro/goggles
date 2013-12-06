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
                                                    # Partition records in GenderType::FEMALE_ID vs. GenderType::MALE_ID -- prevent also orphan rows to be included:
    f_records, m_records = all_records.partition{ |ind_result| ind_result.gender_type && (ind_result.gender_type.id == GenderType::FEMALE_ID) }
                                                    # Partition records in PoolType::MT25_ID vs. PoolType::MT50_ID -- prevent also orphan rows to be included:
    f25mt_rec_list = f_records.reject{ |ind_result| ind_result.pool_type.nil? || (ind_result.pool_type && ind_result.pool_type.id != PoolType::MT25_ID) }
    f50mt_rec_list = f_records.reject{ |ind_result| ind_result.pool_type.nil? || (ind_result.pool_type && ind_result.pool_type.id != PoolType::MT50_ID) }
    m25mt_rec_list = m_records.reject{ |ind_result| ind_result.pool_type.nil? || (ind_result.pool_type && ind_result.pool_type.id != PoolType::MT25_ID) }
    m50mt_rec_list = m_records.reject{ |ind_result| ind_result.pool_type.nil? || (ind_result.pool_type && ind_result.pool_type.id != PoolType::MT50_ID) }

    @f25mt_rec_hash = distribute_records_to_matrix( @events, @category_short_names, f25mt_rec_list )
    @f50mt_rec_hash = distribute_records_to_matrix( @events, @category_short_names, f50mt_rec_list )
    @m25mt_rec_hash = distribute_records_to_matrix( @events, @category_short_names, m25mt_rec_list )
    @m50mt_rec_hash = distribute_records_to_matrix( @events, @category_short_names, m50mt_rec_list )
# DEBUG
#    logger.debug "\r\n@f25mt_rec_hash.class.name: #{@f25mt_rec_hash.class.name}"
#    logger.debug "@f25mt_rec_hash.keys: #{@f25mt_rec_hash.keys.inspect}"
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


  private


  # Given a list of meeting_individual_results, compiles and retuns an hash-matrix
  # with event_type ids as row keys and category short names as column keys.
  #
  def distribute_records_to_matrix( event_types_array, category_short_names_list, ind_result_records_list )
    result_hash_matrix = {}                         # Init the result hash:
# DEBUG
#    logger.debug "\r\nresult_hash_matrix.class.name: #{result_hash_matrix.class.name}"
    event_types_array.each do |event_type|
      result_hash_matrix.merge!({ event_type.id => {} })
      category_short_names_list.each do |cat_short_name|
        result_hash_matrix[ event_type.id ].merge!({ cat_short_name => nil })
      end
    end
# DEBUG
#    logger.debug "result_hash_matrix.keys: #{result_hash_matrix.keys.inspect}"
                                                    # Fill the result hash
    ind_result_records_list.each do |ind_result|
      cat_short_name  = ind_result.category_type.short_name
      event_type_key = ind_result.event_type.id
      result_hash_matrix[ event_type_key ].merge!({ cat_short_name => ind_result })
    end
    result_hash_matrix
  end
  # ----------------------------------------------------------------------------

end
