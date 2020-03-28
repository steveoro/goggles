require 'rails_helper'

describe MeetingResults, type: :strategy do

  let(:meeting)         { Meeting.last(300).sample }

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


  context "well formed instance" do
    subject { MeetingResults.new( meeting ) }

    it_behaves_like( "(the existance of a method)", [
      :meeting,
      :data_retrieved, :max_updated_at, :set_meeting_results_dao
    ] )

    it "assigns attributes as given parameters" do
      expect( subject.meeting ).to eq( meeting )
    end

    it "assigns defaults" do
      expect( subject.max_updated_at ).to eq( 0 )
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
      xit "returns a query result of elements with necessary columns" do
        columns = [
          'meeting_id', 'meeting_name', 'meeting_date', 'federation_code', 'category_code', 'category_age',
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
      xit "returns an empty query result for a date interval in future" do
        sm = SwimmerCareer.new( swimmer, Date.today() + 500, Date.today() + 50 )
        result = sm.retrieve_data
        expect( result ).to be_a_kind_of( ActiveRecord::Result )
        expect( result.count ).to eq( 0 )
      end
      xit "returns an empty query result for a result-less swimmer" do
        new_swimmer = create( :swimmer )
        sm = SwimmerCareer.new( new_swimmer )
        result = sm.retrieve_data
        expect( result ).to be_a_kind_of( ActiveRecord::Result )
        expect( result.count ).to eq( 0 )
      end
    end

    describe "#set_meeting_results_dao" do
      it "returns a MeetingResultsDAO" do
        result = subject.retrieve_data
        expect( subject.set_meeting_results_dao ).to be_an_instance_of( MeetingResultsDAO )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
