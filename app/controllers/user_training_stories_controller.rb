# encoding: utf-8
require 'date'
require 'common/format'
require 'training_printout_layout'


class UserTrainingStoriesController < ApplicationController

  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_user!
  # ---------------------------------------------------------------------------


  # Index/Search action.
  #
  def index
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}.index() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    @title = I18n.t('user_training_stories.index_title')
    @user_training_stories_grid = initialize_grid(
      UserTrainingStory,
#      :include => [:swimmer_level_type, :user_training, :swimming_pool],
      :order => :swam_date,
      :order_direction => 'asc',
      :per_page => 20
    )
  end


  # Show action.
  #
  def show
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}.show() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    user_training_story_id = params[:id].to_i
    @user_training_story = ( user_training_story_id > 0 ) ? UserTrainingStory.find_by_id( user_training_story_id ) : nil
    unless ( @user_training_story )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( user_training_stories_path() ) and return
    end
    @title = I18n.t('user_training_stories.show_title').gsub( "{TRAINING_TITLE}", @user_training_story.get_user_training_name )
  end
  # ---------------------------------------------------------------------------


  # New action.
  #
  def new
    @user_training_story = UserTrainingStory.new
    render :edit
  end


  # Create action (POST only).
  #
  def create
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}.create() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    if request.post?
      @user_training_story = UserTrainingStory.new( params[:user_training_story] )
                                                    # Set the owner for all the records:
      @user_training_story.user_id = current_user.id

      if @user_training_story.save
        flash[:notice] = I18n.t('user_training_stories.story_created')
        redirect_to( user_training_story_path(@user_training_story) )
      else
        render :action => :edit
      end
    else
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( user_training_stories_path() ) and return
    end
  end
  # ---------------------------------------------------------------------------


  # Edit action.
  #
  def edit
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}.edit() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    user_training_story_id = params[:id].to_i
    @user_training_story = ( user_training_story_id > 0 ) ? UserTrainingStory.find_by_id( user_training_story_id ) : nil
    unless ( @user_training_story )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( user_training_stories_path() ) and return
    end
    @title = I18n.t('user_training_stories.show_title').gsub( "{TRAINING_TITLE}", @user_training_story.get_user_training_name )
  end


  # Update action.
  #
  def update
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}.update() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    user_training_story_id = params[:id].to_i
    @user_training_story = ( user_training_story_id > 0 ) ? UserTrainingStory.find_by_id( user_training_story_id ) : nil
    unless ( @user_training_story )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( user_training_stories_path() ) and return
    end
    if @user_training_story.update_attributes( params[:user_training_story] )
      flash[:notice] = I18n.t('user_training_stories.story_updated')
      redirect_to( user_training_story_path(@user_training_story) )
    else
      render :action => 'edit'
    end
  end
  # ---------------------------------------------------------------------------


  # Destroy action.
  #
  def destroy
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}.destroy() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    user_training_story_id = params[:id].to_i
    @user_training_story = ( user_training_story_id > 0 ) ? UserTrainingStory.find_by_id( user_training_story_id ) : nil
    unless ( @user_training_story )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( user_training_stories_path() ) and return
    end
    @user_training_story.destroy
    redirect_to( user_training_stories_path() )
  end
  # ---------------------------------------------------------------------------
end
