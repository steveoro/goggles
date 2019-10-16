require 'rails_helper'

describe SwimmerMedals, type: :strategy do

  let(:swimmer)         { Swimmer.first(300).sample }
  let(:leega)           { Swimmer.find(23) }

  # Leega medals (minimum values at 13/10/2019)
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
      it "returns an hash and sets swimmer_medals" do
        expect( subject.swimmer_medals ).to be_nil
        result = subject.retrieve_data
        expect( result ).to be_a_kind_of( Hash )
        expect( subject.swimmer_medals ).to be_a_kind_of( Hash )
        expect( subject.swimmer_medals ).to eq( result )
      end
      it "returns a query result with necessary columns" do
        result = subject.retrieve_data
        [
          'is_a_relay', 'season_type', 'pool_code', 'style_order', 'event_code',
          'golds', 'silvers', 'bronzes', 'woodens'
        ].each do |column|
          expect( result.has_key?(column) ).to eq(true)
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
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
