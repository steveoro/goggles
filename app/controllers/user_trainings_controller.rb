# encoding: utf-8
require 'date'
require 'common/format'
require 'training_printout_layout'


class UserTrainingsController < ApplicationController

  # Wildcard string used to signal to the AJAX filtering method #json_list
  # that the query parameter must be ignored.
  QUERY_WILDCHAR = '%'

  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_entity_from_token!
  before_filter :authenticate_entity!                # Devise "standard" HTTP log-in strategy
  # ---------------------------------------------------------------------------


  # AJAX-only action to retrieve a filtered row list or a single instance.
  #
  # TODO [Steve, 20140122] [Future DEV] Move this action to an API-dedicated controller.
  #
  # == Params:
  # - <tt>:id</tt> => filter bypass, used to retrieve the specified single row instance identified by its id
  # - <tt>:training_step_type_id</tt> => when present, it is used as a filtering parameter for the result data set.
  # - <tt>:limit</tt> => to limit the array of results; the default top limit is set to 1000 for performance reasons (but it can be overridden by this parameter).
  # - <tt>:query</tt> => a string match for the verbose description; when equal to '%', the parameter is ignored.
  #
  # == Returns:
  # A JSON array of Hash instances having the structure:
  # <tt>{
  #       :label => row.get_full_name,
  #       :value => row.id,
  #       :tot_distance => row.compute_total_distance(),
  #       :tot_secs => row.compute_total_seconds(),
  #       :user_name: => row.get_user_name(),
  #       :swimmer_level_type_description: => row.get_swimmer_level_type( :i18n_description ),
  #       :swimmer_level_type_alternate => row.get_swimmer_level_type( :i18n_alternate )
  #     }</tt>. 
  #
  def json_list
    if request.xhr?                                 # Make sure the request is an AJAX one
# DEBUG
      logger.debug "\r\n\r\n!! ------ #{self.class.name}.index() -----"
      logger.debug "PARAMS: #{params.inspect}"
      if params[:id].to_i > 0                       # Set up and check parameters:
        result_row = UserTraining.find_by_id( params[:id].to_i )
        render(
          :json => {
            label: result_row.get_full_name(),
            value: result_row.id,
            tot_distance: result_row.compute_total_distance(),
            tot_secs: result_row.compute_total_seconds(),
            user_name: result_row.get_user_name(),
            swimmer_level_type_description: result_row.get_swimmer_level_type( :i18n_description ),
            swimmer_level_type_alternate: result_row.get_swimmer_level_type( :i18n_alternate )
          }
        ) and return
      end
      limit = ( params[:limit].to_i > 0 ? params[:limit].to_i : 1000 )
# FIXME / TODO MUST RETURN ONLY UserTraining rows belonging to friends of the current_user
# TODO ADD friend filtering scope on UserTraining
      result = UserTraining.where( :user_id => current_user.id )
                                                    # Get the results and filter them even more using the query chars:
      if params[:query] && ( params[:query].to_s != QUERY_WILDCHAR )
# DEBUG
#        logger.debug "result (before filtering): #{result.inspect}"
        result = result.find_all { |row|
          row.get_full_name() =~ Regexp.new( params[:query], true )
        }
      end
                                                    # Map the actual results to an array of custom objects (label with values, for drop-down list combo setup):
      if result.respond_to?( :map ) && result.respond_to?( :sort_by )
        result_array = result.map{ |row|
          {
            label: row.get_full_name(),
            value: row.id,
            tot_distance: row.compute_total_distance(),
            tot_secs: row.compute_total_seconds(),
            user_name: row.get_user_name(),
            swimmer_level_type_description: row.get_swimmer_level_type( :i18n_description ),
            swimmer_level_type_alternate: row.get_swimmer_level_type( :i18n_alternate )
          }
        }.sort_by{ |item| item[:label] }            # Sort also the result array by the label itself
      else
        result_array = []
      end
                                                    # Limit the result array, if necessary:
      result_array = result_array[0 .. limit-1] if result_array.size > limit
                                                    # Finally, render the result array as JSON:
      render( :json => result_array )
    else
      flash[:notice] = I18n.t(:invalid_action_request)
      redirect_to( exercises_path() ) and return
    end
  end
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------


  # Index/Search action.
  #
  def index
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}.index() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    @title = I18n.t('user_trainings.index_title')
    @user_trainings_grid = initialize_grid(
      UserTraining,
#      :include => [:swimmer_level_type],
      :order => :updated_at,
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
    user_training_id = params[:id].to_i
    @user_training = ( user_training_id > 0 ) ? UserTraining.find_by_id( user_training_id ) : nil
    unless ( @user_training )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( user_trainings_path() ) and return
    end
    @user_training_rows = @user_training.user_training_rows.includes(:exercise, :training_step_type).all
    @title = I18n.t('trainings.show_title').gsub( "{TRAINING_TITLE}", @user_training.description )
  end
  # ---------------------------------------------------------------------------


  # New action.
  #
  def new
    @user_training = UserTraining.new
    @user_training_max_part_order = 0
    render :edit
  end


  # Create action (POST only).
  #
  def create
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}.create() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    if request.post?
      @user_training = UserTraining.new( params[:user_training] )
                                                    # Set the owner for all the records:
      @user_training.user_id = current_user.id
      @user_training.user_training_rows.each{|row| row.user_id = current_user.id }

      if @user_training.save
        flash[:notice] = I18n.t('trainings.training_created')
        redirect_to( user_training_path(@user_training) )
      else
        render :action => :edit
      end
    else
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( user_trainings_path() ) and return
    end
  end
  # ---------------------------------------------------------------------------


  # Edit action.
  #
  def edit
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}.edit() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    user_training_id = params[:id].to_i
    @user_training = ( user_training_id > 0 ) ? UserTraining.find_by_id( user_training_id ) : nil
    @training_max_part_order = @user_training.user_training_rows.maximum(:part_order)
    unless ( @user_training )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( user_trainings_path() ) and return
    end
    @title = I18n.t('trainings.show_title').gsub( "{TRAINING_TITLE}", @user_training.description )
  end


  # Update action.
  #
  def update
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}.update() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    user_training_id = params[:id].to_i
    @user_training = ( user_training_id > 0 ) ? UserTraining.find_by_id( user_training_id ) : nil
    unless ( @user_training )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( user_trainings_path() ) and return
    end
    if @user_training.update_attributes( params[:user_training] )
      flash[:notice] = I18n.t('trainings.training_updated')
      redirect_to( user_training_path(@user_training) )
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
    user_training_id = params[:id].to_i
    @user_training = ( user_training_id > 0 ) ? UserTraining.find_by_id( user_training_id ) : nil
    unless ( @user_training )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( user_trainings_path() ) and return
    end
    @user_training.destroy
    redirect_to( user_trainings_path() )
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
    user_training_id = params[:id].to_i
    @user_training = ( user_training_id > 0 ) ? UserTraining.find_by_id( user_training_id ) : nil
    unless ( @user_training )
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( user_trainings_path() ) and return
    end
    @user_training_rows = @user_training.user_training_rows.includes(:exercise, :training_step_type).sort_by_part_order.all
    @title = I18n.t('trainings.show_title').gsub( "{TRAINING_TITLE}", @user_training.description )

                                                    # == OPTIONS setup + RENDERING phase ==
    filename = create_unique_filename( "#{I18n.t('trainings.training')}_#{@user_training.description}" ) + '.pdf'
    options = {
      :report_title         => @title,
      :meta_info_subject    => 'training model printout',
      :meta_info_keywords   => "Goggles, #{I18n.t('trainings.training')}, #{@user_training.description}",
      :header_row           => @user_training,
      :detail_rows          => @user_training_rows
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
      user_training_id = params[:id].to_i
      old_user_training = UserTraining.find_by_id( user_training_id )
      old_user_training_rows = UserTrainingRow.where(:user_training_id => old_user_training.id)

      new_user_training = UserTraining.new( old_user_training.attributes.reject{|e| ['id','lock_version','created_at','updated_at'].include?(e)} )
      new_user_training.description = "#{I18n.t(:copy_of)} ""#{old_user_training.description}"""
      new_user_training.user_id = current_user.id

      begin
        if new_user_training.save!
          created_group_ids = {}                    # Store in a hash which group IDs we have already created
          old_user_training_rows.each { |old_row|
            new_row = UserTrainingRow.new( old_row.attributes.reject{|e| ['id','lock_version','created_at','updated_at'].include?(e)} )
            new_row.user_training_id = new_user_training.id
            new_row.save!
          }
          flash[:notice] = I18n.t('trainings.training_created')
          redirect_to( edit_user_training_path(new_user_training) ) and return
        end
      rescue
        flash[:error] = "#{I18n.t('trainings.something_went_wrong_during_copy')}" +
                        ( admin_signed_in? ? "['#{ $!.to_s }']" : '' )
        redirect_to( user_trainings_path() ) and return
      end
    else
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( user_trainings_path() ) and return
    end
  end
  # ---------------------------------------------------------------------------


  # Create a new UserTrainingStory using the specified UserTraining id (POST only).
  #
  # == Params:
  #
  # - <tt>:id</tt> =>
  #   The id of the UserTraining; all its details will be retrieved also.
  #
  def create_user_story
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}.duplicate() -----"
#    logger.debug "PARAMS: #{params.inspect}"
    flash[:error] = "--- WORK IN PROGRESS ---"
    redirect_to( user_trainings_path() ) and return
# TODO
    # if request.post?
      # training_id = params[:id].to_i
      # training = Training.find_by_id( training_id )
      # training_rows = TrainingRow.where(:training_id => training.id)
# 
      # user_training = UserTraining.new()
      # user_training.description = "#{training.title}, #{Format.a_date(Date.today)}"
      # user_training.user_id = current_user.id
# 
      # begin
        # if user_training.save!
          # created_group_ids = {}                    # Store in a hash which group IDs we have already created
          # training_rows.each { |training_row|
            # user_training_row = UserTrainingRow.new(
              # training_row.attributes.reject{|e|
                # ['id','lock_version','created_at','updated_at','training_id'].include?(e)
              # }
            # )
            # user_training_row.user_training_id = user_training.id
            # user_training_row.save!
          # }
          # flash[:notice] = I18n.t('user_trainings.training_created')
          # redirect_to( edit_user_training_path(user_training) ) and return
        # end
      # rescue
        # flash[:error] = "#{I18n.t('trainings.something_went_wrong_during_copy')}" +
                        # ( admin_signed_in? ? "['#{ $!.to_s }']" : '' )
        # redirect_to( trainings_path() ) and return
      # end
    # else
      # flash[:error] = I18n.t(:invalid_action_request)
      # redirect_to( trainings_path() ) and return
    # end
  end
  # ---------------------------------------------------------------------------
end
