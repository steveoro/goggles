require 'spec_helper'

require 'date'
require 'common/format'


describe TrainingsController do
  include ControllerMacros                          # ??? This should not be necessary since there's already the extension in the spec_helper!

  it_behaves_like( "(generic CRUD controller actions)", "trainings", "TrainingDecorator" )


  describe '[GET #show]' do
    context "logged-in user" do
      login_user()

      it "assigns a decorator for the details to be shown" do
        fixture = create( :training_with_rows )
        get :show, id: fixture.id
        expect(response.status).to eq(200)
        expect( assigns( :training_rows ).first ).to be_an_instance_of( TrainingRowDecorator )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET #edit]' do
    context "logged-in user" do
      login_user()

      it "assigns a training_max_part_order" do
        fixture = create( :training_with_rows )
        get :edit, id: fixture.id
        expect( response.status ).to eq(200)
        expect( assigns(:training_max_part_order) ).not_to be_nil 
        expect( assigns(:training_max_part_order) >= 0 ).to be_true 
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET #printout]' do
    context "unlogged user" do
      it "displays always the Login page" do
        fixture = create( :training_with_rows )
        get_action_and_check_if_its_the_login_page_for( :printout, fixture.id )
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user()

      it "refuses the request with invalid parameters" do
        get :printout, id: 0
        expect(response.status).to redirect_to( trainings_path ) # url_to_action_for('trainings')
      end
      it "handles the request with valid parameters" do
        fixture = create( :training_with_rows )
        get :printout, id: fixture.id
        expect(response.status).to eq(200)     # 302 (redirect) means the user is not logged in
      end
      it "receives a PDF file" do
        fixture = create( :training_with_rows )
        get :printout, id: fixture.id
        expect( response.body).to include("%PDF")
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[POST #duplicate]' do
    context "unlogged user" do
      it "displays always the Login page" do
        fixture = create( :training_with_rows )
        post :duplicate, id: fixture.id
        expect(response).to redirect_to '/users/sign_in' # new_user_session_path() => '/users/sign_in?locale=XX'
        expect(response.status).to eq( 302 )        # must redirect to the login page
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      login_user()

      it "refuses the request with invalid parameters" do
        post :duplicate, id: 0
        expect(response.status).to redirect_to( trainings_path() )
      end

      it "handles the request with valid parameters, redirecting to #edit" do
        fixture = create(:training_with_rows, user: @user)
        post :duplicate, id: fixture.id
        expect(response.status).to redirect_to( edit_training_path(Training.last) )
      end
      it "adds another header row" do
        fixture = create(:training_with_rows, user: @user)
        expect { post :duplicate, id: fixture.id }.to change( Training, :count ).by(1)
      end
      it "adds as many detail rows as the source has" do
        fixture = create(:training_with_rows, user: @user)
        detail_rows_count = fixture.training_rows.count
        expect { post :duplicate, id: fixture.id }.to change( TrainingRow, :count ).by(detail_rows_count)
      end

      it "creates a copy of the header row" do
        fixture = create(:training_with_rows, user: @user)
        post :duplicate, id: fixture.id
        duplicated_row = Training.last
        expect( duplicated_row.title ).to             include( fixture.title )
        expect( duplicated_row.description ).to       eq( fixture.description )
        expect( duplicated_row.min_swimmer_level ).to eq( fixture.min_swimmer_level )
        expect( duplicated_row.max_swimmer_level ).to eq( fixture.max_swimmer_level )
        expect( duplicated_row.user_id ).to           eq( fixture.user_id )
      end
      it "links all the copied detail rows to the copied header row" do
        fixture = create(:training_with_rows, user: @user)
        post :duplicate, id: fixture.id
        duplicated_row = Training.last
        duplicated_row.training_rows.each do |duplicated_detail_row|
          expect( duplicated_detail_row.training_id ).to eq( duplicated_row.id )
        end
      end
      it "creates a copy of all the detail rows" do
        # TODO
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
