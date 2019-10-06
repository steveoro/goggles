require 'rails_helper'


describe SwimmerStats, type: :strategy do

  let(:swimmer)         { Swimmer.first(300).sample }
  let(:leega)           { Swimmer.find(23) }

  context "well formed instance" do
    subject { SwimmerStats.new( swimmer ) }

    it_behaves_like( "(the existance of a method)", [
      :swimmer, :swimmer_stats
    ] )

    it "assigns attributes as given parameters" do
      expect( subject.swimmer ).to eq( swimmer )
    end

    it "creates empty readable attributes" do
      expect( subject.swimmer_stats ).to be_nil
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "for Ober Ferrari (a team with payments)" do
    subject { SwimmerStats.new( leega ) }

  end
  #-- -------------------------------------------------------------------------
  #++
end
