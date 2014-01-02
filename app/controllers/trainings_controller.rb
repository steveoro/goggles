# encoding: utf-8
require 'date'
require 'common/format'


class TrainingsController < ApplicationController

  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_user!
  # ---------------------------------------------------------------------------


  # Index/Search action.
  #
  def index
# DEBUG
    logger.debug "\r\n\r\n!! ------ #{self.class.name}.index() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    @title = I18n.t('trainings.index_title')
    @trainings_grid = initialize_grid(
      Training,
      :include => [:swimmer_level_type],
      :order => :title,
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
    training_id = params[:id].to_i
    @training = ( training_id > 0 ) ? Training.find_by_id( training_id ) : nil
    unless ( @training )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( trainings_path() ) and return
    end
    @title = I18n.t('trainings.show_title').gsub( "{TRAINING_TITLE}", @training.title )
  end
  # ---------------------------------------------------------------------------


  # New action.
  #
  def new
    @training = Training.new
  end


  # Create action (POST only).
  #
  def create
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}.create() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    if request.post?
      @training = Training.new()
      @training.title = params[:training][:title]
      @training.description = params[:training][:description]
      @training.swimmer_level_type_id = params[:training][:swimmer_level_type_id]
      @training.user_id = current_user.id
      
      if @training.save
        flash[:notice] = I18n.t('trainings.training_created')
        redirect_to( trainings_path() )
      else
        render :action => 'new'
      end
    else
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( trainings_path() ) and return
    end
  end
  # ---------------------------------------------------------------------------


  # Edit action.
  #
  def edit
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}.edit() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    training_id = params[:id].to_i
    @training = ( training_id > 0 ) ? Training.find_by_id( training_id ) : nil
    unless ( @training )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( trainings_path() ) and return
    end
    @title = I18n.t('trainings.show_title').gsub( "{TRAINING_TITLE}", @training.title )
  end


  # Update action.
  #
  def update
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}.update() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    training_id = params[:id].to_i
    @training = ( training_id > 0 ) ? Training.find_by_id( training_id ) : nil
    unless ( @training )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( trainings_path() ) and return
    end
    @training.title = params[:training][:title] if params[:training][:title]
    @training.description = params[:training][:description] if params[:training][:description]
    @training.swimmer_level_type_id = params[:training][:swimmer_level_type_id] if params[:training][:swimmer_level_type_id]
    @training.user_id = current_user.id
    if @training.save
      flash[:notice] = I18n.t('trainings.training_updated')
      redirect_to( training_path(@training) )
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
    training_id = params[:id].to_i
    @training = ( training_id > 0 ) ? Training.find_by_id( training_id ) : nil
    unless ( @training )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( trainings_path() ) and return
    end
    @training.destroy
    redirect_to( trainings_path() )
  end
  # ---------------------------------------------------------------------------
end
