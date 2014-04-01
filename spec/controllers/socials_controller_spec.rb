require 'spec_helper'


describe SocialsController do

  # Login checker for GET actions only.
  def get_action_and_check_if_its_the_login_page_for( action_sym, id = nil )
    get action_sym, id: id
    expect(response).to redirect_to '/users/session/sign_in' # new_user_session_path() => '/users/session/sign_in?locale=XX'
    expect(response.status).to eq( 302 )            # must redirect to the login page
  end
  # ===========================================================================


  describe 'GET #show_all' do
    context "unlogged user" do
      it "displays always the Login page" do
        get_action_and_check_if_its_the_login_page_for( :show_all )
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user()

      it "handles successfully the request" do
        get :show_all
        expect( response.status ).to eq(200)
        expect( assigns(:title) ).not_to be_nil 
        expect( assigns(:friendships) ).not_to be_nil 
        expect( assigns(:pending_invited) ).not_to be_nil 
        expect( assigns(:invited) ).not_to be_nil 
        expect( assigns(:blocked_friendships) ).not_to be_nil 
      end

      it "renders the template" do
        get :show_all
        expect(response.status).to eq(200)
        expect(response).to render_template(:show_all)
      end

      it "page includes a freshly invited friend" do
        @friend_user = create( :user )
        @user.invite( @friend_user )
        get :show_all
        expect(response.status).to eq(200)
        expect( assigns(:pending_invited).first.name == @friend_user.name ).to be_true
      end
    end
  end
  # ---------------------------------------------------------------------------


  describe 'GET #invite' do
    before :each do
      @friend_user = create( :user )
    end

    context "unlogged user" do
      it "displays always the Login page" do
        get_action_and_check_if_its_the_login_page_for( :invite, @friend_user.id )
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user()

      it "handles successfully the request" do
        get :invite, id: @friend_user.id
        expect( response.status ).to eq(200)
        expect( assigns(:title) ).not_to be_nil 
        expect( assigns(:swimming_buddy) ).not_to be_nil 
      end

      it "renders the template" do
        get :invite, id: @friend_user.id
        expect( controller.params[:id].to_i == @friend_user.id ).to be_true 
        expect(response.status).to eq(200)
        expect(response).to render_template(:invite)
      end

      it "redirects to show_all_socials_path for a non-yet existing goggler" do
        get :invite, id: 0
        expect(response).to redirect_to show_all_socials_path()
      end

      it "redirects to show_all_socials_path for an existing friendship" do
        @friend_user.invite( @user )
        get :invite, id: @friend_user.id
        expect(response).to redirect_to show_all_socials_path()
      end
    end
  end
  # ---------------------------------------------------------------------------


  describe 'POST #invite' do
    before :each do
      @friend_user = create( :user )
    end

    context "unlogged user" do
      it "doesn't create a new row" do 
        expect {
          post :invite, id: @friend_user.id
        }.not_to change(@friend_user.invited_by, :count) 
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user()

      it "handles successfully the request" do
        expect {
          post :invite, id: @friend_user.id
        }.to change(@user.pending_invited, :count).by(1) 
      end

      it "renders successfully the template" do
        post :invite, id: @friend_user.id 
        expect(response).to redirect_to show_all_socials_path()
        expect( flash[:info] ).to include( I18n.t('social.invite_successful') )
      end
    end
  end
  # ===========================================================================


  describe 'GET #approve' do
    before :each do
      @friend_user = create( :user )
    end

    context "unlogged user" do
      it "displays always the Login page" do
        get_action_and_check_if_its_the_login_page_for( :approve, @friend_user.id )
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user()

      it "handles successfully the request" do
        pending "WIP"
      end

      it "renders the template" do
        pending "WIP"
      end
    end
  end


  describe 'PUT #approve' do
    before :each do
      @friend_user = create( :user )
    end

    context "unlogged user" do
      it "doesn't update an existing row" do 
        pending "WIP"
        expect {
          put :approve, id: @friend_user.id
        }.not_to change(@user.pending_invited, :count) 
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user()

      it "handles successfully the request" do
        pending "WIP"
      end

      it "renders the template" do
        pending "WIP"
      end
    end
  end
  # ===========================================================================


  describe 'GET #block' do
    context "unlogged user" do
      it "displays always the Login page" do
        pending "WIP"
        get_action_and_check_if_its_the_login_page_for( :block )
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user()

      it "handles successfully the request" do
        pending "WIP"
      end

      it "renders the template" do
        pending "WIP"
      end
    end
  end


  describe 'PUT #block' do

    before :each do
      @friend_user = create( :user )
    end

    context "unlogged user" do
      it "doesn't update an existing row" do 
        pending "WIP"
        expect {
          put :block, id: @friend_user.id
        }.not_to change(@user.blocked_friendships, :count) 
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user()

      it "handles successfully the request" do
        pending "WIP"
      end

      it "renders the template" do
        pending "WIP"
      end
    end
  end
  # ===========================================================================


  describe 'GET #unblock' do
    context "unlogged user" do
      it "displays always the Login page" do
        pending "WIP"
        get_action_and_check_if_its_the_login_page_for( :unblock )
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user()

      it "handles successfully the request" do
        pending "WIP"
      end

      it "renders the template" do
        pending "WIP"
      end
    end
  end


  describe 'PUT #unblock' do

    before :each do
      @friend_user = create( :user )
    end

    context "unlogged user" do
      it "doesn't update an existing row" do 
        pending "WIP"
        expect {
          put :unblock, id: @friend_user.id
        }.not_to change(@user.blocked_friendships, :count) 
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user()

      it "handles successfully the request" do
        pending "WIP"
      end

      it "renders the template" do
        pending "WIP"
      end
    end
  end
  # ===========================================================================


  describe 'GET #remove_friendship' do
    context "unlogged user" do
      it "displays always the Login page" do
        pending "WIP"
        get_action_and_check_if_its_the_login_page_for( :remove_friendship )
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user()

      it "handles successfully the request" do
        pending "WIP"
      end

      it "renders the template" do
        pending "WIP"
      end
    end
  end


  describe 'DELETE #remove_friendship' do

    before :each do
      @friend_user = create( :user )
    end

    context "unlogged user" do
      it "doesn't delete an existing row" do 
        pending "WIP"
        expect {
          delete :remove_friendship, friend_id: @friend_user.id
        }.not_to change(@user.friendships, :count) 
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user()

      it "handles successfully the request" do
        pending "WIP"
      end

      it "renders the template" do
        pending "WIP"
      end
    end
  end
  # ===========================================================================

end
