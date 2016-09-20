# encoding: utf-8
require 'date'
require 'common/format'
require 'json'


=begin

= ExercisesController

  - version:  4.00.317.20140616
  - author:   Steve A., Leega

=end
class ExercisesController < ApplicationController

  # Wildcard string used to signal to the AJAX filtering method #json_list
  # that the query parameter must be ignored.
  QUERY_WILDCHAR = '%'

  # Require authorization before invoking any of this controller's actions:
  before_action :authenticate_user_from_token!
  before_action :authenticate_user!                   # Devise "standard" HTTP log-in strategy
  #-- -------------------------------------------------------------------------
  #++


  # AJAX-only action to retrieve a filtered row list or a single instance.
  # (was: API vers. 0.1)
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
  # ExerciseDecorator#.drop_down_attrs( current_user )
  #
  def json_list
    if request.xhr? || request.format.json?         # Make sure the request is an AJAX or JSON one
# DEBUG
#      logger.debug "\r\n\r\n!! ------ #{self.class.name}.index() -----"
#      logger.debug "PARAMS: #{params.inspect}"
      if params[:id].to_i > 0                       # Set up and check parameters:
        result_row = Exercise.find_by_id( params[:id].to_i )
        render(
          json: ExerciseDecorator.decorate( result_row ).drop_down_attrs( current_user )
        ) and return
      end

      limit = ( params[:limit].to_i > 0 ? params[:limit].to_i : 1000 )
      if params[:training_step_type_id].to_i > 0    # Filter by :training_step_type_id when specified:
        training_step_code = TrainingStepType.find_by_id( params[:training_step_type_id].to_i ).code
        result = Exercise.belongs_to_training_step_code( training_step_code )
      else
        result = Exercise.all
      end
                                                    # Get the results and filter them even more using the query chars:
      if params[:query] && ( params[:query].to_s != QUERY_WILDCHAR )
# DEBUG
#        logger.debug "result (before filtering): #{result.inspect}"
        result = result.find_all { |exercise|
          ExerciseDecorator.decorate( exercise ).get_full_name(
            0,
            :short,
            ( current_user ? current_user.get_preferred_swimmer_level_id() : 0 )
          ) =~ Regexp.new( params[:query], true )
        }
      end
                                                    # Map the actual results to an array of custom objects (label with values, for drop-down list combo setup):
      if result.respond_to?( :map ) && result.respond_to?( :sort_by )
        result_array = result.map{ |exercise|
          ExerciseDecorator.decorate( exercise ).drop_down_attrs( current_user )
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
      redirect_to( root_path() ) and return
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
