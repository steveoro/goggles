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
        :count,
        :add,
        :<<,
        :get_record_for,
        :has_record_for,
        :has_tie_in_for,
        :to_hash
      ]
    )
  end

  it "implements the Enumerable interface" do
    expect( subject ).to be_a_kind_of( Enumerable )
  end
  #-- -----------------------------------------------------------------------
  #++

  describe "#to_hash" do
    it "returns an instance of Hash" do
      expect( subject.to_hash ).to be_an_instance_of( Hash )
    end    
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#clear" do
    it "returns this instance" do
      expect( subject.clear ).to be_an_instance_of( RecordCollection )
    end    
    it "adds another element to the internal list" do
      subject.add( fixture3 )
      expect{ subject.clear }.to change{ subject.count }.to(0)
    end    
  end


  describe "#add" do
    it "returns nil with a nil parameter" do
      expect( subject.add(nil) ).to be_nil
    end    
    it "returns the string key of the new element" do
      expect( subject.add(fixture) ).to be_an_instance_of( String )
    end    
    it "adds another element to the list" do
      expect{ subject.add(fixture2) }.to change{ subject.count }.by(1)
    end
    it "does not add twice the same element to the list" do
      subject.clear
      expect{
        subject.add( fixture )
        subject.add( fixture )
      }.to change{ subject.count }.by(1)
      expect{
        subject.add( fixture2 )
        subject.add( fixture2 )
      }.to change{ subject.count }.by(1)
    end
    it "adds correctly 2 different records to the list" do
      subject.clear
      expect{
        subject.add( fixture )
        subject.add( fixture2 )
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
