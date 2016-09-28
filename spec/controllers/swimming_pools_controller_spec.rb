require 'rails_helper'


describe SwimmingPoolsController, type: :controller do

  describe '[GET #index]' do
    context "with a JSON request," do
      it "redirects to the root path" do
        get :index, format: :json
        expect( response ).to redirect_to( root_path )
      end
    end

    context "with an HTML request," do
      it "handles successfully the request" do
        get :index
        expect(response.status).to eq( 200 )
      end
      it "assigns the required variables" do
        get :index
        expect( assigns(:title) ).to be_an_instance_of( String )
        expect( assigns(:pools_grid) ).to be_an_instance_of( Wice::WiceGrid )
      end
      it "renders the search template" do
        get :index
        expect(response).to render_template(:index)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET #show/:id]' do
    context "with a JSON request and a non-existing id," do
      it "redirects to the root path" do
        get :show, format: :json, params: { id: 0 }
        expect( response ).to redirect_to( root_path )
      end
    end
    context "with a JSON request and an existing id," do
      it "redirects to the root path" do
        fixture = create( :swimming_pool )
        get :show, format: :json, params: { id: fixture.id }
        expect( response ).to redirect_to( root_path )
      end
    end

    context "with an HTML request and a non-existing id," do
      it "handles the request with a redirect" do
        get :show, params: { id: 0 }
        expect(response.status).to eq( 302 )
      end
      it "redirects to #index" do
        get :show, params: { id: 0 }
        expect( response ).to redirect_to( controller: :swimming_pools, action: :index )
        # [Steve, 20150410] Using this method fails because "_path" helpers use default locale :en,
        # and we have just set defaul locale to :it
#        expect( response ).to redirect_to( swimming_pools_path())
      end
    end

    context "with an HTML request and an existing id," do
      before :each do
        @fixture = create( :swimming_pool )
      end
      it "handles successfully the request" do
        get :show, params: { id: @fixture.id }
        expect(response.status).to eq( 200 )
      end
      it "assigns the required variables" do
        get :show, params: { id: @fixture.id }
        expect( assigns(:pool) ).to be_an_instance_of( SwimmingPool )
      end
      it "renders the template" do
        get :show, params: { id: @fixture.id }
        expect(response).to render_template(:show)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
