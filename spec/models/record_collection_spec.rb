require 'spec_helper'


describe RecordCollection do
  # Use pre-loaded seeds:
  let( :results )  { MeetingIndividualResult.where( swimmer_id: 142 ) }
  let( :fixture )  { results.at( ((rand * 1000) % results.size).to_i ) }
  let( :fixture2 ) { results.at( ((rand * 1000) % results.size).to_i ) }
  let( :fixture3 ) { results.at( ((rand * 1000) % results.size).to_i ) }

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
      subject.add(fixture3)
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
    it "adds another element to the internal list" do
      expect{ subject.add(fixture2) }.to change{ subject.count }.by(1)
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

    it "returns an instance of MeetingIndividualResult" do
      expect(
        subject.get_record_for( pool_type_code, event_type_code, category_type_code, gender_type_code )
      ).to be_an_instance_of( MeetingIndividualResult )
    end    
    it "returns the corresponding individual result for the specified keys" do
      result = subject.get_record_for( pool_type_code, event_type_code, category_type_code, gender_type_code )
      expect( result.pool_type.code ).to      eq( pool_type_code )
      expect( result.event_type.code ).to     eq( event_type_code )
      expect( result.category_type.code ).to  eq( category_type_code )
      expect( result.gender_type.code ).to    eq( gender_type_code )
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
        subject.has_record_for( fixture3.pool_type.code, fixture3.event_type.code, fixture3.category_type.code, fixture3.gender_type.code )
      ).to be_false
    end    
  end
  #-- -------------------------------------------------------------------------
  #++
end
