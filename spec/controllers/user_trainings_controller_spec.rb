require 'spec_helper'

require 'date'
require 'common/format'


describe UserTrainingsController, :type => :controller do

  it_behaves_like( "(generic CRUD controller actions)", "user_trainings", "TrainingDecorator" )

  describe '[AJAX #json_list]' do
    context "unlogged user" do
      it "displays always the Login page" do
        xhr :get, :json_list
        expect(response.status).to eq( 401 )            # invalid request / not found
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do

      before :each do                                   # Make sure there's at least a couple of rows for the current (fake) user
        login_user()
        @user_training_1 = create( :user_training, user: @user )
        @user_training_2 = create( :user_training, user: @user )
      end

      describe "(requesting a list of rows)" do
        before(:each) { xhr :get, :json_list }
        it_behaves_like( "(Ap1-V1-Controllers, success returning an Array of Hash)" )

        it "retrieves a list of rows with the required fields" do
          expect( response.body ).not_to be_nil
          expect( response.body ).to include( 'label', 'value', 'tot_distance', 'tot_secs' )
          expect( response.body ).to include( 'user_name' )
          expect( response.body ).to include( 'swimmer_level_type_description' )
          expect( response.body ).to include( 'swimmer_level_type_alternate' )
        end
      end

      describe "(requesting a single row)" do
        before(:each) { xhr :get, :json_list, id: @user_training_1.id }
        it_behaves_like( "(Ap1-V1-Controllers, success returning an Hash)" )

        it "returns always the required key fields" do
          expect( response.body ).not_to be_nil
          expect( response.body ).to include( 'label', 'value', 'tot_distance', 'tot_secs' )
          expect( response.body ).to include( 'user_name' )
          expect( response.body ).to include( 'swimmer_level_type_description' )
          expect( response.body ).to include( 'swimmer_level_type_alternate' )
        end

        # The following is important for the drop-down list rendering of the hash values:
        it "returns a JSON hash with the requested ID as the 'value' field" do
          result = JSON.parse(response.body)
          expect( result['value'] ).to eq( @user_training_1.id )
        end
      end

      context "with two swimming-buddies sharing trainings" do
        before :each do                                   # Make sure there's at least a couple of rows for the current (fake) user
          @user_training_3 = create( :user_training )
          @user_training_3.user.invite( @user, true, true, true )   # he wants to share everything
          @user.approve( @user_training_3.user, true, true, true )  # the current user approves
        end
        it "successfully retrieves a shared training" do
          xhr :get, :json_list, id: @user_training_3.id
          expect(response.status).to eq(200)
        end
        it "refuses the request for a non-visible training" do
          xhr :get, :json_list, id: create( :user_training ).id
          expect(response.status).to eq(406)
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET #show]' do
    context "logged-in user" do
      before(:each) { login_user() }

      it "assigns a decorator for the details to be shown" do
        fixture = create( :user_training_with_rows, user: @user )
        get :show, id: fixture.id
        expect(response.status).to eq(200)
        expect( assigns( :user_training_rows ).first ).to be_an_instance_of( TrainingRowDecorator )
      end

      it "accepts the request for a shared training" do
        fixture = create( :user_training )
        fixture.user.invite( @user, true, true, true )   # he wants to share everything
        @user.approve( fixture.user, true, true, true )  # the current user approves
        get :show, id: fixture.id
        expect(response.status).to eq(200)
      end
      it "refuses the request for an unshared training" do
        fixture = create( :user_training )
        get :show, id: fixture.id
        expect(response).to redirect_to( user_trainings_path() )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET #edit]' do
    context "logged-in user" do
      before(:each) { login_user() }

      # Expect that a user should not be able to invoke this action on any user_training, but just on its own
      it "refuses the request for a shared training (not belonging to self)" do
        fixture = create( :user_training )
        fixture.user.invite( @user, true, true, true )   # he wants to share everything
        @user.approve( fixture.user, true, true, true )  # the current user approves
        get :edit, id: fixture.id
        expect(response).to redirect_to( user_trainings_path() )
      end
      it "refuses the request for an unshared training" do
        fixture = create( :user_training )
        get :edit, id: fixture.id
        expect(response).to redirect_to( user_trainings_path() )
      end

      it "assigns a training_max_part_order (for an owned training)" do
        fixture = create( :user_training_with_rows, user: @user )
        get :edit, id: fixture.id
        expect( response.status ).to eq(200)
        expect( assigns(:training_max_part_order) ).not_to be_nil 
        expect( assigns(:training_max_part_order) >= 0 ).to be true 
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[PUT #update]' do
    context "logged-in user" do
      before(:each) { login_user() }

      # Expect that a user should not be able to invoke this action on any user_training, but just on its own
      it "refuses the request for a shared training (not belonging to self)" do
        fixture = create( :user_training )
        fixture.user.invite( @user, true, true, true )   # he wants to share everything
        @user.approve( fixture.user, true, true, true )  # the current user approves
        put :update, id: fixture.id, training: attributes_for( :user_training )
        expect(response).to redirect_to( user_trainings_path() )
      end
      it "refuses the request for an unshared training" do
        fixture = create( :user_training )
        put :update, id: fixture.id, training: attributes_for( :user_training )
        expect(response).to redirect_to( user_trainings_path() )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[DELETE]' do
    context "logged-in user" do
      before(:each) { login_user() }

      # Expect that a user should not be able to invoke this action on any user_training, but just on its own
      it "refuses the request for a shared training (not belonging to self)" do
        fixture = create( :user_training )
        fixture.user.invite( @user, true, true, true )   # he wants to share everything
        @user.approve( fixture.user, true, true, true )  # the current user approves
        delete :destroy, id: fixture.id
        expect(response).to redirect_to( user_trainings_path() )
      end
      it "refuses the request for an unshared training" do
        fixture = create( :user_training )
        delete :destroy, id: fixture.id
        expect(response).to redirect_to( user_trainings_path() )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET #printout]' do
    context "unlogged user" do
      it "displays always the Login page" do
        fixture = create( :user_training_with_rows )
        get_action_and_check_if_its_the_login_page_for( :printout, fixture.id )
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      before(:each) { login_user() }

      it "refuses the request with invalid parameters" do
        get :printout, id: 0
        expect(response.status).to redirect_to( user_trainings_path )
      end
      it "handles the request with valid parameters" do
        fixture = create( :user_training_with_rows, user: @user )
        get :printout, id: fixture.id
        expect(response.status).to eq(200)     # 302 (redirect) means the user is not logged in
      end
      it "receives a PDF file" do
        fixture = create( :user_training_with_rows, user: @user )
        get :printout, id: fixture.id
        expect( response.body).to include("%PDF")
      end
      it "refuses the request for a training with no rows" do
        fixture = create( :user_training, user: @user )
        get :printout, id: fixture.id
        expect(response).to redirect_to( user_trainings_path() )
      end

      it "accepts the request for a shared training" do
        fixture = create( :user_training_with_rows )
        fixture.user.invite( @user, true, true, true )   # he wants to share everything
        @user.approve( fixture.user, true, true, true )  # the current user approves
        get :printout, id: fixture.id
        expect(response.status).to eq(200)
      end
      it "refuses the request for an unshared training" do
        fixture = create( :user_training )
        get :printout, id: fixture.id
        expect(response).to redirect_to( user_trainings_path() )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[POST #duplicate]' do
    context "unlogged user" do
      it "displays always the Login page" do
        fixture = create( :user_training_with_rows )
        post :duplicate, id: fixture.id
        expect(response).to redirect_to '/users/sign_in' # new_user_session_path() => '/users/sign_in?locale=XX'
        expect(response.status).to eq( 302 )        # must redirect to the login page
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      before(:each) { login_user() }

      it "refuses the request with invalid parameters" do
        post :duplicate, id: 0
        expect(response.status).to redirect_to( user_trainings_path() )
      end

      it "accepts the request for a shared training (redirecting to #edit)" do
        fixture = create( :user_training )
        fixture.user.invite( @user, true, true, true )   # he wants to share everything
        @user.approve( fixture.user, true, true, true )  # the current user approves
        post :duplicate, id: fixture.id
        expect(response.status).to redirect_to( edit_user_training_path(UserTraining.last) )
      end
      it "refuses the request for an unshared training" do
        fixture = create( :user_training )
        post :duplicate, id: fixture.id
        expect(response).to redirect_to( user_trainings_path() )
      end

      context "(having an accessible user_training with rows)" do
        before :each do
          @fixture = create(:user_training_with_rows, user: @user)
          expect( @fixture.user_training_rows.size > 1 ).to be true
          @fixture.user_training_rows.each do |detail_row|
            expect( detail_row ).not_to be_nil
            expect( detail_row.part_order >= 0 ).to be true
          end
        end

        it "handles the request with valid parameters, redirecting to #edit" do
          post :duplicate, id: @fixture.id
          expect(response.status).to redirect_to( edit_user_training_path(UserTraining.last) )
        end
        it "adds another header row" do
          expect { post :duplicate, id: @fixture.id }.to change( UserTraining, :count ).by(1)
        end
        it "adds as many detail rows as the source has" do
          detail_rows_count = @fixture.user_training_rows.count
          expect { post :duplicate, id: @fixture.id }.to change( UserTrainingRow, :count ).by(detail_rows_count)
        end

        it "creates a copy of the header row" do
          post :duplicate, id: @fixture.id
          duplicated_row = UserTraining.last
          expect( duplicated_row.description ).to include( @fixture.description )
          expect( duplicated_row.user_id ).to eq( @fixture.user_id )
        end
        it "links all the copied detail rows to the copied header row" do
          post :duplicate, id: @fixture.id
          duplicated_row = UserTraining.last
          duplicated_row.user_training_rows.each do |duplicated_detail_row|
            expect( duplicated_detail_row.user_training_id ).to eq( duplicated_row.id )
          end
        end
        it "creates a copy of all the detail rows" do
          post :duplicate, id: @fixture.id
          duplicated_row = UserTraining.last
          # For all duplicated detail rows:
          duplicated_row.user_training_rows.each do |duplicated_detail_row|
            # Extract the hash of comparable duplicated attributes:
            comparable_dup_attrs = duplicated_detail_row.attributes.reject{ |e| ['id','user_training_id','lock_version','created_at','updated_at'].include?(e) }
            # Retrieve the source detail row:
            part_order = comparable_dup_attrs['part_order']
            expect( part_order ).not_to be_nil
            expect( part_order >= 0 ).to be true
            source_detail_row = @fixture.user_training_rows.where( part_order: part_order ).first
            expect( source_detail_row ).not_to be_nil
            # Now check each duplicated detail column with its equivalent source attribute:
            comparable_dup_attrs.each do |key, value|
# DEBUG
#              puts "\r\n#{key} => #{value}"
              expect( value ).to eq( source_detail_row.send(key) )
            end
          end
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[POST #create_user_story]' do
    context "unlogged user" do
      it "displays always the Login page" do
        fixture = create( :user_training_with_rows )
        post :create_user_story, id: fixture.id
        expect(response).to redirect_to '/users/sign_in' # new_user_session_path() => '/users/sign_in?locale=XX'
        expect(response.status).to eq( 302 )        # must redirect to the login page
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      before(:each) { login_user() }

      it "refuses the request with invalid parameters" do
        post :create_user_story, id: 0
        expect(response.status).to redirect_to( user_trainings_path() )
      end

      it "accepts the request for a shared training (redirecting to story edit)" do
        fixture = create( :user_training )
        fixture.user.invite( @user, true, true, true )   # he wants to share everything
        @user.approve( fixture.user, true, true, true )  # the current user approves
        post :create_user_story, id: fixture.id
        expect(response.status).to redirect_to( edit_user_training_story_path(UserTrainingStory.last) )
      end
      it "refuses the request for an unshared training" do
        fixture = create( :user_training )
        post :create_user_story, id: fixture.id
        expect(response).to redirect_to( user_trainings_path() )
      end

      context "(having an accessible user_training with rows)" do
        before :each do
          @fixture = create(:user_training_with_rows, user: @user)
          expect( @fixture.user_training_rows.size > 1 ).to be true
          @fixture.user_training_rows.each do |detail_row|
            expect( detail_row ).not_to be_nil
            expect( detail_row.part_order >= 0 ).to be true
          end
        end

        it "handles the request with valid parameters, redirecting to #edit" do
          post :create_user_story, id: @fixture.id
          expect(response.status).to redirect_to( edit_user_training_story_path(UserTrainingStory.last) )
        end
        it "adds another UserTrainingStory row" do
          expect { post :create_user_story, id: @fixture.id }.to change( UserTrainingStory, :count ).by(1)
        end

        it "links the user training story to the source row" do
          post :create_user_story, id: @fixture.id
          created_row = UserTrainingStory.last
          expect( created_row.user_training_id ).to eq( @fixture.id )
        end
        it "fills the new UserTrainingStory with the correct values" do
          post :create_user_story, id: @fixture.id
          created_row = UserTrainingStory.last
          expect( created_row.user_id ).to eq( @fixture.user_id )
          expect( created_row.total_training_time ).to eq( @fixture.esteemed_total_seconds )
          expect( created_row.swimmer_level_type_id ).to eq( @fixture.user.get_preferred_swimmer_level_id )
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
