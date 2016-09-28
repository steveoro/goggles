require 'rails_helper'
require 'wice_grid'


describe TeamsController, type: :controller do

  describe '[GET #index]' do
    context "with an HTML request," do
      it "handles successfully the request" do
        get :index
        expect(response.status).to eq( 200 )
      end
      it "assigns the required variables" do
        get :index
        expect( assigns(:title) ).to be_an_instance_of( String )
        expect( assigns(:teams_grid) ).to be_an_instance_of( Wice::WiceGrid )
      end
      it "renders the search template" do
        get :index
        expect(response).to render_template(:index)
      end
    end
  end
  # ===========================================================================


  describe '[GET #radio/:id]' do
        # We need to set this to make the redirect_to(:back) passes the tests:
    before(:each) { request.env["HTTP_REFERER"] = teams_path() }

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
        @fixture = create( :team )
      end
      it "handles successfully the request" do
        get :radio, params: { id: @fixture.id }
        expect(response.status).to eq( 200 )
      end
      it "assigns the required variables" do
        get :radio, params: { id: @fixture.id }
        expect( assigns(:team) ).to be_an_instance_of( Team )
        expect( assigns(:tab_title) ).to be_an_instance_of( String )
      end
      it "renders the template" do
        get :radio, params: { id: @fixture.id }
        expect(response).to render_template(:radio)
      end
    end
  end
  # ===========================================================================


  shared_examples_for "(Teams restricted GET action as an unlogged user)" do |action_sym|
    before :each do
      @fixture = create( :team )
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
  # ===========================================================================


  shared_examples_for "(Teams restricted GET action as a logged-in user)" do |action_sym|
    before :each do
      @fixture = create( :team )
        # We need to set this to make the redirect_to(:back) passes the tests:
      request.env["HTTP_REFERER"] = teams_path()
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
          expect( assigns(:team) ).to be_an_instance_of( Team )
        end
        it "renders the template" do
          expect(response).to render_template(action_sym)
        end
      end
    end
  end
  # ===========================================================================


  describe '[GET #current_swimmers/:id]' do
    it_behaves_like( "(Teams restricted GET action as an unlogged user)", :current_swimmers )
    it_behaves_like( "(Teams restricted GET action as a logged-in user)", :current_swimmers )

    context "with an HTML request for a valid id and a logged-in user," do
      before :each do
        @fixture = create( :team_affiliation_with_badges ).team
        # We need to set this to make the redirect_to(:back) passes the tests:
        request.env["HTTP_REFERER"] = teams_path()
        login_user()
        get :current_swimmers, params: { id: @fixture.id }
      end
      it "assigns a list of swimmers" do
        expect( response.status ).to eq( 200 )
        expect( assigns(:swimmers) ).to be_an_instance_of( Array )
        expect( assigns(:swimmers) ).to all( be_an_instance_of( Swimmer ) )
        expect( assigns(:tab_title) ).to be_an_instance_of( String )
      end
    end
  end
  # ===========================================================================


  describe '[GET #best_timings/:id]' do
    it_behaves_like( "(Teams restricted GET action as an unlogged user)", :best_timings )
    it_behaves_like( "(Teams restricted GET action as a logged-in user)", :best_timings )
  end
  # ===========================================================================


  describe '[GET #palmares/:id]' do
    it_behaves_like( "(Teams restricted GET action as an unlogged user)", :palmares )
    it_behaves_like( "(Teams restricted GET action as a logged-in user)", :palmares )

    context "with an HTML request for a valid id and a logged-in user," do
      before :each do
        @fixture = Team.find(1)
        request.env["HTTP_REFERER"] = teams_path()
        login_user()
        get :palmares, params: { id: @fixture.id }
      end

      it "assigns the tab title" do
        expect( assigns(:tab_title) ).to be_an_instance_of( String )
      end
    end
  end
  # ===========================================================================


  describe '[GET #goggle_cup/:id]' do
    it_behaves_like( "(Teams restricted GET action as an unlogged user)", :goggle_cup )
    it_behaves_like( "(Teams restricted GET action as a logged-in user)", :goggle_cup )

    context "with an HTML request for a valid id and a logged-in user for for a team that doesn't have a current Goggle cup," do
      before :each do
        @fixture = create( :team_affiliation_with_badges ).team
        request.env["HTTP_REFERER"] = teams_path()
        login_user()
        get :goggle_cup, params: { id: @fixture.id }
      end
      it "assigns the tab title" do
        expect( assigns(:tab_title) ).to be_an_instance_of( String )
      end
      it "assigns the @goggle_cup_name" do
        expect( assigns(:goggle_cup_name) ).to be_an_instance_of( String )
      end
      it "assigns the @goggle_cup_max_points" do
        expect( assigns(:goggle_cup_max_points) ).to be_an_instance_of( String )
      end
      it "assigns the @goggle_cup_max_performance" do
        expect( assigns(:goggle_cup_max_performance) ).to be_an_instance_of( String )
      end
      it "doesn't assign a goggle_cup instance" do
        expect( response.status ).to eq( 200 )
        expect( assigns(:goggle_cup) ).to be_an_instance_of( GoggleCup ).or be_nil
      end
      it "assigns an empty goggle_cup_rank instance" do
        expect( response.status ).to eq( 200 )
        expect( assigns( :goggle_cup_rank ) ).to be_an_instance_of( Array )
        expect( assigns( :goggle_cup_rank ).size ).to be 0
      end
    end

    context "with an HTML request for a valid id and a logged-in user for for a team that has a current Goggle cup," do
      before :each do
        @fixture = Team.find(1).decorate
        request.env["HTTP_REFERER"] = teams_path()
        login_user()
        get :goggle_cup, params: { id: @fixture.id }
      end
      it "assigns the tab title" do
        expect( assigns(:tab_title) ).to be_an_instance_of( String )
      end
      it "assigns the @goggle_cup_name" do
        expect( assigns(:goggle_cup_name) ).to be_an_instance_of( String )
      end
      it "assigns the @goggle_cup_max_points" do
        expect( assigns(:goggle_cup_max_points) ).to be_an_instance_of( String )
      end
      it "assigns the @goggle_cup_max_performance" do
        expect( assigns(:goggle_cup_max_performance) ).to be_an_instance_of( String )
      end
      it "assigns a goggle_cup instance if the selected team it has currently one" do
        expect( response.status ).to eq( 200 )
        if ( @fixture.get_current_goggle_cup_at )
          expect( assigns( :goggle_cup ) ).to be_an_instance_of( GoggleCup )
        else
          expect( assigns( :goggle_cup ) ).to be nil
        end
      end
      it "assigns a goggle_cup_rank instance" do
        expect( response.status ).to eq( 200 )
        expect( assigns( :goggle_cup_rank ) ).to be_an_instance_of( Array )
        expect( assigns( :goggle_cup_rank ).size ).to be >= 0
      end
    end
  end
  # ===========================================================================


  describe '[GET #goggle_cup_all_of_fame/:id]' do
    it_behaves_like( "(Teams restricted GET action as an unlogged user)", :palmares )
    it_behaves_like( "(Teams restricted GET action as a logged-in user)", :palmares )

    context "with an HTML request for a valid id and a logged-in user for for a team that doesn't have closed Goggle cup," do
      before :each do
        @fixture = create( :team_affiliation_with_badges ).team
        request.env["HTTP_REFERER"] = teams_path()
        login_user()
        get :goggle_cup_all_of_fame, params: { id: @fixture.id }
      end
      it "doesn't assign a closed goggle cup collection" do
        expect( response.status ).to eq( 200 )
        expect( assigns( :closed_goggle_cup ) ).to be_an_instance_of( Array )
        expect( assigns( :closed_goggle_cup ).size ).to be 0
      end
      it "assigns the tab title" do
        expect( assigns(:tab_title) ).to be_an_instance_of( String )
      end
    end

    context "with an HTML request for a valid id and a logged-in user for for a team that has some closed Goggle cup," do
      before :each do
        @fixture = Team.find(1)
        request.env["HTTP_REFERER"] = teams_path()
        login_user()
        get :goggle_cup_all_of_fame, params: { id: @fixture.id }
      end
      it "assigns the tab title" do
        expect( assigns(:tab_title) ).to be_an_instance_of( String )
      end
      it "assigns a closed goggle cup collection" do
        expect( response.status ).to eq( 200 )
        expect( assigns( :closed_goggle_cup ) ).to be_an_instance_of( Array )
      end
      it "assigns an hash with points to every elements of closed_goggle_cup collection" do
        expect( response.status ).to eq( 200 )
        assigns( :closed_goggle_cup ).each do |element|
          expect( element ).to be_a_kind_of( Hash )
          expect( element.has_key?( :goggle_cup ) ).to be true
          expect( element.has_key?( :year ) ).to be true
          expect( element.has_key?( :first ) ).to be true
          expect( element.has_key?( :first_points ) ).to be true
          expect( element.has_key?( :second ) ).to be true
          expect( element.has_key?( :second_points ) ).to be true
          expect( element.has_key?( :third ) ).to be true
          expect( element.has_key?( :third_points ) ).to be true
        end
      end
      it "assigns an hash in which goggle_cup key contains an instance of GoggleCup" do
        expect( response.status ).to eq( 200 )
        assigns( :closed_goggle_cup ).each do |element|
          expect( element ).to be_a_kind_of( Hash )
          expect( element[:goggle_cup] ).to be_an_instance_of( GoggleCup )
        end
      end
      it "assigns an hash in which first key contains an instance of Swimmer with valid score" do
        expect( response.status ).to eq( 200 )
        assigns( :closed_goggle_cup ).each do |element|
          expect( element ).to be_a_kind_of( Hash )
          expect( element[:first] ).to be_an_instance_of( Swimmer )
          expect( element[:first_points] ).to be > 0
        end
      end
      it "assigns an hash in which second and third keys contains instances of Swimmer or nil" do
        expect( response.status ).to eq( 200 )
        assigns( :closed_goggle_cup ).each do |element|
          expect( element ).to be_a_kind_of( Hash )
          expect( element[:second] ).to be_an_instance_of( Swimmer ).or be_nil
          expect( element[:third] ).to be_an_instance_of( Swimmer ).or be_nil
        end
      end
      it "assigns an hash in which first, second and third points are ordered descending" do
        expect( response.status ).to eq( 200 )
        assigns( :closed_goggle_cup ).each do |element|
          expect( element ).to be_a_kind_of( Hash )
          expect( element[:first_points] ).to be >= element[:second_points]
          expect( element[:second_points] ).to be >= element[:third_points]
        end
      end
      it "assigns a sorted by year key array" do
        expect( response.status ).to eq( 200 )
        rank_array = assigns(:closed_goggle_cup)
        current_item = rank_array.first[:year]
        rank_array.each do |item|
          expect( item[:year] ).to be <= current_item
          current_item = item[:year]
        end
      end
      it "assigns an array where count is the number of closed goggle cups for the team" do
        expect( response.status ).to eq( 200 )
        closed_goggle_cup = 0
        @fixture.goggle_cups.each do |goggle_cup|
          closed_goggle_cup += 1 if goggle_cup.is_closed_at? && goggle_cup.has_results?
        end
        expect( assigns( :closed_goggle_cup ).count == closed_goggle_cup ).to be true
      end
    end
  end
  # ===========================================================================


  describe '[GET #closed_goggle_cup/:id]' do
    context "as a logged-in user" do
      let(:team)       { Team.find(1) }
      let(:goggle_cup) { team.goggle_cups[ ((rand * team.goggle_cups.count) % team.goggle_cups.count).to_i ] }

      before(:each) do
        login_user()
        get :closed_goggle_cup, params: { id: goggle_cup.id }
      end

      it "assigns the closed goggle cup" do
        expect( assigns( :closed_goggle_cup ) ).to be_an_instance_of( GoggleCup )
      end
    end
  end
  # ===========================================================================
end
