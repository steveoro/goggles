require 'spec_helper'

describe SocialController do

  # Login checker for GET actions only.
  def get_action_and_check_if_its_the_login_page_for( action_sym, id = nil )
    get action_sym, id: id
    expect(response).to redirect_to '/users/sign_in'
    expect(response.status).to eq( 302 )            # must redirect to the login page
  end
  # ===========================================================================


  describe '[GET #invite]' do
    context "unlogged user" do
      it "displays always the Login page" do
        pending "WIP"
        get_action_and_check_if_its_the_login_page_for( :invite )
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user()

      before :each do
        @friend_user = create( :user )
      end


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

      it "redirects to root_path for a non-yet existing goggler" do
        get :invite, id: 0
        expect(response).to redirect_to root_path()
      end

      it "redirects to [GET] #edit for an existing friendship" do
        @friend_user.invite( @user )
        get :invite, id: @friend_user.id
        expect(response).to redirect_to accept_social_path()
      end
    end
  end
  # ---------------------------------------------------------------------------


  describe '[POST #invite]' do

    before :each do
      @friend_user = create( :user )
    end

    context "unlogged user" do
      it "doesn't create a new row" do 
        pending "WIP"
        expect {
          post :invite, id: @friend_user.id
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


  describe '[GET #accept]' do
    context "unlogged user" do
      it "displays always the Login page" do
        pending "WIP"
        get_action_and_check_if_its_the_login_page_for( :accept )
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


  describe '[PUT #accept]' do

    before :each do
      @friend_user = create( :user )
    end

    context "unlogged user" do
      it "doesn't update an existing row" do 
        pending "WIP"
        expect {
          put :accept, id: @friend_user.id
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


  describe '[GET #block]' do
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


  describe '[PUT #block]' do

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


  describe '[GET #unblock]' do
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


  describe '[PUT #unblock]' do

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


  describe '[GET #remove_friendship]' do
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


  describe '[DELETE #remove_friendship]' do

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
