require 'rails_helper'


describe SupermasterTeamSwimmerDAO, type: :model do

  let(:fix_swimmer_id)       { Swimmer.find(23).id }
  let(:rnd_meeting_id )      { [18201, 18202, 18205, 18224].sample }
  let(:rnd_date)             { Date.today() - (rand * 300).to_i }
  let(:rnd_event_type_code)  { EventType.are_not_relays.sample.code }
  let(:rnd_minutes )         { (rand * 5).to_i }
  let(:rnd_seconds )         { (rand * 59).to_i }
  let(:rnd_hundreds )        { (rand * 99).to_i }
  let(:rnd_time_swam )       { Timing.new( rnd_hundreds, rnd_seconds, rnd_minutes ) }
  let(:rnd_standard_points ) { 500.00 + (rand * 510).to_i + ((rand * 99).to_i / 100) }

  context "SupermasterEventDetailDAO subclass," do
    subject { SupermasterTeamSwimmerDAO::SupermasterEventDetailDAO.new(
      rnd_meeting_id,
      rnd_date,
      rnd_event_type_code,
      rnd_time_swam,
      rnd_standard_points ) }

    it_behaves_like( "(the existance of a method)", [
      :meeting_id, :scheduled_date, :event_type_code, :time_swam, :standard_points
    ])

    describe "[a well formed instance]" do
      it "has correct verify_parameters values" do
        expect( subject.meeting_id ).to eq( rnd_meeting_id )
        expect( subject.scheduled_date ).to eq( rnd_date )
        expect( subject.event_type_code ).to eq( rnd_event_type_code )
        expect( subject.time_swam ).to eq( rnd_time_swam )
        expect( subject.standard_points ).to eq( rnd_standard_points )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "SupermasterTeamSwimmerDAO," do
    subject { SupermasterTeamSwimmerDAO.new( fix_swimmer_id ) }

    it_behaves_like( "(the existance of a method)", [
      :swimmer_id, :complete_name, :category_type_code, :results
    ])

    it_behaves_like( "(existance of a member array)", [
      :results
    ])

    it_behaves_like( "(the existance of a method returning numeric values)", [
      :get_results_count, :get_total_score, :get_everage_score
    ])

    describe "#set_swimmer_data" do
      it "sets given complete name" do
        subject.complete_name = "Farlcco Nome"
        rnd_name = ["ALLORO STEFANO", "LIGABUE MARCO", "SESENA BARBARA", "BIANCHI ELENA", "BONACINI MONICA"].sample
        expect( subject.complete_name ).not_to eq( rnd_name )
        subject.set_swimmer_data( rnd_name, "" )
        expect( subject.complete_name ).to eq( rnd_name )
      end
      it "sets given category type" do
        subject.category_type_code = "M00"
        rnd_cat = ["U25", "M25", "M30", "M40", "M45"].sample
        expect( subject.category_type_code ).not_to eq( rnd_cat )
        subject.set_swimmer_data( "", rnd_cat )
        expect( subject.category_type_code ).to eq( rnd_cat )
      end
    end

    describe "#add_result_detail" do
      it "returns a number" do
        expect( subject.add_result_detail(rnd_meeting_id, rnd_date, rnd_event_type_code, rnd_time_swam, rnd_standard_points) ).to be >= 0
      end
      it "increase #results count" do
        expect( subject.get_results_count ).to eq( 0 )
        expect( subject.add_result_detail(rnd_meeting_id, rnd_date, rnd_event_type_code, rnd_time_swam, rnd_standard_points) ).to eq( 1 )
        expect( subject.get_results_count ).to eq( 1 )
      end
      it "adds a SupermasterEventDetailDAO element to results" do
        expect( subject.results.size ).to eq( 0 )
        expect( subject.add_result_detail(rnd_meeting_id, rnd_date, rnd_event_type_code, rnd_time_swam, rnd_standard_points) ).to eq( 1 )
        expect( subject.results.size ).to be > 0
        expect( subject.results ).to all(be_an_instance_of( SupermasterTeamSwimmerDAO::SupermasterEventDetailDAO ) )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
