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


  describe '[GET #show]' do
    context "logged-in user" do
      login_user()

      it "assigns a decorator for the details to be shown" do
        fixture = create( :user_training_with_rows )
        get :show, id: fixture.id
        expect(response.status).to eq(200)
        expect( assigns( :user_training_rows ).first ).to be_an_instance_of( TrainingRowDecorator )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET #edit]' do
    context "logged-in user" do
      login_user()

      it "assigns a training_max_part_order" do
        fixture = create( :user_training_with_rows )
        get :edit, id: fixture.id
        expect( response.status ).to eq(200)
        expect( assigns(:training_max_part_order) ).not_to be_nil 
        expect( assigns(:training_max_part_order) >= 0 ).to be_true 
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
