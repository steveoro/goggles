require 'spec_helper'

require 'date'
require 'common/format'


describe UserTrainingStoriesController do
  include ControllerMacros                          # ??? This should not be necessary since there's already the extension in the spec_helper!

  describe '[GET #index]' do
    context "unlogged user" do
      it "displays always the Login page" do
        get_action_and_check_if_its_the_login_page_for( :index )
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user()

      it "populates the search grid" do
        # (Seed creation not required since we build-up our own test-db with from the db/seed directory)
        get :index
        expect( assigns(:user_training_stories_grid) ).not_to be( nil )
      end

      it "renders the search template" do
        get :index
        expect(response.status).to eq(200)     # 302 (redirect) means the user is not logged in
        expect(response).to render_template(:index)
      end
    end
  end
  # ===========================================================================


  describe '[GET #show]' do
    context "unlogged user" do
      it "displays always the Login page" do
        get_action_and_check_if_its_the_login_page_for( :show, 1 )
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user()

      it "assigns an instance to be shown" do
        get :show, id: 1
        expect( response.status ).to eq(200)
        expect( assigns(:user_training_story) ).not_to be_nil 
        expect( assigns(:title) ).not_to be_nil 
        expect( assigns(:user_training_story) ).to be_an_instance_of(UserTrainingStoryDecorator) 
        expect( assigns(:title) ).to be_an_instance_of(String) 
      end

      it "renders the show template" do
        get :show, id: 1
        expect( controller.params[:id].to_i == 1 ).to be_true 
        expect(response.status).to eq(200)
        expect(response).to render_template(:show)
      end
    end
  end
  # ===========================================================================


  describe '[GET #new]' do
    context "unlogged user" do
      it "displays always the Login page" do
        get_action_and_check_if_its_the_login_page_for( :new )
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user()

      it "assigns an instance with default values" do
        get :new
        expect( assigns(:user_training_story) ).to be_a_new( UserTrainingStory )
      end

      it "renders the edit template" do
        get :new
        expect(response.status).to eq(200)
        expect(response).to render_template(:edit)
      end
    end
  end
  # ===========================================================================


  describe '[GET #edit]' do
    context "unlogged user" do
      it "displays always the Login page" do
        get_action_and_check_if_its_the_login_page_for( :edit, 1 )
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user()

      it "assigns an instance to be edited" do
        get :edit, id: 1
        expect( response.status ).to eq(200)
        expect( assigns(:user_training_story) ).not_to be_nil 
        expect( assigns(:title) ).not_to be_nil 
        expect( assigns(:user_training_story) ).to be_an_instance_of(UserTrainingStoryDecorator) 
        expect( assigns(:title) ).to be_an_instance_of(String) 
      end

      it "renders the edit template" do
        get :edit, id: 1
        expect( controller.params[:id].to_i == 1 ).to be_true 
        expect(response.status).to eq(200)
        expect(response).to render_template(:edit)
      end
    end
  end
  # ===========================================================================


  describe '[POST #create]' do
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
      login_user()

      context "with valid attributes" do
        it "creates a new row" do
          expect {
            post :create, user_training_story: attributes_for( :user_training_story )
          }.to change(UserTrainingStory, :count).by(1)
        end

        it "redirects to the new row" do
          post :create, user_training_story: attributes_for( :user_training_story )
          expect(response).to redirect_to( UserTrainingStory.last )
        end
      end

      context "with invalid attributes" do
        it "does not save the new contact" do
          expect{
            post :create, user_training_story: attributes_for( :user_training_story, swam_date: nil, user_training_id: nil )
          }.to_not change(UserTrainingStory, :count)
        end

        it "re-renders the new method" do
          post :create, user_training_story: attributes_for( :user_training_story, swam_date: nil, user_training_id: nil )
          expect(response).to render_template( :edit )
        end
      end
    end
  end
  # ===========================================================================


  describe '[PUT #update]' do
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
      login_user()

      before :each do
        @user_training_story = create( :user_training_story )
      end

      context "with valid attributes" do
        before :each do
          @example_date = Date.today
          put :update, id: @user_training_story.id, user_training_story: attributes_for(:user_training_story, swam_date: @example_date, user_training_id: 2, swimmer_level_type_id: 3, notes: "Meh.")
        end
        it "changes the row attributes" do
          @user_training_story.reload
          expect( @user_training_story.swam_date == @example_date ).to be_true
          expect( @user_training_story.notes == "Meh." ).to be_true
          expect( @user_training_story.user_training_id == 2 ).to be_true
          expect( @user_training_story.swimmer_level_type_id == 3 ).to be_true
        end
        it "redirects to the updated row" do
          expect(response).to redirect_to( @user_training_story )
        end
      end

      context "with invalid attributes" do
        before :each do
          put :update, id: @user_training_story.id, user_training_story: attributes_for( :user_training_story, swam_date: nil, user_training_id: nil )
        end
        it "doesn't change the row" do
          @user_training_story.reload
          expect( @user_training_story.swam_date ).not_to be_nil
          expect( @user_training_story.user_training_id ).not_to be_nil
          expect( @user_training_story.notes ).not_to be_nil
        end
        it "renders the edit method" do
          expect(response).to render_template( :edit )
        end 
      end
    end 
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
      login_user()

      it "deletes the row" do
        expect {
          delete :destroy, id: @user_training_story
        }.to change(UserTrainingStory, :count).by(-1)
      end

      it "redirects to #index" do
        delete :destroy, id: @user_training_story
        expect(response).to redirect_to( user_training_stories_url )
      end
    end
  end
  # ===========================================================================
end
