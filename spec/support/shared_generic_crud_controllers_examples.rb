require 'spec_helper'


# These examples are meant to be used for any generic CRUD controller that
# behaves like the user_trainings_controller.
#
# It is *assumed* that:
#
# - the #index action will use a WiceGrid instance
# - the decorator is generated by Draper
# - the #show action will pass a decorated instance to its view
# - if the model has any detail row:
#   - the detail table uses the <model_name> + '_rows' naming convention
#   - the #show action will pass a decorated collection for the details to the view
# - the #edit action will pass a decorated instance to its view
#
# Also:
# - if the model responds to +user+, any fixtures created by factories will be
#   forced to the +current_user+ ownership, so that any privacy rules may be skipped
#   here and be tested externally.
# 
#
# === Params:
# - table_name      => the table name of the model associated with the controller to be tested
# - decorator_name  => the string name of the Decorator class
# 
shared_examples_for "(generic CRUD controller actions)" do |table_name, decorator_name|
  include ControllerMacros                          # ??? This should not be necessary since there's already the extension in the spec_helper!

  let( :model_name )              { table_name.classify }
  let( :model_name_sym )          { table_name.classify.underscore.to_sym }
  let( :invalid_model_name_sym )  { "invalid_#{table_name.classify.underscore}".to_sym }
  let( :entity_attrs )            { attributes_for( model_name_sym ) }

  describe '[GET #index]' do
    context "unlogged user" do
      it "displays always the Login page" do
        get_action_and_check_if_its_the_login_page_for( :index )
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user()

      it "populates the search grid" do
        get :index
        expect( assigns("#{table_name}_grid".to_sym) ).not_to be( nil )
      end

      it "renders the search template" do
        get :index
        expect(response.status).to eq(200)     # 302 (redirect) means the user is not logged in
        expect(response).to render_template(:index)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET #show]' do
    context "unlogged user" do
      it "displays always the Login page" do
        get_action_and_check_if_its_the_login_page_for( :show, 1 )
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user()
      before :each do                               # Skip social privacy issues by checking only content available to the current user:
        @fixture = ( model_name.constantize.instance_methods.include?(:user=) ? create(model_name_sym, user: @user) : create(model_name_sym) )
      end

      it "assigns an instance to be shown" do
        get :show, id: @fixture.id
        expect( response.status ).to eq(200)
        expect( assigns( model_name_sym ) ).not_to be_nil 
        expect( assigns( model_name_sym ) ).to be_an_instance_of( decorator_name.constantize )
        expect( assigns( :title ) ).not_to be_nil 
        expect( assigns( :title ) ).to be_an_instance_of(String)
        detail_model_name = "#{table_name.classify.underscore}_rows"
        if assigns( model_name_sym ).respond_to?( detail_model_name )
          expect( assigns( detail_model_name ) ).not_to be_nil
          expect( assigns( detail_model_name ) ).to be_an_instance_of( Draper::CollectionDecorator )
        end
      end

      it "renders the show template" do
        get :show, id: @fixture.id
        expect( controller.params[:id].to_i == @fixture.id ).to be_true 
        expect(response.status).to eq(200)
        expect(response).to render_template(:show)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET #new]' do
    context "unlogged user" do
      it "displays always the Login page" do
        get_action_and_check_if_its_the_login_page_for( :new )
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user()

      it "assigns an instance with default values" do
        get :new
        expect( assigns( model_name_sym ) ).to be_a_new( model_name.constantize )
      end

      it "renders the edit template" do
        get :new
        expect(response.status).to eq(200)
        expect(response).to render_template(:edit)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET #edit]' do
    context "unlogged user" do
      it "displays always the Login page" do
        get_action_and_check_if_its_the_login_page_for( :edit, 1 )
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user()
      before :each do                               # Skip social privacy issues by checking only content available to the current user:
        @fixture = ( model_name.constantize.instance_methods.include?(:user=) ? create(model_name_sym, user: @user) : create(model_name_sym) )
      end

      it "assigns an instance to be edited" do
        get :edit, id: @fixture.id
        expect( response.status ).to eq(200)
        expect( assigns( model_name_sym ) ).not_to be_nil 
        expect( assigns( model_name_sym ) ).to be_an_instance_of( decorator_name.constantize )
        expect( assigns( :title ) ).not_to be_nil 
        expect( assigns( :title ) ).to be_an_instance_of(String)
      end

      it "renders the edit template" do
        get :edit, id: @fixture.id
        expect( controller.params[:id].to_i == @fixture.id ).to be_true 
        expect(response.status).to eq(200)
        expect(response).to render_template(:edit)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[POST #create]' do
    context "unlogged user" do
      it "doesn't create a new row" do 
        expect {
          post :create, model_name_sym => entity_attrs
        }.not_to change( model_name.constantize, :count ) 
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user()

      context "with valid attributes" do
        it "creates a new row" do
          expect {
            post :create, model_name_sym => entity_attrs
          }.to change( model_name.constantize, :count ).by(1)
        end
        it "redirects to the new row" do
          post :create, model_name_sym => entity_attrs
          expect(response).to redirect_to( model_name.constantize.last )
        end
      end

      context "with invalid attributes" do
        it "does not save the new contact" do
          expect{
            post :create, model_name_sym => attributes_for( invalid_model_name_sym )
          }.to_not change( model_name.constantize, :count )
        end

        it "re-renders the new method" do
          post :create, model_name_sym => attributes_for( invalid_model_name_sym )
          expect(response).to render_template( :edit )
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[PUT #update]' do

    context "unlogged user" do
      it "fails the update" do                      # Check that we have different attributes, usable for an update:
        fixture = create( model_name_sym )
        expect( entity_attrs.values != fixture.attributes.values ).to be_true
                                                    # Try the update without logging in:
        put :update, id: fixture.id, model_name_sym => entity_attrs
        fixture.reload                             # The update should not have persisted:
        fixture_data_values = fixture.attributes.values.map{ |i| i.to_s }
        expect(
          entity_attrs.values.all? do |value|       # Checking strings works well with include:
            fixture_data_values.include?( value.to_s )
          end
        ).to be_false                               # (At least a field should be different)
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user()
      before :each do                               # Skip social privacy issues by checking only content available to the current user:
        @fixture = ( model_name.constantize.instance_methods.include?(:user=) ? create(model_name_sym, user: @user) : create(model_name_sym) )
      end

      context "with valid attributes" do
        before :each do
          put :update, id: @fixture, model_name_sym => entity_attrs
        end
        it "changes the row attributes" do
          @fixture.reload
          fixture_data_values = @fixture.attributes.values.map{ |i| i.to_s }
          entity_attrs.values.each do |value|       # Checking strings works well with include:
            expect( fixture_data_values ).to include( value.to_s )
          end
        end
        it "redirects to the updated row" do
          expect(response).to redirect_to( @fixture )
        end
      end

      context "with invalid attributes" do
        before :each do
          put :update, id: @fixture, model_name_sym => attributes_for( invalid_model_name_sym )
        end
        it "doesn't change the row" do
          updated_fixture = model_name.constantize.find( @fixture.id )
          fixture_data_values = @fixture.attributes.values.map{ |i| i.to_s }
                                                    # The persisted (unchanged) row must be equal to the original fixture
          updated_fixture.attributes.values.each do |value|
            expect( fixture_data_values ).to include( value.to_s )
          end
        end
        it "renders the edit method" do
          expect(response).to render_template( :edit )
        end 
      end
    end 
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[DELETE]' do

    context "unlogged user" do
      it "doesn't delete the row" do
        fixture = create( model_name_sym ) 
        expect {
          delete :destroy, id: fixture.id
        }.not_to change( model_name.constantize, :count )
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user()
      before :each do                               # Skip social privacy issues by checking only content available to the current user:
        @fixture = ( model_name.constantize.instance_methods.include?(:user=) ? create(model_name_sym, user: @user) : create(model_name_sym) )
      end

      it "deletes the row" do
        expect {
          delete :destroy, id: @fixture.id
        }.to change( model_name.constantize, :count ).by(-1)
      end

      it "redirects to #index" do
        delete :destroy, id: @fixture.id
        expect(response).to redirect_to( url_to_action_for(table_name) )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end