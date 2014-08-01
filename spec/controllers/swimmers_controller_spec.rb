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


  shared_examples_for "(Swimmers restricted GET action as an unlogged user)" do |action_sym|
    before :each do
      @fixture = create( :swimmer )
#      sign_out create(:user)
    end

    context "unlogged user" do
      it "displays the Login page for an invalid id" do
        get_action_and_check_if_its_the_login_page_for( action_sym, 0 )
      end
      it "displays the Login page for a valid id" do
        get_action_and_check_if_its_the_login_page_for( action_sym, @fixture.id )
      end
    end
  end
  # ===========================================================================


  shared_examples_for "(Swimmers restricted GET action as a logged-in user)" do |action_sym|
    before :each do
      @fixture = create( :swimmer )
      # We need to set this to make the redirect_to(:back) pass the tests:
      request.env["HTTP_REFERER"] = swimmers_path()
      login_user()
    end

    context "as a logged-in user" do
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
          klass = (action_sym == :all_races ? Swimmer : SwimmerDecorator)
          expect( assigns(:swimmer) ).to be_an_instance_of( klass ) 
        end
        it "renders the template" do
          expect(response).to render_template(action_sym)
        end
      end
    end
  end
  # ===========================================================================


  describe '[GET #medals/:id]' do
    it_behaves_like( "(Swimmers restricted GET action as an unlogged user)", :medals )
    it_behaves_like( "(Swimmers restricted GET action as a logged-in user)", :medals )
  end
  # ===========================================================================


  describe '[GET #best_timings/:id]' do
    it_behaves_like( "(Swimmers restricted GET action as an unlogged user)", :best_timings )
    it_behaves_like( "(Swimmers restricted GET action as a logged-in user)", :best_timings )
  end
  # ===========================================================================


  describe '[GET #all_races/:id]' do
    it_behaves_like( "(Swimmers restricted GET action as an unlogged user)", :all_races )

    before :each do
      @fixture = create( :swimmer )
      # We need to set this to make the redirect_to(:back) pass the tests:
      request.env["HTTP_REFERER"] = swimmers_path()
    end

    context "as a logged-in user" do
      before(:each) { login_user() }

      context "with an HTML request for a non-existing id," do
        before(:each) { get :all_races, id: 0 }
        it "handles the request with a redirect" do
          expect(response.status).to eq( 302 )
        end
        it "redirects to #index" do
          expect( response ).to redirect_to( request.env["HTTP_REFERER"] ) 
        end
      end
      context "with an HTML request for a valid id," do
        before(:each) { get :all_races, id: @fixture.id }
        it "handles the request with a redirect" do
          expect(response.status).to eq( 302 )
        end
        it "redirects to meetings_path( prefiltered )" do
          expect( response ).to redirect_to(
            meetings_path( preselect_ids: 1, prefilter_swimmer: @fixture.get_full_name, swimmer_id: @fixture.id )
          ) 
        end
      end
    end
  end
  # ===========================================================================


  describe '[GET #misc/:id]' do
    it_behaves_like( "(Swimmers restricted GET action as an unlogged user)", :misc )
    it_behaves_like( "(Swimmers restricted GET action as a logged-in user)", :misc )

    context "as a logged-in user" do
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

    context "as a logged-in user with invalid id parameter" do
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
    # -------------------------------------------------------------------------


    context "as a logged-in user, " do
      let(:minutes)  { ((rand * 10) % 10).to_i + 1 }
      let(:seconds)  { ((rand * 59) % 59).to_i + 1 }
      let(:hundreds) { ((rand * 99) % 99).to_i + 1 }

      before(:each) do
        login_user()
        request.env["HTTP_REFERER"] = swimmers_path()
        @swimmer = create(:swimmer)
        # FIXME Create factories with events and pool types not for relays
        @fixture_events_by_pool_type = EventsByPoolType.find_by_id(((rand * 18) % 18).to_i + 1) # ASSERT: first 18 event by pool types are not relays
      end

      context "without pool type or event type" do
        before(:each) do
          post(
            :misc,
            id:         @swimmer.id,
            event_type: {id: 0},  # Force invalid event type and pool type
            pool_type:  {id: 0},
            minutes:    minutes,
            seconds:    seconds,
            hundreds:   hundreds
          )
        end
        it "handles the request with a redirect" do
          expect(response.status).to eq( 302 )
        end
        it "redirects to #misc" do
          expect( response ).to redirect_to( swimmer_misc_path(@swimmer.id) ) 
        end
        it "displays the flash error message" do
          expect( flash[:error] ).to include( I18n.t(:missing_request_parameter) ) 
        end
        it "assigns -1 value to standard points" do
          expect( assigns(:standard_points) ).to eq( -1 )       
        end
      end
      # -----------------------------------------------------------------------
      
      context "with an invalid timing" do
        before(:each) do
          post(
            :misc,
            id:         @swimmer.id,
            event_type: {id: @fixture_events_by_pool_type.event_type_id},
            pool_type:  {id: @fixture_events_by_pool_type.pool_type_id},
            minutes:    -3,  # Force invalid timing
            seconds:    -2,
            hundreds:   -1
          )
        end
        it "handles the request with a redirect" do
          expect(response.status).to eq( 302 )
        end
        it "redirects to #misc" do
          expect( response ).to redirect_to( swimmer_misc_path(@swimmer.id) ) 
        end
        it "displays the flash error message" do
          expect( flash[:error] ).to include( I18n.t('radiography.wrong_timing') ) 
        end        
        it "assigns -1 value to standard points" do
          expect( assigns(:standard_points) ).to eq( -1 )       
        end
      end
      # -----------------------------------------------------------------------

      context "with not allowed pool type and event type parameters" do
        before(:each) do
          post(
            :misc,
            id:         @swimmer.id,
            event_type: {id: EventType.where(code: '100MI').first.id},
            pool_type:  {id: PoolType.where(code: '50').first.id},
            minutes:    minutes,
            seconds:    seconds,
            hundreds:   hundreds
          )
        end
        it "handles the request with a redirect" do
          expect(response.status).to eq( 302 )
        end
        it "redirects to #misc" do
          expect( response ).to redirect_to( swimmer_misc_path(@swimmer.id) ) 
        end
        it "displays the flash error message" do
          expect( flash[:error] ).to include( I18n.t('radiography.wrong_event_or_pool') ) 
        end        
        it "assigns -1 value to standard points" do
          expect( assigns(:standard_points) ).to eq( -1 )       
        end
      end
      # -----------------------------------------------------------------------

      context "with a correct request" do
        before(:each) do
          post(
            :misc,
            id:         @swimmer.id,
            event_type: {id: @fixture_events_by_pool_type.event_type_id},
            pool_type:  {id: @fixture_events_by_pool_type.pool_type_id},
            minutes:    minutes,
            seconds:    seconds,
            hundreds:   hundreds
          )
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
        it "assigns a pool_type" do
          expect( assigns(:current_pool) ).to be_an_instance_of( PoolType )        
        end 
        it "assigns a event_type" do
          expect( assigns(:current_event) ).to be_an_instance_of( EventType )        
        end 
        it "event type is in event_by_pool_type for current season" do
          expect( assigns(:current_event).events_by_pool_types.where(pool_type_id: @fixture_events_by_pool_type.pool_type_id).count ).to be > 0 
        end
        it "assigns timing data" do
          expect( assigns(:timing) ).to be_an_instance_of( Timing )        
        end 
        it "timing data inserted is a valid timing" do
          expect( assigns(:timing).to_hundreds ).to be > 0        
        end 
        xit "assigns a positive result score" do
          expect( assigns(:standard_points) ).to be >= 0        
        end           
      end
      # -----------------------------------------------------------------------

        
      context "with an existing time standard" do
        before(:each) do
          fixture_current_season = Season.get_last_season_by_type( 'MASFIN' )
          fixture_time_standard = create(:time_standard,
            season_id:        fixture_current_season.id,
            gender_type_id:   @swimmer.gender_type,
            category_type_id: @swimmer.get_category_type_for_season( fixture_current_season.id ),
            event_type_id:    @fixture_events_by_pool_type.event_type_id, 
            pool_type_id:     @fixture_events_by_pool_type.pool_type_id
          )
          #puts "\r\n - swimmer: #{ @swimmer.inspect }"
          #puts "- fixture_time_standard: #{ fixture_time_standard.inspect }"
          #puts "- fixture_events_by_pool_type: #{ @fixture_events_by_pool_type.inspect }"
          post(
            :misc,
            id:         @swimmer.id,
            event_type: {id: @fixture_events_by_pool_type.event_type_id},
            pool_type:  {id: @fixture_events_by_pool_type.pool_type_id},
            minutes:    minutes,
            seconds:    seconds,
            hundreds:   hundreds
          )
        end
        xit "retreives the standard time" do
          expect( assigns(:current_time_standard) ).to be_an_instance_of( TimeStandard )        
        end
        xit "the standard time is valid" do
          expect( assigns(:current_time_standard).get_timing_instance.to_hundreds ).to be > 0        
        end
        xit "assigns a positive result score" do
          expect( assigns(:standard_points) ).to be >= 0        
        end           
      end
      # -----------------------------------------------------------------------
    end
  end
  # ===========================================================================

end
