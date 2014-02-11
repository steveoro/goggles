# encoding: utf-8
require 'date'
require 'common/format'
require 'training_printout_layout'


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
#      :include => [:swimmer_level_type],
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
    @training_rows = @training.training_rows.includes(:exercise, :training_step_type).all
    @title = I18n.t('trainings.show_title').gsub( "{TRAINING_TITLE}", @training.title )
  end
  # ---------------------------------------------------------------------------


  # New action.
  #
  def new
    @training = Training.new
    @training_max_part_order = 0
    render :edit
  end


  # Create action (POST only).
  #
  def create
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}.create() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    if request.post?
      @training = Training.new( params[:training] )
                                                    # Set the owner for all the records:
      @training.user_id = current_user.id
      @training.training_rows.each{|row| row.user_id = current_user.id }

      if @training.save
        flash[:notice] = I18n.t('trainings.training_created')
        redirect_to( training_path(@training) )
      else
        render :action => :edit
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
    @training_max_part_order = @training.training_rows.maximum(:part_order)
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
    if @training.update_attributes( params[:training] )
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


  # Prepares the selected training data for a PDF print-out.
  # Supports the creation of a single file contaning a single Training header only
  # (including all its detail rows).
  #
  # == Params:
  #
  # - <tt>:id</tt> =>
  #   The id of the Training header; all its details will be retrieved also.
  #
  def printout()
# DEBUG
#    logger.debug( "\r\n\r\n---[ #{controller_name()}.printout ] ---" ) if DEBUG_VERBOSE
#    logger.debug( "Params: #{params.inspect()}" ) if DEBUG_VERBOSE
    training_id = params[:id].to_i
    @training = ( training_id > 0 ) ? Training.find_by_id( training_id ) : nil
    unless ( @training )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( trainings_path() ) and return
    end
    @training_rows = @training.training_rows.includes(:exercise, :training_step_type).sort_by_part_order.all
    @title = I18n.t('trainings.show_title').gsub( "{TRAINING_TITLE}", @training.title )

                                                    # == OPTIONS setup + RENDERING phase ==
    filename = create_unique_filename( "#{I18n.t('trainings.training')}_#{@training.title}" ) + '.pdf'
    options = {
      :report_title         => @title,
      :meta_info_subject    => 'training model printout',
      :meta_info_keywords   => "Goggles, #{I18n.t('trainings.training')}, '#{@training.title}'",
      :header_row           => @training,
      :detail_rows          => @training_rows
    }
                                                    # == Render layout & send data:
    send_data(
        TrainingPrintoutLayout.render( options ),
        :type => 'application/pdf',
        :filename => filename
    )
  end
  # ---------------------------------------------------------------------------


  # Ditto a training with all its details (POST only).
  #
  # == Params:
  #
  # - <tt>:id</tt> =>
  #   The id of the Training; all its details will be retrieved also.
  #
  def duplicate
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}.duplicate() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    if request.post?
      training_id = params[:id].to_i
      old_training = Training.find_by_id( training_id )
      old_training_rows = TrainingRow.where(:training_id => old_training.id)

      new_training = Training.new( old_training.attributes.reject{|e| ['id','lock_version','created_at','updated_at'].include?(e)} )
      new_training.title = "#{I18n.t(:copy_of)} '#{old_training.title}'"
      new_training.user_id = current_user.id

      begin
        if new_training.save!
          created_group_ids = {}                    # Store in a hash which group IDs we have already created
          old_training_rows.each { |old_row|
            new_row = TrainingRow.new( old_row.attributes.reject{|e| ['id','lock_version','created_at','updated_at'].include?(e)} )
            new_row.training_id = new_training.id
            new_row.user_id = current_user.id
            new_row.save!
          }
          flash[:notice] = I18n.t('trainings.training_created')
          redirect_to( edit_training_path(new_training) ) and return
        end
      rescue
        flash[:error] = "#{I18n.t('trainings.something_went_wrong_during_copy')}" +
                        ( admin_signed_in? ? "['#{ $!.to_s }']" : '' )
        redirect_to( trainings_path() ) and return
      end
    else
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( trainings_path() ) and return
    end
  end
  # ---------------------------------------------------------------------------
end
