require 'rails_helper'


describe SwimmingPoolReviewsController, type: :controller do

  describe '[GET #index]' do
    context "with a JSON request," do
      it "handles successfully the request" do
        get :index, format: :json
        expect(response.status).to eq( 200 )
      end
      it "returns a non-empty result (when there are rows)" do
        create( :swimming_pool_review )
        get :index, format: :json
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Array)
        expect( result.size >= 1 ).to be true
      end
    end

    context "with an HTML request," do
      it "handles successfully the request" do
        get :index
        expect(response.status).to eq( 200 )
      end
      it "assigns the required variables" do
        get :index
        expect( assigns(:title) ).to be_an_instance_of( String )
#        expect( assigns(:reviews_grid) ).not_to be_nil
      end
      it "renders the template" do
        get :index
        expect(response).to render_template(:index)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET #show/:id]' do
    context "with a JSON request and a non-existing id," do
      it "returns an 'invalid request error'" do
        get :show, format: :json, params: { id: 0 }
        expect(response.status).to eq( 406 )
      end
      it "returns a JSON 'success:false' result" do
        get :show, format: :json, params: { id: 0 }
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Hash)
        expect( result['success'] ).to be false
      end
    end
    context "with a JSON request and an existing id," do
      before :each do
        @review = create( :swimming_pool_review )
      end
      it "handles successfully the request" do
        get :show, format: :json, params: { id: @review.id }
        expect(response.status).to eq( 200 )
      end
      it "returns a JSON hash for an existing row" do
        get :show, format: :json, params: { id: @review.id }
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Hash)
        expect( result['id'] ).to eq( @review.id )
        expect( result['swimming_pool_id'] ).to eq( @review.swimming_pool_id )
        expect( result['user_id'] ).to eq( @review.user_id )
      end
    end

    context "with an HTML request and a non-existing id," do
      it "handles the request with a redirect" do
        get :show, params: { id: 0 }
        expect(response.status).to eq( 302 )
      end
      it "redirects to #index" do
        get :show, params: { id: 0 }
        expect( response ).to be_a_redirect
      end
    end
    context "with an HTML request and an existing id," do
      before :each do
        @review = create( :swimming_pool_review )
      end
      it "handles successfully the request" do
        get :show, params: { id: @review.id }
        expect(response.status).to eq( 200 )
      end
      it "assigns the required variables" do
        get :show, params: { id: @review.id }
        expect( assigns(:title) ).to be_an_instance_of( String )
        expect( assigns(:review) ).to be_an_instance_of( SwimmingPoolReview )
      end
      it "renders the template" do
        get :show, params: { id: @review.id }
        expect(response).to render_template(:show)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET #for_swimming_pool/:id]' do
    before :each do
      @pool1   = create( :swimming_pool )
    end

    context "with a JSON request and an existing id," do
      it "handles successfully the request" do
        get :for_swimming_pool, format: :json, params: { id: @pool1.id }
        expect(response.status).to eq( 200 )
      end
      it "returns a JSON array (empty when there are no rows)" do
        get :for_swimming_pool, format: :json, params: { id: @pool1.id }
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Array)
        expect( result.size ).to eq(0)
      end
      it "returns a non-empty result (when there are rows)" do
        review1 = create( :swimming_pool_review, swimming_pool: @pool1 )
        review2 = create( :swimming_pool_review, swimming_pool: @pool1 )
        get :for_swimming_pool, format: :json, params: { id: @pool1.id }
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
        get :for_swimming_pool, params: { id: @pool1.id }
        expect(response.status).to eq( 200 )
      end
      it "assigns the required variables" do
        get :for_swimming_pool, params: { id: @pool1.id }
        expect( assigns(:swimming_pool_id) ).not_to be_nil
        expect( assigns(:reviews) ).to respond_to( :each )
      end
      it "renders the template" do
        get :for_swimming_pool, params: { id: @pool1.id }
        expect(response).to render_template(:for_swimming_pool)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET #for_user/:id]' do
    before :each do
      @user = create( :user )
    end

    context "with a JSON request and an existing id," do
      it "handles successfully the request" do
        get :for_user, format: :json, params: { id: @user.id }
        expect(response.status).to eq( 200 )
      end
      it "returns a JSON array (empty when there are no rows)" do
        get :for_user, format: :json, params: { id: @user.id }
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Array)
        expect( result.size ).to eq(0)
      end
      it "returns a non-empty result (when there are rows)" do
        review1 = create( :swimming_pool_review, user: @user )
        review2 = create( :swimming_pool_review, user: @user )
        get :for_user, format: :json, params: { id: @user.id }
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
        get :for_user, params: { id: @user.id }
        expect(response.status).to eq( 200 )
      end
      it "assigns the required variables" do
        get :for_user, params: { id: @user.id }
        expect( assigns(:user_id) ).not_to be_nil
        expect( assigns(:reviews) ).to respond_to( :each )
      end
      it "renders the template" do
        get :for_user, params: { id: @user.id }
        expect(response).to render_template(:for_user)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[POST #report_abuse/:id]' do
    before :each do
      @review = create( :swimming_pool_review )
    end

    context "as an unlogged user" do
      it "doesn't send an abuse report with an HTML request" do
        expect {
          post :report_abuse, params: { id: @review.id }
        }.not_to change{ ActionMailer::Base.deliveries.count }
      end
      it "doesn't send an abuse report with with a JSON request" do
        expect {
          post :report_abuse, format: :json, params: { id: @review.id }
        }.not_to change{ ActionMailer::Base.deliveries.count }
      end
    end

    context "as a logged-in user" do
      before :each do
        login_user()
        @review.user_id = @user.id
      end

      it "send an abuse report with an HTML request" do
        expect {
          post :report_abuse, params: { id: @review.id }
        }.to change{ ActionMailer::Base.deliveries.count }.by(1)
      end
      it "send an abuse report with a JSON request" do
        expect {
          post :report_abuse, format: :json, params: { id: @review.id }
        }.to change{ ActionMailer::Base.deliveries.count }.by(1)
      end
      it "redirects to root path after an HTML request" do
        post :report_abuse, params: { id: @review.id }
        expect( response ).to redirect_to( root_path )
      end
      it "redirects to root path after a JSON request" do
        post :report_abuse, format: :json, params: { id: @review.id }
        expect( response ).to redirect_to( root_path )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[POST #vote/:id]' do
    before :each do
      @review = create( :swimming_pool_review )
    end

    context "as an unlogged user" do
      it "doesn't cast an upvote with an HTML request" do
        expect {
          post :vote, params: { id: @review.id, vote: 1 }
          @review.reload
        }.not_to change{ @review.votes_for.size }
      end
      it "doesn't cast a downvote with an HTML request" do
        expect {
          post :vote, params: { id: @review.id, vote: -1 }
          @review.reload
        }.not_to change{ @review.votes_for.size }
      end
      it "doesn't cast an upvote with a JSON request" do
        expect {
          post :vote, format: :json, params: { id: @review.id, vote: 1 }
          @review.reload
        }.not_to change{ @review.votes_for.size }
      end
      it "doesn't cast a downvote with a JSON request" do
        expect {
          post :vote, format: :json, params: { id: @review.id, vote: -1 }
          @review.reload
        }.not_to change{ @review.votes_for.size }
      end
    end

    context "as a logged-in user" do
      before :each do
        login_user()
        @review.user_id = @user.id
      end

      it "casts an upvote with an HTML request" do
        expect {
          post :vote, params: { id: @review.id, vote: 1 }
        }.to change{ @review.get_upvotes.size }.by(1)
      end
      it "casts a downvote with an HTML request" do
        expect {
          post :vote, params: { id: @review.id, vote: -1 }
        }.to change{ @review.get_downvotes.size }.by(1)
      end
      it "casts an upvote with a JSON request" do
        expect {
          post :vote, format: :json, params: { id: @review.id, vote: 1 }
        }.to change{ @review.get_upvotes.size }.by(1)
      end
      it "casts a downvote with a JSON request" do
        expect {
          post :vote, format: :json, params: { id: @review.id, vote: -1 }
        }.to change{ @review.get_downvotes.size }.by(1)
      end
      it "redirects to root path after an HTML request" do
        post :vote, params: { id: @review.id, vote: 1 }
        expect( response ).to redirect_to( root_path )
      end
      it "redirects to root path after a JSON request" do
        post :vote, format: :json,params: {  id: @review.id, vote: 1 }
        expect( response ).to redirect_to( root_path )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET #new]' do
    context "unlogged user" do
      it "displays always the Login page" do
        get_action_and_check_it_redirects_to_login_for( :new )
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    context "as a logged-in user who's NOT a confirmed goggler" do
      before(:each) { login_user() }

      context "with a JSON request," do
        it "refuses the request" do
          get :new, format: :json
          expect(response.status).to eq( 406 )
        end
      end

      context "with an HTML request," do
        it "refuses the request and redirects to app root" do
          get :new
          expect( response ).to redirect_to( root_path )
        end
      end

      context "with an HTML request and a preset swimming_pool_id parameter," do
        before :each do
          @pool = create(:swimming_pool)
          get :new, params: { swimming_pool_id: @pool.id }
        end
        it "refuses the request and redirects to app root" do
          expect( response ).to redirect_to( root_path )
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    context "as a logged-in user who is a confirmed goggler" do
      before :each do
        login_user()
        @user.swimmer = create(:swimmer)
        another_goggler_confirmator = create(:user)
        UserSwimmerConfirmation.confirm_for( @user, @user.swimmer, another_goggler_confirmator )
      end

      context "with a JSON request" do
        it "refuses the request" do
          get :new, format: :json
          expect(response.status).to eq( 406 )
        end
      end

      context "with an HTML request," do
        it "handles successfully the request" do
          get :new
          expect(response.status).to eq( 200 )
        end
        it "assigns the required variables" do
          get :new
          expect( assigns(:title) ).to be_an_instance_of( String )
          expect( assigns(:review) ).to be_an_instance_of( SwimmingPoolReview )
          expect( assigns(:review).user_id ).to eq( @user.id )
        end
        it "renders the template" do
          get :new
          expect(response).to render_template(:edit)
        end
      end

      context "with an HTML request and a preset swimming_pool_id parameter," do
        before :each do
          @pool = create(:swimming_pool)
          get :new, params: { swimming_pool_id: @pool.id }
        end
        it "handles successfully the request" do
          expect(response.status).to eq( 200 )
        end
        it "assigns the required variables, pre-setting also the swimming pool ID" do
          expect( assigns(:title) ).to be_an_instance_of( String )
          expect( assigns(:review) ).to be_an_instance_of( SwimmingPoolReview )
          expect( assigns(:review).user_id ).to eq( @user.id )
          expect( assigns(:review).swimming_pool_id ).to eq( @pool.id )
        end
        it "renders the template" do
          expect(response).to render_template(:edit)
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[POST #create]' do
    before :each do
      # This will create a sample review fixture not assigned to the current user,
      # while the test examples below will create another, but associated to the current user
      # simply using its attributes.
      @review = create( :swimming_pool_review )
    end

    context "as an unlogged user" do
      it "doesn't create a new row with an HTML request" do
        expect {
          post :create, params: { swimming_pool_review: @review.attributes }
        }.not_to change( SwimmingPoolReview, :count )
      end
      it "doesn't create a new row with a JSON request" do
        expect {
          post :create, format: :json, params: { swimming_pool_review: @review.attributes }
        }.not_to change( SwimmingPoolReview, :count )
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    context "as a logged-in user who's NOT a confirmed goggler" do
      before :each do
        login_user()
        @review.user_id = @user.id
      end
      it "doesn't create a new row with an HTML request" do
        expect {
          post :create, params: { swimming_pool_review: @review.attributes }
        }.not_to change( SwimmingPoolReview, :count )
      end
      it "doesn't create a new row with a JSON request" do
        expect {
          post :create, format: :json, params: { swimming_pool_review: @review.attributes }
        }.not_to change( SwimmingPoolReview, :count )
      end
      it "refuses the request and redirects to app root after an HTML request" do
        post :create, params: { swimming_pool_review: @review.attributes }
        expect( response ).to redirect_to( root_path )
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    context "as a logged-in user who is a confirmed goggler" do
      before :each do
        login_user()
        @user.swimmer = create(:swimmer)
        another_goggler_confirmator = create(:user)
        UserSwimmerConfirmation.confirm_for( @user, @user.swimmer, another_goggler_confirmator )
        @review.user_id = @user.id
      end

      it "handles successfully the request with HTML" do
        expect {
          post :create, params: { swimming_pool_review: @review.attributes }
        }.to change(SwimmingPoolReview, :count).by(1)
      end
      it "handles successfully the request with JSON" do
        expect {
          post :create, format: :json, params: { swimming_pool_review: @review.attributes }
        }.to change(SwimmingPoolReview, :count).by(1)
      end

      it "redirects to #show after creation" do
        post :create, params: { swimming_pool_review: @review.attributes }
        expect( response ).to redirect_to(  controller: :swimming_pool_reviews, action: :show, id: SwimmingPoolReview.last )
      end
      it "assigns the required variables" do
        post :create, params: { swimming_pool_review: @review.attributes }
        expect( assigns(:review) ).to be_an_instance_of( SwimmingPoolReview )
        expect( assigns(:review).user_id ).to eq( @user.id )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET #edit/:id]' do
    context "unlogged user" do
      it "displays always the Login page" do
        get_action_and_check_it_redirects_to_login_for( :edit, "/users/sign_in", 1 )
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    context "logged-in user" do
      before :each do
        login_user()
        @review = create( :swimming_pool_review, user: @user )
      end

      context "with a JSON request" do
        it "refuses the request" do
          get :edit, format: :json, params: { id: @review.id }
          expect(response.status).to eq( 406 )
        end
      end

      context "with an HTML request and a valid id," do
        it "handles successfully the request" do
          get :edit, params: { id: @review.id }
          expect(response.status).to eq( 200 )
        end
        it "assigns the required variables" do
          get :edit, params: { id: @review.id }
          expect( assigns(:title) ).to be_an_instance_of( String )
          expect( assigns(:review) ).to be_an_instance_of( SwimmingPoolReview )
          expect( assigns(:review).title ).to eq( @review.title )
          expect( assigns(:review).entry_text ).to eq( @review.entry_text )
          expect( assigns(:review).user_id ).to eq( @user.id )
          expect( assigns(:review).swimming_pool_id ).to eq( @review.swimming_pool_id )
        end
        it "renders the template" do
          get :edit, params: { id: @review.id }
          expect(response).to render_template(:edit)
        end
      end

      context "with an HTML request and a non-existing id," do
        it "redirects to #index" do
          get :edit, params: { id: 0 }
          expect( response ).to be_a_redirect
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[PUT #update]' do
    before :each do
      @review = create( :swimming_pool_review )
      @new_title = 'THIS IS a new TITLE'
      @new_entry = 'THIS IS a new ENTRY'
    end

    context "as an unlogged user" do
      it "doesn't update an existing row for with a HTML request" do
        put :update, params: { id: @review.id, swimming_pool_review: {title: @new_title, entry_text: @new_entry} }
        @review.reload
        expect( @review.title ).not_to eq(@new_title)
        expect( @review.entry_text ).not_to eq(@new_entry)
      end
      it "doesn't update an existing row for with a JSON request" do
        put :update, format: :json, params: { id: @review.id, swimming_pool_review: {title: @new_title, entry_text: @new_entry} }
        @review.reload
        expect( @review.title ).not_to eq(@new_title)
        expect( @review.entry_text ).not_to eq(@new_entry)
      end
    end


    context "as a logged-in user" do
      before :each do
        login_user()
        @review.user_id = @user.id
      end

      it "handles successfully the request with HTML" do
        edited_review = @review.clone
        edited_review.title = @new_title
        edited_review.entry_text = @new_entry
        put :update, params: { id: edited_review.id, swimming_pool_review: edited_review.attributes }
        @review.reload
        expect( @review.title ).to eq(@new_title)
        expect( @review.entry_text ).to eq(@new_entry)
      end
      it "handles successfully the request with JSON" do
        put :update, format: :json, params: { id: @review.id, swimming_pool_review: {title: @new_title, entry_text: @new_entry} }
        @review.reload
        expect( @review.title ).to eq(@new_title)
        expect( @review.entry_text ).to eq(@new_entry)
      end

      it "redirects to #show after saving" do
        put :update, params: { id: @review.id, swimming_pool_review: @review.attributes }
        expect( response ).to redirect_to( swimming_pool_review_path( id: @review.id ) )
      end
      it "assigns the required variables" do
        put :update, params: { id: @review.id, swimming_pool_review: @review.attributes }
        expect( assigns(:review) ).to be_an_instance_of( SwimmingPoolReview )
        expect( assigns(:review).title ).to eq( @review.title )
        expect( assigns(:review).entry_text ).to eq( @review.entry_text )
        expect( assigns(:review).swimming_pool_id ).to eq( @review.swimming_pool_id )
        expect( assigns(:review).user_id ).to eq( @user.id )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[DELETE #destroy]' do
    before :each do
      @review = create( :swimming_pool_review )
    end

    context "as an unlogged user" do
      it "doesn't delete an existing row with an HTML request" do
        expect {
          delete :destroy, params: { id: @review.id }
        }.not_to change( SwimmingPoolReview, :count )
      end
      it "doesn't delete an existing row with a JSON request" do
        expect {
          delete :destroy, format: :json, params: { id: @review.id }
        }.not_to change( SwimmingPoolReview, :count )
      end
    end


    context "as a logged-in user" do
      before :each do
        login_user()
        @review.user_id = @user.id
      end

      it "handles successfully the request with HTML" do
        expect {
          delete :destroy, params: { id: @review.id }
        }.to change(SwimmingPoolReview, :count).by(-1)
      end
      it "handles successfully the request with JSON" do
        expect {
          delete :destroy, format: :json, params: { id: @review.id }
        }.to change(SwimmingPoolReview, :count).by(-1)
      end

      it "redirects to #index after creation" do
        delete :destroy, params: { id: @review.id }
        expect( response ).to be_a_redirect
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
