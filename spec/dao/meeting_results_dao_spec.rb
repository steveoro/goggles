# encoding: utf-8

require 'rails_helper'
require 'common/format'
require 'ffaker'

describe MeetingResultsDAO, type: :model do

 let(:meeting)             { Meeting.last(300).sample }

  context "MeetingResultsIndividualDAO subelement," do

    subject { MeetingResultsDAO::MeetingResultsIndividualDAO.new(
        id, other_id, rank, complete_name, year_of_birth, team_name, time_swam
       ) }

    it_behaves_like( "(the existance of a method)", [
      :team_id, :swimmer_id,
      :rank, :complete_name, :year_of_birth, :team_name, :time_swam,
      :is_disqualified, :is_personal_best, :reaction_time,
      :standard_points, :meeting_individual_points, :goggle_cup_points, :team_points
    ] )

    it_behaves_like( "(the existance of a method returning a boolean value)", [
      :is_disqualified, :is_personal_best
    ] )

    describe "when initialized without optional parameters" do
      it "returns given values" do
        expect( subject.meeting_program_id ).to eq( id )
        expect( subject.other_id ).to eq( other_id )
        expect( subject.rank ).to eq( rank )
        expect( subject.complete_name).to eq(complete_name)
        expect( subject.year_of_birth).to eq(year_of_birth)
        expect( subject.team_name).to eq(team_name)
        expect( subject.time_swam).to eq(time_swam)
      end
    end

    describe "when initialized with optional parameters" do
      it "returns given values" do
        rea = (rand * 1000).round(2))
        std = (rand * 1000).round(2)
        ind = (rand * 100).to_i
        cup = (rand * 1000).round(2)
        tea = (rand * 1000).round(2)
        result = MeetingResultsDAO::MeetingResultsIndividualDAO.new(
            id, other_id, rank, complete_name, year_of_birth, team_name, time_swam,
            false, true, rea, std, ind, cup, tea)
        expect( subject.meeting_program_id ).to eq( id )
        expect( subject.other_id ).to eq( other_id )
        expect( subject.rank ).to eq( rank )
        expect( subject.complete_name).to eq(complete_name)
        expect( subject.year_of_birth).to eq(year_of_birth)
        expect( subject.team_name).to eq(team_name)
        expect( subject.time_swam).to eq(time_swam)
        expect( result.is_disqualified ).to eq( false )
        expect( result.is_personal_best ).to eq( true )
        expect( result.reaction_time ).to eq( rea )
        expect( result.standard_points ).to eq( std )
        expect( result.meeting_individual_points ).to eq( ind )
        expect( result.goggle_cup_points ).to eq( cup )
        expect( result.team_points ).to eq( tea )
      end
    end

  end
  #-- -------------------------------------------------------------------------
  #++

  context "MeetingResultsProgramDAO subelement," do

    subject { MeetingResultsDAO::MeetingResultsProgramDAO.new( id, event_code, gender_code, category_code ) }

    it_behaves_like( "(the existance of a method)", [
      :meeting_program_id, :event_code, :gender_code, :category_code
    ] )

    it_behaves_like( "(the existance of a method returning an hash)", [
      :results
    ] )

    describe "when initialized without optional parameters" do
      it "returns given values" do
        expect( subject.meeting_program_id ).to eq( id )
        expect( subject.event_code ).to eq( event_code )
        expect( subject.gender_code ).to eq( gender_code )
        expect( subject.category_code ).to eq( category_code )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "MeetingResultsEventDAO subelement," do

    subject { MeetingResultsDAO::MeetingResultsEventDAO.new( id, event_code ) }

    it_behaves_like( "(the existance of a method)", [
      :meeting_event_id, :event_code
    ] )

    it_behaves_like( "(the existance of a method returning an hash)", [
      :programs
    ] )

    describe "when initialized with parameters" do
      it "returns given values and sets defaults" do
        expect( subject.meeting_event_id ).to eq( id )
        expect( subject.event_code ).to eq( event_code )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "MeetingResultsDAO general element," do

    subject { MeetingResultsDAO.new( meeting ) }

    it_behaves_like( "(the existance of a method)", [
      :meeting,
      :updated_at
    ] )

    it_behaves_like( "(the existance of a method returning an hash)", [
      :events
    ] )

    describe "when initialized without optional parameters" do
      it "returns given values, default values and initialize empty data structures" do
        expect( subject.meeting ).to eq( meeting )
        expect( subject.updated_at ).to eq( 0 )
      end
    end

    describe "when initialized with optional parameters" do
      it "returns given values" do
        updated_at = Date.today() - (rand * 1000).to_i
        result = MeetingResultsDAO.new( meeting, updated_at )
        expect( result.meeting ).to eq( meeting )
        expect( result.updated_at ).to eq( updated_at )
      end
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- -------------------------------------------------------------------------
#++
