require 'spec_helper'

# Leega
# Probably good idea to generalize some testa as the method failure due to a non logged user
# or non confimred swimmer

describe PassagesController do
  include ControllerMacros                          # ??? This should not be necessary since there's already the extension in the spec_helper!

  context "authorizated actions" do
    # Leega
    # FIXME Should check in user is logged and confirmed swimmer for each method invoked 
    it_behaves_like( "(Ap1-V1-Controllers, actions that requires logged user who's a confirmed swimmer)", [
      :index,
      #:show,
      #:for_meeting_individual_result,
      #:new,
      #:edit,
      #:create,
      #:update,
      #:destroy      
    ])
  end

  context "as a logged-in user who is a confirmed goggler" do
    # Action performed before next specs
    login_user()
    before :each do
      #@user.swimmer = create(:swimmer)
      @swimmer = create(:swimmer)
      @user.set_associated_swimmer( @swimmer )
      another_goggler_confirmator = create(:user)
      UserSwimmerConfirmation.confirm_for( @user, @user.swimmer, another_goggler_confirmator )
    end

    #it "has current_user correctly set" do
    #  expect( subject.current_user_have_enough_confirmations! ).to be_true
    #end
    
    describe '[GET #index]' do
      context "with an HTML request," do
        it "handles successfully the request" do
          get :index
          expect(response.status).to eq( 200 )
        end
        it "assigns the required variables" do
          get :index
          expect( assigns(:title) ).to be_an_instance_of( String ) 
          expect( assigns(:passages_grid) ).not_to be_nil 
        end
        it "renders the template" do
          get :index
          expect(response).to render_template(:index)
        end
      end
    end
    # ===========================================================================
  
  
    describe '[GET #show/:id]' do
      context "with an HTML request and a non-existing id," do
        it "handles the request with a redirect" do
          get :show, id: 0
          expect(response.status).to eq( 302 )
        end
        it "redirects to #index" do
          get :show, id: 0
          expect( response ).to redirect_to( passages_path()) 
        end
      end
      
      context "with an HTML request and an existing id," do
        before :each do
          @passage = create( :passage, user: @user, swimmer: @user.swimmer )
        end
        it "handles successfully the request" do
          get :show, id: @passage.id
          expect(response.status).to eq( 200 )
        end
        it "assigns the required variables" do
          get :show, id: @passage.id
          expect( assigns(:title) ).to be_an_instance_of( String ) 
          expect( assigns(:passage) ).to be_an_instance_of( Passage ) 
        end
        it "renders the template" do
          get :show, id: @passage.id
          expect(response).to render_template(:show)
        end
      end
    end
    # ===========================================================================
  
  
    describe '[GET #for_meeting_individual_result/:id]' do
      before :each do
        @meeting_individual_result1 = create( :meeting_individual_result_with_passages, user: @user, swimmer: @user.swimmer )
      end
  
      context "with an HTML request" do
        it "handles successfully the request" do
          get :for_meeting_individual_result, id: @meeting_individual_result1.id
          expect(response.status).to eq( 200 )
        end
        it "assigns the required variables" do
          get :for_meeting_individual_result, id: @meeting_individual_result1.id
          expect( assigns(:title) ).to be_an_instance_of( String ) 
          expect( assigns(:passages) ).to respond_to( :each ) 
        end
        it "renders the template" do
          get :for_meeting_individual_result, id: @meeting_individual_result1.id
          expect(response).to render_template(:for_meeting_individual_result)
        end
      end
    end
    # ===========================================================================
  
  
    describe '[GET #new]' do
      # Leega FIXME
      # Is it correct? Won't the meeting_individual_result be required? 
      context "with an HTML request without meeting_individual_result," do
        xit "handles successfully the request" do
          get :new
          expect(response.status).to eq( 200 )
        end
        xit "assigns the required variables" do
          get :new
          expect( assigns(:title) ).to be_an_instance_of( String ) 
          expect( assigns(:passage) ).to be_an_instance_of( Passage ) 
          expect( assigns(:passage).user_id ).to eq( @user.id ) 
          expect( assigns(:passage).swimmer_id ).to eq( @user.swimmer_id ) 
        end
        xit "renders the template" do
          get :new
          expect(response).to render_template(:new)
        end
      end

      context "with an HTML request and a preset meeting_individual_result_id parameter," do
        before :each do
          @meeting_individual_result = create(:meeting_individual_result, user: @user, swimmer: @user.swimmer )
          get :new, meeting_individual_result_id: @meeting_individual_result.id
        end
        it "handles successfully the request" do
          expect(response.status).to eq( 200 )
        end
        it "assigns the required variables, pre-setting also the meeting_individual_result ID" do
          expect( assigns(:title) ).to be_an_instance_of( String ) 
          expect( assigns(:passage) ).to be_an_instance_of( Passage ) 
          expect( assigns(:passage).user_id ).to eq( @user.id ) 
          expect( assigns(:passage).swimmer_id ).to eq( @user.swimmer_id ) 
          expect( assigns(:passage).meeting_individual_result_id ).to eq( @meeting_individual_result.id ) 
          expect( assigns(:passage).meeting_program_id ).to eq( @meeting_individual_result.meeting_program_id ) 
          expect( assigns(:passage).team_id ).to eq( @meeting_individual_result.team_id ) 
        end
        it "renders the template" do
          expect(response).to render_template(:new)
        end
      end
    end
    # ===========================================================================


    describe '[POST #create]' do
      before :each do
        @passage = create( :passage, user: @user, swimmer: @user.swimmer )
      end

      it "handles successfully the request with HTML" do
        expect {
          post :create, passage: @passage.attributes
        }.to change(Passage, :count).by(1) 
      end
      it "assigns the required variables" do
        post :create, passage: @passage.attributes
        expect( assigns(:passage) ).to be_an_instance_of( Passage ) 
        expect( assigns(:passage).user_id ).to eq( @user.id ) 
      end
      it "redirects to #show after creation" do
        post :create, passage: @passage.attributes
        expect( response ).to redirect_to( passage_path( Passage.last )) 
      end
    end
    # ===========================================================================


    describe '[GET #edit/:id]' do
      before :each do
        @passage = create( :passage, user: @user, swimmer: @user.swimmer )
      end

      context "with an HTML request and a valid id," do
        it "handles successfully the request" do
          get :edit, id: @passage.id
          expect(response.status).to eq( 200 )
        end
        it "assigns the required variables" do
          get :edit, id: @passage.id
          expect( assigns(:title) ).to be_an_instance_of( String ) 
          expect( assigns(:passage) ).to be_an_instance_of( Passage ) 
          expect( assigns(:passage).minutes ).to eq( @passage.minutes ) 
          expect( assigns(:passage).seconds ).to eq( @passage.seconds ) 
          expect( assigns(:passage).hundreds ).to eq( @passage.hundreds ) 
          expect( assigns(:passage).meeting_individual_result_id ).to eq( @passage.meeting_individual_result_id ) 
          expect( assigns(:passage).user_id ).to eq( @user.id ) 
          expect( assigns(:passage).swimmer_id ).to eq( @passage.swimmer_id ) 
        end
        it "renders the template" do
          get :edit, id: @passage.id
          expect(response).to render_template(:edit)
        end
      end

      context "with an HTML request and a non-existing id," do
        it "redirects to #index" do
          get :edit, id: 0
          expect(response).to redirect_to( passages_path() )
        end
      end
    end
    # ===========================================================================


    describe '[PUT #update]' do
      before :each do
        @passage = create( :passage, user: @user, swimmer: @user.swimmer )
        @new_minutes  = 2    # Assumes factory only uses 0 and 1
        @new_seconds  = 59   # Assumes factory doesn't use only 59  
        @new_hundreds = 99   # Assumes factory doesn't use only 99
      end

      it "handles successfully the request with HTML" do
        edited_passage = @passage.clone
        edited_passage.minutes = @new_minutes
        edited_passage.seconds = @new_seconds
        edited_passage.hundreds = @new_hundreds
        put :update, id: edited_passage.id, passage: edited_passage.attributes
        @passage.reload
        expect( @passage.minutes ).to eq(@new_minutes) 
        expect( @passage.seconds ).to eq(@new_seconds) 
        expect( @passage.hundreds ).to eq(@new_hundreds) 
      end
      it "assigns the required variables" do
        put :update, id: @passage.id, passage: @passage.attributes
        expect( assigns(:passage) ).to be_an_instance_of( Passage ) 
        expect( assigns(:passage).minutes ).to eq( @passage.minutes ) 
        expect( assigns(:passage).seconds ).to eq( @passage.seconds ) 
        expect( assigns(:passage).hundreds ).to eq( @passage.hundreds ) 
        expect( assigns(:passage).meeting_individual_result_id ).to eq( @passage.meeting_individual_result_id ) 
        expect( assigns(:passage).user_id ).to eq( @user.id ) 
        expect( assigns(:passage).swimmer_id ).to eq( @passage.swimmer_id ) 
      end
      it "redirects to #show after saving" do
        put :update, id: @passage.id, passage: @passage.attributes
        expect( response ).to redirect_to( passage_path( @passage.id )) 
      end
    end
    # ===========================================================================


    describe '[DELETE #destroy]' do
      before :each do
        @passage = create( :passage, user: @user, swimmer: @user.swimmer )
      end
  
      it "handles successfully the request with HTML" do
        expect {
          delete :destroy, id: @passage.id
        }.to change(Passage, :count).by(-1) 
      end
      it "redirects to #index after creation" do
        delete :destroy, id: @passage.id
        expect( response ).to redirect_to( passages_path()) 
      end
    end
    # ===========================================================================
  end
end
