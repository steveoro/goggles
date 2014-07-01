require 'spec_helper'


describe Api::V1::MeetingsController do
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = create( :user )
  end


  it_behaves_like( "(Ap1-V1-Controllers, #index & #show actions)", "meetings" )    


  describe '[GET meetings/index]' do
    context "with :code_like filtering parameter" do
      before :each do
        # Assert: we rely on the pre-loaded seeds here
        get :index, code_like: 'csi', format: :json, user_email: @user.email, user_token: @user.authentication_token
      end

      it_behaves_like( "(Ap1-V1-Controllers, success returning an Array of Hash)" )

      it "returns at least a match with the existing seeds" do
        result = JSON.parse(response.body)
        expect( result.first['code'] ).to match(/csi/i)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
