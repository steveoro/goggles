require 'spec_helper'

shared_examples_for "(existance of a member array)" do |member_name_array|
  member_name_array.each do |member_name|
    it "responds to ##{member_name}" do
      expect( subject ).to respond_to( member_name )
    end

    it "has a ##{member_name} array" do
      expect( subject.send(member_name.to_sym) ).to be_a_kind_of( Array )
    end
  end
end


describe RecordX4dDAO, :type => :model do

  let(:pool)            { PoolType.only_for_meetings[(rand * (PoolType.only_for_meetings.count - 1)).to_i].code }
  let(:gender)          { GenderType.individual_only[(rand * (GenderType.individual_only.count - 1)).to_i].code }
  let(:event)           { EventType.are_not_relays.for_fin_calculation[(rand * (EventType.are_not_relays.for_fin_calculation.count - 1)).to_i].code }
  let(:category)        { CategoryType.are_not_relays[(rand * (CategoryType.are_not_relays.count - 1)).to_i].code }
  let(:mir)             { create( :meeting_individual_result ) }
  let(:record_type)     { RecordType.all[(rand * (RecordType.all.count - 1)).to_i] }

  context "RecordElementDAO subclass," do

    describe "[a well formed instance]" do
      subject { RecordX4dDAO::RecordElementDAO.new( pool, gender, event, category, mir ) }
      
      it_behaves_like( "(the existance of a method)", [
        :get_pool_type,
        :get_gender_type,
        :get_event_type,
        :get_category_type,
      ] )
        
      describe "#parameters," do
        it "are the given parameters" do
          expect( subject.pool_type_code ).to eq( pool )
          expect( subject.gender_type_code ).to eq( gender )
          expect( subject.event_type_code ).to eq( event )
          expect( subject.category_type_code ).to eq( category )
          expect( subject.record ).to eq( mir )
       end
      end
  
      describe "#get_pool_type," do
        it "returns a string" do
          expect( subject.get_pool_type ).to be_an_instance_of( String )
        end
        it "returns the pool parameter set" do
          expect( subject.get_pool_type ).to eq( pool )
        end
      end
  
      describe "#get_gender_type," do
        it "returns a string" do
          expect( subject.get_gender_type ).to be_an_instance_of( String )
        end
        it "returns the pool parameter set" do
          expect( subject.get_gender_type ).to eq( gender )
        end
      end
  
      describe "#get_event_type," do
        it "returns a string" do
          expect( subject.get_event_type ).to be_an_instance_of( String )
        end
        it "returns the pool parameter set" do
          expect( subject.get_event_type ).to eq( event )
        end
      end
  
      describe "#get_category_type," do
        it "returns a string" do
          expect( subject.get_category_type ).to be_an_instance_of( String )
        end
        it "returns the pool parameter set" do
          expect( subject.get_category_type ).to eq( category )
        end
      end
  
      describe "#get_record," do
        it "returns a meeting individual result" do
          expect( subject.get_record ).to be_an_instance_of( MeetingIndividualResult )
        end
        it "returns the pool parameter set" do
          expect( subject.get_record ).to eq( mir )
        end
      end
    end
    #-- -------------------------------------------------------------------------
    
    describe "without requested parameters" do
      it "raises an exception for wrong record parameter" do
        expect{ RecordX4dDAO::RecordElementDAO.new( pool, gender, event, category, 'WRONG_RECORD' ) }.to raise_error( ArgumentError )
        expect{ RecordX4dDAO::RecordElementDAO.new( pool, gender, event, category ) }.to raise_error( ArgumentError )
      end
    end
    #-- -------------------------------------------------------------------------
  end
  #-- -------------------------------------------------------------------------
  #++
  
  subject { RecordX4dDAO.new( "Something", record_type ) }

  describe "[a well formed instance]" do

    it_behaves_like( "(existance of a member array)", [
      :records
    ])
      
    describe "#parameters," do
      it "are the given parameters" do
        expect( subject.owner ).to eq( "Something" )
        expect( subject.record_type ).to eq( record_type )
     end
    end
    #-- -------------------------------------------------------------------------

  end
  #-- -------------------------------------------------------------------------
  #++

  describe "without requested parameters" do
    it "raises an exception for missing parameter" do
      expect{ RecordX4dDAO.new() }.to raise_error( ArgumentError )
      expect{ RecordX4dDAO.new( "Something" ) }.to raise_error( ArgumentError )
    end
    it "raises an exception for wrong record parameter" do
      expect{ RecordX4dDAO.new( "Something", "Wrong record type" ) }.to raise_error( ArgumentError )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
