require 'rails_helper'

describe SwimmerMedals, type: :strategy do

  let(:swimmer)         { Swimmer.first(300).sample }
  let(:leega)           { Swimmer.find(23) }

  let(:individuals)  { false }
  let(:season_fin)   { 'MASTER FIN' }
  let(:season_csi)   { 'MASTER CSI' }
  let(:pool_25)      { '25' }
  let(:pool_50)      { '50' }
  let(:event_200MI)  { '200MI' }
  let(:medal_gold)   { 'O' }

  let(:leega_FIN_200MI_50_gold) { 1 }
  let(:leega_CSI_200MI_25_gold) { 4 }

  # Leega medals (minimum values at 13/10/2019)
  let(:leega_types)     { 130 }
  let(:leega_golds)     { 59 }
  let(:leega_silvers)   { 62 }
  let(:leega_bronzes)   { 55 }
  let(:leega_woodens)   { 38 }

  context "well formed instance" do
    subject { SwimmerMedals.new( swimmer ) }

    it_behaves_like( "(the existance of a method)", [
      :swimmer, :swimmer_medals
    ] )

    it "assigns attributes as given parameters" do
      expect( subject.swimmer ).to eq( swimmer )
    end

    it "creates empty readable attributes" do
      expect( subject.swimmer_medals ).to be_nil
    end

    describe "#retrieve_data" do
      it "returns a relation and sets swimmer_medals" do
        expect( subject.swimmer_medals ).to be_nil
        result = subject.retrieve_data
        expect( result ).to be_a_kind_of( ActiveRecord::Result )
        expect( subject.swimmer_medals ).to be_a_kind_of( ActiveRecord::Result )
        expect( subject.swimmer_medals ).to eq( result )
      end
      it "returns a query result of elements with necessary columns" do
        result = subject.retrieve_data
        result.each do |element|
          expect( element.size ).to eq(7)
          [
            'is_a_relay', 'season_code', 'pool_code', 'style_order', 'event_code',
            'medal_code', 'medals_count'
          ].each do |column|
            expect( element.has_key?(column) ).to eq(true)
          end
        end
      end
      it "returns an empty query result for a medal-less swimmer" do
        new_swimmer = create( :swimmer )
        sm = SwimmerMedals.new( new_swimmer )
        result = sm.retrieve_data
        expect( result ).to be_a_kind_of( ActiveRecord::Result )
        expect( result.count ).to eq( 0 )
      end
    end

    describe "#get_medals_dao" do
      it "returns a MedalsDAO object" do
        expect( subject.get_medals_dao ).to be_an_instance_of( MedalsDAO )
      end
      it "returns an empty MedalsDAO object if no data collected" do
        expect( subject.swimmer_medals ).to be_nil
        md = subject.get_medals_dao
        MedalType.all.each do |medal_type|
          expect( md.get_summary( medal_type.code ) ).to be( 0 )
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # This context is to ensure results of data retrieving are those desidered
  # based on known data (of Leega)
  context "for Leega (a swimmer with full stats)" do
    subject { SwimmerMedals.new( leega ) }

    describe "#retrieve_data" do
      it "return an hash with at least Leega's number of medals types" do
        result = subject.retrieve_data
        expect( result ).to be_a_kind_of( ActiveRecord::Result )
        expect( result.count ).to be >= leega_types
      end
    end

    describe "#get_medals_dao" do
      it "return an hash with at least Leega's number of gold medals in 200MI CSI " do
        subject.retrieve_data
        result = subject.get_medals_dao
        expect( result.get_individuals.exists_season?(season_csi) ).to eq( true )
        expect( result.get_individuals.exists_season?(season_fin) ).to eq( true )
        expect( result.get_relays.exists_season?(season_csi) ).to eq( true )
        expect( result.get_relays.exists_season?(season_fin) ).to eq( true )
        expect( result.get_medals( individuals, season_csi, pool_25, event_200MI, medal_gold ) ).to be >= leega_CSI_200MI_25_gold
        expect( result.get_medals( individuals, season_fin, pool_50, event_200MI, medal_gold ) ).to be >= leega_FIN_200MI_50_gold
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
