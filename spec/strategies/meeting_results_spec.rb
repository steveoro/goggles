require 'rails_helper'

describe MeetingResults, type: :strategy do

  let(:meeting)         { Meeting.last(300).sample }

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
      it "returns a query result of elements with necessary columns" do
        columns = [
          'session_order', 'event_order', 'event_code', 'heat_type', 'gender_code', 'age_begin', 'category_code', 'rank', 'is_disqualified', 'minutes',
          'seconds', 'hundreds', 'is_personal_best', 'reaction_time', 'standard_points', 'meeting_individual_points', 'goggle_cup_points', 'team_points',
          'complete_name', 'year_of_birth', 'team_name', 'team_id', 'swimmer_id', 'meeting_event_id', 'meeting_program_id'
        ]
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
