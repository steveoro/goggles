require 'spec_helper'


describe Api::V1::RecordsController do
  # ASSERT: individual_records table has been copied from development DB
  # (use always #> rake db:clone_to_test task to prepare the test DB)

  describe '[GET #for_season_type]' do
    context "with a non-JSON request" do
      it "refuses the request" do
        get :for_season_type, id: 2 # 'MASCSI'
        expect(response.status).to eq( 406 )
      end
    end

    context "for JSON request with invalid parameters," do
      before( :each ) { get :for_season_type, id: 0, format: :json }

      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "returns an empty Array as result" do
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Array)
        expect( result.size ).to eq(0)
      end
    end

    context "for JSON request with valid parameters," do
      before( :each ) { get :for_season_type, id: 2, format: :json }

      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "returns a JSON array with an Hash as each element (representing each row)" do
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Array)
        result.each do |item|
          expect( item ).to be_an_instance_of(Hash)
          season = Season.find_by_id( item['season_id'] )
          expect( season ).to be_an_instance_of(Season)
          expect( season.season_type_id ).to eq( 2 ) # = MASCSI
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe '[GET #for_team]' do
    context "with a non-JSON request" do
      it "refuses the request" do
        get :for_team, id: 1
        expect(response.status).to eq( 406 )
      end
    end

    context "for JSON request with invalid parameters," do
      before( :each ) { get :for_team, id: 0, format: :json }

      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "returns an empty Array as result" do
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Array)
        expect( result.size ).to eq(0)
      end
    end

    context "for JSON request with valid parameters," do
      before( :each ) { get :for_team, id: 1, format: :json }

      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "returns a JSON array with an Hash as each element (representing each row)" do
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Array)
        result.each do |item|
          expect( item ).to be_an_instance_of(Hash)
          expect( item['team_id'] ).to eq( 1 )
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe '[GET #for_swimmer]' do
    context "with a non-JSON request" do
      it "refuses the request" do
        get :for_swimmer, id: 142 # = Steve A.
        expect(response.status).to eq( 406 )
      end
    end

    context "for JSON request with invalid parameters," do
      before( :each ) { get :for_swimmer, id: 0, format: :json }

      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "returns an empty Array as result" do
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Array)
        expect( result.size ).to eq(0)
      end
    end

    context "for JSON request with valid parameters," do
      before( :each ) { get :for_swimmer, id: 142, format: :json }

      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "returns a JSON array with an Hash as each element (representing each row)" do
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Array)
        result.each do |item|
          expect( item ).to be_an_instance_of(Hash)
          expect( item['swimmer_id'] ).to eq( 142 )
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe '[GET #count_records_for_swimmer]' do
    context "with a non-JSON request" do
      it "refuses the request" do
        get :count_records_for_swimmer, id: 142 # = Steve A.
        expect(response.status).to eq( 406 )
      end
    end

    context "for JSON request with invalid parameters," do
      before( :each ) { get :count_records_for_swimmer, id: 0, format: :json }

      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "returns an empty Array as result" do
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Hash)
        expect( result['total'] ).to eq(0)
      end
    end

    context "for JSON request with valid parameters," do
      before( :each ) { get :count_records_for_swimmer, id: 142, format: :json }

      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "returns a JSON array with an Hash as each element (representing each row)" do
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Hash)
        # There should be at least 6 records/best results for this swimmer
        # in the preloaded seed files:
        expect( result['total'] ).to be >= 6
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
