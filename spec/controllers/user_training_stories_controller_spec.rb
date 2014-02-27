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

  context "unlogged user, POST actions" do
    it "it does not create new row" do 
      entity_params = attributes_for( :user_training_story )
      expect { post :create, :user_training_story => entity_params }.not_to change(UserTrainingStory, :count) 
    end

    xit "displays always the Login page when not logged in for a POST" do
#      put ''
    end

    xit "displays always the Login page when not logged for a DELETE" do
    end
  end

  context "logged-in user" do
    xit "logs the user before anything else"
    xit "visits the index page"
    xit "shows a single training story"
    xit "creates a new training story"
    xit "edits an existing training story"
    xit "deletes an existing training story"
  end


  describe "GET index" do
    it "goes back to the index page after a successful login" do
      visit_and_check_if_its_the_login_page_for( user_training_stories_path() )
      user = create( :user )                        # Create an authenticated & confirmed user on the fly
      fill_in "user_email", :with => user.email
      fill_in "user_password", :with => user.password
      click_button I18n.t('devise.new_session_submit')

      expect(response.status).to eq(200)
      pending "will fail text match since index layout has still errors"
      expect(page).to have_text( I18n.t('user_training_stories.index_title') )
      expect(response).to render_template(:index)
    end
  end
  # ---------------------------------------------------------------------------

end
