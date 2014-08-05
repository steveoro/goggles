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
    # We need to set this to make the redirect_to(:back) pass the tests:
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
end
