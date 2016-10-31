require 'rails_helper'


describe Api::V1::RecordsController, type: :controller, api: true do
  # ASSERT: individual_records table has been copied from development DB
  # (use always #> rake db:clone_to_test task to prepare the test DB)

  describe '[GET #for_season_type]' do
    context "with a non-JSON request" do
      it "refuses the request" do
        get :for_season_type, params: { id: 2 } # 'MASCSI'
        expect(response.status).to eq( 406 )
      end
    end

    context "for JSON request with invalid parameters," do
      before( :each ) { get :for_season_type, format: :json, params: { id: 0 } }

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
      before( :each ) { get :for_season_type, format: :json, params: { id: 2 } }

      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "returns a non-empty JSON array" do
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Array)
        expect( result.size ).to be > 0
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

  describe '[GET #for_federation]' do
    context "with a non-JSON request" do
      it "refuses the request" do
        get :for_federation, params: { id: 2 } # 'CSI'
        expect(response.status).to eq( 406 )
      end
    end

    context "for JSON request with invalid parameters," do
      before( :each ) { get :for_federation, format: :json, params: { id: 0 } }

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
      before( :each ) { get :for_federation, format: :json, params: { id: 2 } }

      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "returns a non-empty JSON array" do
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Array)
        expect( result.size ).to be > 0
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
        get :for_team, params: { id: 1 }
        expect(response.status).to eq( 406 )
      end
    end

    context "for JSON request with invalid parameters," do
      before( :each ) { get :for_team, format: :json, params: { id: 0 } }

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
      before( :each ) { get :for_team, format: :json, params: { id: 1 } }

      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "returns a non-empty JSON array" do
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Array)
        expect( result.size ).to be > 0
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
        get :for_swimmer, params: { id: 142 } # = Steve A.
        expect(response.status).to eq( 406 )
      end
    end

    context "for JSON request with invalid parameters," do
      before( :each ) { get :for_swimmer, format: :json, params: { id: 0 } }

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
      before( :each ) { get :for_swimmer, format: :json, params: { id: 142 } }

      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "returns a non-empty JSON array" do
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Array)
        expect( result.size ).to be > 0
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
        get :count_records_for_swimmer, params: { id: 142 } # = Steve A.
        expect(response.status).to eq( 406 )
      end
    end

    context "for JSON request with invalid parameters," do
      before( :each ) { get :count_records_for_swimmer, format: :json, params: { id: 0 } }

      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "returns a JSONified Array of Hash as result" do
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Array)
        expect( result ).to all( be_an_instance_of(Hash) )
      end
      it "returns a list of Hash having 'total' and 'season_type_id' as fields" do
        result = JSON.parse(response.body)
        result.each do |item|
          expect( item.has_key?('season_type_id') ).to be true
          expect( item.has_key?('total') ).to be true
        end
      end
      it "returns a JSONified list of empty totals" do
        result = JSON.parse(response.body)
        result.each do |item|
          expect( item['total'] ).to eq(0)
        end
      end
    end

    context "for JSON request with valid parameters," do
      before( :each ) { get :count_records_for_swimmer, format: :json, params: { id: 142 } }

      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "returns a JSONified Array of Hash as result" do
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Array)
        expect( result ).to all( be_an_instance_of(Hash) )
      end
      it "returns a list of Hash having 'total' and 'season_type_id' as fields" do
        result = JSON.parse(response.body)
        result.each do |item|
          expect( item.has_key?('season_type_id') ).to be true
          expect( item.has_key?('total') ).to be true
        end
      end
      it "returns at least some non-zero value for the specified swimmer" do
        result = JSON.parse(response.body)
        result.each do |hash|
          expect( hash ).to be_an_instance_of(Hash)
          # Hopefully, there should be at least 5 records/best results for this swimmer/season_type
          # combo in the preloaded seed files for this specific season_type_id:
          # FIXME WARNING: this may change from time to time as records are updated with the results according to current seed data! This should be refactored somehow.
          if hash['season_type_id'] == 2
            expect( hash['total'] ).to be >= 5
            break
          end
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
