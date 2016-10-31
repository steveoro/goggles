require 'rails_helper'

require 'date'
require 'common/format'


describe RecordsController, type: :controller do

  describe '[GET #for_season_type]' do
    context "with an HTML request," do
      it "handles successfully the request" do
        get :for_season_type
        expect(response.status).to eq( 200 )
      end
      it "assigns the required variables" do
        get :for_season_type
        expect( assigns(:title) ).to be_an_instance_of( String )
      end
      it "renders the form template" do
        get :for_season_type
        expect(response).to render_template(:for_season_type)
      end
    end


    context "with an AJAX request," do
      context "without parameters," do
        before(:each) { get( :for_season_type, xhr: true ) }
        # [Steve, 20140723] To speed up the example, this long request will be done only
        # once, with all the test performed at once (even thou it's not a best-practice).
        it "handles successfully the request but with an empty list" do
          expect(response.status).to eq( 200 )
          expect( assigns(:title) ).to be_an_instance_of( String )
          expect( assigns(:grid_builder) ).to be_an_instance_of( RecordGridBuilder )
          expect( assigns(:grid_builder).count ).to eq(0)
          expect(response).to render_template(:for_season_type)
        end
      end

      context "with a valid parameter," do
        before(:each) { get( :for_season_type, xhr: true, params: { season_type: {id: 2} } ) }

        it "handles successfully the request" do
          expect(response.status).to eq( 200 )
        end
        it "assigns the required variables" do
          expect( assigns(:title) ).to be_an_instance_of( String )
          expect( assigns(:grid_builder) ).to be_an_instance_of( RecordGridBuilder )
        end
        it "has a non-empty record list" do
          expect( assigns(:grid_builder).count ).to be > 0
        end
        it "renders the form template" do
          expect(response).to render_template(:for_season_type)
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe '[GET #for_team]' do
    context "with an HTML request," do
      it "handles successfully the request" do
        get :for_team
        expect(response.status).to eq( 200 )
      end
      it "assigns the required variables" do
        get :for_team
        expect( assigns(:title) ).to be_an_instance_of( String )
      end
      it "renders the form template" do
        get :for_team
        expect(response).to render_template(:for_team)
      end
    end


    context "with an AJAX request," do
      context "without parameters," do
        before(:each) { get( :for_team, xhr: true ) }
        # [Steve, 20140723] To speed up the example, this long request will be done only
        # once, with all the test performed at once (even thou it's not a best-practice).
        it "handles successfully the request but with an empty list" do
          expect(response.status).to eq( 200 )
          expect( assigns(:title) ).to  be_an_instance_of( String )
          # [Steve, 20160401] This is no longer true: (to be removed)
          #expect( assigns(:grid_builder) ).to be_an_instance_of( RecordGridBuilder )
          #expect( assigns(:grid_builder).count ).to eq(0)
          expect(response).to render_template(:for_team)
        end
      end

      context "with a valid parameter," do
        # (Team.id = 1 => CSI, always existing in seeds)
        before(:each) { get( :for_team, xhr: true, params: { team: {id: 1} } ) }

        it "handles successfully the request" do
          expect(response.status).to eq( 200 )
        end
        it "assigns a safe-buffer text link to the team's radio page in the title variable" do
          expect( assigns(:title) ).to be_an_instance_of( ActiveSupport::SafeBuffer )
        end
        it "assigns the other required variables" do
          expect( assigns(:grid_builder) ).to be_an_instance_of( RecordGridBuilder )
        end
        it "has a non-empty record list" do
          expect( assigns(:grid_builder).count ).to be > 0
        end
        it "renders the form template" do
          expect(response).to render_template(:for_team)
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe '[GET #for_swimmer]' do
    context "with an HTML request," do
      it "handles successfully the request" do
        get :for_swimmer
        expect(response.status).to eq( 200 )
      end
      it "assigns the required variables" do
        get :for_swimmer
        expect( assigns(:title) ).to be_an_instance_of( String )
      end
      it "renders the form template" do
        get :for_swimmer
        expect(response).to render_template(:for_swimmer)
      end
    end


    context "with an AJAX request," do
      context "without parameters," do
        before(:each) { get( :for_swimmer, xhr: true ) }
        # [Steve, 20140723] To speed up the example, this long request will be done only
        # once, with all the test performed at once (even thou it's not a best-practice).
        it "handles successfully the request but with an empty list" do
          expect(response.status).to eq( 200 )
          expect( assigns(:title) ).to be_an_instance_of( String )
          # [Steve, 20160401] This is no longer true: (to be removed)
          #expect( assigns(:grid_builder) ).to be_an_instance_of( RecordGridBuilder )
          #expect( assigns(:grid_builder).count ).to eq(0)
          expect(response).to render_template(:for_swimmer)
        end
      end

      context "with a valid parameter," do
        let(:leega_swimmer) { Swimmer.where(complete_name: 'LIGABUE MARCO').first }
        before(:each) { get( :for_swimmer, xhr: true, params: { swimmer: {id: leega_swimmer.id} } ) }

        it "handles successfully the request" do
          expect(response.status).to eq( 200 )
        end
        it "assigns the required variables" do
          expect( assigns(:title) ).to be_an_instance_of( String )
          expect( assigns(:grid_builder) ).to be_an_instance_of( RecordGridBuilder )
        end
        it "has a non-empty record list" do
          expect( assigns(:grid_builder).count ).to be > 0
        end
        it "renders the form template" do
          expect(response).to render_template(:for_swimmer)
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


# FIXME this has not been used yet: (view removed or missing) -- check it out and then remove it, if everything is ok

  # describe '[GET #for_personal_best]' do
    # context "with an HTML request," do
# # FIXME
      # xit "handles successfully the request" do
        # get :for_personal_best
        # expect(response.status).to eq( 200 )
      # end
      # xit "assigns the required variables" do
        # get :for_personal_best
        # expect( assigns(:title) ).to be_an_instance_of( String )
      # end
      # xit "renders the form template" do
        # get :for_personal_best
        # expect(response).to render_template(:for_personal_best)
      # end
    # end
#
#
    # context "with an AJAX request," do
      # context "without parameters," do
        # before(:each) { get( :for_personal_best, xhr: true ) }
        # # [Steve, 20140723] To speed up the example, this long request will be done only
        # # once, with all the test performed at once (even thou it's not a best-practice).
# # FIXME
        # xit "handles successfully the request but with an empty list" do
          # expect(response.status).to eq( 200 )
          # expect( assigns(:title) ).to be_an_instance_of( String )
          # expect( assigns(:grid_builder) ).to be_an_instance_of( PersoanlBestGridBuilder )
          # expect( assigns(:grid_builder).count ).to eq(0)
          # #expect(response).to render_template(:for_personal_best)
        # end
      # end
#
      # context "with a valid parameter," do
        # # (Team.id = 1 => CSI, existing in seeds)
        # let(:leega_swimmer) { Swimmer.where(complete_name: 'LIGABUE MARCO').first }
        # before(:each) { get( :for_personal_best, xhr: true, params: { swimmer: {id: leega_swimmer.id} } ) }
#
# # FIXME
        # xit "handles successfully the request" do
          # expect(response.status).to eq( 200 )
        # end
        # xit "assigns the required variables" do
          # expect( assigns(:title) ).to be_an_instance_of( String )
          # expect( assigns(:grid_builder) ).to be_an_instance_of( PersoanlBestGridBuilder )
        # end
        # xit "has a non-empty record list" do
          # expect( assigns(:grid_builder).count ).to be > 0
        # end
        # xit "renders the form template" do
          # expect(response).to render_template(:for_personal_best)
        # end
      # end
    # end
  # end
  #-- -------------------------------------------------------------------------
  #++
end
