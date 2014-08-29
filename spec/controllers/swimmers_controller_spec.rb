require 'spec_helper'
require 'wice_grid'


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
        expect( assigns(:swimmers_grid) ).to be_an_instance_of( Wice::WiceGrid )
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
        get :radio, id: @fixture.id
      end
      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "assigns the required variables" do
        expect( assigns(:swimmer) ).to be_an_instance_of( SwimmerDecorator )
      end
      it "assigns the tab title" do
        expect( assigns(:tab_title) ).to be_an_instance_of( String )
      end
      it "renders the template" do
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
          expect( assigns(:swimmer) ).to be_an_instance_of( SwimmerDecorator )
        end
        it "assigns the tab title" do
          expect( assigns(:tab_title) ).to be_an_instance_of( String )
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


  describe '[GET #full_history_1/:id]' do
    it_behaves_like( "(Swimmers restricted GET action as an unlogged user)", :full_history_1 )
    it_behaves_like( "(Swimmers restricted GET action as a logged-in user)", :full_history_1 )

    context "as a logged-in user" do
      before(:each) do
        login_user()
        @swimmer = create(:swimmer)
        get :full_history_1, id: @swimmer.id
      end

      it "assigns an hash with data collected" do
        expect( assigns( :full_history_by_date ) ).to be_a_kind_of( Hash )
      end
      it "assigns an hash with the same number of element of pool types suitable for meetings" do
        expect( assigns( :full_history_by_date ).size ).to be PoolType.only_for_meetings.count
      end
      it "assigns an hash that responds to pool type codes" do
        result = assigns( :full_history_by_date )
        PoolType.only_for_meetings.each do |pool_type|
          expect( result[pool_type.code] ).not_to be_nil
        end
      end
      it "assigns an hash with array as elements" do
        result = assigns( :full_history_by_date )
        PoolType.only_for_meetings.each do |pool_type|
          expect( result[pool_type.code] ).to be_a_kind_of( Array )
        end
      end
      it "assigns an hash with array of two elements as element" do
        result = assigns( :full_history_by_date )
        PoolType.only_for_meetings.each do |pool_type|
          expect( result[pool_type.code].size ).to be 2
        end
      end
      
      context "event_list structure," do
        it "assigns an hash with array of two elements as element and the first array element is a list that contains '50FA'" do
          result = assigns( :full_history_by_date )
          PoolType.only_for_meetings.each do |pool_type|
            event_list = result[pool_type.code][0]
            expect( event_list ).to be_a_kind_of( Array )
          end
        end
      end
      
      context "event_by_date structure," do
        it "assigns an hash with array of two elements as element and the second array element is an array" do
          result = assigns( :full_history_by_date )
          PoolType.only_for_meetings.each do |pool_type|
            event_by_date = result[pool_type.code][1]
            expect( event_by_date ).to be_a_kind_of( Array )
          end
        end
        it "assigns an hash with array of two elements as element and the second array element is an array of hashes" do
          result = assigns( :full_history_by_date )
          PoolType.only_for_meetings.each do |pool_type|
            event_by_date = result[pool_type.code][1]
            expect( event_by_date ).to all( be_a_kind_of( Hash ) )
          end
        end
        it "assigns an hash with array of two elements as element and the second array element responds to :meeting" do
          result = assigns( :full_history_by_date )
          PoolType.only_for_meetings.each do |pool_type|
            result[pool_type.code][1].each do |pool_type_hash|
              expect( pool_type_hash[:meeting] ).not_to be_nil
              expect( pool_type_hash[:meeting] ).to be_an_instance_of( Meeting )
            end
          end
        end
        it "assigns an hash with array of two elements as element and the second array element responds has size > 1" do
          result = assigns( :full_history_by_date )
          PoolType.only_for_meetings.each do |pool_type|
            result[pool_type.code][1].each do |pool_type_hash|
              expect( pool_type_hash.size ).to be > 1
            end
          end
        end
      end
    end
      
    context "as a logged-in user, with LIGABUE MARCO seeds" do
      before(:each) do
        login_user()
        @swimmer = Swimmer.find(23)
        get :full_history_1, id: @swimmer.id
      end
      
      it "prepares an event_list containing specific events" do
        result = assigns( :full_history_by_date )
        PoolType.only_for_meetings.each do |pool_type|
          event_list = result[pool_type.code][0]
          expect( event_list ).to include( '50SL' )
          expect( event_list ).to include( '200SL' )
          expect( event_list ).to include( '800SL' )
          expect( event_list ).to include( '50FA' )
          expect( event_list ).to include( '100FA' )
          expect( event_list ).to include( '100RA' )
          expect( event_list ).to include( '200MI' )
        end
      end
      it "scans all meetings attended" do
        count = 0
        result = assigns( :full_history_by_date )
        PoolType.only_for_meetings.each do |pool_type|
          event_by_date = result[pool_type.code][1]
          count += event_by_date.count
        end
        expect( count ).to be >= @swimmer.meetings.uniq.count
      end
    end
  end
  # ===========================================================================


  describe '[GET #full_history_2/:id]' do
    it_behaves_like( "(Swimmers restricted GET action as an unlogged user)", :full_history_2 )
    it_behaves_like( "(Swimmers restricted GET action as a logged-in user)", :full_history_2 )

    context "as a logged-in user" do
      before(:each) do
        login_user()
        @swimmer = create(:swimmer)
        get :full_history_2, id: @swimmer.id
      end

      it "assigns a list of MeetingIndividualResult(s)" do
        expect( assigns(:all_mirs).respond_to?( :each ) ).to be true
        expect( assigns(:all_mirs) ).to all(  be_an_instance_of( MeetingIndividualResult ) )
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


    context "as a logged-in user," do
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
        it "assigns the tab title" do
          expect( assigns(:tab_title) ).to be_an_instance_of( String )
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
        it "accepts event type which is in event_by_pool_type for current season" do
          expect( assigns(:current_event).events_by_pool_types.where(pool_type_id: @fixture_events_by_pool_type.pool_type_id).count ).to be > 0
        end
        it "assigns timing data" do
          expect( assigns(:timing) ).to be_an_instance_of( Timing )
        end
        it "accepts timing data which is a valid timing" do
          expect( assigns(:timing).to_hundreds ).to be > 0
        end
        it "assigns a positive result score" do
          expect( assigns(:standard_points) ).to be >= 0
        end
        it "assigns current time standard" do
          expect( assigns(:current_time_standard) ).to be_an_instance_of( TimeStandard ).or be_nil
        end
        it "assigns world record" do
          expect( assigns(:world_record) ).to be_an_instance_of( ActiveSupport::SafeBuffer ).or be_an_instance_of( String )
        end
        it "assigns national record" do
          expect( assigns(:national_record) ).to be_an_instance_of( ActiveSupport::SafeBuffer ).or be_an_instance_of( String )
        end
        it "assigns season record" do
          expect( assigns(:seasonal_record) ).to be_an_instance_of( ActiveSupport::SafeBuffer ).or be_an_instance_of( String )
        end
        it "assigns swimmer record" do
          expect( assigns(:personal_best) ).to be_an_instance_of( ActiveSupport::SafeBuffer ).or be_an_instance_of( String )
        end
        it "assigns season record" do
          expect( assigns(:seasonal_best) ).to be_an_instance_of( ActiveSupport::SafeBuffer ).or be_an_instance_of( String )
        end

        describe "while assigning team records," do
          it "assigns an hash" do
            expect( assigns(:available_team_records) ).to be_an_instance_of( Hash ).or be_an_instance_of( ActiveSupport::HashWithIndifferentAccess )
          end
          it "has Team instances as keys" do
            expect( assigns(:available_team_records).keys ).to all( be_an_instance_of( Team ) )
          end
          it "has html record as element" do
            expect( assigns(:available_team_records).values ).to all( be_an_instance_of( ActiveSupport::SafeBuffer ).or be_an_instance_of( String ) )
          end
        end
      end
      # -----------------------------------------------------------------------
    end
  end
  # ===========================================================================

end