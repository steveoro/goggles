require 'spec_helper'


describe Api::V1::MeetingsController, :type => :controller do
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = create( :user )
  end


  it_behaves_like( "(Ap1-V1-Controllers, #index & #show actions)", "meetings" )


  describe '[GET #index]' do
    context "without a :code_like filtering parameter," do
      before :each do
        # Assert: we rely on the pre-loaded seeds here
        get :index, format: :json, user_email: @user.email, user_token: @user.authentication_token
      end
      it_behaves_like( "(Ap1-V1-Controllers, success returning an Array of Hash)" )

      it "returns the list of all Meetings" do
        result_array = JSON.parse(response.body)
        expect( result_array.size ).to eq( Meeting.count )
      end
    end


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


  describe '[GET #show]' do
    context "with a valid :id parameter," do
      before :each do
        @meeting_id = Meeting.select(:id).all.map{ |row| row.id }.flatten.uniq.sort{ rand - 0.5 }[0]
        # Assert: we rely on the pre-loaded seeds here
        get :show, id: @meeting_id, format: :json, user_email: @user.email, user_token: @user.authentication_token
      end

      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "returns a JSON Hash" do
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of( Hash )
      end
      it "returns the correct match with the existing seeds" do
        result = JSON.parse(response.body)
        expect( result['id'] ).to eq( @meeting_id )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
