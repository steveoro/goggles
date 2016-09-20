# encoding: utf-8
require 'date'
require 'common/format'
require 'training_printout_layout'


=begin

= UserTrainingStoriesController

  - version:  4.00.483
  - author:   Steve A.

=end
class UserTrainingStoriesController < ApplicationController

  # Require authorization before invoking any of this controller's actions:
  before_action :authenticate_user_from_token!
  before_action :authenticate_user!                # Devise "standard" HTTP log-in strategy
  # Parse parameters:
  before_action :verify_ownership, only: [:edit, :destroy, :update]
  before_action :verify_visibility, except: [:index, :edit, :new, :create]
  #-- -------------------------------------------------------------------------
  #++


  # Index/Search action.
  #
  def index
    @title = I18n.t('user_training_stories.index_title')
    @user_training_stories_grid = initialize_grid(
      UserTrainingStory.visible_to_user( current_user ),
#      include: [:swimmer_level_type, :user_training, :swimming_pool],
      order: :swam_date,
      order_direction: 'asc',
      per_page: 20
    )
    flash[:warning] = I18n.t('feature_wip_disclaimer')
  end


  # Show action.
  #
  def show
    @title = I18n.t('user_training_stories.show_title').gsub( "{TRAINING_TITLE}", @user_training_story.decorate.get_user_training_name )
  end
  #-- -------------------------------------------------------------------------
  #++


  # New action.
  #
  def new
    @user_training_story = UserTrainingStory.new
    flash[:warning] = I18n.t('feature_wip_disclaimer')
    render :edit
  end


  # Create action (POST only).
  #
  def create
    if request.post?
      @user_training_story = UserTrainingStory.new( params[:user_training_story] )
      @user_training_story.user_id = current_user.id # Set the owner for all the records

      if @user_training_story.save
        flash[:info] = I18n.t('user_training_stories.story_created')
        redirect_to( user_training_story_path(@user_training_story) )
      else
        flash[:error] = I18n.t('activerecord.errors.messages.record_invalid')
        render :action => :edit
      end
    else
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( user_training_stories_path() ) and return
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Edit action.
  #
  def edit
    @title = I18n.t('user_training_stories.show_title')
      .gsub(
        "{TRAINING_TITLE}",
        UserTrainingStoryDecorator.decorate(@user_training_story).get_user_training_name
      )
    flash[:warning] = I18n.t('feature_wip_disclaimer')
  end


  # Update action.
  #
  def update
    if @user_training_story.update_attributes( params[:user_training_story] )
      flash[:info] = I18n.t('user_training_stories.story_updated')
      redirect_to( user_training_story_path(@user_training_story) )
    else
      render :action => 'edit'
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Destroy action.
  #
  def destroy
    @user_training_story.destroy
    redirect_to( user_training_stories_path() )
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Verifies that the user_training_story id is provided as a parameter
  # and that the corresponding training is owned by the current user.
  # Otherwise, it redirects to the home page.
  # Assigns the @user_training_story instance when successful.
  # (Assumes log-in has been enforced elsewhere.)
  #
  # == Controller Params:
  # id: the user_training_story id to be processed by most of the methods (see before filter above)
  #
  def verify_ownership
    set_user_training_story
    if UserTrainingStoryAccessibility.new( current_user, @user_training_story ).is_owned
      return
    else
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( user_training_stories_path() ) and return
    end
  end


  # Verifies that a user_training_story id is provided as a parameter,
  # and that the corresponding training story is *visible* by the current user.
  # Otherwise, it redirects to the home page.
  # Assigns the @user_training_story instance when successful.
  # (Assumes log-in has been enforced elsewhere.)
  #
  # == Controller Params:
  # id: the user_training_story id to be processed by most of the methods (see before filter above)
  #
  def verify_visibility
    set_user_training_story
    unless UserTrainingStoryAccessibility.new( current_user, @user_training_story ).is_visible
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( user_training_stories_path() ) and return
    end
  end


  # Verifies that a user_training_story id is provided as a parameter to this controller.
  # Assigns the @user_training_story instance when successful.
  #
  # == Controller Params:
  # id: the user_training_story id to be processed by most of the methods (see before filter above)
  #
  def set_user_training_story
    @user_training_story = UserTrainingStory.find_by_id( params[:id].to_i )
  end
  #-- -------------------------------------------------------------------------
  #++
end
