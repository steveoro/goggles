require 'spec_helper'

require_relative '../../../../app/controllers/admin/v3/data_import_controller'
require_relative '../../../../app/data_import/v3/dao/parse_result'


describe Admin::V3::DataImportController, :type => :controller do
#  before :each do
#    @request.env["devise.mapping"] = Devise.mappings[:admin]
#    @admin = Admin.first
#  end

  let( :fixture_file ) { "./test/fixtures/samples/fixture1-ris20120414molinella-sample.txt" }


  describe '[GET #index]' do
    context "as an unlogged user," do
      it "refuses the request" do
        expect( get :index ).to redirect_to( new_admin_session_path( locale: nil ) )
      end
    end

    context "as a logged-in admin," do
      before(:each) do
        login_admin( Admin.first )
      end

      context "with some existing data-import session," do
        it "handles successfully the request" do
          get :index
          expect(response.status).to eq( 200 )
        end

        it "renders the :index template" do
          expect( get :index ).to render_template(:index)
        end

        it "has the full list of existing data-import sessions" do
          di_session = create( :data_import_session )
          get :index
          expect( assigns(:existing_import_sessions) ).to respond_to(:each)
          expect( assigns(:existing_import_sessions) ).to respond_to(:count)
        end
      end
    end
  end


  describe '[POST #parse_file]' do
    context "as an unlogged user," do
      it "refuses the request" do
        expect( get :index ).to redirect_to( new_admin_session_path( locale: nil ) )
      end
    end

    context "as a logged-in admin," do
      before(:each) do
        login_admin( Admin.first )
      end

      context "with nil :datafile parameter," do
        it "redirects to #index" do
          post :parse_file
          expect(response.status).to redirect_to( admin_v3_data_import_index_path(locale: :it) )
        end
      end

      context "with valid parameters," do
        let(:datafile) { fixture_file_upload(fixture_file, "text/plain") }

        xit "redirects to :team_analysis" do
# FIXME Make a DataImporter class first, that decides which Parser has to be
#       instantiated, using the FileFormatParser class, expanded to handle and
#       recognize also the CsiParser family of processors.
          post :parse_file, datafile: datafile
          expect(response.status).to redirect_to(
            admin_v3_data_import_team_analysis_path( 1, locale: :it )
          )
        end

        xit "creates a new V3::ParseResult" do
# FIXME Make a DataImporter class first, that decides which Parser has to be
#       instantiated, using the FileFormatParser class, expanded to handle and
#       recognize also the CsiParser family of processors.
          post :parse_file, datafile: datafile
          expect( assigns(:result) ).to be_an_instance_of?( V3::ParseResult )
        end

        xit "serializes the results somehow" do
# FIXME Make a DataImporter class first, that decides which Parser has to be
#       instantiated, using the FileFormatParser class, expanded to handle and
#       recognize also the CsiParser family of processors.
          post :parse_file, datafile: datafile
          expect( assigns(:result).is_serialized? ).to be true
        end

        xit "creates a new DataImportSession" do
# FIXME Make a DataImporter class first, that decides which Parser has to be
#       instantiated, using the FileFormatParser class, expanded to handle and
#       recognize also the CsiParser family of processors.
          post :parse_file, datafile: datafile
          expect( assigns(:data_import_session) ).to be_an_instance_of?( DataImportSession )
        end
      end
    end
  end


  # TODO

  #-- -------------------------------------------------------------------------
  #++
end
