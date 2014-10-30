require 'spec_helper'


describe SocialsController, :type => :controller do
  before :each do
    @swimming_buddy = create( :user )
    @unlogged_user = create( :user )
  end

  describe '[GET #show_all]' do
    context "as an unlogged user" do
      it "displays always the Login page" do
        get_action_and_check_if_its_the_login_page_for( :show_all )
      end
    end

    context "as a logged-in user" do
      before(:each) { login_user() }

      it "handles successfully the request" do
        get :show_all
        expect( response.status ).to eq(200)
      end
      it "assigns the required variables" do
        get :show_all
        expect( assigns(:title) ).to be_an_instance_of(String)
        expect( assigns(:friends) ).not_to be_nil
        expect( assigns(:pending_invited) ).not_to be_nil
        expect( assigns(:pending_invited_by) ).not_to be_nil
        expect( assigns(:invited) ).not_to be_nil
        expect( assigns(:blocked_friendships) ).not_to be_nil
      end
      it "renders the template" do
        get :show_all
        expect(response).to render_template(:show_all)
      end
      it "shows a freshly invited friend" do
        friend_user = create( :user )
        @user.invite( friend_user )
        get :show_all
        expect( assigns(:pending_invited).first.name == friend_user.name ).to be true
      end
    end
  end
  # ===========================================================================


  describe '[POST #association_confirm]' do
    before :each do
      @swimmer = create(:swimmer)
      @swimming_buddy.set_associated_swimmer(@swimmer)
      # We need to set this to make the redirect_to(:back) pass the tests:
      request.env["HTTP_REFERER"] = url_for( host: 'test.host', controller: 'swimmers', action: 'radio', id: @swimming_buddy.swimmer_id, only_path: false )
    end

    context "as an unlogged user" do
      it "doesn't add a confirmation" do
        expect {
          post :association_confirm, id: @swimming_buddy.id
        }.not_to change{ @swimming_buddy.confirmators.count }
      end
      it "results in a redirect" do
        post :association_confirm, id: @swimming_buddy.id
        expect(response.status).to eq( 302 )
      end
    end


    context "as a logged-in normal user" do
      before(:each) { login_user() }

      it "handles the request, but does not add a confirmator" do
        expect {
          post :association_confirm, id: @swimming_buddy.id
        }.not_to change{ @swimming_buddy.confirmators.count }
      end
      it "handles the request, but does not add a confirmation" do
        expect {
          post :association_confirm, id: @swimming_buddy.id
        }.not_to change{ UserSwimmerConfirmation.count }
      end
      it "results in a redirect" do
        post :association_confirm, id: @swimming_buddy.id
        expect(response.status).to eq( 302 )
      end
      it "displays a flash error message" do
        post :association_confirm, id: @swimming_buddy.id
        expect( flash[:error] ).to include( I18n.t(:invalid_action_request) )
      end
    end


    context "as a logged-in goggler (unconfirmed)" do
      before(:each) do
        login_user()
        @user.set_associated_swimmer( create(:swimmer) )
      end

      it "handles successfully the request by increasing the total confirmators" do
        expect {
          post :association_confirm, id: @swimming_buddy.id
        }.to change{ @swimming_buddy.confirmators.count }.by(1)
      end
      it "handles successfully the request by adding a confirmation row" do
        expect {
          post :association_confirm, id: @swimming_buddy.id
        }.to change{ UserSwimmerConfirmation.count }.by(1)
      end
      it "results in a redirect" do
        post :association_confirm, id: @swimming_buddy.id
        expect(response.status).to eq( 302 )
      end
      it "displays a flash session info message" do
        post :association_confirm, id: @swimming_buddy.id
        expect( flash[:info] ).to include( I18n.t('social.confirm_successful') )
      end
    end
  end
  # ===========================================================================


  describe '[POST #association_unconfirm]' do
    before :each do
      @swimmer = create(:swimmer)
      @swimming_buddy.set_associated_swimmer(@swimmer)
      # We need to set this to make the redirect_to(:back) pass the tests:
      request.env["HTTP_REFERER"] = url_for( host: 'test.host', controller: 'swimmers', action: 'radio', id: @swimming_buddy.swimmer_id, only_path: false )
    end

    context "as an unlogged user" do
      it "results in a redirect" do
        post :association_unconfirm, id: @swimming_buddy.id
        expect(response.status).to eq( 302 )
      end
    end


    context "as a logged-in normal user" do
      before(:each) do
        login_user()
        UserSwimmerConfirmation.confirm_for( @swimming_buddy, @swimmer, @user )
      end

      it "handles the request, but does not delete a confirmator" do
        expect {
          post :association_unconfirm, id: @swimming_buddy.id
        }.not_to change{ @swimming_buddy.confirmators.count }
      end
      it "handles the request, but does not delete a confirmation" do
        expect {
          post :association_unconfirm, id: @swimming_buddy.id
        }.not_to change{ UserSwimmerConfirmation.count }
      end
      it "results in a redirect" do
        post :association_unconfirm, id: @swimming_buddy.id
        expect(response.status).to eq( 302 )
      end
      it "displays a flash error message" do
        post :association_unconfirm, id: @swimming_buddy.id
        expect( flash[:error] ).to include( I18n.t(:invalid_action_request) )
      end
    end


    context "as a logged-in goggler (unconfirmed)" do
      before(:each) do
        login_user()
        @user.set_associated_swimmer( create(:swimmer) )
        UserSwimmerConfirmation.confirm_for( @swimming_buddy, @swimmer, @user )
      end

      it "handles successfully the request by decreasing the total confirmators" do
        expect {
          post :association_unconfirm, id: @swimming_buddy.id
        }.to change{ @swimming_buddy.confirmators.count }.by(-1)
      end
      it "handles successfully the request by removing a confirmation row" do
        expect {
          post :association_unconfirm, id: @swimming_buddy.id
        }.to change{ UserSwimmerConfirmation.count }.by(-1)
      end
      it "results in a redirect" do
        post :association_unconfirm, id: @swimming_buddy.id
        expect(response.status).to eq( 302 )
      end
      it "displays a flash session info message" do
        post :association_unconfirm, id: @swimming_buddy.id
        expect( flash[:info] ).to include( I18n.t('social.unconfirm_successful') )
      end
    end
  end
  # ===========================================================================


  describe '[GET #invite]' do
    context "as an unlogged user" do
      it "displays always the Login page" do
        get_action_and_check_if_its_the_login_page_for( :invite, @swimming_buddy.id )
      end
    end

    context "as a logged-in user" do
      before(:each) do
        login_user()
        @user.set_associated_swimmer( create(:swimmer) )
        @swimming_buddy.set_associated_swimmer( create(:swimmer) )
        # We need to set this to make the redirect_to(:back) pass the tests:
        request.env["HTTP_REFERER"] = url_for( host: 'test.host', controller: 'swimmers', action: 'radio', id: @swimming_buddy.swimmer_id, only_path: false )
      end

      it "handles successfully the request" do
        get :invite, id: @swimming_buddy.id
        expect( response.status ).to eq(200)
      end
      it "renders the template" do
        get :invite, id: @swimming_buddy.id
        expect( controller.params[:id].to_i == @swimming_buddy.id ).to be true
        expect(response).to render_template(:invite)
      end
      it "assigns the required variables" do
        get :invite, id: @swimming_buddy.id
        expect( assigns(:title) ).to be_an_instance_of(String)
        expect( assigns(:swimming_buddy) ).to be_an_instance_of(User)
        expect( assigns(:submit_title) ).to be_an_instance_of(String)
      end
      it "redirects to :back for a non-yet valid goggler" do
        @user.set_associated_swimmer( nil )
        get :invite, id: @swimming_buddy.id
        expect(response).to redirect_to(:back)
      end
      it "redirects to :back for an existing friendship" do
        @swimming_buddy.invite( @user )
        get :invite, id: @swimming_buddy.id
        expect(response).to redirect_to(:back)
      end
    end
  end
  # ---------------------------------------------------------------------------


  describe '[POST #invite]' do
    context "as an unlogged user" do
      it "doesn't create a new row" do
        expect {
          post :invite, id: @swimming_buddy.id
        }.not_to change(@swimming_buddy.invited_by, :count)
      end
    end

    context "as a logged-in user" do
      before(:each) do
        login_user()
        @swimming_buddy.set_associated_swimmer( create(:swimmer) )
        # We need to set this to make the redirect_to(:back) pass the tests:
        request.env["HTTP_REFERER"] = url_for( host: 'test.host', controller: 'swimmers', action: 'radio', id: @swimming_buddy.swimmer_id, only_path: false )
      end

      it "handles successfully the request for a new friendship" do
        expect {
          post :invite, id: @swimming_buddy.id
        }.to change(@user.pending_invited, :count).by(1)
      end
      it "assigns the required variables for a new friendship" do
        post :invite, id: @swimming_buddy.id
        expect( assigns(:title) ).to be_an_instance_of(String)
        expect( assigns(:swimming_buddy) ).to be_an_instance_of(User)
      end
      it "renders successfully the template for a new friendship" do
        post :invite, id: @swimming_buddy.id
        expect(response).to redirect_to( swimmer_radio_path(id: @swimming_buddy.swimmer_id) )
        expect( flash[:info] ).to include( I18n.t('social.invite_successful') )
      end
    end
  end
  # ===========================================================================


  describe '[GET #approve]' do
    context "as an unlogged user" do
      it "displays always the Login page" do
        get_action_and_check_if_its_the_login_page_for( :approve, @swimming_buddy.id )
      end
    end

    context "as a logged-in user" do
      before(:each) do
        login_user()
        @user.set_associated_swimmer( create(:swimmer) )
        @swimming_buddy.set_associated_swimmer( create(:swimmer) )
        # We need to set this to make the redirect_to(:back) pass the tests:
        request.env["HTTP_REFERER"] = url_for( host: 'test.host', controller: 'swimmers', action: 'radio', id: @swimming_buddy.swimmer_id, only_path: false )
      end

      it "handles successfully the request" do
        @swimming_buddy.invite( @user )
        get :approve, id: @swimming_buddy.id
        expect( response.status ).to eq(200)
      end
      it "assigns the required variables" do
        @swimming_buddy.invite( @user )
        get :approve, id: @swimming_buddy.id
        expect( assigns(:title) ).to be_an_instance_of(String)
        expect( assigns(:swimming_buddy) ).to be_an_instance_of(User)
        expect( assigns(:submit_title) ).to be_an_instance_of(String)
      end
      it "renders the template" do
        @swimming_buddy.invite( @user )
        get :approve, id: @swimming_buddy.id
        expect( controller.params[:id].to_i == @swimming_buddy.id ).to be true
        expect(response).to render_template(:approve)
      end
      it "redirects to :back for a non-yet valid goggler" do
        @user.set_associated_swimmer( nil )
        get :approve, id: @swimming_buddy.id
        expect(response).to redirect_to(:back)
      end
      it "redirects to :back for an already approved friendship" do
        @swimming_buddy.invite( @user )
        @user.approve( @swimming_buddy )
        get :approve, id: @swimming_buddy.id
        expect(response).to redirect_to(:back)
      end
      it "redirects to :back for a pending friendship requested by the user himself" do
        @user.invite( @swimming_buddy )
        get :approve, id: @swimming_buddy.id
        expect(response).to redirect_to(:back)
      end
    end
  end
  # ---------------------------------------------------------------------------


  describe '[POST #approve]' do
    context "as an unlogged user" do
      it "doesn't update existing rows" do
        @unlogged_user = create( :user )
        @swimming_buddy.invite( @unlogged_user )
        expect {
          put :approve, id: @swimming_buddy.id
        }.not_to change(@unlogged_user.pending_invited, :count)
      end
    end

    context "as a logged-in user" do
      before :each do
        login_user()
        @swimming_buddy.set_associated_swimmer( create(:swimmer) )
        @swimming_buddy.invite( @user )
        # We need to set this to make the redirect_to(:back) pass the tests:
        request.env["HTTP_REFERER"] = url_for( host: 'test.host', controller: 'swimmers', action: 'radio', id: @swimming_buddy.swimmer_id, only_path: false )
      end

      it "handles successfully the request for a pending friendship" do
        friendship = @user.find_any_friendship_with(@swimming_buddy)
        expect( friendship.pending? ).to be true
        expect {
          post :approve, id: @swimming_buddy.id
          friendship.reload
        }.to change( friendship, :pending ).to( false )
      end
      it "renders successfully the template for a pending friendship" do
        post :approve, id: @swimming_buddy.id
        expect(response).to redirect_to( swimmer_radio_path(id: @swimming_buddy.swimmer_id) )
        expect( flash[:info] ).to include( I18n.t('social.approve_successful') )
      end
    end
  end
  # ===========================================================================


  describe '[GET #block]' do
    context "as an unlogged user" do
      it "displays always the Login page" do
        get_action_and_check_if_its_the_login_page_for( :block, @swimming_buddy.id )
      end
    end

    context "as a logged-in user" do
      before(:each) do
        login_user()
        @user.set_associated_swimmer( create(:swimmer) )
        @swimming_buddy.set_associated_swimmer( create(:swimmer) )
        @swimming_buddy.invite( @user )
        # We need to set this to make the redirect_to(:back) pass the tests:
        request.env["HTTP_REFERER"] = url_for( host: 'test.host', controller: 'swimmers', action: 'radio', id: @swimming_buddy.swimmer_id, only_path: false )
      end

      it "handles successfully the request for an approved friendship" do
        @user.approve( @swimming_buddy )
        get :block, id: @swimming_buddy.id
        expect( response.status ).to eq(200)
      end
      it "handles successfully the request for a received & pending friendship" do
        get :block, id: @swimming_buddy.id
        expect( response.status ).to eq(200)
      end
      it "assigns the required variables for an approved friendship" do
        @user.approve( @swimming_buddy )
        get :block, id: @swimming_buddy.id
        expect( assigns(:title) ).to be_an_instance_of(String)
        expect( assigns(:swimming_buddy) ).to be_an_instance_of(User)
        expect( assigns(:submit_title) ).to be_an_instance_of(String)
        expect( assigns(:friendship) ).to be_an_instance_of(Amistad::Friendships::UserFriendship)
        expect( assigns(:destination_path) ).to be_an_instance_of(String)
      end
      it "renders the template for an approved friendship" do
        @user.approve( @swimming_buddy )
        get :block, id: @swimming_buddy.id
        expect( controller.params[:id].to_i == @swimming_buddy.id ).to be true
        expect(response).to render_template( :ask_confirmation )
      end
      it "redirects to :back for an invalid friendable" do
        get :block, id: 0
        expect(response).to redirect_to(:back)
      end
      it "redirects to :back for a requested & pending friendship (invalid action)" do
        another_buddy = create(:user)
        another_buddy.set_associated_swimmer( create(:swimmer) )
        @user.invite( another_buddy )
        get :block, id: another_buddy.swimmer_id
        expect(response).to redirect_to(:back)
      end
    end
  end
  # ---------------------------------------------------------------------------


  describe '[POST #block]' do
    context "as an unlogged user" do
      it "doesn't update existing rows" do
        @swimming_buddy.invite( @unlogged_user )
        @unlogged_user.approve( @swimming_buddy )
        expect {
          put :block, id: @swimming_buddy.id
        }.not_to change(@unlogged_user.blocked_friendships, :count)
      end
    end

    context "as a logged-in user" do
      before(:each) do
        login_user()
        @user.set_associated_swimmer( create(:swimmer) )
        @swimming_buddy.set_associated_swimmer( create(:swimmer) )
        @swimming_buddy.invite( @user )
        @user.approve( @swimming_buddy )
        # We need to set this to make the redirect_to(:back) pass the tests:
        request.env["HTTP_REFERER"] = url_for( host: 'test.host', controller: 'swimmers', action: 'radio', id: @swimming_buddy.swimmer_id, only_path: false )
      end

      it "handles successfully the request for a non-blocked friendship" do
        friendship = @user.find_any_friendship_with(@swimming_buddy)
        expect( friendship.approved? ).to be true
        expect( friendship.active? ).to be true
        expect {
          post :block, id: @swimming_buddy.id
          @user.reload
        }.to change{ @user.blocked_friendships.count }.by(1)
      end
      it "renders successfully the template for a non-blocked friendship" do
        post :block, id: @swimming_buddy.id
        expect(response).to redirect_to( swimmer_radio_path(id: @swimming_buddy.swimmer_id) )
        expect( flash[:info] ).to include( I18n.t('social.block_successful') )
      end
    end
  end
  # ===========================================================================


  describe '[GET #unblock]' do
    context "as an unlogged user" do
      it "displays always the Login page" do
        get_action_and_check_if_its_the_login_page_for( :unblock, @swimming_buddy.id )
      end
    end

    context "as a logged-in user" do
      before(:each) do
        login_user()
        @user.set_associated_swimmer( create(:swimmer) )
        @swimming_buddy.set_associated_swimmer( create(:swimmer) )
        @swimming_buddy.invite( @user )
        # We need to set this to make the redirect_to(:back) pass the tests:
        request.env["HTTP_REFERER"] = url_for( host: 'test.host', controller: 'swimmers', action: 'radio', id: @swimming_buddy.swimmer_id, only_path: false )
      end

      it "handles successfully the request for a blocked friendship" do
        @user.approve( @swimming_buddy )
        @user.block( @swimming_buddy )
        get :unblock, id: @swimming_buddy.id
        expect( response.status ).to eq(200)
      end
      it "assigns the required variables" do
        @user.approve( @swimming_buddy )
        @user.block( @swimming_buddy )
        get :unblock, id: @swimming_buddy.id
        expect( assigns(:title) ).to be_an_instance_of(String)
        expect( assigns(:swimming_buddy) ).to be_an_instance_of(User)
        expect( assigns(:submit_title) ).to be_an_instance_of(String)
        expect( assigns(:friendship) ).to be_an_instance_of(Amistad::Friendships::UserFriendship)
        expect( assigns(:destination_path) ).to be_an_instance_of(String)
      end
      it "renders the template" do
        @user.approve( @swimming_buddy )
        @user.block( @swimming_buddy )
        get :unblock, id: @swimming_buddy.id
        expect( controller.params[:id].to_i == @swimming_buddy.id ).to be true
        expect(response).to render_template( :ask_confirmation )
      end
      it "redirects to :back for an invalid friendable" do
        get :unblock, id: 0
        expect(response).to redirect_to(:back)
      end
      it "redirects to :back for a pending friendship" do
        get :unblock, id: @swimming_buddy.id
        expect(response).to redirect_to(:back)
      end
      it "redirects to :back for a non-blocked friendship" do
        @user.approve( @swimming_buddy )
        get :unblock, id: @swimming_buddy.id
        expect(response).to redirect_to(:back)
      end
    end
  end
  # ---------------------------------------------------------------------------


  describe '[POST #unblock]' do
    context "as an unlogged user" do
      it "doesn't update existing rows" do
        @unlogged_user = create( :user )
        @swimming_buddy.invite( @unlogged_user )
        @unlogged_user.approve( @swimming_buddy )
        @unlogged_user.block( @swimming_buddy )
        expect {
          put :unblock, id: @swimming_buddy.id
        }.not_to change(@unlogged_user.blocked_friendships, :count)
      end
    end

    context "as a logged-in user" do
      before(:each) do
        login_user()
        @user.set_associated_swimmer( create(:swimmer) )
        @swimming_buddy.set_associated_swimmer( create(:swimmer) )
        @swimming_buddy.invite( @user )
        @user.approve( @swimming_buddy )
        @user.block( @swimming_buddy )
        # We need to set this to make the redirect_to(:back) pass the tests:
        request.env["HTTP_REFERER"] = url_for( host: 'test.host', controller: 'swimmers', action: 'radio', id: @swimming_buddy.swimmer_id, only_path: false )
      end

      it "handles successfully the request for a blocked friendship" do
        friendship = @user.find_any_friendship_with(@swimming_buddy)
        expect( friendship.blocked? ).to be true
        expect {
          post :unblock, id: @swimming_buddy.id
          @user.reload
        }.to change{ @user.blocked_friendships.count }.by(-1)
      end
      it "renders successfully the template for a blocked friendship" do
        post :unblock, id: @swimming_buddy.id
        expect(response).to redirect_to( swimmer_radio_path(id: @swimming_buddy.swimmer_id) )
        expect( flash[:info] ).to include( I18n.t('social.unblock_successful') )
      end
    end
  end
  # ===========================================================================


  describe '[GET #remove]' do
    context "as an unlogged user" do
      it "displays always the Login page" do
        get_action_and_check_if_its_the_login_page_for( :remove, @swimming_buddy.id )
      end
    end

    context "as a logged-in user" do
      before(:each) do
        login_user()
        @user.set_associated_swimmer( create(:swimmer) )
        @swimming_buddy.set_associated_swimmer( create(:swimmer) )
        @swimming_buddy.invite( @user )
        # We need to set this to make the redirect_to(:back) pass the tests:
        request.env["HTTP_REFERER"] = url_for( host: 'test.host', controller: 'swimmers', action: 'radio', id: @swimming_buddy.swimmer_id, only_path: false )
      end

      it "handles successfully the request for an existing friendship" do
        get :remove, id: @swimming_buddy.id
        expect( response.status ).to eq(200)
      end
      it "assigns the required variables for an existing friendship" do
        get :remove, id: @swimming_buddy.id
        expect( assigns(:title) ).to be_an_instance_of(String)
        expect( assigns(:swimming_buddy) ).to be_an_instance_of(User)
        expect( assigns(:submit_title) ).to be_an_instance_of(String)
        expect( assigns(:friendship) ).to be_an_instance_of(Amistad::Friendships::UserFriendship)
        expect( assigns(:destination_path) ).to be_an_instance_of(String)
      end
      it "renders the template for an existing friendship" do
        get :remove, id: @swimming_buddy.id
        expect( controller.params[:id].to_i == @swimming_buddy.id ).to be true
        expect(response).to render_template( :ask_confirmation )
      end
      it "redirects to :back for an invalid friendable" do
        @user.set_associated_swimmer(nil)
        get :remove, id: @swimming_buddy.id
        expect(response).to redirect_to(:back)
      end
    end
  end
  # ---------------------------------------------------------------------------


  describe '[POST #remove]' do
    context "as an unlogged user" do
      it "doesn't update existing rows" do
        @unlogged_user = create( :user )
        @swimming_buddy.invite( @unlogged_user )
        expect {
          put :remove, id: @swimming_buddy.id
        }.not_to change(@unlogged_user.friendships, :count)
      end
    end

    context "as a logged-in user" do
      before(:each) do
        login_user()
        @user.set_associated_swimmer( create(:swimmer) )
        @swimming_buddy.set_associated_swimmer( create(:swimmer) )
        @swimming_buddy.invite( @user )
        # We need to set this to make the redirect_to(:back) pass the tests:
        request.env["HTTP_REFERER"] = url_for( host: 'test.host', controller: 'swimmers', action: 'radio', id: @swimming_buddy.swimmer_id, only_path: false )
      end

      it "handles successfully the request for a pending friendship" do
        post :remove, id: @swimming_buddy.id
        expect( @user.find_any_friendship_with(@swimming_buddy) ).to be_nil
      end
      it "handles successfully the request for an accepted friendship" do
        @user.approve( @swimming_buddy )
        friendship = @user.find_any_friendship_with(@swimming_buddy)
        expect( friendship.approved? ).to be true
        expect {
          post :remove, id: @swimming_buddy.id
          @user.reload
        }.to change{ @user.total_friends }.by(-1) # "Total friends" are bidirectional (approved) friendships
      end
      it "handles successfully the request for a blocked friendship" do
        @user.approve( @swimming_buddy )
        @user.block( @swimming_buddy )
        post :remove, id: @swimming_buddy.id
        expect( @user.find_any_friendship_with(@swimming_buddy) ).to be_nil
      end
      it "renders successfully the template for an existing friendship" do
        post :remove, id: @swimming_buddy.id
        expect(response).to redirect_to( swimmer_radio_path(id: @swimming_buddy.swimmer_id) )
        expect( flash[:info] ).to include( I18n.t('social.remove_successful') )
      end
    end
  end
  # ===========================================================================


  describe '[GET #edit]' do
    context "as an unlogged user" do
      it "displays always the Login page" do
        get_action_and_check_if_its_the_login_page_for( :edit, @swimming_buddy.id )
      end
    end

    context "as a logged-in user" do
      before(:each) do
        login_user()
        @user.set_associated_swimmer( create(:swimmer) )
        @swimming_buddy.set_associated_swimmer( create(:swimmer) )
        # We need to set this to make the redirect_to(:back) pass the tests:
        request.env["HTTP_REFERER"] = url_for( host: 'test.host', controller: 'swimmers', action: 'radio', id: @swimming_buddy.swimmer_id, only_path: false )
      end

      it "handles successfully the request for an existing friendship" do
        @swimming_buddy.invite( @user )
        get :edit, id: @swimming_buddy.id
        expect( response.status ).to eq(200)
      end
      it "assigns the required variables for an existing friendship" do
        @swimming_buddy.invite( @user )
        get :edit, id: @swimming_buddy.id
        expect( assigns(:swimming_buddy) ).to be_an_instance_of(User)
        expect( assigns(:friendship) ).to be_an_instance_of(Amistad::Friendships::UserFriendship)
        expect( assigns(:title) ).to be_an_instance_of(String)
        expect( assigns(:submit_title) ).to be_an_instance_of(String)
      end
      it "renders the template for an existing friendship" do
        @swimming_buddy.invite( @user )
        get :edit, id: @swimming_buddy.id
        expect( controller.params[:id].to_i == @swimming_buddy.id ).to be true
        expect(response).to render_template(:edit)
      end
      it "redirects to :show_all for an invalid friendable" do
        @user.set_associated_swimmer(nil)
        get :edit, id: @swimming_buddy.id
        expect(response).to redirect_to socials_show_all_path()
      end
    end
  end
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------


  shared_examples_for "(POST #edit ok) pending friendship editing shares:" do
    it "redirects to socials_show_all_path when done" do
      expect(response).to redirect_to socials_show_all_path()
    end
    it "handles successfully the request" do
      expect( @editor.is_sharing_passages_with?(@friend) ).to be true
      expect( @editor.is_sharing_trainings_with?(@friend) ).to be true
      expect( @editor.is_sharing_calendars_with?(@friend) ).to be false
    end
    it "doesn't change the pending status of an already pending friendship" do
      friendship = @editor.find_any_friendship_with(@friend)
      expect( friendship.pending? ).to be true
    end
  end

  shared_examples_for "(POST #edit ok) existing friendship editing shares:" do
    it "redirects to socials_show_all_path when done" do
      expect(response).to redirect_to socials_show_all_path()
    end
    it "renders successfully the template" do
      expect(response).to redirect_to socials_show_all_path()
      expect( flash[:info] ).to include( I18n.t('social.changes_saved') )
    end
  end

  shared_examples_for "(POST #edit ok) existing friendship CLEARING shares:" do
    it "doesn't change the pending status" do
      friendship = @editor.find_any_friendship_with(@friend)
      expect( friendship.pending? ).to be false
    end
    it "handles successfully the request" do
      expect( @editor.is_sharing_passages_with?(@friend) ).to be true
      expect( @editor.is_sharing_trainings_with?(@friend) ).to be false
      expect( @editor.is_sharing_calendars_with?(@friend) ).to be false
    end
  end

  shared_examples_for "(POST #edit ok) existing friendship SETTING shares:" do
    it "sets ON the pending status of an already approved friendship only if the friendable/editor was the user" do
      friendship = @friend.find_any_friendship_with(@editor)
      # This will be pending only if the "friendable" in the friendship is actually the
      # one making the edit request. If it is the friend who received the original invite
      # (thus the one accepting it), the editing won't have changed the pending status.
      must_be_pending = (friendship.friendable_id == @editor.id)
      expect( friendship.pending? ).to eq(must_be_pending)
    end
    it "handles successfully the request" do
      expect( @editor.is_sharing_passages_with?(@friend) ).to be true
      expect( @editor.is_sharing_trainings_with?(@friend) ).to be true
      expect( @editor.is_sharing_calendars_with?(@friend) ).to be true
    end
  end
  # ---------------------------------------------------------------------------


  describe '[POST #edit]' do

    context "as an unlogged user" do
      it "doesn't update existing rows" do
                                        # passages, trainings, calendars
        @swimming_buddy.invite( @unlogged_user, true, true, true )
        @unlogged_user.approve( @swimming_buddy )
        post :edit, id: @swimming_buddy.id, shares_passages: 1, shares_trainings: 1
        expect( @unlogged_user.is_sharing_passages_with?(@swimming_buddy) ).to be false
        expect( @unlogged_user.is_sharing_trainings_with?(@swimming_buddy) ).to be false
      end
    end

    context "as a logged-in user" do
      before(:each) do
        login_user()
        @user.set_associated_swimmer( create(:swimmer) )
        @swimming_buddy.set_associated_swimmer( create(:swimmer) )
        @swimming_buddy.invite( @user, true, true, true )
        @another_buddy = create( :user )
        @another_buddy.set_associated_swimmer( create(:swimmer) )
        @user.invite( @another_buddy, true, false, true )
        # We need to set this to make the redirect_to(:back) pass the tests:
        request.env["HTTP_REFERER"] = url_for( host: 'test.host', controller: 'swimmers', action: 'radio', id: @swimming_buddy.swimmer_id, only_path: false )
      end

      context "for a received pending friendship, when editing commonly-agreed share flags" do
        before(:each) do
          post :edit, id: @swimming_buddy.id, shares_passages: 1, shares_trainings: 1
          @editor = @user
          @friend = @swimming_buddy
        end

        it_behaves_like "(POST #edit ok) pending friendship editing shares:"
      end
      context "for an  requested pending friendship, when editing commonly-agreed share flags" do
        before(:each) do
          post :edit, id: @another_buddy.id, shares_passages: 1, shares_trainings: 1
          @editor = @user
          @friend = @another_buddy
        end
        it_behaves_like "(POST #edit ok) pending friendship editing shares:"
      end
      # -----------------------------------------------------------------------

      context "for an approved friendship, when clearing shares" do
        before(:each) do
          @user.approve( @swimming_buddy, true, true )
          # friendable changes idea on sharing trainings and edits:
          post :edit, id: @swimming_buddy.id, shares_passages: 1, shares_trainings: 0
          @editor = @user
          @friend = @swimming_buddy
        end
        it_behaves_like "(POST #edit ok) existing friendship editing shares:"
        it_behaves_like "(POST #edit ok) existing friendship CLEARING shares:"
      end
      context "for a blocked friendship, when clearing shares" do
        before(:each) do
          @user.approve( @swimming_buddy, true, true )
          @user.block(@swimming_buddy)
          # friendable changes idea on sharing trainings and edits:
          post :edit, id: @swimming_buddy.id, shares_passages: 1, shares_trainings: 0
          @editor = @user
          @friend = @swimming_buddy
        end
        it_behaves_like "(POST #edit ok) existing friendship editing shares:"
        it_behaves_like "(POST #edit ok) existing friendship CLEARING shares:"
      end
      context "for a requested friendship, when clearing shares" do
        before(:each) do
          @another_buddy.approve( @user, true, true )
          # friendable changes idea on sharing trainings and edits:
          post :edit, id: @another_buddy.id, shares_passages: 1, shares_trainings: 0
          @editor = @user
          @friend = @another_buddy
        end
        it_behaves_like "(POST #edit ok) existing friendship editing shares:"
        it_behaves_like "(POST #edit ok) existing friendship CLEARING shares:"
      end
      context "for a requested blocked friendship, when clearing shares" do
        before(:each) do
          @another_buddy.approve( @user, true, true )
          @another_buddy.block(@user)
          # friendable changes idea on sharing trainings and edits:
          post :edit, id: @another_buddy.id, shares_passages: 1, shares_trainings: 0
          @editor = @user
          @friend = @another_buddy
        end
        it_behaves_like "(POST #edit ok) existing friendship editing shares:"
        it_behaves_like "(POST #edit ok) existing friendship CLEARING shares:"
      end
      # -----------------------------------------------------------------------

      context "for an approved friendship, when adding new shares" do
        before(:each) do
          @user.approve( @swimming_buddy, true, false, true )
          # friendable changes idea on sharing trainings and edits:
          post :edit, id: @swimming_buddy.id, shares_passages: 1, shares_trainings: 1, shares_calendars: 1
          @editor = @user
          @friend = @swimming_buddy
        end
        it_behaves_like "(POST #edit ok) existing friendship editing shares:"
        it_behaves_like "(POST #edit ok) existing friendship SETTING shares:"
      end
      context "for a blocked friendship, when adding new shares" do
        before(:each) do
          @user.approve( @swimming_buddy, true, false, true )
          @user.block(@swimming_buddy)
          # friendable changes idea on sharing trainings and edits:
          post :edit, id: @swimming_buddy.id, shares_passages: 1, shares_trainings: 1, shares_calendars: 1
          @editor = @user
          @friend = @swimming_buddy
        end
        it_behaves_like "(POST #edit ok) existing friendship editing shares:"
        it_behaves_like "(POST #edit ok) existing friendship SETTING shares:"
      end
      context "for a requested & approved friendship, when adding new shares" do
        before(:each) do
          @another_buddy.approve( @user, true, false, true )
          # friendable changes idea on sharing trainings and edits:
          post :edit, id: @another_buddy.id, shares_passages: 1, shares_trainings: 1, shares_calendars: 1
          @editor = @user
          @friend = @another_buddy
        end
        it_behaves_like "(POST #edit ok) existing friendship editing shares:"
        it_behaves_like "(POST #edit ok) existing friendship SETTING shares:"
      end
      context "for a requested & blocked friendship, when adding new shares" do
        before(:each) do
          @another_buddy.approve( @user, true, false, true )
          @another_buddy.block(@user)
          # friendable changes idea on sharing trainings and edits:
          post :edit, id: @another_buddy.id, shares_passages: 1, shares_trainings: 1, shares_calendars: 1
          @editor = @user
          @friend = @another_buddy
        end
        it_behaves_like "(POST #edit ok) existing friendship editing shares:"
        it_behaves_like "(POST #edit ok) existing friendship SETTING shares:"
      end
    end
  end
  # ===========================================================================

end
