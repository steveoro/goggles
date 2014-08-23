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
      it "returns a EventsByPool instance or nil" do
        fix_pool_code  = PoolType.find( ((rand * 100) % 3).to_i + 1 ).code
        fix_event_code = EventType.find( ((rand * 100) % 30).to_i + 1 ).code
        expect( EventsByPoolType.find_by_pool_and_event_codes(fix_pool_code, fix_event_code) ).to be_an_instance_of( EventsByPoolType ).or be_nil
      end
      it "returns a EventsByPool instance if present" do
        expect( EventsByPoolType.find_by_pool_and_event_codes(subject.pool_type.code, subject.event_type.code) ).to be_an_instance_of( EventsByPoolType )
      end
      it "returns nil if no event for the pool type present" do
        expect( EventsByPoolType.find_by_pool_and_event_codes('50', '100MI') ).to be_nil        
      end
    end
    
    describe "#get_event_types_for_pool_type_by_code" do
      it "has a self method get_event_types_for_pool_type_by_code" do
        expect( EventsByPoolType ).to respond_to( :get_event_types_for_pool_type_by_code )
      end
      it "responds to each" do
        fix_pool_code  = PoolType.find( ((rand * 100) % 3).to_i + 1 ).code
        expect( EventsByPoolType.get_event_types_for_pool_type_by_code(fix_pool_code) ).to respond_to( :each )
      end
      it "responds to count" do
        fix_pool_code  = PoolType.find( ((rand * 100) % 3).to_i + 1 ).code
        expect( EventsByPoolType.get_event_types_for_pool_type_by_code(fix_pool_code) ).to respond_to( :count )
      end
      it "returns a collection of event types" do
        fix_pool_code  = PoolType.find( ((rand * 100) % 3).to_i + 1 ).code
        EventsByPoolType.get_event_types_for_pool_type_by_code(fix_pool_code).each do |event_type|
          expect( event_type ).to be_an_instance_of( EventType )
        end        
      end      
    end
    
    describe "#get_pool_types_for_event_type_by_code" do
      it "has a self method get_pool_types_for_event_type_by_code" do
        expect( EventsByPoolType ).to respond_to( :get_pool_types_for_event_type_by_code )
      end
      it "responds to each" do
        fix_event_code = EventType.find( ((rand * 100) % 30).to_i + 1 ).code
        expect( EventsByPoolType.get_pool_types_for_event_type_by_code(fix_event_code) ).to respond_to( :each )
      end      
      it "responds to count" do
        fix_event_code = EventType.find( ((rand * 100) % 30).to_i + 1 ).code
        expect( EventsByPoolType.get_pool_types_for_event_type_by_code(fix_event_code) ).to respond_to( :count )
      end      
      it "returns a collection of pool types" do
        fix_event_code = EventType.find( ((rand * 100) % 30).to_i + 1 ).code
        EventsByPoolType.get_pool_types_for_event_type_by_code(fix_event_code).each do |pool_type|
          expect( pool_type ).to be_an_instance_of( PoolType )
        end        
      end      
    end
  end  
end
