# encoding: utf-8
require 'date'
require 'common/format'


=begin

= SwimmingPoolsController

  - version:  6.200
  - author:   Steve A.

=end
class SwimmingPoolsController < ApplicationController

  # Index/Search action.
  #
  # def index
    # redirect_to root_path and return if request.format.json?
    # # [Steve, 20161001] We need to whitelist all parameters for the search query:
    # params.permit!()
    # @title = I18n.t('swimming_pool.index_title')
    # # @pools_grid = initialize_grid(
      # # SwimmingPool,
      # # include: [:pool_type, :city],
      # # order: 'swimming_pools.name',
      # # order_direction: 'asc',
      # # per_page: 20
    # # )
  # end


  # Show action.
  #
  def show
    redirect_to root_path and return if request.format.json?
    pool_id = params[:id].to_i
    @pool = ( pool_id > 0 ) ? SwimmingPool.find_by_id( pool_id ) : nil
    unless ( @pool )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_back( fallback_location: root_path ) and return
    end
  end
end
