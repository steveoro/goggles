#
# RESTful API controller
#
class Api::V1::TrainingsController < ApplicationController

  respond_to :json


  def index
    respond_with( @trainings = Training.all )
  end
  # ---------------------------------------------------------------------------


  def new
    respond_with( @training = Training.new )
  end
  # ---------------------------------------------------------------------------


  def create
    respond_with( @training = Training.create(params[:training]) )
  end
  # ---------------------------------------------------------------------------


  def edit
    respond_with( @training = Training.find(params[:id]) )
  end
  # ---------------------------------------------------------------------------


  def update
    @training = Training.find(params[:id])
    @training.update_attributes(params[:training])
    respond_with( @training )
  end
  # ---------------------------------------------------------------------------

end
