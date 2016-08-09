require 'rails_helper'


describe Api::V1::ExercisesController, :type => :controller do
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = create( :user )
  end


  it_behaves_like( "(Ap1-V1-Controllers, #index & #show actions)", "exercises" )    


  describe '[GET exercises/index]' do
    context "with :code_like filtering parameter" do
      before :each do
        # Assert: we rely on the pre-loaded seeds here
        get :index, code_like: 'a1', format: :json, user_email: @user.email, user_token: @user.authentication_token
      end

      it_behaves_like( "(Ap1-V1-Controllers, success returning an Array of Hash)" )

      it "returns at least a match with the existing seeds" do
        result = JSON.parse(response.body)
        expect( result.first['code'] ).to match(/a1/i)
      end
    end


    context "with :training_step_type_id filtering parameter" do
      before :each do
        # Assert: we rely on the pre-loaded seeds here
        # ASSERT training_step_type_id:1 == code:'R'
        get :index, training_step_type_id: 1, format: :json, user_email: @user.email, user_token: @user.authentication_token
      end

      it_behaves_like( "(Ap1-V1-Controllers, success returning an Array of Hash)" )

      it "returns at least a match with the existing seeds" do
        result = JSON.parse(response.body)
        expect( result.first['training_step_type_codes'] ).to match(/R/i)
      end
    end


    context "with :description_like filtering parameter" do
      before :each do
        # Assert: we rely on the pre-loaded seeds here
        # ASSERT: there exists at least 1 exercise with description =~ /SL/ & corresponding to code =~ /A1/
        get :index, description_like: 'SL', format: :json, user_email: @user.email, user_token: @user.authentication_token
      end

      it_behaves_like( "(Ap1-V1-Controllers, success returning an Array of Hash)" )

      it "returns at least a match with the existing seeds" do
        result = JSON.parse(response.body)
        expect( result.first['code'] ).to match(/A1/i)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
