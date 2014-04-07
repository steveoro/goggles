require 'spec_helper'

require 'date'
require 'common/format'


describe UserTrainingsController do

  describe '[AJAX #json_list]' do
    context "unlogged user" do
      it "displays always the Login page" do
        xhr :get, :json_list
        expect(response.status).to eq( 401 )            # invalid request / not found
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user()

      before :each do                                   # Make sure there's at least a couple of rows for the current (fake) user
        @user_training_1 = create( :user_training, user: @user )
        @user_training_2 = create( :user_training, user: @user )
      end

      it "handles successfully the request" do
        xhr :get, :json_list
        expect(response.status).to eq(200)     # 302 (redirect) means the user is not logged in
      end

      it "retrieves a list of rows" do
        xhr :get, :json_list, user_id: @user_training_1.user_id
        expect( response.body ).not_to be_nil
        # FIXME this does not check that the response contains an actual JSON array of rows
        expect( response.body ).to include( 'label', 'value', 'tot_distance', 'tot_secs' )
        expect( response.body ).to include( 'user_name' )
        expect( response.body ).to include( 'swimmer_level_type_description' )
        expect( response.body ).to include( 'swimmer_level_type_alternate' )
      end

      it "retrieves a single row with details" do
        xhr :get, :json_list, id: 1
        expect( response.body ).not_to be_nil
        # FIXME this does not check that the response contains just a JSONified row
        expect( response.body ).to include( 'label', 'value', 'tot_distance', 'tot_secs' )
        expect( response.body ).to include( 'user_name' )
        expect( response.body ).to include( 'swimmer_level_type_description' )
        expect( response.body ).to include( 'swimmer_level_type_alternate' )
      end
    end
  end
  # ===========================================================================


  # Login checker for GET actions only.
  def get_action_and_check_if_its_the_login_page_for( action_sym, id = nil )
    get action_sym, id: id
    expect(response).to redirect_to '/users/session/sign_in'
    expect(response.status).to eq( 302 )            # must redirect to the login page
  end
  # ---------------------------------------------------------------------------


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
        expect( assigns(:user_trainings_grid) ).not_to be( nil )
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
        expect( assigns(:user_training) ).not_to be_nil 
        expect( assigns(:title) ).not_to be_nil 
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
        expect( assigns(:user_training) ).to be_a_new( UserTraining )
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
        expect( assigns(:user_training) ).not_to be_nil 
        expect( assigns(:title) ).not_to be_nil 
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
        entity_attrs = attributes_for( :user_training )
        expect {
          post :create, :user_training => entity_attrs
        }.not_to change(UserTraining, :count) 
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user()

      context "with valid attributes" do
        it "creates a new row" do
          expect {
            post :create, user_training: attributes_for( :user_training )
          }.to change(UserTraining, :count).by(1)
        end

        it "redirects to the new row" do
          post :create, user_training: attributes_for( :user_training )
          expect(response).to redirect_to( UserTraining.last )
        end
      end

      context "with invalid attributes" do
        it "does not save the new contact" do
          expect{
            post :create, user_training: attributes_for( :user_training, description: nil )
          }.to_not change(UserTraining, :count)
        end

        it "re-renders the new method" do
          post :create, user_training: attributes_for( :user_training, description: nil )
          expect(response).to render_template( :edit )
        end
      end
    end
  end
  # ===========================================================================


  describe '[PUT #update]' do
    context "unlogged user" do
      it "fails the update" do
        entity_on_db = UserTraining.find(1)    # Retrieve an actual DB row: (existing, from the seeds file)
        entity_attrs = attributes_for( :user_training )
                                                    # Check that we have different attributes, usable for an update:
        expect( entity_attrs[:description] != entity_on_db.description ).to be_true
                                                    # Try the update without logging in:
        put :update, id: 1, user_training: entity_attrs
                                                    # The update should not have persisted:
        expect( UserTraining.find(1) == entity_on_db ).to be_true
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user()

      before :each do
        @user_training = create( :user_training )
      end

      context "with valid attributes" do
        it "locates the requested row" do
          put :update, id: @user_training, user_training: attributes_for(:user_training, description: "Dummy desc!")
          expect( assigns(:user_training) == @user_training ).to be_true
        end

        it "changes the row attributes" do
          put :update, id: @user_training, user_training: attributes_for(:user_training, description: "Dummy desc!")
          @user_training.reload
          expect( @user_training.description == "Dummy desc!" ).to be_true
        end

        it "redirects to the updated row" do
          put :update, id: @user_training, user_training: attributes_for(:user_training)
          expect(response).to redirect_to( @user_training )
        end
      end

      context "with invalid attributes" do
        it "doesn't change the row" do
          put :update, id: @user_training, user_training: attributes_for( :user_training, description: nil )
          expect( assigns(:user_training) == @user_training ).to be_true
          @user_training.reload
          expect( @user_training.description ).not_to be_nil
        end

        it "renders the edit method" do
          put :update, id: @user_training, user_training: attributes_for( :user_training, description: nil )
          expect(response).to render_template( :edit )
        end 
      end
    end 
  end
  # ===========================================================================


  describe '[DELETE]' do
    before :each do
      @user_training = create( :user_training )
    end

    context "unlogged user" do
      it "doesn't delete the row" do 
        expect {
          delete :destroy, id: @user_training
        }.not_to change(UserTraining, :count)
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user()

      it "deletes the row" do
        expect {
          delete :destroy, id: @user_training
        }.to change(UserTraining, :count).by(-1)
      end

      it "redirects to #index" do
        delete :destroy, id: @user_training
        expect(response).to redirect_to( user_trainings_url )
      end
    end
  end
  # ===========================================================================
end
