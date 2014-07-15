require 'spec_helper'


describe RecordCollection do
  # Use pre-loaded seeds:
  let( :results )   { MeetingIndividualResult.where( swimmer_id: 142 ) }
  let( :fixture )   { results.at( ((rand * 1000) % results.size).to_i ) }
  let( :fixture2 )  { results.at( ((rand * 1000) % results.size).to_i ) }
  let( :fixture3 )  { results.at( ((rand * 1000) % results.size).to_i ) }

  let( :tie_fixture1 ) {
    create(
      :meeting_individual_result,
      meeting_program: fixture.meeting_program,
      swimmer: create(:swimmer)
    )
  }
  let( :tie_fixture2 ) {                            # Create a tie-in fixture for a same-ranking result:
    create(
      :meeting_individual_result,
      meeting_program: fixture.meeting_program,
      swimmer_id: 142,
      minutes:  tie_fixture1.minutes,
      seconds:  tie_fixture1.seconds,
      hundreds: tie_fixture1.hundreds
    )
  }

  subject { RecordCollection.new( fixture ) }


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
        :has_tie_in_for,
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
      expect( subject.encode_key_from_codes('a', 'b', 'c', 'd') ).to be_an_instance_of( String )
    end    
    it "contains all the specifed codes" do
      result = subject.encode_key_from_codes('a1', 'b2', 'c3', 'd4')
      expect( result ).to include('a1')
      expect( result ).to include('b2')
      expect( result ).to include('c3')
      expect( result ).to include('d4')
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
      expect( result ).to include( fixture.category_type.code )
      expect( result ).to include( fixture.gender_type.code )
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
      expect( subject.delete(fixture) ).to be_true
    end
    it "returns false when nothing has been done" do
      subject.clear
      expect( subject.delete(fixture) ).to be_false
    end
    it "deletes successfully the specified element from the internal list" do
      subject.clear
      subject.add(fixture)
      expect( subject.delete(fixture) ).to be_true
    end
    it "removes the specified element from the internal list" do
      subject.delete(fixture)
      expect(
        subject.has_record_for(
          fixture.pool_type.code,
          fixture.event_type.code,
          fixture.category_type.code,
          fixture.gender_type.code
        )
      ).to be_false
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
        fixture.event_type.code,
        fixture.category_type.code,
        fixture.gender_type.code
      )
    end
    it "returns true when successful" do
      subject.clear
      subject.add(fixture)
      expect( subject.delete_with_key(encoded_key) ).to be_true
    end
    it "returns false when nothing has been done" do
      subject.clear
      expect( subject.delete_with_key(encoded_key) ).to be_false
    end
    it "deletes successfully the specified element from the internal list" do
      subject.clear
      subject.add(fixture)
      expect( subject.delete_with_key(encoded_key) ).to be_true
    end
    it "removes the specified element from the internal list" do
      subject.delete_with_key(encoded_key)
      expect(
        subject.has_record_for(
          fixture.pool_type.code,
          fixture.event_type.code,
          fixture.category_type.code,
          fixture.gender_type.code
        )
      ).to be_false
    end
    it "decreases the size of the internal list" do
      subject.add(fixture)
      expect{ subject.delete_with_key(encoded_key) }.to change{ subject.count }.by(-1)
    end    
  end


  describe "#clear" do
    it "returns this instance" do
      expect( subject.clear ).to be_an_instance_of( RecordCollection )
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
      expect{
        subject.add( fixture2 )
        subject.add( fixture2 )
      }.to change{ subject.count }.by(1)
      expect{
        subject.add( fixture3 )
        subject.add( fixture3 )
      }.to change{ subject.count }.by(1)
    end
    it "adds correctly 2 different records to the list" do
      subject.clear
      expect{
        subject.add( create(:meeting_individual_result) )
        subject.add( create(:meeting_individual_result) )
      }.to change{ subject.count }.by(2)
    end
    it "adds both records having same-ranking results (tie-ins)" do
      subject.clear
      expect{
        subject.add( tie_fixture1 )
        subject.add( tie_fixture2 )
      }.to change{ subject.count }.by(2)
    end    
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#get_record_for" do
    let( :pool_type_code )      { fixture.pool_type.code }
    let( :event_type_code )     { fixture.event_type.code }
    let( :category_type_code )  { fixture.category_type.code }
    let( :gender_type_code )    { fixture.gender_type.code }

    before( :each ) do
      subject.add(fixture)
      subject.add(fixture2)
    end

    it "returns an instance of IndividualRecord" do
      expect(
        subject.get_record_for( pool_type_code, event_type_code, category_type_code, gender_type_code )
      ).to be_an_instance_of( IndividualRecord )
    end    
    it "returns the corresponding individual result for the specified keys" do
      result = subject.get_record_for( pool_type_code, event_type_code, category_type_code, gender_type_code )
      expect( result.pool_type.code ).to      eq( pool_type_code )
      expect( result.event_type.code ).to     eq( event_type_code )
      expect( result.category_type.code ).to  eq( category_type_code )
      expect( result.gender_type.code ).to    eq( gender_type_code )
    end    
    it "returns the tie-in record when requested by parameter and available" do
      subject.add(tie_fixture1)
      subject.add(tie_fixture2)
      result = subject.get_record_for( tie_fixture1.pool_type.code, tie_fixture1.event_type.code, tie_fixture1.category_type.code, tie_fixture1.gender_type.code, true )
      expect( result.meeting_individual_result_id ).to eq( tie_fixture2.id )
    end    
    it "returns the first stored record when requested normally and tie-ins are available" do
      subject.add(tie_fixture1)
      subject.add(tie_fixture2)
      result = subject.get_record_for( tie_fixture1.pool_type.code, tie_fixture1.event_type.code, tie_fixture1.category_type.code, tie_fixture1.gender_type.code )
      expect( result.meeting_individual_result_id ).to eq( tie_fixture1.id )
    end    
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#has_record_for" do
    let( :pool_type_code2 )     { fixture2.pool_type.code }
    let( :event_type_code2 )    { fixture2.event_type.code }
    let( :category_type_code2 ) { fixture2.category_type.code }
    let( :gender_type_code2 )   { fixture2.gender_type.code }

    before( :each ) do
      subject.add(fixture)
      subject.add(fixture2)
    end

    it "returns true for an existing record" do
      expect(
        subject.has_record_for( pool_type_code2, event_type_code2, category_type_code2, gender_type_code2 )
      ).to be_true
    end    
    it "returns false for a non existing record" do
      expect(
        subject.has_record_for( '45', event_type_code2, 'M85', gender_type_code2 )
      ).to be_false
    end    
  end


  describe "#has_tie_in_for" do
    it "returns true for an existing record with same-ranking results (tie-in)" do
      subject.clear()
      subject.add(tie_fixture1)
      subject.add(tie_fixture2)
      expect(
        subject.has_tie_in_for( tie_fixture1.pool_type.code, tie_fixture1.event_type.code, tie_fixture1.category_type.code, tie_fixture1.gender_type.code )
      ).to be_true
    end    
    it "returns false for a record w/o tie-ins" do
      subject.clear()
      subject.add(fixture)
      expect(
        subject.has_tie_in_for( fixture.pool_type.code, fixture.event_type.code, fixture.category_type.code, fixture.gender_type.code )
      ).to be_false
    end    
  end
  #-- -------------------------------------------------------------------------
  #++
end
