require 'rails_helper'
#require 'wice_grid'


describe SwimmersController, type: :controller do

  # describe '[GET #index]' do
    # context "with an HTML request," do
      # it "handles successfully the request" do
        # get :index
        # expect(response.status).to eq( 200 )
      # end
      # it "assigns the required variables" do
        # get :index
        # expect( assigns(:title) ).to be_an_instance_of( String )
# #        expect( assigns(:swimmers_grid) ).to be_an_instance_of( Wice::WiceGrid )
      # end
      # it "renders the search template" do
        # get :index
        # expect(response).to render_template(:index)
      # end
    # end
  # end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET #radio/:id]' do
    # We need to set this to make the redirect_to(:back) pass the tests:
    before(:each) { request.env["HTTP_REFERER"] = root_path() }

    context "with an HTML request for a non-existing id," do
      it "handles the request with a redirect" do
        get :radio, params: { id: 0 }
        expect(response.status).to eq( 302 )
      end
      it "redirects to #index" do
        get :radio, params: { id: 0 }
        expect( response ).to redirect_to( request.env["HTTP_REFERER"] )
      end
    end

    context "with an HTML request for a valid id," do
      before :each do
        @fixture = create( :swimmer )
        get :radio, params: { id: @fixture.id }
      end
      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "assigns the required variables" do
        expect( assigns(:swimmer) ).to be_an_instance_of( SwimmerDecorator )
        expect( assigns(:max_updated_at) ).to be >= 0
      end
      it "assigns the tab title" do
        expect( assigns(:tab_title) ).to be_an_instance_of( String )
      end
      it "renders the template" do
        expect(response).to render_template(:radio)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  shared_examples_for "(Swimmers restricted GET action as an unlogged user)" do |action_sym|
    before :each do
      @fixture = create( :swimmer )
    end

    context "unlogged user" do
      it "displays the Login page for an invalid id" do
        get_action_and_check_it_redirects_to_login_for( action_sym, "/users/sign_in", 0 )
      end
      it "displays the Login page for a valid id" do
        get_action_and_check_it_redirects_to_login_for( action_sym, "/users/sign_in", @fixture.id )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  shared_examples_for "(Swimmers restricted GET action as a logged-in user)" do |action_sym|
    before :each do
      @fixture = create( :swimmer )
      # We need to set this to make the redirect_to(:back) pass the tests:
      request.env["HTTP_REFERER"] = root_path()
      login_user()
    end

    context "as a logged-in user" do
      context "with an HTML request for a non-existing id," do
        before(:each) { get action_sym, params: { id: 0 } }

        it "handles the request with a redirect" do
          expect(response.status).to eq( 302 )
        end
        it "redirects to #index" do
          expect( response ).to redirect_to( request.env["HTTP_REFERER"] )
        end
      end

      context "with an HTML request for a valid id," do
        before(:each) { get action_sym, params: { id: @fixture.id } }

        it "handles successfully the request" do
          expect(response.status).to eq( 200 )
        end
        it "assigns the required variables" do
          expect( assigns(:swimmer) ).to be_an_instance_of( SwimmerDecorator )
        expect( assigns(:max_updated_at) ).to be >= 0
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
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET #medals/:id]' do
    it_behaves_like( "(Swimmers restricted GET action as an unlogged user)", :medals )
    it_behaves_like( "(Swimmers restricted GET action as a logged-in user)", :medals )

    context "as a logged-in user" do
      before(:each) do
        login_user()
        @swimmer = create(:swimmer)
        get :medals, params: { id: @swimmer.id }
      end

      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end

      it "retrieves the medal types" do
        expect( assigns(:medal_types) ).to all( be_an_instance_of( MedalType ) )
      end
      it "assigns the required medals DAO" do
        expect( assigns(:swimmer_medals_dao) ).to be_an_instance_of( MedalsDAO )
      end
    end

    context "as a logged-in user, with Leega seeds" do
      before(:each) do
        login_user()
        @swimmer = Swimmer.find(23)
        get :medals, params: { id: @swimmer.id }
      end

      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end

      it "collects informations about every kind of medal types" do
        # [Steve, 20140911] We cannot test specific values here, because they
        # will be increased at the start of each new season!
        # But we can assume Leega won at least a medal of each type, individual or relay
        MedalType.all.each do |medal_type|
          swm = assigns(:swimmer_medals_dao)
          expect( swm.get_individuals.get_summary(medal_type.code) ).to be > 0
          expect( swm.get_relays.get_summary(medal_type.code) ).to be > 0
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


# FIXME / TODO REMOVE THIS, SINCE IT'S NOT USED ANYMORE (route has been commented-out too)

  # describe '[GET #records/:id]' do
    # #it_behaves_like( "(Swimmers restricted GET action as an unlogged user)", :records )
    # #it_behaves_like( "(Swimmers restricted GET action as a logged-in user)", :records )
#
    # context "as a logged-in user" do
      # before(:each) do
        # login_user()
        # @swimmer = create(:swimmer)
        # get :records, params: { id: @swimmer.id }
      # end
#
      # it "handles successfully the request" do
        # expect(response.status).to eq( 200 )
      # end
#
      # xit "assigns an array of hashes as seasonal record collection which responds to :tot_season_records" do
        # assigns(:seasonal_record_collection).each do |seasonal_records|
          # expect( seasonal_records[:tot_season_records] ).to be >= 0
        # end
      # end
    # end
  # end
  # #-- -------------------------------------------------------------------------
  # #++


  describe '[GET #best_timings/:id]' do
    it_behaves_like( "(Swimmers restricted GET action as an unlogged user)", :best_timings )
    it_behaves_like( "(Swimmers restricted GET action as a logged-in user)", :best_timings )
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET #full_history_1/:id]' do
    it_behaves_like( "(Swimmers restricted GET action as an unlogged user)", :full_history_1 )
    it_behaves_like( "(Swimmers restricted GET action as a logged-in user)", :full_history_1 )

    context "as a logged-in user" do
      before(:each) do
        login_user()
        @swimmer = create(:swimmer)
        get :full_history_1, params: { id: @swimmer.id }
      end

      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end

      describe "the @swimmer_career general structure," do
        it "is a SwimmerCareerDAO" do
          expect( assigns( :swimmer_career ) ).to be_an_instance_of( SwimmerCareerDAO )
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET #full_history_2/:id]' do
    it_behaves_like( "(Swimmers restricted GET action as an unlogged user)", :full_history_2 )
    it_behaves_like( "(Swimmers restricted GET action as a logged-in user)", :full_history_2 )

    context "as a logged-in user" do
      let( :events ) { EventsByPoolType.only_for_meetings.not_relays.sort_by_event }

      before(:each) do
        login_user()
        @swimmer = create(:swimmer_with_results)
        get :full_history_2, params: { id: @swimmer.id }
      end

      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "assigns an hash with data collected" do
        expect( assigns( :full_history_by_event ) ).to be_a_kind_of( Hash )
      end
      it "assigns an hash with the same number of element of event by pool types not relays and suitable for meetings" do
        expect( assigns( :full_history_by_event ).size ).to eq( events.count )
      end
      it "assigns an hash that responds to event type code - pool type code" do
        result = assigns( :full_history_by_event )
        events.each do |events_by_pool_type|
          expect( result[events_by_pool_type.get_key] ).not_to be_nil
        end
      end
      it "assigns an hash with array as elements" do
        result = assigns( :full_history_by_event )
        events.each do |events_by_pool_type|
          expect( result[events_by_pool_type.get_key] ).to be_a_kind_of( Array )
        end
      end
      it "assigns an hash with array of four elements as element" do
        result = assigns( :full_history_by_event )
        events.each do |events_by_pool_type|
          expect( result[events_by_pool_type.get_key].size ).to be 5
        end
      end
      it "hasn't elements with results for invalid event for pool type" do
        expect( assigns( :full_history_by_event )["100MI-50"] ).to be_nil
        expect( assigns( :full_history_by_event )["25FA-55"] ).to be_nil
      end

      context "passages_list element structure," do
        it "assigns an hash with array of four elements as element and the first array element is a list" do
          result = assigns( :full_history_by_event )
          events.each do |events_by_pool_type|
            passages_list = result[events_by_pool_type.get_key][0]
            expect( passages_list ).to be_a_kind_of( Array )
          end
        end
      end

      context "results_by_time element structure," do
        it "assigns an hash with array of four elements as element and the second array element is a collection of meeting individual result" do
          result = assigns( :full_history_by_event )
          events.each do |events_by_pool_type|
            results_by_time = result[events_by_pool_type.get_key][1]
            expect( results_by_time ).to all( be_a_kind_of( MeetingIndividualResult ) )
          end
        end
        it "assigns an hash with array of four elements as element and the second array element is a collection of meeting individual result with all swimmer results" do
          result = assigns( :full_history_by_event )
          events.each do |events_by_pool_type|
            results_by_time = result[events_by_pool_type.get_key][1]
            # [Steve, 20160929] If we use #count here below, instead of #size, ActiveRecord will try
            # to convert results_by_time.count into a query and this will yield an error. Stick with #size here:
            expect( results_by_time.size ).to eq( @swimmer.meeting_individual_results.for_event_by_pool_type(events_by_pool_type).count )
          end
        end
      end

      context "passages element structure," do
        it "assigns an hash with array of four elements as element and the third array element is a collection of passage" do
          result = assigns( :full_history_by_event )
          events.each do |events_by_pool_type|
            passages = result[events_by_pool_type.get_key][2]
            if passages
              expect( passages ).to all( be_a_kind_of( Passage ) )
            end
          end
        end
      end

      context "verbose event description element," do
        it "assigns an hash with array of four elements as element and the third array element is a collection of passage" do
          result = assigns( :full_history_by_event )
          events.each do |events_by_pool_type|
            expect( result[events_by_pool_type.get_key][3] ).to be_an_instance_of( String )
          end
        end
      end
    end

    context "as a logged-in user, with LIGABUE MARCO seeds" do
      before(:each) do
        login_user()
        @swimmer = Swimmer.find(23)            # Assumes LIGABUE MARCO from seeds
        get :full_history_2, params: { id: @swimmer.id }
      end

      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "has elements with results for 50FA, 100FA, 200MI in each pool types" do
        # [Steve, 20160929] If we use #count here below, instead of #size, ActiveRecord will try
        # to convert results_by_time.count into a query and this will yield an error. Stick with #size here:
        expect( assigns( :full_history_by_event )["200MI-50"][1].size ).to be > 0
        expect( assigns( :full_history_by_event )["200MI-25"][1].size ).to be > 0
        expect( assigns( :full_history_by_event )["100FA-50"][1].size ).to be > 0
        expect( assigns( :full_history_by_event )["100FA-25"][1].size ).to be > 0
        expect( assigns( :full_history_by_event )["50FA-50"][1].size ).to be > 0
        expect( assigns( :full_history_by_event )["50FA-25"][1].size ).to be > 0
      end
      it "has elements with correct number of passages type" do
        expect( assigns( :full_history_by_event )["200MI-25"][0].size ).to eq(4)
        expect( assigns( :full_history_by_event )["200MI-50"][0].size ).to eq(4)
        expect( assigns( :full_history_by_event )["100SL-25"][0].size ).to eq(2)
        expect( assigns( :full_history_by_event )["100MI-25"][0].size ).to eq(4)
        expect( assigns( :full_history_by_event )["50FA-50"][0].size ).to eq(0)
      end
      it "has elements with result and passages only at 50, 100, 150 and 200 for 200MI, 50 meters" do
        passages_list = assigns( :full_history_by_event )["200MI-50"][0]
        expect( passages_list.size ).to eq(4)
        expect( passages_list ).to include( 50 )
        expect( passages_list ).to include( 100 )
        expect( passages_list ).to include( 150 )
        expect( passages_list ).to include( 200 )
        expect( passages_list ).not_to include( 25 )
        expect( passages_list ).not_to include( 300 )
      end

      # Should test with full seeds
      describe "the index table structure," do
        it "assigns an array with data collected" do
          expect( assigns( :index_table ) ).to be_a_kind_of( Array )
        end
        it "assigns an array with hashes elements" do
          expect( assigns( :index_table ) ).to all( be_a_kind_of( Hash ) )
        end
        it "assigns an array with 3 to 5 elements" do
          index_table = assigns( :index_table )
          expect( index_table.count ).to be >= 3
          expect( index_table.count ).to be <= 5
        end
        it "assigns an array with hashes elements that responds to :stroke_type" do
          assigns( :index_table ).each do |index_element|
            expect( index_element[:stroke_type] ).not_to be_nil
          end
        end
        it "assigns an array with hashes elements that responds to :stroke_code" do
          assigns( :index_table ).each do |index_element|
            expect( index_element[:stroke_code] ).not_to be_nil
          end
        end
        it "assigns an array with hashes elements for FA, SL, RA e MI" do
          index_table = assigns( :index_table )
          expect( index_table.rindex{ |hash_element| hash_element[:stroke_type] == StrokeType.find_by_code('FA').i18n_description } ).not_to be_nil
          expect( index_table.rindex{ |hash_element| hash_element[:stroke_type] == StrokeType.find_by_code('SL').i18n_description } ).not_to be_nil
          expect( index_table.rindex{ |hash_element| hash_element[:stroke_type] == StrokeType.find_by_code('RA').i18n_description } ).not_to be_nil
          expect( index_table.rindex{ |hash_element| hash_element[:stroke_type] == StrokeType.find_by_code('MI').i18n_description } ).not_to be_nil
        end
        it "assigns an array with hashes elements for FA, that responds to 25 and 50 pool types" do
          index_table = assigns( :index_table )
          index_row = index_table[index_table.rindex{ |hash_element| hash_element[:stroke_type] == StrokeType.find_by_code('FA').i18n_description }]
          expect( index_row.size ).to eq( 4 )
          expect( index_row[PoolType.find_by_code('25').i18n_verbose] ).not_to be_nil
          expect( index_row[PoolType.find_by_code('50').i18n_verbose] ).not_to be_nil
        end
        it "assigns an array with hashes elements for FA, that responds to 25 and has 2 elements: (50FA, 100FA)" do
          index_table = assigns( :index_table )
          index_row = index_table[index_table.rindex{ |hash_element| hash_element[:stroke_type] == StrokeType.find_by_code('FA').i18n_description }]
          index_row_list = index_row[ PoolType.find_by_code('25').i18n_verbose ]
          expect( index_row_list.size ).to eq(3)
          expect( index_row_list ).to contain_exactly( 50, 100, 200 )
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET #current_goggle_cup/:id]' do
    it_behaves_like( "(Swimmers restricted GET action as an unlogged user)", :current_goggle_cup )
    it_behaves_like( "(Swimmers restricted GET action as a logged-in user)", :current_goggle_cup )

    context "as a logged-in user" do
      let(:team)    { Team.find(1) }
      let(:swimmer) { team.swimmers[ ((rand * team.swimmers.count) % team.swimmers.count).to_i ] }

      before(:each) do
        request.env["HTTP_REFERER"] = root_path()
        login_user()
        get :current_goggle_cup, params: { id: swimmer.id }
      end

      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "assigns an array with goggle cup collected" do
        expect( assigns( :goggle_cups ) ).to be_a_kind_of( Array )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET #closed_goggle_cup/:id]' do
    context "as a logged-in user" do
      let(:team)       { Team.find(1) }
      let(:swimmer)    { team.swimmers[ ((rand * team.swimmers.count) % team.swimmers.count).to_i ] }
      let(:goggle_cup) { swimmer.goggle_cups.for_team( team )[ ((rand * swimmer.goggle_cups.for_team( team ).count) % swimmer.goggle_cups.for_team( team ).count).to_i ] }

      before(:each) do
        request.env["HTTP_REFERER"] = root_path()
        login_user()
        get :closed_goggle_cup, params: { id: swimmer.id, goggle_cup_id: goggle_cup.id }
      end

      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "assigns an array with goggle cup collected" do
        expect( assigns( :goggle_cups ) ).to be_a_kind_of( Array )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET #supermaster/:id]' do
    context "as a logged-in user," do
      context "for a current season that has the chosen swimmer w/ badge in it," do
        let(:header_year) { Season.build_header_year_from_date(Date.today - 1.year) }
        let(:season_type) { SeasonType.find_by_code('MASFIN') }
        let(:season) do
          Season.exists?( season_type_id: season_type.id, header_year: header_year) ?
            Season.where( season_type_id: season_type.id, header_year: header_year).first :
            Season.find(152)
        end
        let(:team) { Team.find(1) }
        let(:swimmer) do
          swimmer = team.badges.for_season( season )[
             ((rand * team.badges.for_season( season ).count) % team.badges.for_season( season ).count).to_i
          ].swimmer
          expect( swimmer ).to be_a( Swimmer )
          expect( swimmer.has_badge_for_season_and_year?( header_year) ).to be true
          swimmer
        end

        before(:each) do
          request.env["HTTP_REFERER"] = root_path()
          login_user()
          # We will force the header_year upon the action (when not present, header_year
          # will default to nil, using the current season which may well be still without
          # any badges in it at the beginning of the academic year)
          get :supermaster, params: { id: swimmer.id, season_id: season.id, header_year: header_year }
        end

        it "handles successfully the request" do
          expect(response.status).to eq( 200 )
        end
        it "assigns required variables" do
          expect( assigns( :season_type ) ).to eq( season_type )
          expect( assigns( :badge ) ).to be_a( Badge )
          expect( assigns( :season ) ).to eq( season )
          expect( assigns( :team ) ).to eq( team )
          expect( assigns( :team_affiliation ) ).to be_a( TeamAffiliation )
          expect( assigns( :meetings ) ).to all( be_a( Meeting ) )
          expect( assigns( :meeting_individual_results ) ).to all( be_a( MeetingIndividualResult ) )
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET #trainings/:id]' do
    # FIXME This action requires "full goggler" (swimmer associated with user)
    #it_behaves_like( "(Swimmers restricted GET action as an unlogged user)", :trainings )
    #it_behaves_like( "(Swimmers restricted GET action as a logged-in user)", :trainings )

    context "as a logged-in user" do
      before(:each) do
        # We need to set this to make the redirect_to(:back) pass the tests:
        request.env["HTTP_REFERER"] = root_path()
        login_user()
        # FIXME This action requires "full goggler" (swimmer associated with user)
        #@swimmer = create(:swimmer)
        @swimmer = Swimmer.find_by_id(23)           # Assumes LIGABUE MARCO from seeds
        get :trainings, params: { id: @swimmer.id }
      end

      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end

      # [Steve, 20140925] Not true. These can also be all nil:
      xit "assigns the global training distance" do
        expect( assigns(:global_distance) ).to be_a_kind_of( Hash )
        expect( assigns(:global_distance).keys ).to include('distance', 'duration', 'number', 'avg_distance', 'avg_duration', 'avg_100_meters')
      end
      xit "assigns global trainng distance hash with numeric values for each key" do
        assigns(:global_distance).each do |key,value|
          expect( value ).to be >= 0
        end
      end
      xit "assigns the season training distance" do
        expect( assigns(:season_distance) ).to be_a_kind_of( Hash )
        expect( assigns(:season_distance).keys ).to include('distance', 'duration', 'number', 'avg_distance', 'avg_duration', 'avg_100_meters')
      end
      xit "assigns global trainng distance hash with numeric values for each key" do
        assigns(:season_distance).each do |key,value|
          expect( value ).to be >= 0
        end
      end
      xit "assigns the last month training distance" do
        expect( assigns(:last_month) ).to be_a_kind_of( Hash )
        expect( assigns(:last_month).keys ).to include('distance', 'duration', 'number', 'avg_distance', 'avg_duration', 'avg_100_meters')
      end
      xit "assigns global trainng distance hash with numeric values for each key" do
        assigns(:last_month).each do |key,value|
          expect( value ).to be >= 0
        end
      end
      xit "assigns the last week training distance" do
        expect( assigns(:last_week) ).to be_a_kind_of( Hash )
        expect( assigns(:last_week).keys ).to include('distance', 'duration', 'number', 'avg_distance', 'avg_duration', 'avg_100_meters')
      end
      xit "assigns global trainng distance hash with numeric values for each key" do
        assigns(:last_week).each do |key,value|
          expect( value ).to be >= 0
        end
      end
      xit "assigns the last training distance" do
        expect( assigns(:last_training) ).to be_a_kind_of( Hash )
        expect( assigns(:last_training).keys ).to include('distance', 'duration', 'avg_100_meters')
      end
      xit "assigns global trainng distance hash with numeric values for each key" do
        assigns(:last_training).each do |key,value|
          expect( value ).to be >= 0
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
