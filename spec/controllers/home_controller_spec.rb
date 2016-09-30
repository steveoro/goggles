require 'rails_helper'


describe HomeController, type: :controller do
  before :each do
    @swimming_buddy = create( :user )
    @unlogged_user = create( :user )
  end

  describe '[GET #index]' do
    context "as an unlogged user," do
      it "handles successfully the request" do
        get :index
        expect( response.status ).to eq(200)
      end
      it "assigns the required variables" do
        get :index
        expect( assigns(:articles) ).to be_an_instance_of( Array )
        expect( assigns(:news_feed) ).to be_an_instance_of( Array )
        expect( assigns(:teams) ).to be_an_instance_of( Array )
        expect( assigns(:seasons) ).to be_an_instance_of( Array )
        expect( assigns(:invitations) ).to be_an_instance_of( Array )
        expect( assigns(:start_lists) ).to be_an_instance_of( Array )
        expect( assigns(:results) ).to be_an_instance_of( Array )
        expect( assigns(:goggle_cups) ).to be_an_instance_of( Array )
      end
      it "sets the variables with empty lists" do
        get :index
        expect( assigns(:articles).size ).to eq(0)
        expect( assigns(:news_feed).size ).to eq(0)
        expect( assigns(:teams).size ).to eq(0)
        expect( assigns(:seasons).size ).to eq(0)
        expect( assigns(:invitations).size ).to eq(0)
        expect( assigns(:start_lists).size ).to eq(0)
        expect( assigns(:results).size ).to eq(0)
        expect( assigns(:goggle_cups).size ).to eq(0)
      end
      it "renders the template" do
        get :index
        expect(response).to render_template(:index)
      end
    end


    context "as a logged-in user (NOT associated w/ swimmer)," do
      before(:each) { login_user() }

      it "redirects to socials_associate_path()" do
        get :index
        expect( response ).to redirect_to( controller: :socials, action: :associate )
      end
    end


    shared_examples_for "(Home page for a Goggler or a user that temporary skips the swimmer association)" do
      it "handles successfully the request" do
        get :index
        expect( response.status ).to eq(200)
      end
      it "assigns the required variables" do
        get :index
        expect( assigns(:articles) ).to respond_to( :each )
        expect( assigns(:news_feed) ).to respond_to( :each )
        expect( assigns(:teams) ).to respond_to( :each )
        expect( assigns(:seasons) ).to respond_to( :each )
        expect( assigns(:invitations) ).to respond_to( :each )
        expect( assigns(:start_lists) ).to respond_to( :each )
        expect( assigns(:results) ).to respond_to( :each )
        expect( assigns(:goggle_cups) ).to respond_to( :each )
      end
      it "renders the template" do
        get :index
        expect(response).to render_template(:index)
      end
    end


    context "as a logged-in goggler (already associated w/ swimmer)," do
      before(:each) do
        login_user()
        @user.set_associated_swimmer( create(:swimmer) )
      end

      it_behaves_like "(Home page for a Goggler or a user that temporary skips the swimmer association)"
    end


    context "as a logged-in user who temporary skips the swimmer association," do
      before(:each) do
        login_user()
        @user.goggle_uid = 1
        @user.save
      end

      it_behaves_like "(Home page for a Goggler or a user that temporary skips the swimmer association)"
    end
  end
  # ===========================================================================


  describe '[GET #about]' do
    context "for any user" do
      it "handles successfully the request" do
        get :about
        expect( response.status ).to eq(200)
      end
      it "assigns the required variables" do
        get :about
        expect( assigns(:versioning) ).to be_an_instance_of( AppParameter )
        expect( assigns(:gem_info) ).to be_an_instance_of( Array )
      end
      it "renders the template" do
        get :about
        expect(response).to render_template(:about)
      end
    end
  end
  # ===========================================================================


  describe '[GET #contact_us]' do
    context "for any user" do
      it "handles successfully the request" do
        get :contact_us
        expect( response.status ).to eq(200)
      end
      it "renders the template" do
        get :contact_us
        expect(response).to render_template(:contact_us)
      end
    end
  end
  # ===========================================================================


  describe '[GET #maintenance]' do
    context "for any user" do
      it "handles successfully the request" do
        get :maintenance
        expect( response.status ).to eq(200)
      end
      it "assigns the required variables" do
        get :maintenance
        expect( assigns(:presumed_downtime_end) ).to be_an_instance_of( String )
      end
      it "renders the template" do
        get :maintenance
        expect(response).to render_template(:maintenance)
      end
    end
  end
  # ===========================================================================


  describe '[GET #wip]' do
    context "for any user" do
      it "handles successfully the request" do
        get :wip
        expect( response.status ).to eq(200)
      end
      it "renders the template" do
        get :wip
        expect(response).to render_template(:wip)
      end
    end
  end
  # ===========================================================================
end
