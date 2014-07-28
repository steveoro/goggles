require 'spec_helper'


describe SwimmersController do
  include ControllerMacros                          # ??? This should not be necessary since there's already the extension in the spec_helper!

  describe '[GET #index]' do

    context "with an HTML request," do
      it "handles successfully the request" do
        get :index
        expect(response.status).to eq( 200 )
      end
      it "assigns the required variables" do
        get :index
        expect( assigns(:title) ).to be_an_instance_of( String ) 
        expect( assigns(:swimmers_grid) ).not_to be_nil 
      end
      it "renders the search template" do
        get :index
        expect(response).to render_template(:index)
      end
    end
  end
  # ===========================================================================


  describe '[GET #radio/:id]' do
    # We need to set this to make the redirect_to(:back) pass the tests:
    before(:each) { request.env["HTTP_REFERER"] = swimmers_path() }

    context "with an HTML request for a non-existing id," do
      it "handles the request with a redirect" do
        get :radio, id: 0
        expect(response.status).to eq( 302 )
      end
      it "redirects to #index" do
        get :radio, id: 0
        expect( response ).to redirect_to( redirect_to(request.env["HTTP_REFERER"]) ) 
      end
    end

    context "with an HTML request for a valid id," do
      before :each do
        @fixture = create( :swimmer )
      end
      it "handles successfully the request" do
        get :radio, id: @fixture.id
        expect(response.status).to eq( 200 )
      end
      it "assigns the required variables" do
        get :radio, id: @fixture.id
        expect( assigns(:swimmer) ).to be_an_instance_of( SwimmerDecorator ) 
      end
      it "renders the template" do
        get :radio, id: @fixture.id
        expect(response).to render_template(:radio)
      end
    end
  end
  # ===========================================================================


  shared_examples_for "(Swimmers GET action restricted w/ login)" do |action_sym|

    before :each do
      @fixture = create( :swimmer )
      # We need to set this to make the redirect_to(:back) pass the tests:
      request.env["HTTP_REFERER"] = swimmers_path()
    end

    context "unlogged user" do
      it "displays the Login page for an invalid id" do
        get_action_and_check_if_its_the_login_page_for( action_sym, 0 )
      end
      it "displays the Login page for a valid id" do
        get_action_and_check_if_its_the_login_page_for( action_sym, @fixture.id )
      end
    end
    #-- ---------------------------------------------------------------------
    #++

    context "as a logged-in user" do
      login_user()

      context "with an HTML request for a non-existing id," do
        it "handles the request with a redirect" do
          get action_sym, id: 0
          expect(response.status).to eq( 302 )
        end
        it "redirects to #index" do
          get action_sym, id: 0
          expect( response ).to redirect_to( redirect_to(request.env["HTTP_REFERER"]) ) 
        end
      end

      context "with an HTML request for a valid id," do
        it "handles successfully the request" do
          get action_sym, id: @fixture.id
          expect(response.status).to eq( 200 )
        end
        it "assigns the required variables" do
          get action_sym, id: @fixture.id
          expect( assigns(:swimmer) ).to be_an_instance_of( SwimmerDecorator ) 
        end
        it "renders the template" do
          get action_sym, id: @fixture.id
          expect(response).to render_template(action_sym)
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  # ===========================================================================


  describe '[GET #medals/:id]' do
    it_behaves_like( "(Swimmers GET action restricted w/ login)", :medals )
  end
  # ===========================================================================


  describe '[GET #best_timings/:id]' do
    it_behaves_like( "(Swimmers GET action restricted w/ login)", :best_timings )
  end
  # ===========================================================================


  describe '[GET #all_races/:id]' do
    it_behaves_like( "(Swimmers GET action restricted w/ login)", :all_races )

    context "as a logged-in user" do
      login_user()

      it "assigns a collection IDs for all the races" do
        get :all_races, id: create(:swimmer).id
        expect( assigns(:swimmer_mir_ids) ).to respond_to(:each) 
      end
    end
  end
  # ===========================================================================


  describe '[GET #misc/:id]' do
    it_behaves_like( "(Swimmers GET action restricted w/ login)", :misc )
    
    context "as a logged-in user" do
      login_user()

      it "assigns a current season" do
        get :misc, id: create(:swimmer).id
        expect( assigns(:current_season) ).to be_an_instance_of( Season )
      end 
      it "assigns a category_type" do
        get :misc, id: create(:swimmer).id
        expect( assigns(:swimmer_category) ).to be_an_instance_of( CategoryType )      
      end
      it "assigns a gender_type" do
        get :misc, id: create(:swimmer).id
        expect( assigns(:swimmer_gender) ).to be_an_instance_of( GenderType )        
      end
      it "assigns -1 value to standard points" do
        get :misc, id: create(:swimmer).id
        expect( assigns(:standard_points) ).to eq( -1 )       
      end
    end
  end
  # ===========================================================================

  describe '[POST #misc/:id]' do
    #it_behaves_like( "(Swimmers POST action restricted w/ login)", :misc )
    
    context "as a logged-in user" do
      login_user()

      xit "assigns a current season" do
        post :misc, id: create(:swimmer).id
        expect( assigns(:current_season) ).to be_an_instance_of( Season )
      end 
      xit "assigns a category_type" do
        post :misc, id: create(:swimmer).id
        expect( assigns(:swimmer_category) ).to be_an_instance_of( CategoryType )      
      end
      xit "assigns a gender_type" do
        post :misc, id: create(:swimmer).id
        expect( assigns(:swimmer_gender) ).to be_an_instance_of( GenderType )        
      end
      xit "assigns pool type"
      xit "assigns event type"
      xit "event type is in event_by_pool_type for current season"
      xit "assigns timing data"
      xit "timing data inserted is a valid timing"
      xit "assigns a positive result score"
    end
  end
  # ===========================================================================

end
