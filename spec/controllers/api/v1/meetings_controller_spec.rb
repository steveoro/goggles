require 'spec_helper'


describe Api::V1::MeetingsController, :type => :controller do
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = create( :user )
  end


  it_behaves_like( "(Ap1-V1-Controllers, #index & #show actions)", "meetings" )


  describe '[GET meetings/index]' do
    context "with a :code_like filtering parameter," do
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


  describe '[GET meetings/search]' do
    context "with an existing :query parameter," do
      before :each do
        # Assert: we rely on the pre-loaded seeds here
        get :search, query: 'ALLORO', format: :json, user_email: @user.email, user_token: @user.authentication_token
      end
      it_behaves_like( "(Ap1-V1-Controllers, success returning an Array of Hash)" )

      it "returns at least more than 1 match with the existing seeds" do
        result_array = JSON.parse(response.body)
        expect( result_array.size ).to be > 1
      end
    end

    context "with a non-existing :query parameter," do
      before :each do
        # Assert: we rely on the pre-loaded seeds here
        get :search, query: 'LARICIUMBALALILLALLERO', format: :json, user_email: @user.email, user_token: @user.authentication_token
      end

      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "returns a JSON array" do
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Array)
      end
      it "returns an empty list with the existing seeds" do
        result_array = JSON.parse(response.body)
        expect( result_array.size ).to eq(0)
      end
    end

    context "without a :query parameter," do
      before :each do
        # Assert: we rely on the pre-loaded seeds here
        get :search, format: :json, user_email: @user.email, user_token: @user.authentication_token
      end
      it_behaves_like( "(Ap1-V1-Controllers, success returning an Array of Hash)" )

      it "returns the list of all Meetings" do
        result_array = JSON.parse(response.body)
        expect( result_array.size ).to eq( Meeting.count )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
