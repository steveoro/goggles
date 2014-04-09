#
# RESTful API controller
#
class Api::V1::ExercisesController < ApplicationController

  respond_to :json


  def index
    respond_with( @exercises = Exercise.all )
  end
  # ---------------------------------------------------------------------------


  def new
    respond_with( @exercise = Exercise.new )
  end
  # ---------------------------------------------------------------------------


  def create
    respond_with( @exercise = Exercise.create(params[:exercise]) )
  end
  # ---------------------------------------------------------------------------


  def edit
    respond_with( @exercise = Exercise.find(params[:id]) )
  end
  # ---------------------------------------------------------------------------


  def update
    @exercise = Exercise.find(params[:id])
    @exercise.update_attributes(params[:exercise])
    respond_with( @exercise )
  end
  # ---------------------------------------------------------------------------

end
