# encoding: utf-8

require 'rails_helper'
require 'common/format'
require 'ffaker'

describe SwimmerCareerDAO, type: :model do

  let(:swimmer)             { Swimmer.first(300).sample }
  let(:meeting_date)        { Date.today() }
  let(:meeting_id)          { (rand * 10000).to_i }
  let(:meeting_name)        { ( rand * 50 ).to_i.to_s + ' ' + FFaker::Lorem.word.camelcase + ' meeting' }
  let(:federation_code)     { FederationType.all.sample.code }
  let(:pool_code)           { PoolType.all.sample.code }
  let(:category_code)       { CategoryType.where( season_id: 192 ).sample.code }
  let(:event_code)          { EventType.are_not_relays.sample.code }
  let(:passage_code)        { PassageType.all.sample.code }
  let(:minutes)             { (rand * 2).to_i }
  let(:seconds)             { (rand * 59).to_i }
  let(:hundreds)            { (rand * 99).to_i }
  let(:time_swam)           { Timing.new( hundreds, seconds, minutes ) }

  context "SwimmerCareerResultDAO subelement," do

    subject { SwimmerCareerDAO::SwimmerCareerResultDAO.new( event_code, time_swam ) }

    it_behaves_like( "(the existance of a method)", [
      :event_code, :time_swam,
      :standard_points, :individual_points, :meeting_points
    ] )

    it_behaves_like( "(the existance of a method returning an hash)", [
      :passages
    ] )

    describe "when initialized without optional parameters" do
      it "returns given values" do
        expect( subject.event_code ).to eq( event_code )
        expect( subject.time_swam ).to eq( time_swam )
        expect( subject.standard_points ).to be_nil
        expect( subject.individual_points ).to be_nil
        expect( subject.meeting_points ).to be_nil
      end
    end

    describe "when initialized with optional parameters" do
      it "returns given values" do
        std = (rand * 1000).round(2)
        ind = (rand * 100).to_i
        mtg = (rand * 1000).round(2)
        result = SwimmerCareerDAO::SwimmerCareerResultDAO.new( event_code, time_swam, std, ind, mtg )
        expect( result.event_code ).to eq( event_code )
        expect( result.time_swam ).to eq( time_swam )
        expect( result.standard_points ).to eq( std )
        expect( result.individual_points ).to eq( ind )
        expect( result.meeting_points ).to eq( mtg )
      end
    end

    describe "#add_passage" do
      it "adds an element to passages and returns passages count" do
        prev_size = subject.passages.size
        count = subject.add_passage( passage_code, time_swam )
        expect( count ).to eq( prev_size + 1 )
        expect( subject.passages.size ).to eq( count )
      end

      it "sets the given result key in results structure" do
        another_key = '37' # Passage surely not already present
        subject.add_passage( passage_code, time_swam )
        count = subject.add_passage( another_key, time_swam )
        expect( subject.passages.size ).to eq( count )
        expect( subject.passages.has_key?( passage_code )).to eq( true )
        expect( subject.passages.has_key?( another_key )).to eq( true )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "SwimmerCareerMeetingDAO subelement," do

    subject { SwimmerCareerDAO::SwimmerCareerMeetingDAO.new( meeting_id, meeting_date, meeting_name, federation_code, category_code ) }

    it_behaves_like( "(the existance of a method)", [
      :meeting_id, :meeting_date, :meeting_name, :federation_code, :category_code,
      :results
    ] )

    describe "when initialized with parameters" do
      it "returns given values and initialize empty data structures" do
        expect( subject.meeting_id ).to eq( meeting_id )
        expect( subject.meeting_date ).to eq( meeting_date )
        expect( subject.meeting_name ).to eq( meeting_name )
        expect( subject.federation_code ).to eq( federation_code )
        expect( subject.category_code ).to eq( category_code )
        expect( subject.results.size ).to eq( 0 )
      end
    end

    describe "#add_result" do
      it "adds an element to results and returns results count" do
        prev_size = subject.results.size
        count = subject.add_result( event_code, time_swam )
        expect( count ).to eq( prev_size + 1 )
        expect( subject.results.size ).to eq( count )
      end

      it "sets the given result key in results structure" do
        another_eve = '130FO' # Event surely not already present
        subject.add_result( event_code, time_swam )
        count = subject.add_result( another_eve, time_swam )
        expect( subject.results.size ).to eq( count )
        expect( subject.results.has_key?( event_code )).to eq( true )
        expect( subject.results.has_key?( another_eve )).to eq( true )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "SwimmerCareerPoolDAO subelement," do

    subject { SwimmerCareerDAO::SwimmerCareerPoolDAO.new( pool_code ) }

    it_behaves_like( "(the existance of a method)", [
      :pool_code
    ] )

    it_behaves_like( "(the existance of a method returning an hash)", [
      :meetings, :categories, :events
    ] )

    describe "when initialized with parameters" do
      it "returns given values" do
        expect( subject.pool_code ).to eq( pool_code )
      end
      it "initializes empty data structures" do
        expect( subject.meetings.size ).to eq( 0 )
        expect( subject.categories.size ).to eq( 0 )
        expect( subject.events.size ).to eq( 0 )
      end
    end

    describe "#add_meeting" do
      it "adds an element to meetings and returns meetings count" do
        prev_size = subject.meetings.size
        count = subject.add_meeting( meeting_id, meeting_date, meeting_name, federation_code, category_code )
        expect( count ).to eq( prev_size + 1 )
        expect( subject.meetings.size ).to eq( count )
      end

      it "sets the given meeting key in meetings structure" do
        another_key = meeting_id + 10
        subject.add_meeting( meeting_id, meeting_date, meeting_name, federation_code, category_code )
        count = subject.add_meeting( another_key, meeting_date, meeting_name, federation_code, category_code )
        expect( subject.meetings.size ).to eq( count )
        expect( subject.meetings.has_key?( meeting_id )).to eq( true )
        expect( subject.meetings.has_key?( another_key )).to eq( true )
      end

      it "adds the given category in categories structure" do
        another_key = meeting_id + 10
        another_cat = 'Z23' # Category surely not already present
        subject.add_meeting( meeting_id, meeting_date, meeting_name, federation_code, category_code )
        subject.add_meeting( another_key, meeting_date, meeting_name, federation_code, category_code )
        count = subject.add_meeting( -527, meeting_date, meeting_name, federation_code, another_cat )
        expect( subject.categories.has_key?( category_code )).to eq( true )
        expect( subject.categories.has_key?( another_cat )).to eq( true )
        expect( subject.meetings.size ).to eq( count )
        expect( count ).to eq( 3 )
        expect( subject.categories.size ).to eq( 2 )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "SwimmerCareerDAO general element," do

    subject { SwimmerCareerDAO.new( swimmer ) }

    it_behaves_like( "(the existance of a method)", [
      :swimmer, :to_date, :from_date,
      :updated_at
    ] )
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- -------------------------------------------------------------------------
#++
