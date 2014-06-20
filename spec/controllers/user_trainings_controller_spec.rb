require 'spec_helper'

require 'date'
require 'common/format'


describe UserTrainingsController do
  include ControllerMacros                          # ??? This should not be necessary since there's already the extension in the spec_helper!

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

      context "with two swimming-buddies sharing trainings" do
        xit "returns only trainings available to the current user (TODO)"
      end
    end
  end
  # ===========================================================================

# FIXME/TEST a user should not be able to show any user_training, but just its own
# TODO add a check in the controller action also (or a before filter)

  describe '[GET #show]' do
    context "logged-in user" do
      login_user()

      it "assigns a decorator for the details to be shown" do
        fixture = create( :user_training_with_rows, user: @user )
        get :show, id: fixture.id
        expect(response.status).to eq(200)
        expect( assigns( :user_training_rows ).first ).to be_an_instance_of( TrainingRowDecorator )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

# FIXME/TEST a user should not be able to edit any user_training, but just its own
# TODO add a check in the controller action also (or a before filter)


  describe '[GET #edit]' do
    context "logged-in user" do
      login_user()

      it "assigns a training_max_part_order" do
        fixture = create( :user_training_with_rows, user: @user )
        get :edit, id: fixture.id
        expect( response.status ).to eq(200)
        expect( assigns(:training_max_part_order) ).not_to be_nil 
        expect( assigns(:training_max_part_order) >= 0 ).to be_true 
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

# FIXME a user should not be able to printout any user_training, but just its own
# TODO add a check in the controller action also (or a before filter)


  describe '[GET #printout]' do
    context "unlogged user" do
      it "displays always the Login page" do
        fixture = create( :user_training_with_rows )
        get_action_and_check_if_its_the_login_page_for( :printout, fixture.id )
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user()

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
    end
  end
  #-- -------------------------------------------------------------------------
  #++

# FIXME a user should not be able to duplicate any user_training, but just its own
# TODO add a check in the controller action also (or a before filter)


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
      login_user()

      it "refuses the request with invalid parameters" do
        post :duplicate, id: 0
        expect(response.status).to redirect_to( user_trainings_path() )
      end

      it "handles the request with valid parameters, redirecting to #edit" do
        fixture = create(:user_training_with_rows, user: @user)
        post :duplicate, id: fixture.id
        expect(response.status).to redirect_to( edit_user_training_path(UserTraining.last) )
      end
      it "adds another header row" do
        fixture = create(:user_training_with_rows, user: @user)
        expect { post :duplicate, id: fixture.id }.to change( UserTraining, :count ).by(1)
      end
      it "adds as many detail rows as the source has" do
        fixture = create(:user_training_with_rows, user: @user)
        detail_rows_count = fixture.user_training_rows.count
        expect { post :duplicate, id: fixture.id }.to change( UserTrainingRow, :count ).by(detail_rows_count)
      end

      it "creates a copy of the header row" do
        fixture = create(:user_training_with_rows, user: @user)
        post :duplicate, id: fixture.id
        duplicated_row = UserTraining.last
        expect( duplicated_row.description ).to include( fixture.description )
        expect( duplicated_row.user_id ).to     eq( fixture.user_id )
      end
      it "links all the copied detail rows to the copied header row" do
        fixture = create(:user_training_with_rows, user: @user)
        post :duplicate, id: fixture.id
        duplicated_row = UserTraining.last
        duplicated_row.user_training_rows.each do |duplicated_detail_row|
          expect( duplicated_detail_row.user_training_id ).to eq( duplicated_row.id )
        end
      end
      it "creates a copy of all the detail rows" do
        # TODO
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
