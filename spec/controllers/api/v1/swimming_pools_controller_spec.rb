require 'rails_helper'


describe Api::V1::SwimmingPoolsController, type: :controller, api: true do
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = create( :user )
  end


  it_behaves_like( "(Ap1-V1-Controllers, #index & #show actions)", "swimming_pools" )


  describe '[GET swimming_pools/index]' do
    context "with :nick_name-like filtering parameter" do
      before :each do
        # Assert: we rely on the pre-loaded seeds here
        get :index, format: :json, params: { q: 'ferrari', user_email: @user.email, user_token: @user.authentication_token }
      end

      it_behaves_like( "(Ap1-V1-Controllers, success returning an Array of Hash)" )

      it "returns at least a match with the existing seeds" do
        result = JSON.parse(response.body)
        expect( result.size ).to be > 0
        expect( result.first['name'] ).to match(/ferrari/i)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe '[GET swimming_pools/show]' do
    context "with valid & custom parameters and credentials" do
      before :each do
        @swimming_pool = create(:swimming_pool)
        get :show, format: :json, params: { id: @swimming_pool.id, user_email: @user.email, user_token: @user.authentication_token }
      end
      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "returns a JSON hash representing the requested instance" do
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Hash)
        expect( result['id'] ).to eq( @swimming_pool.id )
        expect( result['name'] ).to eq( @swimming_pool.name )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
