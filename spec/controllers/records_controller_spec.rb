require 'spec_helper'

require 'date'
require 'common/format'


describe RecordsController do
  include ControllerMacros                          # ??? This should not be necessary since there's already the extension in the spec_helper!

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

        it "handles successfully the request" do
          expect(response.status).to eq( 200 )
        end
        it "assigns the required variables" do
          expect( assigns(:title) ).to be_an_instance_of( String ) 
          expect( assigns(:collector) ).to be_an_instance_of( RecordCollector ) 
        end
        it "has an empty record list" do
          expect( assigns(:collector).count ).to eq(0) 
        end
        it "renders the form template" do
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
          expect( assigns(:collector) ).to be_an_instance_of( RecordCollector ) 
        end
        it "has a non-empty record list" do
          expect( assigns(:collector).count ).to be > 0 
        end
        it "renders the form template" do
          expect(response).to render_template(:for_season_type)
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe '[GET #for_federation]' do
    context "with an HTML request," do
      it "handles successfully the request" do
        get :for_federation
        expect(response.status).to eq( 200 )
      end
      it "assigns the required variables" do
        get :for_federation
        expect( assigns(:title) ).to be_an_instance_of( String ) 
      end
      it "renders the form template" do
        get :for_federation
        expect(response).to render_template(:for_federation)
      end
    end


    context "with an AJAX request," do
      context "without parameters," do
        before(:each) { xhr :get, :for_federation }

        it "handles successfully the request" do
          expect(response.status).to eq( 200 )
        end
        it "assigns the required variables" do
          expect( assigns(:title) ).to be_an_instance_of( String ) 
          expect( assigns(:collector) ).to be_an_instance_of( RecordCollector ) 
        end
        it "has an empty record list" do
          expect( assigns(:collector).count ).to eq(0) 
        end
        it "renders the form template" do
          expect(response).to render_template(:for_federation)
        end
      end

      context "with a valid parameter," do
        before(:each) { xhr :get, :for_federation, federation_type: {id: 2} }

        it "handles successfully the request" do
          expect(response.status).to eq( 200 )
        end
        it "assigns the required variables" do
          expect( assigns(:title) ).to be_an_instance_of( String ) 
          expect( assigns(:collector) ).to be_an_instance_of( RecordCollector ) 
        end
        it "has a non-empty record list" do
          expect( assigns(:collector).count ).to be > 0 
        end
        it "renders the form template" do
          expect(response).to render_template(:for_federation)
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
