# encoding: utf-8

require 'rails_helper'
require 'common/format'
require 'ffaker'

describe MeetingScheduleDAO, type: :model do

  let(:meeting)             { Meeting.last(100).sample }
  let(:gender_code)         { EventType.all.sammple.code }
  let(:category_code)       { CategoryType.where( season_id: [191, 192] ).sample.code }
  let(:event_code)          { EventType.all.sample.code }
  let(:pool_code)           { PoolType.all.sample.code }
  let(:session_order)       { ( rand * 6 ).to_i + 1 }
  let(:event_order)         { ( rand * 22 ).to_i + 1 }
  let(:heat_type)           { HeatType.all.sample.i18n_description }
  let(:boolean1)            { [true, false].sample }
  let(:boolean2)            { [true, false].sample }
  let(:boolean3)            { [true, false].sample }
  let(:date)                { Date.today() }
  let(:day_part)            { DayPartType.all.sample.i18n_description }
  let(:hour)                { (rand * 24).to_i }
  let(:minute)              { (rand * 60).to_i }
  let(:time1)               { "#{hour}:#{minute}" }
  let(:time2)               { "#{hour}:#{minute}" }
  let(:pool_name)           { FFaker::Lorem.word }
  let(:address)             { FFaker::Address.street_name }
  let(:notes)               { FFaker::Lorem.word }

  context "MeetingScheduleEventDAO subelement," do

    subject { MeetingScheduleDAO::MeetingScheduleEventDAO.new( event_code ) }

    it_behaves_like( "(the existance of a method)", [
      :event_code,
      :event_order, :heat_type, :is_out_of_race, :has_separate_gender, :has_separate_categories, :notes
    ] )

    describe "when initialized without optional parameters" do
      it "returns given values and sets defaults" do
        expect( subject.event_code ).to eq( event_code )
        expect( subject.event_order ).to eq( 0 )
        expect( subject.heat_type ).to be_nil
        expect( subject.is_out_of_race ).to eq( false )
        expect( subject.has_separate_gender ).to eq( true )
        expect( subject.has_separate_categories ).to eq( false )
        expect( subject.notes ).to eq( '' )
      end
    end

    describe "when initialized with optional parameters" do
      it "returns given values" do
        result = MeetingScheduleDAO::MeetingScheduleEventDAO.new( event_code, event_order, heat_type, boolean1, boolean2, boolean3, notes )
        expect( result.event_code ).to eq( event_code )
        expect( result.event_order ).to eq( event_order )
        expect( result.heat_type ).to eq( heat_type )
        expect( result.is_out_of_race ).to eq( boolean1 )
        expect( result.has_separate_gender ).to eq( boolean2 )
        expect( result.has_separate_categories ).to eq( boolean3 )
        expect( result.notes ).to eq( notes )
      end
    end
  end

  context "MeetingScheduleSessionDAO subelement," do

    subject { MeetingScheduleDAO::MeetingScheduleSessionDAO.new( session_order, date, pool_code ) }

    it_behaves_like( "(the existance of a method)", [
      :session_order, :scheduled_date, :pool_code,
      :begin_time, :warm_up_time, :pool_name, :pool_address, :day_part, :notes
    ] )

    it_behaves_like( "(the existance of a method returning an hash)", [
      :events
    ] )

    describe "when initialized without optional parameters" do
      it "returns given values and sets defaults" do
        expect( subject.session_order ).to eq( session_order )
        expect( subject.scheduled_date ).to eq( date )
        expect( subject.pool_code ).to eq( pool_code )
        expect( subject.begin_time ).to eq( '' )
        expect( subject.warm_up_time ).to eq( '' )
        expect( subject.pool_name ).to eq( '' )
        expect( subject.pool_address ).to eq( '' )
        expect( subject.day_part ).to be_nil
        expect( subject.notes ).to eq( '' )
        expect( subject.events.size ).to eq( 0 )
      end
    end

    describe "when initialized with optional parameters" do
      it "returns given values" do
        result = MeetingScheduleDAO::MeetingScheduleSessionDAO.new( session_order, date, pool_code, time1, time2, pool_name, address, day_part, notes )
        expect( result.session_order ).to eq( session_order )
        expect( result.scheduled_date ).to eq( date )
        expect( result.pool_code ).to eq( pool_code )
        expect( result.begin_time ).to eq( time1 )
        expect( result.warm_up_time ).to eq( time2 )
        expect( result.pool_name ).to eq( pool_name )
        expect( result.pool_address ).to eq( address )
        expect( result.day_part ).to eq( day_part )
        expect( result.notes ).to eq( notes )
        expect( result.events.size ).to eq( 0 )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "MeetingScheduleDAO general element," do

    subject { MeetingScheduleDAO.new( meeting ) }

    it_behaves_like( "(the existance of a method)", [
      :meeting
    ] )

    it_behaves_like( "(the existance of a method returning an hash)", [
      :sessions
    ] )

    describe "when initialized without optional parameters" do
      it "returns given values, default values and initialize empty data structures" do
        expect( subject.meeting ).to eq( meeting )
        expect( subject.sessions.size ).to eq( 0 )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- -------------------------------------------------------------------------
#++
