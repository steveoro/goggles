require 'rails_helper'


describe Api::V1::SearchController, :type => :controller do
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = create( :user )
  end


  describe '[GET #simple]' do
    context "with an existing :query parameter," do
      before :each do
        # Assert: we rely on the pre-loaded seeds here
        get :simple, format: :json, params: { query: 'CILLONI', user_email: @user.email, user_token: @user.authentication_token }
      end
      it_behaves_like( "(Ap1-V1-Controllers, success returning an Array of Hash)" )

      it "returns at least more than 3 matches with the existing seeds" do
        result_array = JSON.parse(response.body)
        expect( result_array.size ).to be > 3
      end
      it "returns an array of Hash with the required fields" do
        result_array = JSON.parse(response.body)
        expect( result_array ).to all include( 'class', 'id', 'description', 'date' )
      end
      it "returns at least 1 Swimmer, 1 Team rows and >2 Meetings (with the existing seeds)" do
        result_array = JSON.parse(response.body)
        expect( result_array.any?{ |hash| hash['class'] == 'Swimmer' } ).to be true
        expect( result_array.any?{ |hash| hash['class'] == 'Team' } ).to be true
        expect( result_array.find_all{ |hash| hash['class'] == 'Meeting' }.size ).to be > 2
# DEBUG
#        puts "\r\n- teams found: #{teams.inspect}"
      end
    end


    context "with a non-existing :query parameter," do
      before :each do
        # Assert: we rely on the pre-loaded seeds here
        get :simple, format: :json, params: { query: 'LARICIUMBALALILLALLERO', user_email: @user.email, user_token: @user.authentication_token }
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


    context "with an empty :query parameter," do
      before :each do
        # Assert: we rely on the pre-loaded seeds here
        get :simple, format: :json, params: { query: '', user_email: @user.email, user_token: @user.authentication_token }
      end
      it_behaves_like( "(Ap1-V1-Controllers, success returning an Array of Hash)" )

      it "returns at least the list of all Meetings" do
        result_array = JSON.parse(response.body)
        expect( result_array.size ).to be >= Meeting.count
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
