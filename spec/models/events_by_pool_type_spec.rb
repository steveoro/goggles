require 'spec_helper'

describe EventsByPoolType, :type => :model do
  #subject { create(:events_by_pool_type) }
  # Assumes presence in seeds
  subject { EventsByPoolType.find( ((rand * 100) % 50).to_i + 1 ) }
  
  context "well formed instance" do
    it "is a valid istance" do
      expect( subject ).to be_valid
    end
    # Validated relations:
    it_behaves_like( "(belongs_to required models)", [
      :pool_type,
      :event_type
    ])
    # Filtering scopes:
    it_behaves_like( "(the existance of a class method)", [
      :not_relays
    ])
        
    describe "#find_by_pool_and_event_codes" do
      it "has a self method find_by_pool_and_event_codes" do
        expect( EventsByPoolType ).to respond_to( :find_by_pool_and_event_codes )
      end
      it "returns a EventsByPoolIstance or nil" do
        fix_pool_code  = PoolType.find( ((rand * 100) % 3).to_i + 1 ).code
        fix_event_code = EventType.find( ((rand * 100) % 30).to_i + 1 ).code
        expect( EventsByPoolType.find_by_pool_and_event_codes(fix_pool_code, fix_event_code) ).to be_an_instance_of( EventsByPoolType ).or be_nil
      end
      it "returns a EventsByPoolIstance if present" do
        expect( EventsByPoolType.find_by_pool_and_event_codes(subject.pool_type.code, subject.event_type.code) ).to be_an_instance_of( EventsByPoolType )
      end
      it "returns nil if no event for the pool type present" do
        expect( EventsByPoolType.find_by_pool_and_event_codes('50', '100MI') ).to be_nil        
      end
    end
  end  
end
