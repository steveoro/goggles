#
# R/O RESTful API controller
#
class Api::V1::ExercisesController < ApplicationController

  respond_to :json

  before_filter :ensure_format
  # ---------------------------------------------------------------------------


  # Returns a JSON-encoded Array of all the rows.
  # Each array element is a JSON-encoded hash of a single row.
  # The keys of the Hash are the attributes as string.
  #
  # === Additional params:
  # - 'code_like':              a matching (sub)string for the Exercise.code
  # - 'training_step_type_id':  an indirect, exact match filter for any element in training_step_codes (retrieves the single code and checks for inclusion in comma separated list of codes)
  # - 'description_like':       a matching (sub)string for the Exercise.get_full_name() description.
  #
  # The first has higher precedence over the second and are mutually exclusive.
  # The third one can be used in conjunction with the first two.
  #
  def index
    # (This uses Squeel DSL syntax for where clauses)
    if params[:code_like]
      filter = "%#{params[:code_like]}%"
      @exercises = Exercise.where( ["code LIKE ?", filter] ).order( :code )
    elsif params[:training_step_type_id]
      filter = TrainingStepType.find_by_id( params[:training_step_type_id].to_i ).code
      @exercises = Exercise.belongs_to_training_step_code( filter )
    else
      @exercises = Exercise.order(:code)
    end
    if params[:description_like]
      @exercises = @exercises.find_all do |row|
        row.get_full_name(
          0,
          :short,
          (current_user ? current_user.get_preferred_swimmer_level_id() : 0)
        ) =~ Regexp.new( params[:description_like], true )
      end
    end
    respond_with( @exercises )
  end


  # Returns a JSON-encoded hash of the specified row data.
  # The keys of the Hash are the attributes as string.
  #
  # === Params:
  # - id: the Exercise.id
  #
  def show
    respond_with( @exercise = Exercise.find(params[:id]) )
  end
  # ---------------------------------------------------------------------------


  protected


  # Makes sure that the format for the request is an accepted one.
  def ensure_format
    unless request.xhr? || request.format.json?
      render( status: 406, json: { success: false, message: I18n.t(:api_request_must_be_json) } )
      return
    end
  end
end
