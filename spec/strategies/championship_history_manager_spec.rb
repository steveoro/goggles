require 'spec_helper'


describe ChampionshipHistoryManager, type: :strategy do
  #before :each do
  #end

  context "with requested parameters" do
    subject { ChampionshipHistoryManager.new }

    describe "#get_closed_seasons," do
      it "responds to get_closed_seasons method" do
        expect(subject).to respond_to(:get_closed_seasons)
      end
      it "returns a relation" do
        expect( subject.get_closed_seasons ).to be_a_kind_of( ActiveRecord::Relation )
      end
      it "returns a relation of Seasons" do
        expect( subject.get_closed_seasons ).to all(be_an_instance_of( Season ))
      end
    end
    #-- -----------------------------------------------------------------------
  end
  #-- -------------------------------------------------------------------------
  #++
end
