require 'spec_helper'


shared_examples_for "(success returning an Array of Hash)" do
  it "handles successfully the request" do
    expect(response.status).to eq( 200 )
  end
  it "returns a JSON array" do
    result = JSON.parse(response.body)
    expect( result ).to be_an_instance_of(Array)
    expect( result.size > 0 ).to be_true
  end
  it "returns an Hash instance as the first element of the result" do
    result = JSON.parse(response.body)
    expect( result.first ).to be_an_instance_of( Hash )
  end
end
# =============================================================================



shared_examples_for "(Ap1-V1-Controllers, #index & #show actions)" do |controller_name|

  describe '[GET #{controller_name}/index]' do
    context "with a non-JSON request" do
      before :each do
        get :index, user_email: @user.email, user_token: @user.authentication_token
      end
      it "refuses the request" do
        expect(response.status).to eq( 406 )
      end
    end

    context "with valid parameters and credentials" do
      before :each do
        # Assert: we rely on the pre-loaded seeds here
        get :index, format: :json, user_email: @user.email, user_token: @user.authentication_token
      end

      it_behaves_like( "(success returning an Array of Hash)" )
    end
  end
  # ---------------------------------------------------------------------------


  describe '[GET #{controller_name}/show]' do
    context "with a non-JSON request" do
      before :each do
        get :show, id: 1, user_email: @user.email, user_token: @user.authentication_token
      end
      it "refuses the request" do
        expect(response.status).to eq( 406 )
      end
    end

    context "with valid parameters and credentials" do
      before :each do
        # Assert: we rely on the pre-loaded seeds here
        get :show, id: 1, format: :json, user_email: @user.email, user_token: @user.authentication_token
      end
      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "returns a JSON hash representing the requested instance" do
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Hash)
        expect( result['id'] ).to eq(1)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
