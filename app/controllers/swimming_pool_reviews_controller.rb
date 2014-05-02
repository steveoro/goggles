# encoding: utf-8

class SwimmingPoolReviewsController < ApplicationController

  respond_to :html, :json

  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_entity_from_token!, except: [:index, :for_swimming_pool, :for_user]
  before_filter :authenticate_entity!, except: [:index, :for_swimming_pool, :for_user] # Devise HTTP log-in strategy
  # Parse parameters:
#  before_filter :verify_parameter, except: [:show_all]
#  before_filter :verify_parameter, except: [:show_all]
  # ---------------------------------------------------------------------------


  def index
    respond_with( @reviews = SwimmingPoolReview.all )
  end
  # ---------------------------------------------------------------------------


  # Returns the reviews found for a specific swimmin_pool id.
  #
  # === Params:
  # - :id => the SwimmingPool.id
  #
  def for_swimming_pool
    respond_with( @reviews = SwimmingPoolReview.where( swimming_pool_id: params[:id] ) )
  end
  # ----------------------------------------------------------------------------


  # Returns the reviews found for a specific user id.
  #
  # === Params:
  # - :id => the User.id
  #
  def for_user
    respond_with( @reviews = SwimmingPoolReview.where( user_id: params[:id] ) )
  end
  # ----------------------------------------------------------------------------


  def new
#    respond_with( @review = SwimmingPoolReview.new )
  end
  # ---------------------------------------------------------------------------


  def create
#    respond_with( @review = SwimmingPoolReview.create(params[:swimming_pool_review]) )
  end
  # ---------------------------------------------------------------------------


  def edit
#    respond_with( @review = SwimmingPoolReview.find(params[:id]) )
  end
  # ---------------------------------------------------------------------------


  def update
#    @review = SwimmingPoolReview.find(params[:id])
#    @review.update_attributes(params[:swimming_pool_review])
#    respond_with( @review )
  end
  # ---------------------------------------------------------------------------


  def destroy
    # TODO ?
  end
  # ---------------------------------------------------------------------------




  private


  # TODO
  # Verifies that a user id is provided as parameter; otherwise
  # redirects to the home page.
  # Assigns the @swimming_buddy instance when successful.
  #
  # == Params:
  # :user_id => 
  #
  # def verify_parameter
    # user_id = params[:id].to_i
    # @user = ( user_id > 0 ) ? User.find_by_id( user_id ) : nil
    # unless ( @swimming_buddy )                      # Check swimming buddy existance
      # flash[:error] = I18n.t(:invalid_action_request)
      # redirect_to( swimming_pool_reviews_path() ) and return
    # end
  # end
  # ---------------------------------------------------------------------------
end
