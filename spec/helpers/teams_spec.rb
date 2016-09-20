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
end
