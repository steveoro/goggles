# encoding: utf-8
require 'date'
require 'common/format'
require 'training_printout_layout'


=begin

= UserTrainingsController

  - version:  4.00.383
  - author:   Steve A., Leega

=end
class UserTrainingsController < ApplicationController

  # Wildcard string used to signal to the AJAX filtering method #json_list
  # that the query parameter must be ignored.
  QUERY_WILDCHAR = '%'

  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_user_from_token!
  before_filter :authenticate_user!                # Devise "standard" HTTP log-in strategy
  # Parse parameters:
  before_filter :verify_ownership, only: [:edit, :destroy, :update]
  before_filter :verify_visibility, except: [:index, :edit, :new, :create]
  #-- -------------------------------------------------------------------------
  #++


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
  # A JSON array of Hash instances having the structure returned by
  # TrainingDecorator#.drop_down_attrs( current_user )
  #
  def json_list
    if request.xhr?                                 # Make sure the request is an AJAX one
# DEBUG
#      logger.debug "\r\n\r\n!! ------ #{self.class.name}.index() -----"
#      logger.debug "PARAMS: #{params.inspect}"
                                                    # -- Single id retrieval:
      if @user_training
        render( json: TrainingDecorator.decorate( @user_training ).drop_down_attrs() ) and return
      end
                                                    # -- Result List retrieval:
      limit = ( params[:limit].to_i > 0 ? params[:limit].to_i : 1000 )
      results = UserTraining.visible_to_user( current_user )
                                                    # Get the results and filter them even more using the query chars:
      if params[:query] && ( params[:query].to_s != QUERY_WILDCHAR )
# DEBUG
#        logger.debug "results (before filtering): #{results.inspect}"
        results = results.find_all { |row|
          row.get_full_name() =~ Regexp.new( params[:query], true )
        }
      end
                                                    # Map the actual results to an array of custom objects (label with values, for drop-down list combo setup):
      if results.respond_to?( :map ) && results.respond_to?( :sort_by )
        result_array = results.map{ |row|
          TrainingDecorator.decorate( row ).drop_down_attrs()
        }.sort_by{ |item| item[:label] }            # Sort also the result array by the label itself
      else
        result_array = []
      end
                                                    # Limit the result array, if necessary:
      result_array = result_array[0 .. limit-1] if result_array.size > limit
                                                    # Finally, render the result array as JSON:
      render( json: result_array )
    else
      flash[:info] = I18n.t(:invalid_action_request)
      redirect_to( exercises_path() ) and return
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Index/Search action.
  #
  def index
    @title = I18n.t('user_trainings.index_title')
    @user_trainings_grid = initialize_grid(
      UserTraining.visible_to_user( current_user ),
#      include: [:swimmer_level_type],
      order: :updated_at,
      order_direction: 'asc',
      per_page: 20
    )
  end


  # Show action.
  #
  def show
    @user_training = TrainingDecorator.decorate( @user_training )
    user_training_rows = @user_training.user_training_rows.includes(:exercise, :training_step_type).all
    @user_training_rows = TrainingRowDecorator.decorate_collection( user_training_rows )
    @title = I18n.t('trainings.show_title').gsub( "{TRAINING_TITLE}", @user_training.description )
  end
  #-- -------------------------------------------------------------------------
  #++


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
    if request.post?
      @user_training = UserTraining.new( params[:user_training] )
      @user_training.user_id = current_user.id      # Set the owner for all the records

      if @user_training.save
        flash[:info] = I18n.t('trainings.training_created')
        redirect_to( user_training_path(@user_training) )
      else
        render :action => :edit
      end
    else
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( user_trainings_path() ) and return
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Edit action.
  #
  def edit
    @user_training = TrainingDecorator.decorate( @user_training )
    @training_max_part_order = @user_training.user_training_rows.maximum(:part_order)
    @title = I18n.t('trainings.show_title').gsub( "{TRAINING_TITLE}", @user_training.description )
  end

  # Update action.
  #
  def update
    if @user_training.update_attributes( params[:user_training] )
      flash[:info] = I18n.t('trainings.training_updated')
      redirect_to( user_training_path(@user_training) )
    else
      render :action => 'edit'
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Destroy action.
  #
  def destroy
    @user_training.destroy
    redirect_to( user_trainings_path() )
  end
  #-- -------------------------------------------------------------------------
  #++


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
    user_training_rows = @user_training.user_training_rows.includes(:exercise, :training_step_type).sort_by_part_order.all
    if user_training_rows.size < 1
      flash[:error] = I18n.t(:no_detail_to_process)
      redirect_to( user_trainings_path() ) and return
    end
    title = I18n.t('trainings.show_title').gsub( "{TRAINING_TITLE}", @user_training.description )

                                                    # == OPTIONS setup + RENDERING phase ==
    base_filename = "#{I18n.t('trainings.training')}_#{@user_training.description}" 
    filename = create_unique_filename( base_filename ) + '.pdf'
    options = {
      :report_title         => title,
      :meta_info_subject    => 'training model printout',
      :meta_info_keywords   => "Goggles, #{base_filename}",
      :header_row           => TrainingDecorator.decorate( @user_training ),
      :detail_rows          => TrainingRowDecorator.decorate_collection( user_training_rows )
    }
    send_data(                                      # == Render layout & send data:
        TrainingPrintoutLayout.render( options ),
        :type => 'application/pdf',
        :filename => filename
    )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Ditto a training with all its details (POST only).
  #
  # == Params:
  #
  # - <tt>:id</tt> =>
  #   The id of the Training; all its details will be retrieved also.
  #
  def duplicate
    if request.post?
      old_user_training_rows = UserTrainingRow.where( user_training_id: @user_training.id )
      new_user_training = UserTraining.new( @user_training.attributes.reject{|e| ['id','lock_version','created_at','updated_at'].include?(e)} )
      new_user_training.description = "#{I18n.t(:copy_of)} ""#{@user_training.description}"""
      new_user_training.user_id = current_user.id

      begin
        if new_user_training.save!
          old_user_training_rows.each { |old_row|
            new_row = UserTrainingRow.new( old_row.attributes.reject{|e| ['id','lock_version','created_at','updated_at'].include?(e)} )
            new_row.user_training_id = new_user_training.id
            new_row.save!
          }
          flash[:info] = I18n.t('user_trainings.training_created')
          redirect_to( edit_user_training_path(new_user_training) ) and return
        end
      rescue
        flash[:error] = "#{I18n.t('something_went_wrong')}" + ( admin_signed_in? ? "['#{ $!.to_s }']" : '' )
        redirect_to( user_trainings_path() ) and return
      end
    else
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( user_trainings_path() ) and return
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Create a new UserTrainingStory using the specified UserTraining id (POST only).
  #
  # == Params:
  #
  # - <tt>:id</tt> =>
  #   The id of the UserTraining; all its details will be retrieved also.
  #
  def create_user_story
    if request.post?
      new_user_training_story = UserTrainingStory.new()
      new_user_training_story.user_id = current_user.id
      new_user_training_story.total_training_time = @user_training.esteemed_total_seconds
      new_user_training_story.user_training_id = @user_training.id
      new_user_training_story.swimmer_level_type_id = current_user.get_preferred_swimmer_level_id
      new_user_training_story.swam_date = Date.today
      # TODO get swimming_pool_id from a previously saved, (same-) user story, if available

      begin
        if new_user_training_story.save!
          flash[:info] = I18n.t('user_training_stories.story_created')
          redirect_to( edit_user_training_story_path(new_user_training_story) ) and return
        end
      rescue
        flash[:error] = "#{I18n.t('something_went_wrong')}" + ( admin_signed_in? ? "['#{ $!.to_s }']" : '' )
        redirect_to( user_trainings_path() ) and return
      end
    else
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( user_trainings_path() ) and return
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Verifies that the user_training id is provided as a parameter
  # and that the corresponding training is owned by the current user.
  # Otherwise, it redirects to the home page.
  # Assigns the @user_training instance when successful.
  # (Assumes log-in has been enforced elsewhere.)
  #
  # == Controller Params:
  # id: the user_training id to be processed by most of the methods (see before filter above)
  #
  def verify_ownership
    set_user_training
    if UserTrainingAccessibility.new(current_user, @user_training, admin_signed_in?).is_owned
      return
    else
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( user_trainings_path() ) and return
    end
  end


  # Verifies that a user_training id is provided as a parameter (except for an AJAX request, in which case it may be nil)
  # and that the corresponding training is *visible* by the current user.
  # Otherwise, it redirects to the home page.
  # Assigns the @user_training instance when successful.
  # (Assumes log-in has been enforced elsewhere.)
  #
  # == Controller Params:
  # id: the user_training id to be processed by most of the methods (see before filter above)
  #
  def verify_visibility
    set_user_training
    if UserTrainingAccessibility.new(current_user, @user_training, admin_signed_in?).is_visible ||
       ( request.xhr? && @user_training.nil? )
      return
    else
      if request.xhr?
        render( status: 406, json: { success: false, message: I18n.t(:invalid_action_request) } ) and return
      else
        flash[:error] = I18n.t(:invalid_action_request)
        redirect_to( user_trainings_path() ) and return
      end
    end
  end


  # Verifies that a user_training id is provided as a parameter to this controller.
  # Assigns the @user_training instance when successful.
  #
  # == Controller Params:
  # id: the user_training id to be processed by most of the methods (see before filter above)
  #
  def set_user_training
    @user_training = UserTraining.find_by_id( params[:id].to_i )
  end
  #-- -------------------------------------------------------------------------
  #++
end
