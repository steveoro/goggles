require 'rails_helper'


describe TeamsHelper, :type => :helper do
  include Devise::Test::ControllerHelpers

  describe "#cache_key_for_swimmer" do
    let(:result_plain) { helper.send(:cache_key_for_team, 'radio', (rand * 10000).to_i, DateTime.now ) }

    it "returns a String" do
      expect( result_plain ).to be_an_instance_of(String)
    end
    it "returns a non empty string" do
      expect( result_plain.size ).to be >= 6
    end
    it "contains as many numbers as there are IDs in the collection" do
      # 2 IDs + 1 locale key + 1 date
      expect( result_plain.split('-').count ).to eq( 4 )
    end
    it "returns different strings as invoked with different parameters" do
      another_result = helper.send(:cache_key_for_team, 'radio', (rand * 10000).to_i, DateTime.now + 100, (rand * 10000).to_i )
      expect( result_plain == another_result ).to be false
    end
  end
  #-- -------------------------------------------------------------------------
  #++



  shared_examples_for "correctly rendering the event sheet PDF link button" do
    it "is not nil" do
      expect( subject ).not_to be_nil
    end
    it "returns a non-empty text" do
      expect( subject.size ).to be > 0
    end
    it "contains the image name" do
      expect( subject ).to include('page_white_acrobat')
    end
  end



  describe "#link_to_best_timings_printout()" do
    context "when given a nil team," do
      subject { helper.link_to_best_timings_printout( nil ) }

      it "returns nil" do
        expect( subject ).to be nil
      end
    end

    context "when given valid parameters," do
      context "[params: Team WITH existing result]," do
        let(:team) { Team.all.limit(200).sample }
        subject { helper.link_to_best_timings_printout( team ) }

        it_behaves_like "correctly rendering the event sheet PDF link button"

        it "contains the path to the printout action" do
          expect( subject ).to include( team_printout_best_timings_path(id: team.id) )
        end
      end
    end
  end



  describe "#link_to_goggle_cup_rankings_printout()" do
    context "when given a nil GoggleCup," do
      subject { helper.link_to_goggle_cup_rankings_printout( nil ) }

      it "returns nil" do
        expect( subject ).to be nil
      end
    end

    context "when given valid parameters," do
      context "[params: valid GoggleCup]," do
        let(:goggle_cup) { GoggleCup.all.limit(200).sample }
        subject { helper.link_to_goggle_cup_rankings_printout( goggle_cup ) }

        it_behaves_like "correctly rendering the event sheet PDF link button"

        it "contains the path to the printout action" do
          expect( subject ).to include( team_printout_goggle_cup_path(id: goggle_cup.id) )
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
