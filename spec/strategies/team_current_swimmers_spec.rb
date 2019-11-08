require 'rails_helper'


describe TeamCurrentSwimmers, type: :strategy do

  #let(:team)         { Team.first(300).sample }
  let(:team)         { Team.find(1) }
  let(:date)         { Date.today() - (rand*100).to_i + (rand*100).to_i }

  context "well formed instance" do
    subject { TeamCurrentSwimmers.new( team ) }

    it_behaves_like( "(the existance of a method)", [
      :team, :evaluation_date, :header_year,
      :data_retrieved
    ] )

    it "assigns attributes as given parameters and creates empty structures" do
      expect( subject.team ).to eq( team )
      expect( subject.evaluation_date ).to eq( Date.today() )
      expect( subject.data_retrieved ).to be_nil
    end

    it "assigns optional attributes as given parameters" do
      tcs = TeamCurrentSwimmers.new( team, date )
      expect( tcs.team ).to eq( team )
      expect( tcs.evaluation_date ).to eq( date )
      expect( tcs.data_retrieved ).to be_nil
    end

    describe "#retrieve_data" do
      it "returns a relation and sets data_retrieved" do
        expect( subject.data_retrieved ).to be_nil
        result = subject.retrieve_data
        expect( result ).to be_a_kind_of( ActiveRecord::Result )
        expect( subject.data_retrieved ).to be_a_kind_of( ActiveRecord::Result )
        expect( subject.data_retrieved ).to eq( result )
      end
      it "returns a query result with necessary columns" do
        keys = [
          'swimmer_id', 'swimmer_name', 'swimmer_year',
          'csi_swimmer_id', 'csi_federation_code', 'csi_affiliation_number', 'csi_badge_id', 'csi_badge_number', 'csi_category_code', 'csi_meetings_count', 'csi_max_updated_at',
          'fin_swimmer_id', 'fin_federation_code', 'fin_affiliation_number', 'fin_badge_id', 'fin_badge_number', 'fin_category_code', 'fin_meetings_count', 'fin_max_updated_at',
          'uisp_swimmer_id', 'uisp_federation_code', 'uisp_affiliation_number', 'uisp_badge_id', 'uisp_badge_number', 'uisp_category_code', 'uisp_meetings_count', 'uisp_max_updated_at',
          'meetings_total', 'max_updated_at'
          ]
        result = subject.retrieve_data
        result.each do |element|
          expect( element.size ).to eq( keys.size )
          keys.each do |column|
            expect( element.has_key?(column) ).to eq(true)
          end
        end
      end
    end

    describe "#set_team_current_swimmers_dao" do
      it "returns a TeamCurrentSwimmersDAO" do
        expect( subject.set_team_current_swimmers_dao ).to be_an_instance_of( TeamCurrentSwimmersDAO )
      end
      it "returns an empty TeamCurrentSwimmersDAO if no data retrieved" do
        expect( subject.data_retrieved ).to be_nil
        tcs = subject.set_team_current_swimmers_dao
        expect( tcs.swimmers.size ).to eq(0)
      end
      it "returns a non empty TeamCurrentSwimmersDAO if data retrieved" do
        subject.retrieve_data
        expect( subject.data_retrieved ).not_to be_nil
        tcs = subject.set_team_current_swimmers_dao
        expect( tcs.swimmers.size ).to be >= 0
        expect( tcs.affiliations.size ).to be >= 0
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
