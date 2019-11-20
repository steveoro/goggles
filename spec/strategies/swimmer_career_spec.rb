require 'rails_helper'

describe SwimmerCareer, type: :strategy do

  let(:swimmer)         { Swimmer.first(300).sample }

  # Data valid past 01/10/2019
  # Leega data amount still increases, so use always with >=
  let(:leega)           { Swimmer.find(23) }
  let(:leega_results)   { 400 }
  let(:leega_meet_25)   { 133 }
  let(:leega_cat_25)    { 4 }
  let(:leega_eve_25)    { 17 }
  let(:leega_meet_50)   { 70 }
  let(:leega_cat_50)    { 4 }
  let(:leega_eve_50)    { 14 }

  let(:passage_keys)    {[
                          :length_in_meters,
                          :minutes, :seconds, :hundreds,
                          :minutes_from_start, :seconds_from_start, :hundreds_from_start
                        ]}


  context "well formed instance" do
    subject { SwimmerCareer.new( swimmer ) }

    it_behaves_like( "(the existance of a method)", [
      :swimmer, :to_date, :from_date,
      :data_retrieved
    ] )

    it "assigns attributes as given parameters" do
      expect( subject.swimmer ).to eq( swimmer )
    end

    it "assigns defaults" do
      expect( subject.to_date ).to eq( Date.today() )
      expect( subject.from_date ).to eq( 0 )
    end

    it "creates empty readable attributes" do
      expect( subject.data_retrieved ).to be_nil
    end

    describe "#retrieve_data" do
      it "returns a relation and sets date_retrieved" do
        expect( subject.data_retrieved ).to be_nil
        result = subject.retrieve_data
        expect( result ).to be_a_kind_of( ActiveRecord::Result )
        expect( subject.data_retrieved ).to be_a_kind_of( ActiveRecord::Result )
        expect( subject.data_retrieved ).to eq( result )
      end
      it "returns a query result of elements with necessary columns" do
        columns = [
          'meeting_id', 'meeting_name', 'meeting_date', 'federation_code', 'category_code',
          'pool_code', 'event_code', 'event_order', 'result_id', 'minutes', 'seconds', 'hundreds', 'is_personal_best', 'is_disqualified', 'updated_at',
          'passages'
        ]
        result = subject.retrieve_data
        result.each do |element|
          expect( element.size ).to eq( columns.size )
          columns.each do |column|
            expect( element.has_key?(column) ).to eq(true)
          end
        end
      end
      it "returns an empty query result for a date interval in future" do
        sm = SwimmerCareer.new( swimmer, Date.today() + 500, Date.today() + 50 )
        result = sm.retrieve_data
        expect( result ).to be_a_kind_of( ActiveRecord::Result )
        expect( result.count ).to eq( 0 )
      end
      it "returns an empty query result for a result-less swimmer" do
        new_swimmer = create( :swimmer )
        sm = SwimmerCareer.new( new_swimmer )
        result = sm.retrieve_data
        expect( result ).to be_a_kind_of( ActiveRecord::Result )
        expect( result.count ).to eq( 0 )
      end
    end

    describe "#set_swimmer_career_dao" do
      it "returns a SwimmerCareerDAO" do
        result = subject.retrieve_data
        expect( subject.set_swimmer_career_dao ).to be_an_instance_of( SwimmerCareerDAO )
      end
    end

    describe "#extract_passages" do
      it "returns an empty array if no parameters given" do
        result = subject.extract_passages( passage_keys )
        expect( result ).to be_a_kind_of( Array )
        expect( result.size ).to eq( 0 )
      end
      it "returns an empty array if 'null' string given" do
        result = subject.extract_passages( passage_keys, 'null' )
        expect( result ).to be_a_kind_of( Array )
        expect( result.size ).to eq( 0 )
      end
      it "returns a non empty array if data string given" do
        data = '50;zio;pippo,100;20;23'
        result = subject.extract_passages( passage_keys, data )
        expect( result ).to be_a_kind_of( Array )
        expect( result.size ).to eq( 2 )
      end
      it "returns an array of empty hash if wrong data string given" do
        data = '50;zio;pippo,100;20;23'
        result = subject.extract_passages( passage_keys, data )
        result.each do |passage|
          expect( passage ).to be_a_kind_of( Hash )
          expect( passage.size ).to eq( 0 )
        end
      end
      it "returns an array of non empty hash if good data string given" do
        data = '50;0;34;12;0;34;12,100;0;37;2;1;11;14,150;0;39;56;1;50;70,200;0;40;53;2;31;23'
        result = subject.extract_passages( passage_keys, data )
        result.each do |passage|
          expect( passage ).to be_a_kind_of( Hash )
          expect( passage.size ).to eq( passage_keys.size )
        end
      end
    end

    describe "#extract_passage" do
      it "returns an empty hash if no parameters given" do
        result = subject.extract_passage( passage_keys )
        expect( result ).to be_a_kind_of( Hash )
        expect( result.size ).to eq( 0 )
      end
      it "returns an empty hash if 'null' string given" do
        result = subject.extract_passage( passage_keys, 'null' )
        expect( result ).to be_a_kind_of( Hash )
        expect( result.size ).to eq( 0 )
      end
      it "returns an empty hash if wrong string given" do
        result = subject.extract_passage( passage_keys, '50;zio;pippo' )
        expect( result ).to be_a_kind_of( Hash )
        expect( result.size ).to eq( 0 )
      end
      it "returns an hash if data string given" do
        data = ['100', '0', '35', '27', '1', '08', '89']
        result = subject.extract_passage( passage_keys, data.join(';') )
        expect( result ).to be_a_kind_of( Hash )
        expect( result.size ).to eq( passage_keys.length )
        passage_keys.each do |key|
          expect( result.has_key?( key )).to eq( true )
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # This context is to ensure results of data retrieving are those desidered
  # based on known data (of Leega)
  context "for Leega (a swimmer with long career)" do
    subject { SwimmerCareer.new( leega ) }

    describe "#retrieve_data" do
      it "return an hash with at least Leega's number results" do
        result = subject.retrieve_data
        expect( result ).to be_a_kind_of( ActiveRecord::Result )
        expect( result.count ).to be >= leega_results
      end
    end

    describe "#set_swimmer_career_dao" do
      it "return an hash with at least Leega's number results" do
        subject.retrieve_data
        cs = subject.set_swimmer_career_dao
        expect( cs ).to be_an_instance_of( SwimmerCareerDAO )
        expect( cs.pool_types.size ).to eq( 2 )
        expect( cs.pool_types.has_key?( '25' ) ).to eq( true )
        expect( cs.pool_types.has_key?( '50' ) ).to eq( true )
        pt25 = cs.get_pool( '25' )
        expect( pt25.meetings.size ).to be >= leega_meet_25
        expect( pt25.categories.size ).to be >= leega_cat_25
        expect( pt25.events.size ).to be >= leega_eve_25
        expect( pt25.meetings[5].results.has_key?('50SL') ).to eq( true )
        expect( pt25.meetings[5].results.has_key?('100MI') ).to eq( true )
        expect( pt25.meetings[5].results['50SL'].time_swam ).to eq( Timing.new( 20, 36 ) )
        pt50 = cs.get_pool( '50' )
        expect( pt50.meetings.size ).to be >= leega_meet_50
        expect( pt50.categories.size ).to be >= leega_cat_50
        expect( pt50.events.size ).to be >= leega_eve_50
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
