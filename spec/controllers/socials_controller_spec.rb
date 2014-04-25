require 'spec_helper'


describe SocialsController do

  # Login checker for GET actions only.
  def get_action_and_check_if_its_the_login_page_for( action_sym, id = nil )
    get action_sym, id: id
    expect(response).to redirect_to '/users/session/sign_in' # new_user_session_path() => '/users/session/sign_in?locale=XX'
    expect(response.status).to eq( 302 )            # must redirect to the login page
  end
  # ===========================================================================


  describe '[GET #show_all]' do
    context "as an unlogged user" do
      it "displays always the Login page" do
        get_action_and_check_if_its_the_login_page_for( :show_all )
      end
    end


    context "as a logged-in user" do
      login_user()

      it "handles successfully the request" do
        get :show_all
        expect( response.status ).to eq(200)
      end

      it "assigns the required variables" do
        get :show_all
        expect( assigns(:title) ).not_to be_nil 
        expect( assigns(:friendships) ).not_to be_nil 
        expect( assigns(:pending_invited) ).not_to be_nil 
        expect( assigns(:invited) ).not_to be_nil 
        expect( assigns(:blocked_friendships) ).not_to be_nil 
      end

      it "renders the template" do
        get :show_all
        expect(response).to render_template(:show_all)
      end

      it "shows a freshly invited friend" do
        @friend_user = create( :user )
        @user.invite( @friend_user )
        get :show_all
        expect( assigns(:pending_invited).first.name == @friend_user.name ).to be_true
      end
    end
  end
  # ===========================================================================


  describe '[POST #association_confirm]' do
    before :each do
      @friend_user = create(:user)
      @swimmer = create(:swimmer)
      @friend_user.set_associated_swimmer(@swimmer)
    end

    context "as an unlogged user" do
      it "doesn't add a confirmation" do
        expect {
          post :association_confirm, id: @friend_user.id
        }.not_to change{ @friend_user.confirmators.count } 
      end

      it "results in a redirect" do 
        post :association_confirm, id: @friend_user.id
        expect(response.status).to eq( 302 )
      end
    end


    context "as a logged-in user" do
      login_user()

      it "handles successfully the request by increasing the total confirmators" do
        expect {
          post :association_confirm, id: @friend_user.id
        }.to change{ @friend_user.confirmators.count }.by(1) 
      end

      it "handles successfully the request by adding a confirmation row" do
        expect {
          post :association_confirm, id: @friend_user.id
        }.to change{ UserSwimmerConfirmation.count }.by(1) 
      end

      it "results in a redirect" do 
        post :association_confirm, id: @friend_user.id
        expect(response.status).to eq( 302 )
      end

      it "displays a flash session info message" do 
        post :association_confirm, id: @friend_user.id
        expect( flash[:info] ).to include( I18n.t('social.confirm_successful') )
      end
    end
  end
  # ===========================================================================


  describe '[POST #association_unconfirm]' do
    before :each do
      @friend_user = create(:user)
      @swimmer = create(:swimmer)
      @friend_user.set_associated_swimmer(@swimmer)
    end

    context "as an unlogged user" do
      it "results in a redirect" do 
        post :association_unconfirm, id: @friend_user.id
        expect(response.status).to eq( 302 )
      end
    end


    context "as a logged-in user" do
      login_user()
      before :each do
        UserSwimmerConfirmation.confirm_for( @friend_user, @swimmer, @user )
      end

      it "handles successfully the request by decreasing the total confirmators" do
        expect {
          post :association_unconfirm, id: @friend_user.id
        }.to change{ @friend_user.confirmators.count }.by(-1) 
      end

      it "handles successfully the request by removing a confirmation row" do
        expect {
          post :association_unconfirm, id: @friend_user.id
        }.to change{ UserSwimmerConfirmation.count }.by(-1) 
      end

      it "results in a redirect" do 
        post :association_unconfirm, id: @friend_user.id
        expect(response.status).to eq( 302 )
      end

      it "displays a flash session info message" do 
        post :association_unconfirm, id: @friend_user.id
        expect( flash[:info] ).to include( I18n.t('social.unconfirm_successful') )
      end
    end
  end
  # ===========================================================================


  describe '[GET #invite]' do
    before :each do
      @friend_user = create( :user )
    end

    context "as an unlogged user" do
      it "displays always the Login page" do
        get_action_and_check_if_its_the_login_page_for( :invite, @friend_user.id )
      end
    end


    context "as a logged-in user" do
      login_user()

      it "handles successfully the request" do
        get :invite, id: @friend_user.id
        expect( response.status ).to eq(200)
      end

      it "assigns the required variables" do
        get :invite, id: @friend_user.id
        expect( assigns(:title) ).not_to be_nil 
        expect( assigns(:swimming_buddy) ).not_to be_nil 
        expect( assigns(:submit_title) ).not_to be_nil 
      end

      it "renders the template" do
        get :invite, id: @friend_user.id
        expect( controller.params[:id].to_i == @friend_user.id ).to be_true 
        expect(response).to render_template(:invite)
      end

      it "redirects to socials_show_all_path for a non-yet existing goggler" do
        get :invite, id: 0
        expect(response).to redirect_to request.env["HTTP_REFERER"] # => :back
      end

      it "redirects to socials_show_all_path for an existing friendship" do
        @friend_user.invite( @user )
        get :invite, id: @friend_user.id
        expect(response).to redirect_to socials_show_all_path()
      end
    end
  end
  # ---------------------------------------------------------------------------


  describe '[POST #invite]' do
    before :each do
      @friend_user = create( :user )
    end

    context "as an unlogged user" do
      it "doesn't create a new row" do 
        expect {
          post :invite, id: @friend_user.id
        }.not_to change(@friend_user.invited_by, :count) 
      end
    end


    context "as a logged-in user" do
      login_user()

      it "handles successfully the request" do
        expect {
          post :invite, id: @friend_user.id
        }.to change(@user.pending_invited, :count).by(1) 
      end

      it "assigns the required variables" do
        get :invite, id: @friend_user.id
        expect( assigns(:title) ).not_to be_nil 
        expect( assigns(:swimming_buddy) ).not_to be_nil 
      end

      it "renders successfully the template" do
        post :invite, id: @friend_user.id 
        expect(response).to redirect_to socials_show_all_path()
        expect( flash[:info] ).to include( I18n.t('social.invite_successful') )
      end
    end
  end
  # ===========================================================================


  describe '[GET #approve]' do
    before :each do
      @friend_user = create( :user )
    end

    context "as an unlogged user" do
      it "displays always the Login page" do
        get_action_and_check_if_its_the_login_page_for( :approve, @friend_user.id )
      end
    end


    context "as a logged-in user" do
      login_user()

      it "handles successfully the request" do
        @friend_user.invite( @user )
        get :approve, id: @friend_user.id
        expect( response.status ).to eq(200)
      end

      it "assigns the required variables" do
        @friend_user.invite( @user )
        get :approve, id: @friend_user.id
        expect( assigns(:title) ).not_to be_nil 
        expect( assigns(:swimming_buddy) ).not_to be_nil 
        expect( assigns(:submit_title) ).not_to be_nil 
      end

      it "renders the template" do
        @friend_user.invite( @user )
        get :approve, id: @friend_user.id
        expect( controller.params[:id].to_i == @friend_user.id ).to be_true 
        expect(response).to render_template(:approve)
      end

      it "redirects to socials_show_all_path for an invalid friendable" do
        get :approve, id: 0
        expect(response).to redirect_to request.env["HTTP_REFERER"] # => :back
      end

      it "redirects to socials_show_all_path for an already approved friendship" do
        @friend_user.invite( @user )
        @user.approve( @friend_user )
        get :approve, id: @friend_user.id
        expect(response).to redirect_to socials_show_all_path()
      end

      it "redirects to socials_show_all_path for a pending friendship requested by the user himself" do
        @user.invite( @friend_user )
        get :approve, id: @friend_user.id
        expect(response).to redirect_to socials_show_all_path()
      end
    end
  end
  # ---------------------------------------------------------------------------


  describe '[POST #approve]' do
    before :each do
      @friend_user = create( :user )
    end

    context "as an unlogged user" do
      it "doesn't update existing rows" do 
        @unlogged_user = create( :user )
        @friend_user.invite( @unlogged_user )
        expect {
          put :approve, id: @friend_user.id
        }.not_to change(@unlogged_user.pending_invited, :count) 
      end
    end


    context "as a logged-in user" do
      login_user()

      before :each do
        @friend_user.invite( @user )
      end

      it "handles successfully the request" do
        friendship = @user.find_any_friendship_with(@friend_user)
        expect( friendship.pending? ).to be_true 
        expect {
          post :approve, id: @friend_user.id
          friendship.reload
        }.to change( friendship, :pending ).to( false ) 
      end

      it "renders successfully the template" do
        post :approve, id: @friend_user.id 
        expect(response).to redirect_to socials_show_all_path()
        expect( flash[:info] ).to include( I18n.t('social.approve_successful') )
      end
    end
  end
  # ===========================================================================


  describe '[GET #block]' do
    context "as an unlogged user" do
      it "displays always the Login page" do
        pending "WIP"
        get_action_and_check_if_its_the_login_page_for( :block )
      end
    end
    # -------------------------------------------------------------------------

    context "as a logged-in user" do
      login_user()

      it "handles successfully the request" do
        pending "WIP"
      end

      it "renders the template" do
        pending "WIP"
      end
    end
  end


  describe '[POST #block]' do

    before :each do
      @friend_user = create( :user )
    end

    context "as an unlogged user" do
      it "doesn't update an existing row" do 
        pending "WIP"
        expect {
          put :block, id: @friend_user.id
        }.not_to change(@user.blocked_friendships, :count) 
      end
    end
    # -------------------------------------------------------------------------

    context "as a logged-in user" do
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


  describe '[GET #unblock]' do
    context "as an unlogged user" do
      it "displays always the Login page" do
        pending "WIP"
        get_action_and_check_if_its_the_login_page_for( :unblock )
      end
    end
    # -------------------------------------------------------------------------

    context "as a logged-in user" do
      login_user()

      it "handles successfully the request" do
        pending "WIP"
      end

      it "renders the template" do
        pending "WIP"
      end
    end
  end


  describe '[POST #unblock]' do

    before :each do
      @friend_user = create( :user )
    end

    context "as an unlogged user" do
      it "doesn't update an existing row" do 
        pending "WIP"
        expect {
          put :unblock, id: @friend_user.id
        }.not_to change(@user.blocked_friendships, :count) 
      end
    end
    # -------------------------------------------------------------------------

    context "as a logged-in user" do
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


  describe '[GET #remove]' do
    context "as an unlogged user" do
      it "displays always the Login page" do
        pending "WIP"
        get_action_and_check_if_its_the_login_page_for( :remove )
      end
    end
    # -------------------------------------------------------------------------

    context "as a logged-in user" do
      login_user()

      it "handles successfully the request" do
        pending "WIP"
      end

      it "renders the template" do
        pending "WIP"
      end
    end
  end


  describe '[DELETE #remove]' do

    before :each do
      @friend_user = create( :user )
    end

    context "as an unlogged user" do
      it "doesn't delete an existing row" do 
        pending "WIP"
        expect {
          delete :remove, friend_id: @friend_user.id
        }.not_to change(@user.friendships, :count) 
      end
    end
    # -------------------------------------------------------------------------

    context "as a logged-in user" do
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
