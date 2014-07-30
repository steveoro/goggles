# encoding: utf-8
require 'date'
require 'common/format'


=begin

= SwimmingPoolsController

  - version:  4.00.383
  - author:   Steve A.

=end
class SwimmingPoolsController < ApplicationController

  # Index/Search action.
  #
  def index
    @title = I18n.t('swimming_pool.index_title')
    @pools_grid = initialize_grid(
      SwimmingPool,
      include: [:pool_type, :city],
      order: 'swimming_pools.name',
      order_direction: 'asc',
      per_page: 20
    )
  end


  # Show action.
  #
  def show
    pool_id = params[:id].to_i
    @pool = ( pool_id > 0 ) ? SwimmingPool.find_by_id( pool_id ) : nil
    unless ( @pool )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( swimming_pools_path() ) and return
    end
  end
end
