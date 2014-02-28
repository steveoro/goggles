require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

require 'date'
require 'common/format'


describe UserTrainingStoriesController do

  def check_response_and_if_its_the_login_page_with( expected_status_code )
    expect(response.status).to eq(expected_status_code)
    expect(page).to have_text( I18n.t('devise.new_session_title') )
    expect(page).to have_field( :user_email )
    expect(page).to have_field( :user_password )
  end

  def visit_and_check_if_its_the_login_page_for( route )
    visit route
    check_response_and_if_its_the_login_page_with( 200 )
  end
  # ---------------------------------------------------------------------------


  context "unlogged user, GET actions" do
    it "displays always the Login page when not logged in" do
      visit_and_check_if_its_the_login_page_for( user_training_stories_path() )
      visit_and_check_if_its_the_login_page_for( user_training_story_path(1) )
      visit_and_check_if_its_the_login_page_for( edit_user_training_story_path(1) )
    end
  end


  context "unlogged user, POST & DELETE actions" do
    it "it does not create new row" do 
      entity_params = attributes_for( :user_training_story )
      expect { post :create, :user_training_story => entity_params }.not_to change(UserTrainingStory, :count) 
    end

    xit "displays always the Login page when not logged in for a POST" do
#      get :user_training_story, 1
      entity_params = attributes_for( :user_training_story, id: 1 )
# FIXME
      expect { 
        post :update, :user_training_story => entity_params
      }.not_to change(UserTrainingStory, :count) 
    end

    xit "displays always the Login page when not logged for a DELETE" do
    end
  end
  # ---------------------------------------------------------------------------


  describe "generic GET index" do
    it "goes back to the index page after a successful login" do
      visit_and_check_if_its_the_login_page_for( user_training_stories_path() )
      user = create( :user )                        # Create an authenticated & confirmed user on the fly
      fill_in "user_email", :with => user.email
      fill_in "user_password", :with => user.password
      click_button I18n.t('devise.new_session_submit')

      expect(response.status).to eq(200)
      expect(response).to render_template(:index)
    end
  end
  # ---------------------------------------------------------------------------


  context "logged user" do
    login_user

    it "asserts is really logged-in" do
      expect( controller.current_user ).not_to be( nil )
      expect( controller.stub(:current_user) ).not_to be( nil )
    end

    it "visits the index page" do
      visit user_training_stories_path()
      expect(response.status).to eq(200)
      expect(response).to render_template(:index)
    end

    it "shows a single training story" do
      visit user_training_story_path(1)
      pending "it would fail because the show page is still a work in progress"
      expect(response.status).to eq(200)
      expect(response).to render_template(:show)
    end

    xit "creates a new training story"
    xit "edits an existing training story"
    xit "deletes an existing training story"
  end
  # ---------------------------------------------------------------------------

end
