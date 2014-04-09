#
# RESTful API controller
#
class Api::V1::UserTrainingsController < ApplicationController

  respond_to :json


  def index
    respond_with( @user_trainings = UserTraining.all )
  end
  # ---------------------------------------------------------------------------


  def new
    respond_with( @user_training = UserTraining.new )
  end
  # ---------------------------------------------------------------------------


  def create
    respond_with( @user_training = UserTraining.create(params[:user_training]) )
  end
  # ---------------------------------------------------------------------------


  def edit
    respond_with( @user_training = UserTraining.find(params[:id]) )
  end
  # ---------------------------------------------------------------------------


  def update
    @user_training = UserTraining.find(params[:id])
    @user_training.update_attributes(params[:user_training])
    respond_with( @user_training )
  end
  # ---------------------------------------------------------------------------

end
