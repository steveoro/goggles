require 'rails_helper'
require 'date'


describe ChampionshipsHelper, :type => :helper do
  include Devise::Test::ControllerHelpers
  include ERB::Util

  subject { helper }

  context "[implemented methods]" do
    it_behaves_like( "(the existance of a method)",
      [
        :cache_key_for_championship_history
      ]
    )
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#cache_key_for_championship_history" do
    let(:result_plain) { subject.cache_key_for_championship_history( (rand * 100).to_i, DateTime.now ) }

    it "returns a String" do
      expect( result_plain ).to be_an_instance_of(String)
    end
    it "returns a non empty string" do
      expect( result_plain.size ).to be >= 6
    end
    it "contains as many numbers as there are IDs in the collection" do
      # 3 IDs + 1 locale key
      expect( result_plain.split('-').count ).to eq( 4 )
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


  describe "#link_to_csi_team_rankings_printout()" do
    context "when given a nil season," do
      subject { helper.link_to_csi_team_rankings_printout( nil ) }

      it "returns nil" do
        expect( subject ).to be nil
      end
    end

    context "when given a valid Season instance (it doesn't matter if it's a CSI-type season or not)," do
      let(:season) { Season.last(100).sample }
      subject { helper.link_to_csi_team_rankings_printout( season ) }

      it_behaves_like "correctly rendering the event sheet PDF link button"

      it "contains the path to the printout action" do
        expect( subject ).to include( championships_printout_ranking_regional_csi_path(id: season.id) )
      end
    end
  end


  describe "#link_to_csi_indi_rankings_printout()" do
    context "when given a nil season," do
      subject { helper.link_to_csi_indi_rankings_printout( nil ) }

      it "returns nil" do
        expect( subject ).to be nil
      end
    end

    context "when given a valid Season instance (it doesn't matter if it's a CSI-type season or not)," do
      let(:season) { Season.last(100).sample }
      subject { helper.link_to_csi_indi_rankings_printout( season ) }

      it_behaves_like "correctly rendering the event sheet PDF link button"

      it "contains the path to the printout action" do
        expect( subject ).to include( championships_printout_indi_ranking_csi_path(id: season.id) )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
