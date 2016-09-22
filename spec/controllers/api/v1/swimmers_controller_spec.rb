require 'rails_helper'


describe Api::V1::SwimmersController, :type => :controller do
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = create( :user )
  end


  it_behaves_like( "(Ap1-V1-Controllers, #index & #show actions)", "swimmers" )


  describe '[GET swimmers/index]' do
    context "with :complete_name_like filtering parameter" do
      before :each do
        # Assert: we rely on the pre-loaded seeds here
        get :index, format: :json, params: { q: 'stef', user_email: @user.email, user_token: @user.authentication_token }
      end

      it_behaves_like( "(Ap1-V1-Controllers, success returning an Array of Hash)" )

      it "returns at least a match with the existing seeds" do
        result = JSON.parse(response.body)
        expect( result.first['complete_name'] ).to match(/stef/i)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe '[GET swimmers/show]' do
    context "with valid & custom parameters and credentials" do
      before :each do
        @swimmer = create(:swimmer)
        get :show, format: :json, params: { id: @swimmer.id, user_email: @user.email, user_token: @user.authentication_token }
      end
      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "returns a JSON hash representing the requested instance" do
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Hash)
        expect( result['id'] ).to eq( @swimmer.id )
        expect( result['complete_name'] ).to eq( @swimmer.complete_name )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
