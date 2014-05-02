require 'spec_helper'

describe SwimmingPoolReviewsController do

  # Login checker for GET actions only.
  def get_action_and_check_if_its_the_login_page_for( action_sym, id = nil )
    get action_sym, id: id
    expect(response).to redirect_to '/users/session/sign_in' # new_user_session_path() => '/users/session/sign_in?locale=XX'
    expect(response.status).to eq( 302 )            # must redirect to the login page
  end
  # ===========================================================================

# TODO for post/put/delete, require auth:
#    context "as an unlogged user" do
#      it "displays always the Login page" do
#        get_action_and_check_if_its_the_login_page_for( :index )
#      end
#    end


  describe '[GET #index]' do

    context "with a JSON request," do
      it "handles successfully the request" do
        get :index, format: :json
        expect(response.status).to eq( 200 )
      end
      it "returns a JSON array (empty when there are no rows)" do
        get :index, format: :json
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Array)
        expect( result.size ).to eq(0)
      end
      it "returns a non-empty result when there are rows" do
        create( :swimming_pool_review )
        get :index, format: :json
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Array)
        expect( result.size ).to eq(1)
      end
    end

    context "with an HTML request," do
      it "handles successfully the request" do
        get :index
        expect(response.status).to eq( 200 )
      end
      it "assigns the required variables" do
        get :index
        expect( assigns(:reviews) ).to respond_to( :each ) 
      end
      it "renders the template" do
        get :index
        expect(response).to render_template(:index)
      end
    end
  end
  # ===========================================================================


  describe '[GET #for_swimming_pool/:id]' do
    before :each do
      @pool1   = create( :swimming_pool )
    end

    context "with a JSON request and an existing id," do
      it "handles successfully the request" do
        get :for_swimming_pool, format: :json, id: @pool1.id
        expect(response.status).to eq( 200 )
      end
      it "returns a JSON array (empty when there are no rows)" do
        get :for_swimming_pool, format: :json, id: @pool1.id
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Array)
        expect( result.size ).to eq(0)
      end
      it "returns a non-empty result when there are rows" do
        review1 = create( :swimming_pool_review, swimming_pool: @pool1 )
        review2 = create( :swimming_pool_review, swimming_pool: @pool1 )
        get :for_swimming_pool, format: :json, id: @pool1.id
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Array)
        expect( result.size ).to eq(2)
        expect( result[0]['title'] ).to      eq( review1.attributes()['title'] )
        expect( result[0]['entry_text'] ).to eq( review1.attributes()['entry_text'] )
        expect( result[1]['title'] ).to      eq( review2.attributes()['title'] )
        expect( result[1]['entry_text'] ).to eq( review2.attributes()['entry_text'] )
      end
    end

    context "with an HTML request" do
      it "handles successfully the request" do
        get :for_swimming_pool, id: @pool1.id
        expect(response.status).to eq( 200 )
      end
      it "assigns the required variables" do
        get :for_swimming_pool, id: @pool1.id
        expect( assigns(:reviews) ).to respond_to( :each ) 
      end
      it "renders the template" do
        get :for_swimming_pool, id: @pool1.id
        expect(response).to render_template(:for_swimming_pool)
      end
    end
  end
  # ===========================================================================


  describe '[GET #for_user/:id]' do
    before :each do
      @user = create( :user )
    end

    context "with a JSON request and an existing id," do
      it "handles successfully the request" do
        get :for_user, format: :json, id: @user.id
        expect(response.status).to eq( 200 )
      end
      it "returns a JSON array (empty when there are no rows)" do
        get :for_user, format: :json, id: @user.id
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Array)
        expect( result.size ).to eq(0)
      end
      it "returns a non-empty result when there are rows" do
        review1 = create( :swimming_pool_review, user: @user )
        review2 = create( :swimming_pool_review, user: @user )
        get :for_user, format: :json, id: @user.id
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Array)
        expect( result.size ).to eq(2)
        expect( result[0]['title'] ).to      eq( review1.attributes()['title'] )
        expect( result[0]['entry_text'] ).to eq( review1.attributes()['entry_text'] )
        expect( result[1]['title'] ).to      eq( review2.attributes()['title'] )
        expect( result[1]['entry_text'] ).to eq( review2.attributes()['entry_text'] )
      end
    end

    context "with an HTML request" do
      it "handles successfully the request" do
        get :for_user, id: @user.id
        expect(response.status).to eq( 200 )
      end
      it "assigns the required variables" do
        get :for_user, id: @user.id
        expect( assigns(:reviews) ).to respond_to( :each ) 
      end
      it "renders the template" do
        get :for_user, id: @user.id
        expect(response).to render_template(:for_user)
      end
    end
  end
  # ===========================================================================

end
