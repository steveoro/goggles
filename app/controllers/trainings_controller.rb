# encoding: utf-8
require 'date'
require 'common/format'
require 'training_printout_layout'


=begin

= TrainingsController

  - version:  6.002
  - author:   Steve A., Leega

=end
class TrainingsController < ApplicationController

  # Require authorization before invoking any of this controller's actions:
  before_action :authenticate_user!                # Devise "standard" HTTP log-in strategy
  # Parse parameters:
  before_action :verify_ownership, only: [:edit, :destroy, :update]
  before_action :verify_visibility, except: [:index, :new, :create]
  #-- -------------------------------------------------------------------------
  #++


  # Index/Search action.
  #
  def index
    # [Steve, 20161001] We need to whitelist all parameters for the search query:
    params.permit!()
    @title = I18n.t('trainings.index_title')
    @trainings_grid = initialize_grid(
      Training,
#      include: [:swimmer_level_type],
      order: :title,
      order_direction: 'asc',
      per_page: 20
    )
    flash[:warning] = I18n.t('feature_wip_disclaimer')
  end


  # Show action.
  #
  def show
    training_rows = @training.training_rows.includes(:exercise, :training_step_type).all
    @training_rows = TrainingRowDecorator.decorate_collection( training_rows )
    @title = I18n.t('trainings.show_title').gsub( "{TRAINING_TITLE}", @training.title )
  end
  #-- -------------------------------------------------------------------------
  #++


  # New action.
  #
  def new
    @training = Training.new
    @training_max_part_order = 0
    assign_all_options_array()
    flash[:warning] = I18n.t('feature_wip_disclaimer')
    render :edit
  end


  # Create action (POST only).
  #
  def create
    if request.post?
      @training = Training.new( training_params )
      @training.user_id = current_user.id           # Set the owner for all the records

      if @training.save
        flash[:info] = I18n.t('trainings.training_created')
        redirect_to( training_path(@training) )
      else
        flash[:error] = I18n.t('activerecord.errors.messages.record_invalid')
        assign_all_options_array()
        render :edit
      end
    else
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( trainings_path() ) and return
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Edit action.
  #
  def edit
    @training_max_part_order = @training.training_rows.maximum(:part_order)
    @title = I18n.t('trainings.show_title').gsub( "{TRAINING_TITLE}", @training.title )
    assign_all_options_array()
    flash[:warning] = I18n.t('feature_wip_disclaimer')
  end


  # Update action.
  #
  def update
    if @training.update_attributes( training_params )
      flash[:info] = I18n.t('trainings.training_updated')
      redirect_to( training_path(@training) )
    else
      assign_all_options_array()
      render :edit
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Destroy action.
  #
  def destroy
    @training.destroy
    redirect_to( trainings_path() )
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
    training_rows = @training.training_rows.includes(:exercise, :training_step_type).sort_by_part_order.all
    if training_rows.size < 1
      flash[:error] = I18n.t(:no_detail_to_process)
      redirect_to( trainings_path() ) and return
    end
    title = I18n.t('trainings.show_title').gsub( "{TRAINING_TITLE}", @training.title )

                                                    # == OPTIONS setup + RENDERING phase ==
    base_filename = "#{I18n.t('trainings.training')}_#{@training.title}"
    filename = create_unique_filename( base_filename ) + '.pdf'
    options = {
      :report_title         => title,
      :meta_info_subject    => 'training model printout',
      :meta_info_keywords   => "Goggles, #{base_filename}'",
      :header_row           => TrainingDecorator.decorate( @training ),
      :detail_rows          => TrainingRowDecorator.decorate_collection( training_rows )
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
      old_training_rows = TrainingRow.where( training_id: @training.id )
      new_training = Training.new( @training.attributes.reject{|e| ['id','lock_version','created_at','updated_at'].include?(e)} )
      new_training.title = "#{I18n.t(:copy_of)} '#{@training.title}'"
      new_training.user_id = current_user.id

      begin
        if new_training.save!
          old_training_rows.each { |old_row|
            new_row = TrainingRow.new( old_row.attributes.reject{|e| ['id','lock_version','created_at','updated_at'].include?(e)} )
            new_row.training_id = new_training.id
            new_row.save!
          }
          flash[:info] = I18n.t('trainings.training_created')
          redirect_to( edit_training_path(new_training) ) and return
        end
      rescue
        flash[:error] = "#{I18n.t('trainings.something_went_wrong_during_copy')}"
        redirect_to( trainings_path() ) and return
      end
    else
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( trainings_path() ) and return
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Use a training with all its details as a model for a UserTraining (POST only).
  #
  # == Params:
  #
  # - <tt>:id</tt> =>
  #   The id of the Training; all its details will be retrieved also.
  #
  def create_user_training
    if request.post?
      training_rows = TrainingRow.where( training_id: @training.id )
      user_training = UserTraining.new()
      user_training.description = "#{@training.title}, #{Format.a_date(Date.today)}"
      user_training.user_id = current_user.id

      begin
        if user_training.save!
          training_rows.each { |training_row|
            user_training_row = UserTrainingRow.new(
              training_row.attributes.reject{|e|
                ['id','lock_version','created_at','updated_at','training_id'].include?(e)
              }
            )
            user_training_row.user_training_id = user_training.id
            user_training_row.save!
          }
          flash[:info] = I18n.t('user_trainings.training_created')
          redirect_to( edit_user_training_path(user_training) ) and return
        end
      rescue
        flash[:error] = "#{I18n.t('trainings.something_went_wrong_during_copy')}"
        redirect_to( trainings_path() ) and return
      end
    else
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( trainings_path() ) and return
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Strong parameters checking for mass-assignment of a Training instance.
  # Returns the whitelisted, filtered params Hash.
  def training_params
    params
      .require( :training )
      .permit(
        :title, :description,
        :min_swimmer_level,
        :max_swimmer_level,
        :user_id,
        training_rows_attributes: [
          :part_order,
          :group_id, :group_times, :group_start_and_rest, :group_pause,
          :times, :distance, :start_and_rest, :pause,
          :training_id, :exercise_id, :training_step_type_id,
          :arm_aux_type_id, :kick_aux_type_id, :body_aux_type_id, :breath_aux_type_id
        ]
      )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Verifies that the training id is provided as a parameter
  # and that the corresponding training is owned by the current user.
  # Otherwise, it redirects to the home page.
  # Assigns the @training instance when successful.
  # (Assumes log-in has been enforced elsewhere.)
  #
  # == Controller Params:
  # id: the user_training id to be processed by most of the methods (see before filter above)
  #
  def verify_ownership
    set_training
    if TrainingAccessibility.new( current_user, @training ).is_owned
      return
    else
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( trainings_path() ) and return
    end
  end


  # Verifies that a training id is provided as a parameter (except for an AJAX request, in which case it may be nil).
  # Otherwise, it redirects to the home page.
  # Assigns the @training instance when successful.
  # (Assumes log-in has been enforced elsewhere.)
  #
  # == Controller Params:
  # id: the training id to be processed by most of the methods (see before filter above)
  #
  def verify_visibility
    set_training
    unless TrainingAccessibility.new( current_user, @training ).is_visible
      flash[:error] = I18n.t(:invalid_action_request)
      redirect_to( trainings_path() ) and return
    end
  end


  # Verifies that a training id is provided as a parameter to this controller.
  # Assigns the @training instance when successful.
  #
  # == Controller Params:
  # id: the training id to be processed by most of the methods (see before filter above)
  #
  def set_training
    @training = Training.find_by_id( params[:id].to_i )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Prepares and assigns all the arrays used for the drop-down combo selects of the
  # edit form.
  # This should be invoked before any rendering of the edit views.
  #
  def assign_all_options_array
    @start_rest_options_array = 0.step(3600,5).collect{ |x| [(x > 0 ? sprintf("%2s\'%02.0f\"",x/60, x%60) : '-'), x] }
    @pause_options_array      = 0.step(1800,5).collect{ |x| [(x > 0 ? sprintf("%2s\'%02.0f\"",x/60, x%60) : '-'), x] }
    @exercise_options_array   = [[nil,nil]] + Exercise.to_dropdown()
    @step_type_options_array  = TrainingStepType.to_unsorted_dropdown( nil, :id, :i18n_description )
    @arm_aux_options_array    = ArmAuxType.to_dropdown( nil, :id, :i18n_description )
    @kick_aux_options_array   = KickAuxType.to_dropdown( nil, :id, :i18n_description )
    @body_aux_options_array   = BodyAuxType.to_dropdown( nil, :id, :i18n_description )
    @breath_aux_options_array = BreathAuxType.to_dropdown( nil, :id, :i18n_description )
  end
  #-- -------------------------------------------------------------------------
  #++
end
