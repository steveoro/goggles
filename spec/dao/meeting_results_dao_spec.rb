# encoding: utf-8

require 'rails_helper'
require 'common/format'
require 'ffaker'

describe MeetingResultsDAO, type: :model do

  let(:meeting)             { Swimmer.last(300).sample }
  let(:id)                  { (rand * 10000).to_i + 1 }
  let(:other_id)            { (rand * 10000).to_i + 1 }
  let(:rank)                { (rand * 15).to_i + 1 }
  let(:year_of_birth)       { (rand * 75).to_i + 1920 }
  let(:complete_name)       { FFaker::NameIT.name }
  let(:team_name)           { FFaker::Lorem.word.camelcase + ' Team' }
  let(:event_code)          { EventType.are_not_relays.sample.code }
  let(:gender_code)         { GenderType.all.sample.code }
  let(:category_code)       { CategoryType.where( season_id: [191, 192] ).sample.code }
  let(:event_order)         { (rand * 20).to_i }
  let(:minutes)             { (rand * 2).to_i }
  let(:seconds)             { (rand * 59).to_i }
  let(:hundreds)            { (rand * 99).to_i }
  let(:time_swam)           { Timing.new( hundreds, seconds, minutes ) }

  context "MeetingResultsIndividualDAO subelement," do

    subject { MeetingResultsDAO::MeetingResultsIndividualDAO.new(
        id, other_id, rank, complete_name, year_of_birth, team_name, time_swam
       ) }

    it_behaves_like( "(the existance of a method)", [
      :team_id, :swimmer_id,
      :rank, :complete_name, :year_of_birth, :team_name,
      :reaction_time, :time_swam, :is_disqualified, :is_personal_best,
      :standard_points, :meeting_individual_points, :goggle_cup_points, :team_points
    ] )
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
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- -------------------------------------------------------------------------
#++
