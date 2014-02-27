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
# TODO
    # @user_trainings_grid = initialize_grid(
      # UserTraining,
# #      :include => [:swimmer_level_type],
      # :order => :updated_at,
      # :order_direction => 'asc',
      # :per_page => 20
    # )
  end


  # Show action.
  #
  def show
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}.show() -----"
#    logger.debug "PARAMS: #{params.inspect}"
# TODO
    # user_training_id = params[:id].to_i
    # @user_training = ( user_training_id > 0 ) ? UserTraining.find_by_id( user_training_id ) : nil
    # unless ( @user_training )
      # flash[:error] = I18n.t(:invalid_action_request)
      # redirect_to( user_trainings_path() ) and return
    # end
    # @user_training_rows = @user_training.user_training_rows.includes(:exercise, :training_step_type).all
    # @title = I18n.t('trainings.show_title').gsub( "{TRAINING_TITLE}", @user_training.description )
  end
  # ---------------------------------------------------------------------------


  # New action.
  #
  def new
# TODO
    # @user_training = UserTraining.new
    # @user_training_max_part_order = 0
    # render :edit
  end


  # Create action (POST only).
  #
  def create
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}.create() -----"
#    logger.debug "PARAMS: #{params.inspect}"
# TODO
    # if request.post?
      # @user_training = UserTraining.new( params[:user_training] )
                                                    # # Set the owner for all the records:
      # @user_training.user_id = current_user.id
      # @user_training.user_training_rows.each{|row| row.user_id = current_user.id }
# 
      # if @user_training.save
        # flash[:notice] = I18n.t('trainings.training_created')
        # redirect_to( user_training_path(@user_training) )
      # else
        # render :action => :edit
      # end
    # else
      # flash[:error] = I18n.t(:invalid_action_request)
      # redirect_to( user_trainings_path() ) and return
    # end
  end
  # ---------------------------------------------------------------------------


  # Edit action.
  #
  def edit
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}.edit() -----"
#    logger.debug "PARAMS: #{params.inspect}"
# TODO
    # user_training_id = params[:id].to_i
    # @user_training = ( user_training_id > 0 ) ? UserTraining.find_by_id( user_training_id ) : nil
    # @training_max_part_order = @user_training.user_training_rows.maximum(:part_order)
    # unless ( @user_training )
      # flash[:error] = I18n.t(:invalid_action_request)
      # redirect_to( user_trainings_path() ) and return
    # end
    # @title = I18n.t('trainings.show_title').gsub( "{TRAINING_TITLE}", @user_training.description )
  end


  # Update action.
  #
  def update
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}.update() -----"
#    logger.debug "PARAMS: #{params.inspect}"
# TODO
    # user_training_id = params[:id].to_i
    # @user_training = ( user_training_id > 0 ) ? UserTraining.find_by_id( user_training_id ) : nil
    # unless ( @user_training )
      # flash[:error] = I18n.t(:invalid_action_request)
      # redirect_to( user_trainings_path() ) and return
    # end
    # if @user_training.update_attributes( params[:user_training] )
      # flash[:notice] = I18n.t('trainings.training_updated')
      # redirect_to( user_training_path(@user_training) )
    # else
      # render :action => 'edit'
    # end
  end
  # ---------------------------------------------------------------------------


  # Destroy action.
  #
  def destroy
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}.destroy() -----"
#    logger.debug "PARAMS: #{params.inspect}"
# TODO
    # user_training_id = params[:id].to_i
    # @user_training = ( user_training_id > 0 ) ? UserTraining.find_by_id( user_training_id ) : nil
    # unless ( @user_training )
      # flash[:error] = I18n.t(:invalid_action_request)
      # redirect_to( user_trainings_path() ) and return
    # end
    # @user_training.destroy
    # redirect_to( user_trainings_path() )
  end
  # ---------------------------------------------------------------------------
end
