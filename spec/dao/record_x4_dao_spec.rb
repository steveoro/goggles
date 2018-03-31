require 'rails_helper'


describe RecordX4DAO, type: :model do

  #let(:pool)            { PoolType.only_for_meetings[(rand * (PoolType.only_for_meetings.count - 1)).round(0)].code }
  #let(:gender)          { GenderType.individual_only[(rand * (GenderType.individual_only.count - 1)).round(0)].code }
  #let(:event)           { EventType.are_not_relays.for_fin_calculation[(rand * (EventType.are_not_relays.for_fin_calculation.count - 1)).round(0)].code }
  #let(:category)        { CategoryType.are_not_relays[(rand * (CategoryType.are_not_relays.count - 1)).round(0)].code }
  #let(:record_type)     { RecordType.all[(rand * (RecordType.all.count - 1)).round(0)] }

  let(:gender_type)     { GenderType.individual_only.sample }
  let(:pool_type)       { PoolType.only_for_meetings.sample }
  let(:event_type)      { EventType.are_not_relays.for_fin_calculation.sample }
  let(:category_type)   { CategoryType.are_not_relays.sample }
  let(:record_type)     { RecordType.all.sample }

  let(:gender)          { gender_type.code }
  let(:pool)            { pool_type.code }
  let(:event)           { event_type.code }
  let(:category)        { category_type.code }

  let(:mir)             { create( :meeting_individual_result ) }
  let(:swimmer)         { mir.swimmer }

  context "RecordElementDAO subclass," do

    describe "[a well formed instance]" do
      subject { RecordX4DAO::RecordElementDAO.new( pool_type, gender_type, event_type, category_type, mir, swimmer ) }

      it_behaves_like( "(the existance of a method)", [
        :get_pool_type,
        :get_gender_type,
        :get_event_type,
        :get_category_type,
        :get_record_instance,
        :get_record_date
      ] )

      it_behaves_like( "(the existance of a method returning strings)", [
        :get_record_timing,
        :get_record_code
      ] )

      describe "#parameters," do
        it "are the given parameters" do
          expect( subject.pool_type ).to eq( pool_type )
          expect( subject.gender_type ).to eq( gender_type )
          expect( subject.event_type ).to eq( event_type )
          expect( subject.category_type ).to eq( category_type )
          expect( subject.record ).to eq( mir )
          expect( subject.swimmer ).to eq( swimmer )
       end
      end

      describe "#get_pool_type," do
        it "returns a string" do
          expect( subject.get_pool_type ).to be_an_instance_of( String )
        end
        it "returns the pool parameter set" do
          expect( subject.get_pool_type ).to eq( pool_type.code )
        end
      end

      describe "#get_gender_type," do
        it "returns a string" do
          expect( subject.get_gender_type ).to be_an_instance_of( String )
        end
        it "returns the pool parameter set" do
          expect( subject.get_gender_type ).to eq( gender_type.code )
        end
      end

      describe "#get_event_type," do
        it "returns a string" do
          expect( subject.get_event_type ).to be_an_instance_of( String )
        end
        it "returns the pool parameter set" do
          expect( subject.get_event_type ).to eq( event_type.code )
        end
      end

      describe "#get_category_type," do
        it "returns a string" do
          expect( subject.get_category_type ).to be_an_instance_of( String )
        end
        it "returns the pool parameter set" do
          expect( subject.get_category_type ).to eq( category_type.code )
        end
      end

      describe "#get_record_instance," do
        it "returns a meeting individual result" do
          expect( subject.get_record_instance ).to be_an_instance_of( MeetingIndividualResult )
        end
        it "returns the pool parameter set" do
          expect( subject.get_record_instance ).to eq( mir )
        end
      end

      describe "#get_record_timing," do
        it "retrurns the record timing" do
          expect( subject.get_record_timing ).to eq( mir.get_timing )
        end
      end

      describe "#get_record_date," do
        it "retrurns the meeting scheduled date" do
          expect( subject.get_record_date ).to eq( mir.get_scheduled_date )
        end
      end

      describe "#get_record_code," do
        it "retrurns the record hash code" do
          expect( subject.get_record_code ).to include(pool)
          expect( subject.get_record_code ).to include(gender)
          expect( subject.get_record_code ).to include(category)
          expect( subject.get_record_code ).to include(event)
          expect( subject.get_record_code ).to eq(gender + '-' + pool + '-' + category + '-' + event)
        end
      end
    end
    #-- -------------------------------------------------------------------------

    describe "without requested parameters" do
      it "raises an exception for wrong record parameter" do
        expect{ RecordX4dDAO::RecordElementDAO.new( pool_type, gender_type, event_type, category_type, 'WRONG_RECORD' ) }.to raise_error( ArgumentError )
        expect{ RecordX4dDAO::RecordElementDAO.new( pool_type, gender_type, event_type, category_type ) }.to raise_error( ArgumentError )
      end
    end
    #-- -------------------------------------------------------------------------
  end
  #-- -------------------------------------------------------------------------
  #++

  subject { RecordX4DAO.new( "Something", record_type ) }

  describe "[a well formed instance]" do

    it_behaves_like( "(existance of a member array)", [
      :gender_types, :pool_types
    ])

    it_behaves_like( "(the existance of a method)", [
      :add_record,
      :record_count,
      :has_record_for?,
      :get_record_instance,
      :get_record_attribute,
      :get_record,
      :create_record_code
    ] )

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

  describe "without requested parameters," do
    it "raises an exception for missing parameter" do
      expect{ RecordX4DAO.new() }.to raise_error( ArgumentError )
      expect{ RecordX4DAO.new( "Something" ) }.to raise_error( ArgumentError )
    end
    it "raises an exception for wrong record parameter" do
      expect{ RecordX4DAO.new( "Something", "Wrong record type" ) }.to raise_error( ArgumentError )
    end
  end

  describe "#add_record," do
    it "returns a boolean" do
      expect( subject.add_record( mir ) ).to eq( true ).or eq( false )
    end
    it "adds an element to records collection" do
      record_num = subject.records.size
      expect( subject.add_record( mir ) ).to eq( true )
      expect( subject.records.size ).to be > record_num
    end
    it "adds an element to records collection if optional parameters given" do
      record_num = subject.records.size
      expect( subject.add_record( mir, category_type, pool_type, gender_type, event_type ) ).to eq( true )
      expect( subject.records.size ).to be > record_num
    end
    it "doesn't add an element to records collection if wrong parameters" do
      record_num = subject.records.size
      expect( subject.add_record( "wrong_par" ) ).to eq( false )
      expect( subject.records.size ).to eq( record_num )
    end
    it "replace an element to records collection if already present" do
      expect( subject.add_record( mir, category_type, pool_type, gender_type, event_type ) ).to eq( true )
      record_num = subject.records.size
      expect( subject.add_record( mir, category_type, pool_type, gender_type, event_type ) ).to eq( true )
      expect( subject.add_record( create( :meeting_individual_result ), category_type, pool_type, gender_type, event_type ) ).to eq( true )
      expect( subject.records.size ).to eq( record_num )
    end
    it "adds an element of RecordElement type" do
      expect( subject.records.size ).to eq( 0 )
      subject.add_record( mir )
      code = subject.create_record_code( mir.pool_type.code, mir.gender_type.code, mir.event_type.code, mir.category_type.code )
      expect( subject.records.size ).to eq( 1 )
      expect( subject.records[code] ).to be_an_instance_of( RecordX4DAO::RecordElementDAO )
    end
    it "increases member arrays" do
      expect( subject.records.size ).to eq( 0 )
      expect( subject.gender_types.size ).to eq( 0 )
      expect( subject.pool_types.size ).to eq( 0 )
      expect( subject.category_types.size ).to eq( 0 )
      expect( subject.event_types.size ).to eq( 0 )
      subject.add_record( mir )
      expect( subject.records.size ).to eq( 1 )
      expect( subject.gender_types.size ).to eq( 1 )
      expect( subject.pool_types.size ).to eq( 1 )
      expect( subject.category_types.size ).to eq( 1 )
      expect( subject.event_types.size ).to eq( 1 )
    end
    it "uses record pool, gender, event and category if not forced" do
      subject.add_record( mir )
      code = subject.create_record_code( mir.pool_type.code, mir.gender_type.code, mir.event_type.code, mir.category_type.code )
      expect( subject.records[code].get_pool_type ).to eq( mir.pool_type.code )
      expect( subject.records[code].get_gender_type ).to eq( mir.gender_type.code )
      expect( subject.records[code].get_event_type ).to eq( mir.event_type.code )
      expect( subject.records[code].get_category_type ).to eq( mir.category_type.code )
    end
    it "uses forced pool, gender, event and category instead of record ones if forced" do
      subject.add_record( mir, category_type, pool_type, gender_type, event_type )
      code = subject.create_record_code( pool_type.code, gender_type.code, event_type.code, category_type.code )
      expect( subject.records[code].get_pool_type ).to eq( pool )
      expect( subject.records[code].get_gender_type ).to eq( gender )
      expect( subject.records[code].get_event_type ).to eq( event )
      expect( subject.records[code].get_category_type ).to eq( category )
    end
  end

  describe "#record_count," do
    it "returns a number" do
      expect( subject.record_count ).to be >= 0
    end
    it "returns 0 for empty record collection" do
      expect( subject.records.size ).to eq( 0 )
      expect( subject.record_count ).to eq( 0 )
    end
    it "returns the number of records colelction" do
      subject.add_record( mir )
      expect( subject.records.size ).to be > 0
      expect( subject.record_count ).to eq( subject.records.size )
    end
  end

  describe "#has_record_for?," do
    it "returns false if no records present" do
      expect( subject.records.size ).to eq( 0 )
      expect( subject.has_record_for?( pool, gender, event, category ) ).to eq( false )
    end
    it "returns false if no record present for given parameters" do
      subject.add_record( mir )
      expect( subject.records.size ).to be > 0
      expect( subject.has_record_for?( 'not_possible_pool', 'impossible_gender', 'unknown_event', 'non_existent_category' ) ).to eq( false )
    end
    it "returns true if record present for given parameters" do
      subject.add_record( mir, category_type, pool_type, gender_type, event_type )
      expect( subject.has_record_for?( pool, gender, event, category ) ).to eq( true )
    end
  end

  describe "#get_record_instance," do
    it "returns nil if no records set" do
      expect( subject.records.size ).to eq( 0 )
      expect( subject.get_record_instance( pool, gender, event, category ) ).to be nil
    end
    it "returns a meeting individual record if record present" do
      subject.add_record( mir, category_type, pool_type, gender_type, event_type )
      expect( subject.get_record_instance( pool, gender, event, category ) ).to be_an_instance_of( MeetingIndividualResult )
    end
  end

  describe "#get_record," do
    it "returns nil if no records set" do
      expect( subject.records.size ).to eq( 0 )
      expect( subject.get_record( pool, gender, event, category ) ).to be nil
    end
    xit "returns nil if no record set for given parameters" do
      expect( subject.records.size ).to be > 0
    end
    it "returns a recordDAO if record present and attribute not set" do
      subject.add_record( mir, category_type, pool_type, gender_type, event_type )
      expect( subject.get_record( pool, gender, event, category ) ).to be_an_instance_of( RecordX4DAO::RecordElementDAO )
    end
  end
    
  describe "#get_record_attribute," do
    it "returns nil if no records set" do
      expect( subject.records.size ).to eq( 0 )
      expect( subject.get_record_attribute( pool, gender, event, category ) ).to be nil
      expect( subject.get_record_attribute( pool, gender, event, category, :get_record_timing ) ).to be nil
      expect( subject.get_record_attribute( pool, gender, event, category, :get_record_date ) ).to be nil
      expect( subject.get_record_attribute( pool, gender, event, category, :get_record_swimmer ) ).to be nil
      expect( subject.get_record_attribute( pool, gender, event, category, :get_record_meeting ) ).to be nil
    end
    it "returns the record element timing if timing is requested" do
      subject.add_record( mir, category_type, pool_type, gender_type, event_type )
      code = subject.create_record_code( pool, gender, event, category )
      expect( subject.get_record_attribute( pool, gender, event, category, :get_record_timing ) ).to eq( subject.records[code].get_record_timing )
    end
    it "returns the record element date if date is requested" do
      subject.add_record( mir, category_type, pool_type, gender_type, event_type )
      code = subject.create_record_code( pool, gender, event, category )
      expect( subject.get_record_attribute( pool, gender, event, category, :get_record_date ) ).to eq( subject.records[code].get_record_date )
    end
  end

  #-- -------------------------------------------------------------------------
  #++
end
