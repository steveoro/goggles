require 'spec_helper'
require 'wice_grid'


describe TeamsController, :type => :controller do

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
        @fixture = create( :team )
      end
      it "handles successfully the request" do
        get :radio, id: @fixture.id
        expect(response.status).to eq( 200 )
      end
      it "assigns the required variables" do
        get :radio, id: @fixture.id
        expect( assigns(:team) ).to be_an_instance_of( Team )
      end
      it "renders the template" do
        get :radio, id: @fixture.id
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
        get_action_and_check_if_its_the_login_page_for( action_sym, 0 )
      end
      it "displays the Login page for a valid id" do
        get_action_and_check_if_its_the_login_page_for( action_sym, @fixture.id )
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
        @fixture = create( :team_with_badges )
        # We need to set this to make the redirect_to(:back) passes the tests:
        request.env["HTTP_REFERER"] = teams_path()
        login_user()
        get :current_swimmers, id: @fixture.id
      end
      it "assigns a list of swimmers" do
        expect( response.status ).to eq( 200 )
        expect( assigns(:swimmers) ).to be_an_instance_of( Array )
        expect( assigns(:swimmers) ).to all( be_an_instance_of( Swimmer ) )
      end
    end
  end
  # ===========================================================================


  describe '[GET #best_timings/:id]' do
    it_behaves_like( "(Teams restricted GET action as an unlogged user)", :best_timings )
    it_behaves_like( "(Teams restricted GET action as a logged-in user)", :best_timings )
  end
  # ===========================================================================


  describe '[GET #palamares/:id]' do
    it_behaves_like( "(Teams restricted GET action as an unlogged user)", :palmares )
    it_behaves_like( "(Teams restricted GET action as a logged-in user)", :palmares )
  end
  # ===========================================================================
end
