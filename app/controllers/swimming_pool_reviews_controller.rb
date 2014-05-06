# encoding: utf-8

class SwimmingPoolReviewsController < ApplicationController

  respond_to :html, :json

  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_entity_from_token!, except: [:index, :show, :for_swimming_pool, :for_user]
  before_filter :authenticate_entity!, except: [:index, :show, :for_swimming_pool, :for_user] # Devise HTTP log-in strategy
  # ---------------------------------------------------------------------------


  def index
    @title = I18n.t('swimming_pool_review.title_index')
    respond_with( @reviews = SwimmingPoolReview.all )
  end
  # ---------------------------------------------------------------------------


  # Returns the reviews found for a specific swimmin_pool id.
  #
  # === Params:
  # - :id => the SwimmingPool.id
  #
  def show
    @review = SwimmingPoolReview.find_by_id(params[:id])
    if @review.nil?
      if request.format.json?
        render( status: 406, json: {success: false} ) and return
      else
        redirect_to( swimming_pool_reviews_path() ) and return
      end
    end
    @title = I18n.t('swimming_pool_review.title_show')
    respond_with( @review )
  end
  # ----------------------------------------------------------------------------


  # Returns the reviews found for a specific swimmin_pool id.
  #
  # === Params:
  # - :id => the SwimmingPool.id
  #
  def for_swimming_pool
    @swimming_pool_id = params[:id]
    respond_with( @reviews = SwimmingPoolReview.where( swimming_pool_id: @swimming_pool_id ) )
  end
  # ----------------------------------------------------------------------------


  # Returns the reviews found for a specific user id.
  #
  # === Params:
  # - :id => the User.id
  #
  def for_user
    @user_id = params[:id]
    respond_with( @reviews = SwimmingPoolReview.where( user_id: @user_id ) )
  end
  # ----------------------------------------------------------------------------


  # Sends an e-mail abuse report for a specific SwimmingPoolReview id.
  #
  # === Params:
  # - :id => the SwimmingPoolReview.id
  #
  def report_abuse
    @review = SwimmingPoolReview.find_by_id(params[:id])
    if @review
      AgexMailer.report_abuse_mail( current_user, @review.user, 'SwimmingPoolReview', @review.id, @review.title ).deliver
      flash[:info] = I18n.t('swimming_pool_review.thanks_for_the_report')
    else
      flash[:error] = I18n.t(:invalid_action_request)
    end
    redirect_to(root_path) and return
  end
  # ----------------------------------------------------------------------------


  # Casts a vote (either up or down) for the specified review id.
  #
  # === Params:
  # - :id   => the SwimmingPoolReview.id
  # - :vote => any value cast to a positive integer equals a single upvote; anything
  #            else (even nil) is a downvote.
  def vote
    @review = SwimmingPoolReview.find_by_id(params[:id])
    if @review
      (params[:vote].to_i > 0) ? @review.liked_by(current_user) : @review.downvote_from(current_user)
    end
    redirect_to(root_path) and return
  end
  # ----------------------------------------------------------------------------


  # Prepares the form for the creation of a new Review.
  #
  # === Params:
  # - :swimming_pool_id (not required) => it will pre-set the swimming-pool id when present
  #
  def new
    render( status: 406, json: {success: false} ) and return if request.format.json?
    @review = SwimmingPoolReview.new
    @review.user_id = current_user.id
    @review.swimming_pool_id = params[:swimming_pool_id]
    @title = I18n.t('swimming_pool_review.title_show')
    respond_with( @review )
  end
  # ---------------------------------------------------------------------------


  # Creates a new Review.
  #
  # === Params:
  # - :swimming_pool_review => the hash of attributes for the creation
  #
  def create
    @review = SwimmingPoolReview.create(params[:swimming_pool_review])
    @review.user_id = current_user.id
    respond_with( @review )
  end
  # ---------------------------------------------------------------------------


  # Prepares the form for the editing of a new Review.
  #
  # === Params:
  # - :id => the SwimmingPoolReview.id
  #
  def edit
    render( status: 406, json: {success: false} ) and return if request.format.json?
    @review = SwimmingPoolReview.find_by_id(params[:id])
    redirect_to( swimming_pool_reviews_path() ) and return if @review.nil?
    @title = I18n.t('swimming_pool_review.title_show')
    respond_with( @review )
  end
  # ---------------------------------------------------------------------------


  # Updates an existing Review.
  #
  # === Params:
  # - :id => the SwimmingPoolReview.id
  # - :swimming_pool_review => the hash of attributes for the update
  #
  def update
    @review = SwimmingPoolReview.find_by_id(params[:id])
    redirect_to( swimming_pool_reviews_path() ) and return if @review.nil?
    @review.update_attributes(params[:swimming_pool_review])
    respond_with( @review )
  end
  # ---------------------------------------------------------------------------


  # Deletes an existing Review.
  #
  # === Params:
  # - :id => the SwimmingPoolReview.id
  #
  def destroy
    @review = SwimmingPoolReview.find_by_id(params[:id])
    if @review
      if @review.destroy
        flash[:info] = I18n.t('swimming_pool_review.delete_successful')
      end
    else
      flash[:error] = I18n.t(:invalid_action_request)
    end
    redirect_to( swimming_pool_reviews_path() ) and return
  end
  # ---------------------------------------------------------------------------
end
