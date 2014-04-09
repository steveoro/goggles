#
# RESTful API controller
#
class Api::V1::UserTrainingStoriesController < ApplicationController

  respond_to :json


  def index
    respond_with( @user_training_stories = UserTrainingStory.all )
  end
  # ---------------------------------------------------------------------------


  def new
    respond_with( @user_training_story = UserTrainingStory.new )
  end
  # ---------------------------------------------------------------------------


  def create
    respond_with( @user_training_story = UserTrainingStory.create(params[:user_training_story]) )
  end
  # ---------------------------------------------------------------------------


  def edit
    respond_with( @user_training_story = UserTrainingStory.find(params[:id]) )
  end
  # ---------------------------------------------------------------------------


  def update
    @user_training_story = UserTrainingStory.find(params[:id])
    @user_training_story.update_attributes(params[:user_training_story])
    respond_with( @user_training_story )
  end
  # ---------------------------------------------------------------------------

end
