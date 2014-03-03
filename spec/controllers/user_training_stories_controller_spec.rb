require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

require 'date'
require 'common/format'


describe UserTrainingStoriesController do

  def check_if_its_the_login_page_with( expected_status_code )
    expect(response.status).to eq(expected_status_code)
    expect(response).to render_template( 'users/sessions/new' )
    expect(page).to have_text( I18n.t('devise.new_session_title') )
    expect(page).to have_field( :user_email )
    expect(page).to have_field( :user_password )
  end

  def visit_and_check_if_its_the_login_page_for( route )
    visit route
    check_if_its_the_login_page_with( 200 )
  end
  # ===========================================================================


  describe '[GET #index]' do

    context "unlogged user" do
      it "displays always the Login page" do
        visit_and_check_if_its_the_login_page_for( user_training_stories_path() )
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user

      it "populates the search grid" do
        # (Seed creation not required since we build-up our own test-db with from the db/seed directory)
        get :index
        pending "NOT IMPLEMENTED YET"
        expect( assigns(:user_training_stories_grid) ).not_to be( nil )
      end

      it "renders the search template" do
        get :index
        pending "NOT IMPLEMENTED YET"
        expect(response.status).to eq(200)     # 302 (redirect) means the user is not logged in
        expect(response).to render_template(:index)
      end
    end
    # -------------------------------------------------------------------------

    # Not really useful anymore, but kept here as reference:
    it "goes back to the index page after a successful login" do
      visit_and_check_if_its_the_login_page_for( user_training_stories_path() )
      user = create( :user )                        # Create an authenticated & confirmed user on the fly
      fill_in "user_email", :with => user.email
      fill_in "user_password", :with => user.password
      click_button I18n.t('devise.new_session_submit')

      expect(response.status).to eq(200)
      expect(response).to render_template(:index)
      # it asserts user is really logged-in:
      expect( controller.stub(:current_user) ).not_to be( nil )
    end
    # -------------------------------------------------------------------------
  end
  # ===========================================================================


  describe '[GET #show]' do

    context "unlogged user" do
      it "displays always the Login page" do
        visit_and_check_if_its_the_login_page_for( user_training_story_path(1) )
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user

      it "assigns an instance to be shown" do
        pending "NOT IMPLEMENTED YET"
      end

      it "renders the show template" do
        pending "NOT IMPLEMENTED YET"
      end
    end
    # -------------------------------------------------------------------------
  end
  # ===========================================================================


  describe '[GET #edit]' do

    context "unlogged user" do
      it "displays always the Login page" do
        visit_and_check_if_its_the_login_page_for( edit_user_training_story_path(1) )
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user

      it "assigns an instance to be edited" do
        pending "NOT IMPLEMENTED YET"
      end

      it "renders the edit template" do
        pending "NOT IMPLEMENTED YET"
      end
    end
    # -------------------------------------------------------------------------
  end
  # ===========================================================================


  describe '[GET #new]' do

    context "unlogged user" do
      it "displays always the Login page" do
        visit_and_check_if_its_the_login_page_for( new_user_training_story_path() )
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user

      it "assigns an instance with default values" do
        pending "NOT IMPLEMENTED YET"
      end

      it "renders the new template" do
        pending "NOT IMPLEMENTED YET"
      end
    end
    # -------------------------------------------------------------------------
  end
  # ===========================================================================


  describe '[POST update]' do

    context "unlogged user" do
      it "doesn't create a new row" do 
        entity_attrs = attributes_for( :user_training_story )
        expect {
          post :create, :user_training_story => entity_attrs
        }.not_to change(UserTrainingStory, :count) 
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user

      context "with valid attributes" do
        it "creates a new row" do
          pending "NOT IMPLEMENTED YET"
          expect {
            post :create, user_training_story: attributes_for( :user_training_story )
          }.to change(UserTrainingStory,:count).by(1)
        end

        it "redirects to the new row" do
          post :create, user_training_story: attributes_for( :user_training_story )
          pending "NOT IMPLEMENTED YET"
          expect(response).to redirect_to( UserTrainingStory.last )
        end
      end

      context "with invalid attributes" do
        it "does not save the new contact" do
          expect{
            post :create, user_training_story: attributes_for( :user_training_story, user_training_id: nil, notes: nil )
          }.to_not change(UserTrainingStory,:count)
        end

        it "re-renders the new method" do
          post :create, contact: attributes_for( :user_training_story, user_training_id: nil, notes: nil )
          pending "NOT IMPLEMENTED YET"
          expect(response).to render_template( :new )
        end
      end
    end
    # -------------------------------------------------------------------------
  end
  # ===========================================================================


  describe '[PUT update]' do

    context "unlogged user" do
      it "fails the update" do
        entity_on_db = UserTrainingStory.find(1)    # Retrieve an actual DB row: (existing, from the seeds file)
        entity_attrs = attributes_for( :user_training_story )
                                                    # Check that we have different attributes, usable for an update:
        expect( entity_attrs[:user_training_id] != entity_on_db.user_training_id ).to be_true
        expect( entity_attrs[:notes] != entity_on_db.notes ).to be_true
                                                    # Try the update without logging in:
        put :update, id: 1, user_training_story: entity_attrs
                                                    # The update should not have persisted:
        expect( UserTrainingStory.find(1) == entity_on_db ).to be_true
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user

      before :each do
        @user_training_story = create( :user_training_story, user_training_id: 2 )
      end

      context "with valid attributes" do
        it "locates the requested row" do
          put :update, id: @user_training_story, user_training_story: attributes_for(:user_training_story, user_training_id: 3)
          pending "NOT IMPLEMENTED YET"
          expect( assigns(:user_training_story) ).to be_eq(@user_training_story)
        end

        it "changes the row attributes" do
          put :update, id: @user_training_story, user_training_story: attributes_for(:user_training_story, user_training_id: 3, notes: "Meh.")
          pending "NOT IMPLEMENTED YET"
          @user_training_story.reload
          expect( @user_training_story.user_training_id ).to be_eq( 3 )
          expect( @user_training_story.notes ).to be_eq( "Meh." )
        end

        it "redirects to the updated row" do
          put :update, id: @user_training_story, user_training_story: attributes_for(:user_training_story)
          pending "NOT IMPLEMENTED YET"
          expect(response).to redirect_to( @user_training_story )
        end
      end

      context "with invalid attributes" do
        it "doesn't change the row" do
          put :update, id: @user_training_story, user_training_story: attributes_for(:user_training_story, user_training_id: nil, notes: nil)
          pending "NOT IMPLEMENTED YET"
          expect( assigns(:user_training_story) ).to be_eq(@user_training_story)
          @user_training_story.reload
          expect( @user_training_story.user_training_id ).not_to be_nil
          expect( @user_training_story.notes ).not_to be_nil
        end

        it "re-renders the edit method" do
          put :update, id: @user_training_story, user_training_story: attributes_for(:user_training_story, user_training_id: nil, notes: nil)
          pending "NOT IMPLEMENTED YET"
          expect(response).to render_template( :edit ) 
        end 
      end
    end 
    # -------------------------------------------------------------------------
  end
  # ===========================================================================


  describe '[DELETE]' do

    before :each do
      @user_training_story = create( :user_training_story, user_training_id: 2 )
    end

    context "unlogged user" do
      it "doesn't delete the row" do 
        expect {
          delete :destroy, id: @user_training_story
        }.not_to change(UserTrainingStory, :count)
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user

      it "deletes the row" do
        pending "NOT IMPLEMENTED YET"
        expect {
          delete :destroy, id: @user_training_story
        }.to change(UserTrainingStory, :count).by(-1)
      end

      it "redirects to #index" do
        delete :destroy, id: @user_training_story
        pending "NOT IMPLEMENTED YET"
        expect(response).to redirect_to( user_training_stories_url )
      end
    end
    # -------------------------------------------------------------------------
  end
  # ===========================================================================
end
