require 'rails_helper'

require 'date'
require 'common/format'


describe UserTrainingStoriesController, type: :controller do

  it_behaves_like( "(generic CRUD controller actions)", "user_training_stories", "UserTrainingStoryDecorator" )

  describe '[GET #show]' do
    context "logged-in user" do
      before(:each) { login_user() }

      it "accepts the request for a shared story" do
        fixture = create( :user_training_story )
        fixture.user.invite( @user, true, true, true )   # he wants to share everything
        @user.approve( fixture.user, true, true, true )  # the current user approves
        get :show, params: { id: fixture.id }
        expect(response.status).to eq(200)
      end
      it "refuses the request for an unshared story" do
        fixture = create( :user_training_story )
        get :show, params: { id: fixture.id }
        expect( response ).to redirect_to( controller: :user_training_stories, action: :index )
        # [Steve, 20150410] Using this method fails because "_path" helpers use default locale :en,
        # and we have just set defaul locale to :it
#        expect(response).to redirect_to( user_training_stories_path() )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET #edit]' do
    context "logged-in user" do
      before(:each) { login_user() }

      # Expect that a user should not be able to invoke this action on any user_training, but just on its own
      it "refuses the request for a shared story (not belonging to self)" do
        fixture = create( :user_training_story )
        fixture.user.invite( @user, true, true, true )   # he wants to share everything
        @user.approve( fixture.user, true, true, true )  # the current user approves
        get :edit, params: { id: fixture.id }
        expect( response ).to redirect_to( controller: :user_training_stories, action: :index )
        # [Steve, 20150410] Using this method fails because "_path" helpers use default locale :en,
        # and we have just set defaul locale to :it
#        expect(response).to redirect_to( user_training_stories_path() )
      end
      it "refuses the request for an unshared story" do
        fixture = create( :user_training_story )
        get :edit, params: { id: fixture.id }
        expect( response ).to redirect_to( controller: :user_training_stories, action: :index )
        # [Steve, 20150410] Using this method fails because "_path" helpers use default locale :en,
        # and we have just set defaul locale to :it
#        expect(response).to redirect_to( user_training_stories_path() )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[PUT #update]' do
    context "logged-in user" do
      before(:each) { login_user() }

      # Expect that a user should not be able to invoke this action on any user_training, but just on its own
      it "refuses the request for a shared training (not belonging to self)" do
        fixture = create( :user_training_story )
        fixture.user.invite( @user, true, true, true )   # he wants to share everything
        @user.approve( fixture.user, true, true, true )  # the current user approves
        put :update, params: { id: fixture.id, training: attributes_for( :user_training_story ) }
        expect( response ).to redirect_to( controller: :user_training_stories, action: :index )
        # [Steve, 20150410] Using this method fails because "_path" helpers use default locale :en,
        # and we have just set defaul locale to :it
#        expect(response).to redirect_to( user_training_stories_path() )
      end
      it "refuses the request for an unshared training" do
        fixture = create( :user_training_story )
        put :update, params: { id: fixture.id, training: attributes_for( :user_training_story ) }
        expect( response ).to redirect_to( controller: :user_training_stories, action: :index )
        # [Steve, 20150410] Using this method fails because "_path" helpers use default locale :en,
        # and we have just set defaul locale to :it
#        expect(response).to redirect_to( user_training_stories_path() )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[DELETE]' do
    context "logged-in user" do
      before(:each) { login_user() }

      # Expect that a user should not be able to invoke this action on any user_training, but just on its own
      it "refuses the request for a shared training (not belonging to self)" do
        fixture = create( :user_training_story )
        fixture.user.invite( @user, true, true, true )   # he wants to share everything
        @user.approve( fixture.user, true, true, true )  # the current user approves
        delete :destroy, params: { id: fixture.id }
        expect( response ).to redirect_to( controller: :user_training_stories, action: :index )
        # [Steve, 20150410] Using this method fails because "_path" helpers use default locale :en,
        # and we have just set defaul locale to :it
#        expect(response).to redirect_to( user_training_stories_path() )
      end
      it "refuses the request for an unshared training" do
        fixture = create( :user_training_story )
        delete :destroy, params: { id: fixture.id }
        expect( response ).to redirect_to( controller: :user_training_stories, action: :index )
        # [Steve, 20150410] Using this method fails because "_path" helpers use default locale :en,
        # and we have just set defaul locale to :it
#        expect(response).to redirect_to( user_training_stories_path() )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
