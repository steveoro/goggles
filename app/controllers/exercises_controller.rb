# encoding: utf-8
require 'date'
require 'common/format'


class ExercisesController < ApplicationController

  # Wildcard string used to signal to the AJAX filtering method #json_list
  # that the query parameter must be ignored.
  QUERY_WILDCHAR = '%'

  # Require authorization before invoking any of this controller's actions:
  before_filter :authenticate_user!
  # ---------------------------------------------------------------------------


  # AJAX-only action to retrieve a filtered row list.
  #
  # TODO [Steve, 20140122] [Future DEV] Move this action to an API-dedicated controller.
  #
  # == Params:
  # - <tt>:exercise_id</tt> => filter bypass to retrieve a single Exercise instance
  # - <tt>:training_step_type_id</tt> => when present, it is used as a filtering parameter for the result data set.
  # - <tt>:limit</tt> => to limit the array of results; the default top limit is set to 1000 for performance reasons (but it can be overridden by this parameter).
  # - <tt>:query</tt> => a string match for the verbose description; when equal to '%', the parameter is ignored.
  #
  # == Returns:
  # A JSON array of Hash instances having the structure:
  # <tt>{
  #       :label => row.get_full_name, :value => row.id,
  #       :tot_distance => row.compute_total_distance(),
  #       :tot_secs => row.compute_total_seconds(),
  #       :is_arm_aux_allowed => row.is_arm_aux_allowed(),
  #       :is_kick_aux_allowed => row.is_kick_aux_allowed(),
  #       :is_body_aux_allowed => row.is_body_aux_allowed(),
  #       :is_breath_aux_allowed => row.is_breath_aux_allowed(),
  #     }</tt>. 
  #
  def json_list
    if request.xhr?                                 # Make sure the request is an AJAX one
# DEBUG
#      logger.debug "\r\n\r\n!! ------ #{self.class.name}.index() -----"
#      logger.debug "PARAMS: #{params.inspect}"
      if params[:exercise_id].to_i > 0              # Set up and check parameters:
        result_row = Exercise.find_by_id(params[:exercise_id].to_i)
        render(
          :json => {
            label: result_row.get_full_name(
              0,
              Exercise.get_default_verbosity_for_label_symbol(),
              current_user.get_preferred_swimmer_level_id()
            ),
            value: result_row.id,
            tot_distance: result_row.compute_total_distance(),
            tot_secs: result_row.compute_total_seconds(),
            is_arm_aux_allowed: result_row.is_arm_aux_allowed(),
            is_kick_aux_allowed: result_row.is_kick_aux_allowed(),
            is_body_aux_allowed: result_row.is_body_aux_allowed(),
            is_breath_aux_allowed: result_row.is_breath_aux_allowed()
          }
        ) and return
      end
      limit = ( params[:limit].to_i > 0 ? params[:limit].to_i : 1000 )
      if params[:training_step_type_id].to_i > 0    # Filter by :training_step_type_id when specified:
        training_step_čode = TrainingStepType.find_by_id( params[:training_step_type_id].to_i ).code
        result = Exercise.belongs_to_training_step_code( training_step_čode )
      else
        result = Exercise.all
      end
                                                    # Get the results and filter them even more using the query chars:
      if params[:query] && ( params[:query].to_s != QUERY_WILDCHAR )
# DEBUG
#        logger.debug "result (before filtering): #{result.inspect}"
        result = result.find_all { |row|
          row.get_full_name(
            0,
            Exercise.get_default_verbosity_for_label_symbol(),
            current_user.get_preferred_swimmer_level_id()
          ) =~ Regexp.new( params[:query], true )
        }
      end
                                                    # Map the actual results to an array of custom objects (label with values, for drop-down list combo setup):
      if result.instance_of?( Array )
        result_array = result.map{ |row|
          {
            label: row.get_full_name(
              0,
              Exercise.get_default_verbosity_for_label_symbol(),
              current_user.get_preferred_swimmer_level_id()
            ),
            value: row.id,
            tot_distance: row.compute_total_distance(),
            tot_secs: row.compute_total_seconds(),
            is_arm_aux_allowed: row.is_arm_aux_allowed(),
            is_kick_aux_allowed: row.is_kick_aux_allowed(),
            is_body_aux_allowed: row.is_body_aux_allowed(),
            is_breath_aux_allowed: row.is_breath_aux_allowed()
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
    logger.debug "\r\n\r\n!! ------ #{self.class.name}.index() -----"
#    logger.debug "PARAMS: #{params.inspect}"
  end


  # Show action.
  #
  def show
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}.show() -----"
#    logger.debug "PARAMS: #{params.inspect}"
  end
  # ---------------------------------------------------------------------------


  # New action.
  #
  def new
  end


  # Create action (POST only).
  #
  def create
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}.create() -----"
#    logger.debug "PARAMS: #{params.inspect}"
  end
  # ---------------------------------------------------------------------------


  # Edit action.
  #
  def edit
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}.edit() -----"
#    logger.debug "PARAMS: #{params.inspect}"
  end


  # Update action.
  #
  def update
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}.update() -----"
#    logger.debug "PARAMS: #{params.inspect}"
  end
  # ---------------------------------------------------------------------------


  # Destroy action.
  #
  def destroy
# DEBUG
#    logger.debug "\r\n\r\n!! ------ #{self.class.name}.destroy() -----"
#    logger.debug "PARAMS: #{params.inspect}"
  end
  # ---------------------------------------------------------------------------
end
