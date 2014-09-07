require 'spec_helper'


describe Api::V1::TrainingsController, :type => :controller do
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = create( :user )
  end


  it_behaves_like( "(Ap1-V1-Controllers, #index & #show actions)", "swimmers" )


  describe '[GET trainings/index]' do
    context "with :title_like filtering parameter" do
      before :each do
        create( :training_with_rows ) # ASSERT: it should include 'workout' in its title
        get :index, title_like: 'workout', format: :json, user_email: @user.email, user_token: @user.authentication_token
      end

      it_behaves_like( "(Ap1-V1-Controllers, success returning an Array of Hash)" )

      it "returns at least a match with the created fixture" do
        result = JSON.parse(response.body)
        expect( result.first['title'] ).to match(/workout/i)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
