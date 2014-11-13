require 'spec_helper'
require 'wice_grid'


describe MiscController, :type => :controller do

  describe '[GET #fin_score_calculation]' do

    before(:each) { get :fin_score_calculation }

    it "handles successfully the request" do
      expect(response.status).to eq( 200 )
    end
    it "assigns the tab title" do
      expect( assigns(:tab_title) ).to be_an_instance_of( String )
    end
    it "assigns a current season" do
      expect( assigns(:current_season) ).to be_an_instance_of( Season )
    end
    it "assigns -1 value to standard points" do
      expect( assigns(:standard_points) ).to eq( -1 )
    end
    it "renders the template" do
      expect(response).to render_template(action_sym)
    end

    context "as a logged-in user" do
      before(:each) do
        login_user()
        @swimmer = create(:swimmer)
        get :fin_score_calculation
      end

      it "assigns a current season" do
        expect( assigns(:current_season) ).to be_an_instance_of( Season )
      end
      it "assigns the required variables" do
        expect( assigns(:swimmer) ).to be_an_instance_of( SwimmerDecorator )
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


  describe '[POST #fin_score_calculation]' do

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

      context "without requested parameters" do
        before(:each) do
          post(
            :fin_score_calculation,
            gender_type:   {id: 0},  # Force invalid event type and pool type
            category_type: {id: 0},
            event_type:    {id: 0},
            pool_type:     {id: 0},
            minutes:       minutes,
            seconds:       seconds,
            hundreds:      hundreds
          )
        end
        it "handles the request with a redirect" do
          expect(response.status).to eq( 302 )
        end
        it "redirects to #misc" do
          expect( response ).to redirect_to( misc_fin_score_calculation_path )
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
            :fin_score_calculation,
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