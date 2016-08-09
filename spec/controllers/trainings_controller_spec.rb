require 'rails_helper'

require 'date'
require 'common/format'


describe TrainingsController, :type => :controller do

  it_behaves_like( "(generic CRUD controller actions)", "trainings", "TrainingDecorator" )

  describe '[GET #show]' do
    context "logged-in user" do
      before(:each) { login_user() }

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
      before(:each) { login_user() }

      # Expect that a user should not be able to invoke this action on any user_training, but just on its own
      it "refuses the request for a shared training (not belonging to self)" do
        fixture = create( :training )
        fixture.user.invite( @user, true, true, true )   # he wants to share everything
        @user.approve( fixture.user, true, true, true )  # the current user approves
        get :edit, id: fixture.id
        expect( response ).to redirect_to( controller: :trainings, action: :index )
        # [Steve, 20150410] Using this method fails because "_path" helpers use default locale :en,
        # and we have just set defaul locale to :it
#        expect(response).to redirect_to( trainings_path() )
      end
      it "refuses the request for an unshared training" do
        fixture = create( :training )
        get :edit, id: fixture.id
        expect( response ).to redirect_to( controller: :trainings, action: :index )
        # [Steve, 20150410] Using this method fails because "_path" helpers use default locale :en,
        # and we have just set defaul locale to :it
#        expect(response).to redirect_to( trainings_path() )
      end

      context "with some existing rows," do
        before(:each) do
          fixture = create( :training_with_rows, user: @user )
          get :edit, id: fixture.id
          expect( response.status ).to eq(200)
        end

        it "assigns a training_max_part_order (for an owned training)" do
          expect( assigns(:training_max_part_order) ).not_to be_nil
          expect( assigns(:training_max_part_order) >= 0 ).to be true
        end
        [
          :start_rest_options_array, :pause_options_array,
          :exercise_options_array, :step_type_options_array,
          :arm_aux_options_array, :kick_aux_options_array,
          :body_aux_options_array, :breath_aux_options_array
        ].each do |assigned_sym|
          it "assigns a non-empty :#{assigned_sym} for the corresponding combo-box" do
            expect( assigns(:start_rest_options_array) ).to be_an_instance_of(Array)
            expect( assigns(:start_rest_options_array).size ).to be > 1
          end
        end
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
        fixture = create( :training )
        fixture.user.invite( @user, true, true, true )   # he wants to share everything
        @user.approve( fixture.user, true, true, true )  # the current user approves
        put :update, id: fixture.id, training: attributes_for( :training )
        expect( response ).to redirect_to( controller: :trainings, action: :index )
        # [Steve, 20150410] Using this method fails because "_path" helpers use default locale :en,
        # and we have just set defaul locale to :it
#        expect(response).to redirect_to( trainings_path() )
      end
      it "refuses the request for an unshared training" do
        fixture = create( :training )
        put :update, id: fixture.id, training: attributes_for( :training )
        expect( response ).to redirect_to( controller: :trainings, action: :index )
        # [Steve, 20150410] Using this method fails because "_path" helpers use default locale :en,
        # and we have just set defaul locale to :it
#        expect(response).to redirect_to( trainings_path() )
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
        fixture = create( :training )
        fixture.user.invite( @user, true, true, true )   # he wants to share everything
        @user.approve( fixture.user, true, true, true )  # the current user approves
        delete :destroy, id: fixture.id
        expect( response ).to redirect_to( controller: :trainings, action: :index )
        # [Steve, 20150410] Using this method fails because "_path" helpers use default locale :en,
        # and we have just set defaul locale to :it
#        expect(response).to redirect_to( trainings_path() )
      end
      it "refuses the request for an unshared training" do
        fixture = create( :training )
        delete :destroy, id: fixture.id
        expect( response ).to redirect_to( controller: :trainings, action: :index )
        # [Steve, 20150410] Using this method fails because "_path" helpers use default locale :en,
        # and we have just set defaul locale to :it
#        expect(response).to redirect_to( trainings_path() )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET #printout]' do
    context "unlogged user" do
      it "displays always the Login page" do
        fixture = create( :training_with_rows )
        get_action_and_check_it_redirects_to_login_for( :printout, "/users/sign_in", fixture.id )
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      before(:each) { login_user() }

      it "refuses the request with invalid parameters" do
        get :printout, id: 0
        expect( response ).to redirect_to( controller: :trainings, action: :index )
        # [Steve, 20150410] Using this method fails because "_path" helpers use default locale :en,
        # and we have just set defaul locale to :it
#        expect(response.status).to redirect_to( trainings_path ) # url_to_action_for('trainings')
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
      it "refuses the request for a training with no rows" do
        fixture = create( :training, user: @user )
        get :printout, id: fixture.id
        expect( response ).to redirect_to( controller: :trainings, action: :index )
        # [Steve, 20150410] Using this method fails because "_path" helpers use default locale :en,
        # and we have just set defaul locale to :it
#        expect(response).to redirect_to( trainings_path() )
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
      before(:each) { login_user() }

      it "refuses the request with invalid parameters" do
        post :duplicate, id: 0
        expect( response ).to redirect_to( controller: :trainings, action: :index )
        # [Steve, 20150410] Using this method fails because "_path" helpers use default locale :en,
        # and we have just set defaul locale to :it
#        expect(response).to redirect_to( trainings_path() )
      end

      context "(having an accessible training with rows)" do
        before :each do
          @fixture = create(:training_with_rows, user: @user)
          expect( @fixture.training_rows.size > 1 ).to be true
          @fixture.training_rows.each do |detail_row|
            expect( detail_row ).not_to be_nil
            expect( detail_row.part_order >= 0 ).to be true
          end
        end

        it "handles the request with valid parameters, redirecting to #edit" do
          post :duplicate, id: @fixture.id
        expect( response ).to redirect_to( controller: :trainings, action: :edit, id: Training.last )
        # [Steve, 20150410] Using this method fails because "_path" helpers use default locale :en,
        # and we have just set defaul locale to :it
#          expect(response.status).to redirect_to( edit_training_path(Training.last) )
        end
        it "adds another header row" do
          expect { post :duplicate, id: @fixture.id }.to change( Training, :count ).by(1)
        end
        it "adds as many detail rows as the source has" do
          detail_rows_count = @fixture.training_rows.count
          expect { post :duplicate, id: @fixture.id }.to change( TrainingRow, :count ).by(detail_rows_count)
        end

        it "creates a copy of the header row" do
          post :duplicate, id: @fixture.id
          duplicated_row = Training.last
          expect( duplicated_row.title ).to             include( @fixture.title )
          expect( duplicated_row.description ).to       eq( @fixture.description )
          expect( duplicated_row.min_swimmer_level ).to eq( @fixture.min_swimmer_level )
          expect( duplicated_row.max_swimmer_level ).to eq( @fixture.max_swimmer_level )
          expect( duplicated_row.user_id ).to           eq( @fixture.user_id )
        end
        it "links all the copied detail rows to the copied header row" do
          post :duplicate, id: @fixture.id
          duplicated_row = Training.last
          duplicated_row.training_rows.each do |duplicated_detail_row|
            expect( duplicated_detail_row.training_id ).to eq( duplicated_row.id )
          end
        end
        it "creates a copy of all the detail rows" do
          post :duplicate, id: @fixture.id
          duplicated_row = Training.last
          # For all duplicated detail rows:
          duplicated_row.training_rows.each do |duplicated_detail_row|
            # Extract the hash of comparable duplicated attributes:
            comparable_dup_attrs = duplicated_detail_row.attributes.reject{ |e| ['id','training_id','lock_version','created_at','updated_at'].include?(e) }
            # Retrieve the source detail row:
            part_order = comparable_dup_attrs['part_order']
            expect( part_order ).not_to be_nil
            expect( part_order >= 0 ).to be true
            source_detail_row = @fixture.training_rows.where( part_order: part_order ).first
            expect( source_detail_row ).not_to be_nil
            # Now check each duplicated detail column with its equivalent source attribute:
            comparable_dup_attrs.each do |key, value|
# DEBUG
#              puts "\r\n#{key} => #{value}"
              expect( value ).to eq( source_detail_row.send(key) )
            end
          end
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[POST #create_user_training]' do
    context "unlogged user" do
      it "displays always the Login page" do
        fixture = create( :training_with_rows )
        post :create_user_training, id: fixture.id
        expect(response).to redirect_to '/users/sign_in' # new_user_session_path() => '/users/sign_in?locale=XX'
        expect(response.status).to eq( 302 )        # must redirect to the login page
      end
    end
    # -------------------------------------------------------------------------

    context "logged-in user" do
      before(:each) { login_user() }

      it "refuses the request with invalid parameters" do
        post :create_user_training, id: 0
        expect( response ).to redirect_to( controller: :trainings, action: :index )
        # [Steve, 20150410] Using this method fails because "_path" helpers use default locale :en,
        # and we have just set defaul locale to :it
#        expect(response).to redirect_to( trainings_path() )
      end

      context "(having an accessible training with rows)" do
        before :each do
          @fixture = create(:training_with_rows, user: @user)
          expect( @fixture.training_rows.size > 1 ).to be true
          @fixture.training_rows.each do |detail_row|
            expect( detail_row ).not_to be_nil
            expect( detail_row.part_order >= 0 ).to be true
          end
        end

        it "handles the request with valid parameters, redirecting to #edit" do
          post :create_user_training, id: @fixture.id
        expect( response ).to redirect_to( controller: :user_trainings, action: :edit, id: UserTraining.last )
        # [Steve, 20150410] Using this method fails because "_path" helpers use default locale :en,
        # and we have just set defaul locale to :it
#          expect(response).to redirect_to( edit_user_training_path(UserTraining.last) )
        end
        it "adds a UserTraining row" do
          expect { post :create_user_training, id: @fixture.id }.to change( UserTraining, :count ).by(1)
        end
        it "adds as many detail rows as the source has" do
          detail_rows_count = @fixture.training_rows.count
          expect { post :create_user_training, id: @fixture.id }.to change( UserTrainingRow, :count ).by(detail_rows_count)
        end

        it "creates a copy of the header row" do
          post :create_user_training, id: @fixture.id
          created_row = UserTraining.last
          expect( created_row.description ).to include( @fixture.title )
          expect( created_row.user_id ).to eq( @fixture.user_id )
        end
        it "links all the copied detail rows to the copied header row" do
          post :create_user_training, id: @fixture.id
          created_row = UserTraining.last
          created_row.user_training_rows.each do |duplicated_detail_row|
            expect( duplicated_detail_row.user_training_id ).to eq( created_row.id )
          end
        end
        it "creates a copy of all the detail rows" do
          post :create_user_training, id: @fixture.id
          created_row = UserTraining.last
          # For all duplicated detail rows:
          created_row.user_training_rows.each do |created_detail_row|
            # Extract the hash of comparable duplicated attributes:
            comparable_dup_attrs = created_detail_row.attributes.reject{ |e| ['id','user_training_id','lock_version','created_at','updated_at'].include?(e) }
            # Retrieve the source detail row:
            part_order = comparable_dup_attrs['part_order']
            expect( part_order ).not_to be_nil
            expect( part_order >= 0 ).to be true
            source_detail_row = @fixture.training_rows.where( part_order: part_order ).first
            expect( source_detail_row ).not_to be_nil
            # Now check each duplicated detail column with its equivalent source attribute:
            comparable_dup_attrs.each do |key, value|
# DEBUG
#              puts "\r\n#{key} => #{value}"
              expect( value ).to eq( source_detail_row.send(key) )
            end
          end
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
