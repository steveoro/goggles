require 'spec_helper'


describe SwimmersController, :type => :controller do

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
        expect( response ).to redirect_to( request.env["HTTP_REFERER"] ) 
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
      before(:each) { login_user() }

      context "with an HTML request for a non-existing id," do
        before(:each) { get action_sym, id: 0 }
        
        it "handles the request with a redirect" do
          expect(response.status).to eq( 302 )
        end
        it "redirects to #index" do
          expect( response ).to redirect_to( request.env["HTTP_REFERER"] ) 
        end
      end

      context "with an HTML request for a valid id," do
        before(:each) { get action_sym, id: @fixture.id }

        it "handles successfully the request" do
          expect(response.status).to eq( 200 )
        end
        it "assigns the required variables" do
          expect( assigns(:swimmer) ).to be_an_instance_of( SwimmerDecorator ) 
        end
        it "renders the template" do
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
  end
  # ===========================================================================


  describe '[GET #misc/:id]' do
    it_behaves_like( "(Swimmers GET action restricted w/ login)", :misc )
    
    context "as a logged-in user with an existing swimmer id" do
      before(:each) do 
        login_user()
        @swimmer = create(:swimmer)
        get :misc, id: @swimmer.id
      end
      
      it "assigns a current season" do
        expect( assigns(:current_season) ).to be_an_instance_of( Season )
      end 
      it "assigns a category_type" do
        expect( assigns(:swimmer_category) ).to be_an_instance_of( CategoryType )      
      end
      it "assigns a gender_type" do
        expect( assigns(:swimmer_gender) ).to be_an_instance_of( GenderType )        
      end
      it "assigns -1 value to standard points" do
        expect( assigns(:standard_points) ).to eq( -1 )       
      end
    end
  end
  # ===========================================================================

  describe '[POST #misc/:id]' do
    #it_behaves_like( "(Swimmers POST action restricted w/ login)", :misc )

    context "as a logged-in user with a non existing swimmer id" do
      before(:each) do
        login_user()
        request.env["HTTP_REFERER"] = swimmers_path()
        post :misc, id: 0
      end
        
      it "handles the request with a redirect" do
        expect(response.status).to eq( 302 )
      end
      it "redirects to #index" do
        expect( response ).to redirect_to( request.env["HTTP_REFERER"] ) 
      end
    end

    context "as a logged-in user with an existing swimmer id" do
      before(:each) do
        login_user()
        request.env["HTTP_REFERER"] = swimmers_path()
        @swimmer = create(:swimmer)
        post :misc, id: @swimmer.id
      end

      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "assigns the required variables" do
        expect( assigns(:swimmer) ).to be_an_instance_of( SwimmerDecorator ) 
      end
      it "renders the template" do
        expect(response).to render_template(:misc)
      end

      it "assigns a current season" do
        expect( assigns(:current_season) ).to be_an_instance_of( Season )
      end 
      it "assigns a category_type" do
        expect( assigns(:swimmer_category) ).to be_an_instance_of( CategoryType )      
      end
      it "assigns a gender_type" do
        expect( assigns(:swimmer_gender) ).to be_an_instance_of( GenderType )        
      end 
      
      context "with requested parameters" do
        #before(:each) do
          # Leega
          # FIXME We need to set requested form parameters to permit calculation
        #end
        
        xit "assigns pool type"
        xit "assigns event type"
        xit "event type is in event_by_pool_type for current season"
        xit "assigns timing data"
        xit "timing data inserted is a valid timing"
        xit "assigns a positive result score"
      end
    end
  end
  # ===========================================================================

end
