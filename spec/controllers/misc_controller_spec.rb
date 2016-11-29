require 'rails_helper'
require 'wice_grid'


describe MiscController, type: :controller do

  render_views

  shared_examples_for "(Misc not restricted GET action)" do |action_sym|
    it "handles successfully the request" do
      expect( response.status ).to eq(200)
    end
    it "assigns the tab title" do
      expect( response.body ).to include( I18n.t("misc.#{ action_sym }") )
    end
  end
  #-- =========================================================================
  #++


  describe '[GET #fin_score_calculation]' do

    context "as an unlogged user" do
      before(:each) { get :fin_score_calculation }

      it_behaves_like( "(Misc not restricted GET action)", :fin_score_calculation )
      it "assigns a current season" do
        expect( assigns(:current_season) ).to be_an_instance_of( Season )
      end

      it "assigns -1 value to standard points" do
        expect( assigns(:standard_points) ).to eq( -1 )
      end
      it "doesn't assign a swimmer" do
        expect( assigns(:swimmer) ).to be_nil
      end
      it "doesn't assign a category_type" do
        expect( assigns(:swimmer_category) ).to be_nil
      end
      it "doesn't assign a gender_type" do
        expect( assigns(:swimmer_gender) ).to be_nil
      end
    end

    context "as a logged but not associated user" do
      before(:each) do
        login_user()
        expect( subject.current_user ).to be_an_instance_of( User )
        get :fin_score_calculation
      end

      it_behaves_like( "(Misc not restricted GET action)", :fin_score_calculation )
      it "assigns a current season" do
        expect( assigns(:current_season) ).to be_an_instance_of( Season )
      end

      it "doesn't assign a swimmer" do
        expect( assigns(:swimmer) ).to be_nil
      end
      it "doesn't assign a category_type" do
        expect( assigns(:swimmer_category) ).to be_nil
      end
      it "doesn't assign a gender_type" do
        expect( assigns(:swimmer_gender) ).to be_nil
      end
    end


    context "as a logged-in and swimmer-associated user" do
      before(:each) do
        # XXX Using existing fixture data to speed-up testing:
        @user = User.find( [1, 2].sort{rand * 0.5 }.first )
#        swimmer = @user.swimmer
#        fix_season = Meeting.for_season_type( SeasonType.find_by_code('MASFIN') )
#            .has_results.to_a
#              .sort{rand * 0.5}.first
#              .season
        # ****************[ OLD complex method BEGIN]**************************
#        @user = create(:user)
        # Select from seasons that have badges and time standards
#        fix_season = Meeting.for_season_type( SeasonType.find_by_code( 'MASFIN' )).has_results[ ( rand * Meeting.for_season_type( SeasonType.find_by_code( 'MASFIN' )).has_results.count - 1 ).to_i ].season
        # Get a random swimmer from the fixture season:
#        swimmer = Swimmer
#          .includes(:badges)
#          .where( "badges.season_id" => fix_season.id )[ ( rand * Swimmer.includes(:badges).where( "badges.season_id" => fix_season.id ).count - 1 ).to_i ]
#        expect( swimmer ).not_to be nil
# DEBUG
#        puts( "\r\n- fixture season: #{@fixture_season.inspect}" )
#        puts( "- swimmer: #{swimmer.inspect}" )
# DEBUG
#        puts "\r\n- @user PRE-association: #{@user.inspect}"
#        @user.set_associated_swimmer( swimmer )
# DEBUG
#        puts "- @user POST-association: #{@user.inspect}"
        # ****************[ OLD complex method END]****************************

        login_user( @user )
        expect( subject.current_user ).to be_an_instance_of( User )
        expect( subject.current_user.swimmer_id ).not_to be nil
# DEBUG
 #       puts( "- current_user: #{subject.current_user.inspect}" )
        get :fin_score_calculation
      end

      it_behaves_like( "(Misc not restricted GET action)", :fin_score_calculation )
      it "assigns a current season" do
        expect( assigns(:current_season) ).to be_an_instance_of( Season )
      end

      it "assigns the required variables" do
# DEBUG
#        puts( "\r\n- swimmer assign: #{assigns(:swimmer).inspect}" )
        expect( assigns(:swimmer) ).to be_an_instance_of( SwimmerDecorator )
      end
      it "assigns a category_type" do
        expect( assigns(:swimmer_category) ).to be_an_instance_of( CategoryType )
      end
      it "assigns a gender_type" do
# DEBUG
#        puts( "\r\n- swimmer_gender assign: #{assigns(:swimmer_gender).inspect} => #{assigns(:swimmer).inspect}" )
        expect( assigns(:swimmer_gender) ).to be_an_instance_of( GenderType )
      end
      it "assigns -1 value to standard points" do
        expect( assigns(:standard_points) ).to eq( -1 )
      end
    end
  end
  #-- =========================================================================
  #++


  describe '[XHR POST #compute_fin_score]' do

    let(:minutes)  { ((rand * 10) % 10).to_i + 1 }
    let(:seconds)  { ((rand * 59) % 59).to_i + 1 }
    let(:hundreds) { ((rand * 99) % 99).to_i + 1 }

    context "without requested parameters" do
      before(:each) do
        post( :compute_fin_score, xhr: true,
          params: {
            gender_type_id:   0,  # Force invalid event type and pool type
            category_type_id: 0,
            event_type:       {id: 0},
            pool_type:        {id: 0},
            minutes:          minutes,
            seconds:          seconds,
            hundreds:         hundreds
          }
        )
      end
      it "handles the request" do
        expect( response ).to be_a_success
      end
      it "sets the flash error message" do
        expect( flash[:error] ).to include( I18n.t(:missing_request_parameter) )
      end
      it "assigns -1 value to standard points" do
        expect( assigns(:standard_points) ).to eq( -1 )
      end
    end
    #-- -----------------------------------------------------------------------
    #++


    context "with an invalid timing" do
      before(:each) do
        @fixture_gender = GenderType.find_by_code('M')
        @fixture_category = CategoryType.find_by_code('M40')
        @fixture_events_by_pool_type = EventsByPoolType.find_by_id(((rand * 18) % 18).to_i + 1) # ASSERT: first 18 event by pool types are not relays
        post( :compute_fin_score, xhr: true,
          params: {
            gender_type_id:   @fixture_gender.id,
            category_type_id: @fixture_category.id,
            event_type_id:    @fixture_events_by_pool_type.event_type_id,
            pool_type_id:     @fixture_events_by_pool_type.pool_type_id,
            minutes:          -3,  # Force invalid timing
            seconds:          -2,
            hundreds:         -1
          }
        )
      end
      it "handles the request" do
        expect( response ).to be_a_success
      end
      it "sets the flash error message" do
        expect( flash[:error] ).to include( I18n.t('misc.wrong_timing') )
      end
      it "assigns -1 value to standard points" do
        expect( assigns(:standard_points) ).to eq( -1 )
      end
    end
    #-- -----------------------------------------------------------------------
    #++


    context "with a not-allowed pool type and event type parameters" do
      before(:each) do
        @fixture_gender = GenderType.find_by_code('M')
        @fixture_category = CategoryType.find_by_code('M40')
        post( :compute_fin_score, xhr: true,
          params: {
            gender_type_id:   @fixture_gender.id,
            category_type_id: @fixture_category.id,
            event_type_id:    EventType.where(code: '100MI').first.id,
            pool_type_id:     PoolType.where(code: '50').first.id,
            minutes:          minutes,
            seconds:          seconds,
            hundreds:         hundreds
          }
        )
      end
      it "handles the request" do
        expect( response ).to be_a_success
      end
      it "sets the flash error message" do
        expect( flash[:error] ).to include( I18n.t('misc.wrong_event_or_pool') )
      end
      it "assigns -1 value to standard points" do
        expect( assigns(:standard_points) ).to eq( -1 )
      end
    end
    #-- -----------------------------------------------------------------------
    #++


    context "with a correct request" do
      before(:each) do
        @fixture_gender = GenderType.find_by_code('M')
        @fixture_category = CategoryType.find_by_code('M40')
        @fixture_events_by_pool_type = EventsByPoolType.find_by_id(((rand * 18) % 18).to_i + 1) # ASSERT: first 18 event by pool types are not relays
        post( :compute_fin_score, xhr: true,
          params: {
            gender_type_id:   @fixture_gender.id,
            category_type_id: @fixture_category.id,
            event_type_id:    @fixture_events_by_pool_type.event_type_id,
            pool_type_id:     @fixture_events_by_pool_type.pool_type_id,
            minutes:          minutes,
            seconds:          seconds,
            hundreds:         hundreds
          }
        )
      end

      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
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
    end
    #-- -----------------------------------------------------------------------
    #++


    context "with a correct request for a logged user with associated swimmer" do
      before(:each) do
        # XXX Using existing fixture data to speed-up testing:
        @user = User.find( [1, 2].sort{rand * 0.5 }.first )
        swimmer = @user.swimmer
        fix_season = Meeting.for_season_type( SeasonType.find_by_code('MASFIN') )
            .has_results.to_a
              .sort{rand * 0.5}.first
              .season
        # ****************[ OLD complex method BEGIN]**************************
        # Select from seasons that have badges and time standards
#        fix_season = Meeting.for_season_type( SeasonType.find_by_code('MASFIN') )
#            .has_results.to_a
#              .sort{rand * 0.5}.first
#              .season
        # Get a random swimmer from the fixture season:
#        swimmer = Swimmer
#          .includes(:badges)
#          .where( "badges.season_id" => fix_season.id )[ ( rand * Swimmer.includes(:badges).where( "badges.season_id" => fix_season.id ).count - 1 ).to_i ]
#        expect( swimmer ).not_to be nil
# DEBUG
#        puts "\r\n- fix_season: #{fix_season.inspect}"
#        puts "- swimmer: #{swimmer.inspect}"
#        @user = create(:user)
# DEBUG
#        puts "\r\n- @user PRE-association: #{@user.inspect}"
#        @user.set_associated_swimmer( swimmer )
# DEBUG
#        puts "- @user POST-association: #{@user.inspect}"
        # ****************[ OLD complex method END]****************************
        @fixture_gender = swimmer.gender_type
        @fixture_category = swimmer.get_category_type_for_season( fix_season.id )
        @fixture_events_by_pool_type = EventsByPoolType.not_relays.only_for_meetings
          .to_a.sort{rand * 0.5}.first

        login_user( @user )
        expect( subject.current_user ).to be_an_instance_of( User )
        expect( subject.current_user.swimmer_id ).not_to be nil

        post( :compute_fin_score, xhr: true,
          params: {
            gender_type_id:   @fixture_gender.id,
            category_type_id: @fixture_category.id,
            event_type_id:    @fixture_events_by_pool_type.event_type_id,
            pool_type_id:     @fixture_events_by_pool_type.pool_type_id,
            minutes:          minutes,
            seconds:          seconds,
            hundreds:         hundreds
          }
        )
      end

      it "assigns season record" do
        expect( assigns(:seasonal_record) ).to be_an_instance_of( ActiveSupport::SafeBuffer ).or be_an_instance_of( String )
      end

      # These two are actually NOT nil only if the current random swimmer has had
      # any personal or season best timings. So, sorry, this test
      # must either go away or be rewritten:
      #
      # it "assigns swimmer record" do
        # expect( assigns(:personal_best) ).to be_an_instance_of( ActiveSupport::SafeBuffer ).or be_an_instance_of( String )
      # end
      # it "assigns season record" do
        # expect( assigns(:seasonal_best) ).to be_an_instance_of( ActiveSupport::SafeBuffer ).or be_an_instance_of( String )
      # end

      # The following is an integration test and works only if the team of the random
      # swimmer has any team records inserted in the table. So, sorry, this test
      # must either go away or be rewritten:
      #
      # describe "while assigning team records," do
        # it "assigns an hash" do
          # expect( assigns(:available_team_records) ).to be_an_instance_of( Hash ).or be_an_instance_of( ActiveSupport::HashWithIndifferentAccess )
        # end
        # it "has Team instances as keys" do
          # expect( assigns(:available_team_records).keys ).to all( be_an_instance_of( Team ) )
        # end
        # it "has html record as element" do
          # expect( assigns(:available_team_records).values ).to all( be_an_instance_of( ActiveSupport::SafeBuffer ).or be_an_instance_of( String ) )
        # end
      # end
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- =========================================================================
  #++

  describe '[GET #fin_timing_calculation]' do

    context "as an unlogged user" do
      before(:each) { get :fin_timing_calculation }

      it_behaves_like( "(Misc not restricted GET action)", :fin_timing_calculation )
      it "assigns a current season" do
        expect( assigns(:current_season) ).to be_an_instance_of( Season )
      end

      it "assigns 0 value to goal timing" do
        expect( assigns(:timing) ).to eq( Timing.new( 0 ) )
      end
      it "doesn't assign a swimmer" do
        expect( assigns(:swimmer) ).to be_nil
      end
      it "doesn't assign a category_type" do
        expect( assigns(:swimmer_category) ).to be_nil
      end
      it "doesn't assign a gender_type" do
        expect( assigns(:swimmer_gender) ).to be_nil
      end
    end

    context "as logged but not associated user" do
      before(:each) do
        login_user()
        expect( subject.current_user ).to be_an_instance_of( User )
        get :fin_timing_calculation
      end

      it_behaves_like( "(Misc not restricted GET action)", :fin_timing_calculation )
      it "assigns a current season" do
        expect( assigns(:current_season) ).to be_an_instance_of( Season )
      end

      it "doesn't assign a swimmer" do
        expect( assigns(:swimmer) ).to be_nil
      end
      it "doesn't assign a category_type" do
        expect( assigns(:swimmer_category) ).to be_nil
      end
      it "doesn't assign a gender_type" do
        expect( assigns(:swimmer_gender) ).to be_nil
      end
    end


    context "as logged and swimmer-associated user" do
      before(:each) do
        # XXX Using existing fixture data to speed-up testing:
        @user = User.find( [1, 2].sort{rand * 0.5 }.first )
        # Select from seasons that have badges and time standards
#        fix_season = Meeting.for_season_type( SeasonType.find_by_code( 'MASFIN' )).has_results[ ( rand * Meeting.for_season_type( SeasonType.find_by_code( 'MASFIN' )).has_results.count - 1 ).to_i ].season
        # Get a random swimmer from the fixture season:
#        swimmer = Swimmer
#          .includes(:badges)
#          .where( "badges.season_id" => fix_season.id )[ ( rand * Swimmer.includes(:badges).where( "badges.season_id" => fix_season.id ).count - 1 ).to_i ]
#        expect( swimmer ).not_to be nil
#        @user.set_associated_swimmer( swimmer )

        login_user( @user )
        expect( subject.current_user ).to be_an_instance_of( User )
        expect( subject.current_user.swimmer_id ).not_to be nil
        get :fin_timing_calculation
      end

      it_behaves_like( "(Misc not restricted GET action)", :fin_timing_calculation )
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
      it "assigns 0 value to goal timing" do
        expect( assigns(:timing) ).to eq( Timing.new( 0 ) )
      end
    end
  end
  #-- =========================================================================
  #++

  describe '[XHR POST #compute_fin_timing]' do
    let(:standard_points)  { ((rand * 550) + 500).round(2) }

    context "without requested parameters" do
      before(:each) do
        post( :compute_fin_timing, xhr: true,
          params: {
            gender_type_id:   0,  # Force invalid event type and pool type
            category_type_id: 0,
            event_type:       {id: 0},
            pool_type:        {id: 0},
            standard_points:  standard_points
          }
        )
      end
      it "handles the request" do
        expect( response ).to be_a_success
      end
      it "sets the flash error message" do
        expect( flash[:error] ).to include( I18n.t(:missing_request_parameter) )
      end
      it "assigns 0 value to goal timing" do
        expect( assigns(:timing) ).to eq( Timing.new( 0 ) )
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    context "with an invalid goal score" do
      before(:each) do
        @fixture_gender = GenderType.find_by_code('M')
        @fixture_category = CategoryType.find_by_code('M40')
        @fixture_events_by_pool_type = EventsByPoolType.find_by_id(((rand * 18) % 18).to_i + 1) # ASSERT: first 18 event by pool types are not relays
        post( :compute_fin_timing, xhr: true,
          params: {
            gender_type_id:   @fixture_gender.id,
            category_type_id: @fixture_category.id,
            event_type_id:    @fixture_events_by_pool_type.event_type_id,
            pool_type_id:     @fixture_events_by_pool_type.pool_type_id,
            standard_points:  50  # Force invalid score
          }
        )
      end
      it "handles the request" do
        expect( response ).to be_a_success
      end
      it "sets the flash error message" do
        expect( flash[:error] ).to include( I18n.t('misc.wrong_score') )
      end
      it "assigns 0 value to goal timing" do
        expect( assigns(:timing) ).to eq( Timing.new( 0 ) )
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    context "with not allowed pool type and event type parameters" do
      before(:each) do
        @fixture_gender = GenderType.find_by_code('M')
        @fixture_category = CategoryType.find_by_code('M40')
        post( :compute_fin_timing, xhr: true,
          params: {
            gender_type_id:   @fixture_gender.id,
            category_type_id: @fixture_category.id,
            event_type_id:    EventType.where(code: '100MI').first.id,
            pool_type_id:     PoolType.where(code: '50').first.id,
            standard_points:  standard_points
          }
        )
      end
      it "handles the request" do
        expect( response ).to be_a_success
      end
      it "sets the flash error message" do
        expect( flash[:error] ).to include( I18n.t('misc.wrong_event_or_pool') )
      end
      it "assigns 0 value to goal timing" do
        expect( assigns(:timing) ).to eq( Timing.new( 0 ) )
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    context "with a correct request" do
      before(:each) do
        @fixture_gender = GenderType.find_by_code('M')
        @fixture_category = CategoryType.find_by_code('M40')
        @fixture_events_by_pool_type = EventsByPoolType.find_by_id(((rand * 18) % 18).to_i + 1) # ASSERT: first 18 event by pool types are not relays
        post( :compute_fin_timing, xhr: true,
          params: {
            gender_type_id:   @fixture_gender.id,
            category_type_id: @fixture_category.id,
            event_type_id:    @fixture_events_by_pool_type.event_type_id,
            pool_type_id:     @fixture_events_by_pool_type.pool_type_id,
            standard_points:  standard_points
          }
        )
      end

      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
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
      it "accepts a goal score" do
        expect( assigns(:standard_points) ).to be > 300
      end
      it "accepts a goal score" do
        expect( assigns(:standard_points) ).to be < 1200
      end
      it "assigns timing data" do
        expect( assigns(:timing) ).to be_an_instance_of( Timing )
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
    end
    #-- -----------------------------------------------------------------------
    #++

    context "with a correct request for a logged user with associated swimmer" do
      before(:each) do
        # Select from seasons that have badges and time standards
        fix_season = Meeting.for_season_type( SeasonType.find_by_code( 'MASFIN' )).has_results[ ( rand * Meeting.for_season_type( SeasonType.find_by_code( 'MASFIN' )).has_results.count - 1 ).to_i ].season
        # Get a random swimmer from the fixture season:
        swimmer = Swimmer
          .includes(:badges)
          .where( "badges.season_id" => fix_season.id )[ ( rand * Swimmer.includes(:badges).where( "badges.season_id" => fix_season.id ).count - 1 ).to_i ]
        expect( swimmer ).not_to be nil

        @user = create(:user)
        @user.set_associated_swimmer( swimmer )
        @fixture_gender = swimmer.gender_type
        @fixture_category = swimmer.get_category_type_for_season( fix_season.id )
        @fixture_events_by_pool_type = EventsByPoolType.not_relays.only_for_meetings.all[ ( rand * EventsByPoolType.not_relays.only_for_meetings.count - 1 ).to_i ]

        login_user( @user )
        expect( subject.current_user ).to be_an_instance_of( User )
        expect( subject.current_user.swimmer_id ).not_to be nil

        post( :compute_fin_timing, xhr: true,
          params: {
            gender_type_id:   @fixture_gender.id,
            category_type_id: @fixture_category.id,
            event_type_id:    @fixture_events_by_pool_type.event_type_id,
            pool_type_id:     @fixture_events_by_pool_type.pool_type_id,
            standard_points:  standard_points
          }
        )
      end

      it "assigns season record" do
        expect( assigns(:seasonal_record) ).to be_an_instance_of( ActiveSupport::SafeBuffer ).or be_an_instance_of( String )
      end
    end
  end
  #-- =========================================================================
  #++

  describe '[GET #swimmer_matches]' do

    context "as an unlogged user" do
      before(:each) { get :swimmer_matches }

      it_behaves_like( "(Misc not restricted GET action)", :swimmer_matches )

      it "doesn't assigns local_swimmer" do
        expect( assigns( :local_swimmer ) ).to be nil
      end
      it "doesn't assign visitor_swimmer" do
        expect( assigns( :visitor_swimmer ) ).to be nil
      end
      it "doesn't assign a sme" do
        expect( assigns( :sme ) ).to be nil
      end
      it "doesn't assign a sme_dao" do
        expect( assigns( :sme_dao ) ).to be nil
      end
    end

    context "as logged but not associated user" do
      before(:each) do
        login_user()
        expect( subject.current_user ).to be_an_instance_of( User )
        get :swimmer_matches
      end

      it_behaves_like( "(Misc not restricted GET action)", :swimmer_matches )

      it "doesn't assigns local_swimmer" do
        expect( assigns( :local_swimmer ) ).to be nil
      end
      it "doesn't assign visitor_swimmer" do
        expect( assigns( :visitor_swimmer ) ).to be nil
      end
      it "doesn't assign a sme" do
        expect( assigns( :sme ) ).to be nil
      end
      it "doesn't assign a sme_dao" do
        expect( assigns( :sme_dao ) ).to be nil
      end
    end

    context "as logged and swimmer-associated user" do
      before(:each) do
        user = create(:user)
        swimmer = Swimmer.all[ ( rand * ( Swimmer.count - 1 ) ).to_i ]
        user.set_associated_swimmer( swimmer )
        login_user( user )
        expect( subject.current_user ).to be_an_instance_of( User )
        expect( subject.current_user.swimmer_id ).not_to be nil
        get :swimmer_matches
      end

      it_behaves_like( "(Misc not restricted GET action)", :swimmer_matches )

      it "assigns the required variables" do
        expect( assigns( :local_swimmer ) ).to be_an_instance_of( Swimmer )
      end
      it "doesn't assign visitor_swimmer" do
        expect( assigns( :visitor_swimmer ) ).to be nil
      end
      it "doesn't assign a sme" do
        expect( assigns( :sme ) ).to be nil
      end
      it "doesn't assign a sme_dao" do
        expect( assigns( :sme_dao ) ).to be nil
      end
    end
  end
  #-- =========================================================================
  #++

  describe '[XHR POST #show_swimmer_matches]' do

    context "without requested parameters," do
      before(:each) do
        post( :show_swimmer_matches, xhr: true,
          params: {
            local_swimmer_id:   { id: 23 },
            visitor_swimmer_id: { id: 0 } # Force invalid value
          }
        )
      end
      it "handles the request" do
        expect( response ).to be_a_success
      end
      it "sets the flash error message" do
        expect( flash[:error] ).to include( I18n.t(:missing_request_parameter) )
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    context "with a correct request," do
      before(:each) do
        post( :show_swimmer_matches, xhr: true,
          params: {
            local_swimmer:   { id: 23 },
            visitor_swimmer: { id: 142 }
          }
        )
      end
      it "handles the request" do
        expect( response ).to be_a_success
      end
      it "assigns @local_swimmer according to the specified parameter" do
        expect( assigns(:local_swimmer) ).to be_a( Swimmer )
        expect( assigns(:local_swimmer).id ).to eq( 23 )
      end
      it "assigns @visitor_swimmer according to the specified parameter" do
        expect( assigns(:visitor_swimmer) ).to be_a( Swimmer )
        expect( assigns(:visitor_swimmer).id ).to eq( 142 )
      end
      it "assigns @sme (to the resulting SwimmerMatchEvaluator)" do
        expect( assigns(:sme) ).to be_a( SwimmerMatchEvaluator )
      end
      it "renders #show_swimmer_matches" do
        expect( response ).to render_template( :show_swimmer_matches )
      end
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- =========================================================================
  #++
end
