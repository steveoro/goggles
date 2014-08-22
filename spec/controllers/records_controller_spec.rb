require 'spec_helper'

require 'date'
require 'common/format'


describe RecordsController, :type => :controller do

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
        before(:each) { xhr :get, :for_season_type }
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
        before(:each) { xhr :get, :for_season_type, season_type: {id: 2} }

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
        before(:each) { xhr :get, :for_team }
        # [Steve, 20140723] To speed up the example, this long request will be done only
        # once, with all the test performed at once (even thou it's not a best-practice).
        it "handles successfully the request but with an empty list" do
          expect(response.status).to eq( 200 )
          expect( assigns(:title) ).to be_an_instance_of( String ) 
          expect( assigns(:grid_builder) ).to be_an_instance_of( RecordGridBuilder ) 
          expect( assigns(:grid_builder).count ).to eq(0) 
          expect(response).to render_template(:for_team)
        end
      end

      context "with a valid parameter," do
        # (Team.id = 1 => CSI, existing in seeds)
        before(:each) { xhr :get, :for_team, team: {id: 1} }

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
        before(:each) { xhr :get, :for_swimmer }
        # [Steve, 20140723] To speed up the example, this long request will be done only
        # once, with all the test performed at once (even thou it's not a best-practice).
        it "handles successfully the request but with an empty list" do
          expect(response.status).to eq( 200 )
          expect( assigns(:title) ).to be_an_instance_of( String ) 
          expect( assigns(:grid_builder) ).to be_an_instance_of( RecordGridBuilder ) 
          expect( assigns(:grid_builder).count ).to eq(0) 
          expect(response).to render_template(:for_swimmer)
        end
      end

      context "with a valid parameter," do
        # (Team.id = 1 => CSI, existing in seeds)
        let(:leega_swimmer) { Swimmer.where(complete_name: 'LIGABUE MARCO').first }
        before(:each) { xhr :get, :for_swimmer, swimmer: {id: leega_swimmer.id} }

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


  describe '[GET #for_personal_best]' do
    context "with an HTML request," do
      xit "handles successfully the request" do
        get :for_personal_best
        expect(response.status).to eq( 200 )
      end
      xit "assigns the required variables" do
        get :for_personal_best
        expect( assigns(:title) ).to be_an_instance_of( String ) 
      end
      xit "renders the form template" do
        get :for_personal_best
        expect(response).to render_template(:for_personal_best)
      end
    end


    context "with an AJAX request," do
      context "without parameters," do
        before(:each) { xhr :get, :for_personal_best }
        # [Steve, 20140723] To speed up the example, this long request will be done only
        # once, with all the test performed at once (even thou it's not a best-practice).
        xit "handles successfully the request but with an empty list" do
          expect(response.status).to eq( 200 )
          expect( assigns(:title) ).to be_an_instance_of( String ) 
          expect( assigns(:grid_builder) ).to be_an_instance_of( PersoanlBestGridBuilder ) 
          expect( assigns(:grid_builder).count ).to eq(0) 
          #expect(response).to render_template(:for_personal_best)
        end
      end

      context "with a valid parameter," do
        # (Team.id = 1 => CSI, existing in seeds)
        let(:leega_swimmer) { Swimmer.where(complete_name: 'LIGABUE MARCO').first }
        before(:each) { xhr :get, :for_personal_best, swimmer: {id: leega_swimmer.id} }

        xit "handles successfully the request" do
          expect(response.status).to eq( 200 )
        end
        xit "assigns the required variables" do
          expect( assigns(:title) ).to be_an_instance_of( String ) 
          expect( assigns(:grid_builder) ).to be_an_instance_of( PersoanlBestGridBuilder ) 
        end
        xit "has a non-empty record list" do
          expect( assigns(:grid_builder).count ).to be > 0 
        end
        xit "renders the form template" do
          expect(response).to render_template(:for_personal_best)
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
