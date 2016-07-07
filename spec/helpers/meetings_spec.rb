require 'rails_helper'
require 'date'


describe MeetingsHelper, :type => :helper do
  include Devise::TestHelpers
  include ERB::Util

  subject { helper }

  context "[implemented methods]" do
    it_behaves_like( "(the existance of a method)",
      [
        :cache_key_for_meeting
      ]
    )
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#cache_key_for_meeting" do
    let(:result_plain) { subject.cache_key_for_meeting( 'index', (rand * 10000).to_i, DateTime.now ) }

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
end
