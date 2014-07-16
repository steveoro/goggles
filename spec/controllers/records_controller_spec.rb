require 'spec_helper'

require 'date'
require 'common/format'


describe RecordsController do
  include ControllerMacros                          # ??? This should not be necessary since there's already the extension in the spec_helper!

  describe '[GET #for_federation]' do
    context "with an HTML request," do
      it "handles successfully the request" do
        get :for_federation
        expect(response.status).to eq( 200 )
      end
      it "assigns the required variables" do
        get :for_federation
        expect( assigns(:title) ).to be_an_instance_of( String ) 
#        expect( assigns(:record_collection) ).to be_an_instance_of( RecordCollection ) 
      end
      it "renders the form template" do
        get :for_federation
        expect(response).to render_template(:for_federation)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
