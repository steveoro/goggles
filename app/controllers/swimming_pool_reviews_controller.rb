# encoding: utf-8
=begin

= SwimmingPoolReviewsController

  - version:  6.002
  - author:   Steve A.

=end
class SwimmingPoolReviewsController < ApplicationController
  respond_to :html, :json

  # Require authorization before invoking some of this controller's actions:
#  before_action :authenticate_user_from_token!, except: [:index, :show, :for_swimming_pool, :for_user]
  before_action :authenticate_user!, except: [:index, :show, :for_swimming_pool, :for_user] # Devise HTTP log-in strategy
  # ---------------------------------------------------------------------------


  def index
    if request.format.json?
      respond_with( @reviews = SwimmingPoolReview.all )
    else
      # [Steve, 20161001] We need to whitelist all parameters for the search query:
      params.permit!()
      @title = I18n.t('swimming_pool_review.title_index')
      @reviews_grid = initialize_grid(
        SwimmingPoolReview,
        include: [:user, :swimming_pool],
        order: 'swimming_pool_reviews.title',
        order_direction: 'asc',
        per_page: 20
      )
    end
  end
  # ---------------------------------------------------------------------------


  # Returns the review for a specific review id.
  #
  # === Params:
  # - id: the Review.id
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
  # - id: the SwimmingPool.id
  #
  def for_swimming_pool
    @swimming_pool_id = params[:id]
    @reviews = SwimmingPoolReview.where( swimming_pool_id: @swimming_pool_id )
    @reviews.sort{ |a,b| (a.votes_for.down.count - a.votes_for.up.count) <=> (b.votes_for.down.count - b.votes_for.up.count) }
    respond_with( @reviews )
  end
  # ----------------------------------------------------------------------------


  # Returns the reviews found for a specific user id.
  #
  # === Params:
  # - id: the User.id
  #
  def for_user
    @user_id = params[:id]
    respond_with( @reviews = SwimmingPoolReview.where( user_id: @user_id ) )
  end
  # ----------------------------------------------------------------------------


  # Sends an e-mail abuse report for a specific SwimmingPoolReview id.
  #
  # TODO FUTUREDEV: add support for xhr request in this action
  #
  # === Params:
  # - id: the SwimmingPoolReview.id
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
  # TODO FUTUREDEV: add support for xhr request in this action
  #
  # === Params:
  # - :id   => the SwimmingPoolReview.id
  # - :vote => any value cast to a positive integer equals a single upvote; anything
  #            else (even nil) is a downvote.
  def vote
    @review = SwimmingPoolReview.find_by_id(params[:id])
    if @review
      (params[:vote].to_i > 0) ? @review.liked_by(current_user) : @review.downvote_from(current_user)
      flash[:info] = I18n.t('swimming_pool_review.thanks_for_the_vote')
    else
      flash[:error] = I18n.t(:invalid_action_request)
    end
    redirect_to(root_path) and return
  end
  # ----------------------------------------------------------------------------


  # Prepares the form for the creation of a new Review.
  # Only "confirmed" swimmer-user can do this.
  #
  # === Params:
  # - :swimming_pool_id (not required) => it will pre-set the swimming-pool id when present
  #
  def new
    render( status: 406, json: {success: false} ) and return if request.format.json?
    redirect_to(root_path) and return if current_user_does_not_have_enough_confirmations?
    @review = SwimmingPoolReview.new
    @review.user_id = current_user.id
    @review.swimming_pool_id = params[:swimming_pool_id]
    @title = I18n.t('swimming_pool_review.title_show')
    respond_with( @review )
  end
  # ---------------------------------------------------------------------------


  # Creates a new Review.
  # Only "confirmed" swimmer-user can do this.
  #
  # === Params:
  # - :swimming_pool_review => the hash of attributes for the creation
  #
  def create
    redirect_to(root_path) and return if current_user_does_not_have_enough_confirmations?
    @review = SwimmingPoolReview.create( swimming_pool_review_params )
    @review.user_id = current_user.id
    respond_with( @review )
  end
  # ---------------------------------------------------------------------------


  # Prepares the form for the editing of a new Review.
  #
  # === Params:
  # - id: the SwimmingPoolReview.id
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
  # - id: the SwimmingPoolReview.id
  # - :swimming_pool_review => the hash of attributes for the update
  #
  def update
    @review = SwimmingPoolReview.find_by_id(params[:id])
    redirect_to( swimming_pool_reviews_path() ) and return if @review.nil?
    @review.update_attributes( swimming_pool_review_params )
    respond_with( @review )
  end
  # ---------------------------------------------------------------------------


  # Deletes an existing Review.
  #
  # === Params:
  # - id: the SwimmingPoolReview.id
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


  private


  # Strong parameters checking for mass-assignment of a SwimmingPoolReview instance.
  # Returns the whitelisted, filtered params Hash.
  def swimming_pool_review_params
    params
      .require( :swimming_pool_review )
      .permit(
        :title, :entry_text,
        :swimming_pool_id,
        :user_id
      )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns true if the user doesn't meet the
  # criteria for creating a Review or false otherwise.
  #
  def current_user_does_not_have_enough_confirmations?
    # Only a confirmed swimmer-user can start the creation of a swimming-pool review:
    if current_user.has_swimmer_confirmations?
      false
    else
      flash[:error] = I18n.t(:invalid_action_request)
      true
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
