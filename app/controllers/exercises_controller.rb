# encoding: utf-8
require 'date'
require 'common/format'


class ExercisesController < ApplicationController

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
  # - <tt>:limit</tt> => to limit the array of results; the default is 100
  # - <tt>:query</tt> => a string match for the verbose description
  #
  # == Returns:
  # A JSON array of Hash instances having the structure: <tt>{ :label => row.get_full_name, :value => row.id }</tt>. 
  #
  def json_list
    if request.xhr?                                 # Make sure the request is an AJAX one
      where_condition = nil                         # Set up and check parameters:
      if params[:exercise_id].to_i > 0
        result_row = Exercise.find_by_id(params[:exercise_id].to_i)
        render( :json => { label: result_row.get_full_name, value: result_row.id } ) and return
      end

      if params[:training_step_type_id].to_i > 0
        where_condition = [
          '(training_step_type_id = ?) OR (training_step_type_id IS NULL)',
          params[:training_step_type_id].to_i
        ]
      end
      limit = ( params[:limit].to_i > 0 ? params[:limit].to_i : 100 )
                                                    # Get the results and filter them:
      result = Exercise.where( where_condition ).limit( limit )
      result = result.find_all { |row|
        row.get_full_name =~ Regexp.new( params[:query], true )
      } if params[:query]
                                                    # Map the result to an array of custom objects:
      result_array = result.map{ |row|
        { label: row.get_full_name, value: row.id }
      }.sort_by{ |item| item[:label] }
                                                    # Render the result array as JSON:
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
