require 'spec_helper'


describe PersonalBestCollection, :type => :model do
  # Use pre-loaded seeds:
  let( :results )   { MeetingIndividualResult.where( swimmer_id: 142 ) }
  let( :fixture )   { results.at( ((rand * 1000) % results.size).to_i ) }
  let( :fixture2 )  { results.at( ((rand * 1000) % results.size).to_i ) }
  let( :fixture3 )  { results.at( ((rand * 1000) % results.size).to_i ) }

  let( :pool_type_code )      { fixture.pool_type.code }
  let( :event_type_code )     { fixture.event_type.code }

  let( :pool_type_code2 )     { fixture2.pool_type.code }
  let( :event_type_code2 )    { fixture2.event_type.code }

  subject { PersonalBestCollection.new( fixture ) }


  context "[implemented methods]" do
    it_behaves_like( "(the existance of a method)",
      [
        :clear,
        :each,
        :count,                                     # included with Enumerable
        :size,                                      # aliased from #count
        :delete,
        :delete_with_key,
        :add,
        :<<,
        :get_record_for,
        :has_record_for,
        :encode_key_from_codes,
        :encode_key_from_record,
        :get_record_with_key,
        :to_hash
      ]
    )
  end

  it "implements the Enumerable interface" do
    expect( subject ).to be_a_kind_of( Enumerable )
  end

  describe "#initialize" do
    it "allows a MeetingIndividualResult instance as a parameter" do
      result = PersonalBestCollection.new( create(:meeting_individual_result) )
      expect( result ).to be_an_instance_of( PersonalBestCollection )
      expect( result.count ).to eq(1)
    end
    it "allows a list of MeetingIndividualResult rows as a parameter" do
      result = PersonalBestCollection.new( create_list(:meeting_individual_result, 5) )
      expect( result ).to be_an_instance_of( PersonalBestCollection )
      expect( result.count ).to eq(5)
    end
  end
  #-- -----------------------------------------------------------------------
  #++


  describe "#get_record_with_key" do
    it "returns a nil when not found" do
      expect( subject.get_record_with_key('fake key') ).to be_nil
    end    
    it "returns an instance of IndividualRecord when found" do
      subject.clear
      subject.add(fixture)
      key = subject.encode_key_from_record( fixture )
      expect( subject.get_record_with_key(key) ).to be_an_instance_of( IndividualRecord )
    end    
  end


  describe "#encode_key_from_codes" do
    it "returns a String" do
      expect( subject.encode_key_from_codes('a', 'b') ).to be_an_instance_of( String )
    end    
    it "contains all the specifed codes" do
      result = subject.encode_key_from_codes('a1', 'b2')
      expect( result ).to include('a1')
      expect( result ).to include('b2')
    end    
  end


  describe "#encode_key_from_record" do
    it "returns a String" do
      expect( subject.encode_key_from_record(fixture) ).to be_an_instance_of( String )
    end    
    it "contains all the specifed codes" do
      result = subject.encode_key_from_record(fixture)
      expect( result ).to include( fixture.pool_type.code )
      expect( result ).to include( fixture.event_type.code )
    end    
  end


  describe "#to_hash" do
    it "returns an instance of Hash" do
      expect( subject.to_hash ).to be_an_instance_of( Hash )
    end    
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#delete" do
    it "returns true when successful" do
      subject.clear
      subject.add(fixture)
      expect( subject.delete(fixture) ).to be true
    end
    it "returns false when nothing has been done" do
      subject.clear
      expect( subject.delete(fixture) ).to be false
    end
    it "deletes successfully the specified element from the internal list" do
      subject.clear
      subject.add(fixture)
      expect( subject.delete(fixture) ).to be true
    end
    it "removes the specified element from the internal list" do
      subject.delete(fixture)
      expect(
        subject.has_record_for(
          fixture.pool_type.code,
          fixture.event_type.code
        )
      ).to be false
    end
    it "decreases the size of the internal list" do
      subject.add(fixture)
      expect{ subject.delete(fixture) }.to change{ subject.count }.by(-1)
    end    
  end


  describe "#delete_with_key" do
    let( :encoded_key ) do
      subject.encode_key_from_codes(
        fixture.pool_type.code,
        fixture.event_type.code
      )
    end
    it "returns true when successful" do
      subject.clear
      subject.add(fixture)
      expect( subject.delete_with_key(encoded_key) ).to be true
    end
    it "returns false when nothing has been done" do
      subject.clear
      expect( subject.delete_with_key(encoded_key) ).to be false
    end
    it "deletes successfully the specified element from the internal list" do
      subject.clear
      subject.add(fixture)
      expect( subject.delete_with_key(encoded_key) ).to be true
    end
    it "removes the specified element from the internal list" do
      subject.delete_with_key(encoded_key)
      expect(
        subject.has_record_for(
          fixture.pool_type.code,
          fixture.event_type.code
        )
      ).to be false
    end
    it "decreases the size of the internal list" do
      subject.add(fixture)
      expect{ subject.delete_with_key(encoded_key) }.to change{ subject.count }.by(-1)
    end    
  end


  describe "#clear" do
    it "returns this instance" do
      expect( subject.clear ).to be_an_instance_of( PersonalBestCollection )
    end    
    it "clears the internal list" do
      subject.add( fixture3 )
      expect{ subject.clear }.to change{ subject.count }.to(0)
    end    
  end


  describe "#add" do
    it "returns nil with a nil parameter" do
      expect( subject.add(nil) ).to be_nil
    end    
    it "returns the string key of the new element" do
      subject.clear
      expect( subject.add(fixture) ).to be_an_instance_of( String )
    end    
    it "adds an element to the list" do
      subject.clear
      expect{ subject.add(fixture2) }.to change{ subject.count }.by(1)
    end
    it "does not add twice the same element to the list" do
      subject.clear
      generated_fixture = create( :meeting_individual_result )
      expect{
        subject.add( generated_fixture )
        subject.add( generated_fixture )
      }.to change{ subject.count }.by(1)
    end
    it "adds correctly 2 different records to the list" do
      subject.clear
      expect{
        subject.add( create(:meeting_individual_result) )
        subject.add( create(:meeting_individual_result) )
      }.to change{ subject.count }.by(2)
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#get_record_for" do
    before( :each ) do
      subject.add(fixture)
      subject.add(fixture2)
    end

    it "returns an instance of IndividualRecord" do
      expect(
        subject.get_record_for( pool_type_code, event_type_code )
      ).to be_an_instance_of( IndividualRecord )
    end    
    it "returns the corresponding individual result for the specified keys" do
      result = subject.get_record_for( pool_type_code, event_type_code )
      expect( result.pool_type.code ).to      eq( pool_type_code )
      expect( result.event_type.code ).to     eq( event_type_code )
    end    
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#has_record_for" do
    before( :each ) do
      subject.add(fixture)
      subject.add(fixture2)
    end

    it "returns true for an existing record" do
      expect(
        subject.has_record_for( pool_type_code2, event_type_code2 )
      ).to be true
    end    
    it "returns false for a non existing record" do
      expect(
        subject.has_record_for( '45', '455FA' )
      ).to be false
    end    
  end
  #-- -------------------------------------------------------------------------
  #++
end
