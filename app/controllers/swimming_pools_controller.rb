# encoding: utf-8
require 'date'
require 'common/format'


class SwimmingPoolsController < ApplicationController

  # Index/Search action.
  #
  def index
# DEBUG
    logger.debug "\r\n\r\n!! ------ #{self.class.name}.index() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    @title = I18n.t('swimming_pool.index_title')
    @pools_grid = initialize_grid(
      SwimmingPool,
      :include => [:pool_type, :city],
      :order => 'swimming_pools.name',
      :order_direction => 'asc',
      :per_page => 20
    )
  end


  # Show action.
  #
  def show
# DEBUG
    logger.debug "\r\n\r\n!! ------ #{self.class.name}.show() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    pool_id = params[:id].to_i
    @pool = ( pool_id > 0 ) ? SwimmingPool.find_by_id( pool_id ) : nil
    unless ( @pool )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( swimming_pools_path() ) and return
    end
  end
end
