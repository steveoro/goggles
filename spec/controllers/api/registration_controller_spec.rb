require 'spec_helper'

require 'date'
require 'common/format'


describe Api::RegistrationController do

  describe '[AJAX #create]' do
    context "invalid user" do
      it "returns status error 401" do
        xhr :get, :create, user: nil
        expect(response.status).to eq( 401 )
      end
    end
    # -------------------------------------------------------------------------

    context "valid user" do
      before :each do
        @test_user = create( :user )
      end

      it "returns a successful status code 201" do
        xhr :get, :create, user: @test_user
        expect(response.status).to eq( 201 )
      end

      it "returns status code 201" do
        xhr :get, :create, user: @test_user
        expect(response.body.to_json.success == true ).to be_true
      end
    end
  end
  # ===========================================================================
end
