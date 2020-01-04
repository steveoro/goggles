# encoding: utf-8

require 'rails_helper'
require 'common/format'
require 'ffaker'

describe MeetingScheduleDAO, type: :model do

  let(:meeting)             { Meeting.last(100).sample }
  let(:gender_code)         { EventType.all.sammple.code }
  let(:category_code)       { CategoryType.where( season_id: [191, 192] ).sample.code }
  let(:event_id)            { ( rand * 1000 ).to_i + 1 }
  let(:event_code)          { EventType.all.sample.code }
  let(:is_a_relay)          { [true, false].sample }
  let(:session_id)          { ( rand * 1000 ).to_i + 1 }
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
  let(:pool)                { SwimmingPool.first(50).sample }
  let(:pool_type)           { PoolType.all.sample.code }
  let(:pool_name)           { pool.name }
  let(:address)             { pool.address }
  let(:city)                { FFaker::Lorem.word }
  let(:url)                 { 'http://www.page.dom' }
  let(:notes)               { FFaker::Lorem.word }

  context "MeetingScheduleEventDAO subelement," do

    subject { MeetingScheduleDAO::MeetingScheduleEventDAO.new( event_id, event_code ) }

    it_behaves_like( "(the existance of a method)", [
      :event_id, :event_code, :is_a_relay,
      :event_order, :heat_type, :is_out_of_race, :has_separate_gender, :has_separate_categories, :notes
    ] )

    describe "when initialized without optional parameters" do
      it "returns given values and sets defaults" do
        expect( subject.event_id ).to eq( event_id )
        expect( subject.event_code ).to eq( event_code )
        expect( subject.is_a_relay ).to eq( false )
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
        result = MeetingScheduleDAO::MeetingScheduleEventDAO.new( event_id, event_code, is_a_relay, event_order, heat_type, boolean1, boolean2, boolean3, notes )
        expect( result.event_id ).to eq( event_id )
        expect( result.event_code ).to eq( event_code )
        expect( result.is_a_relay ).to eq( is_a_relay )
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

    subject { MeetingScheduleDAO::MeetingScheduleSessionDAO.new( session_id, session_order, date, pool.id, pool_type ) }

    it_behaves_like( "(the existance of a method)", [
      :session_id, :session_order, :scheduled_date, :pool_id, :pool_type,
      :lanes, :begin_time, :warm_up_time, :pool_name, :pool_address, :city, :maps_uri, :day_part, :notes
    ] )

    it_behaves_like( "(the existance of a method returning an hash)", [
      :events
    ] )

    describe "when initialized without optional parameters" do
      it "returns given values and sets defaults" do
        expect( subject.session_id ).to eq( session_id )
        expect( subject.session_order ).to eq( session_order )
        expect( subject.scheduled_date ).to eq( date )
        expect( subject.pool_id ).to eq( pool.id )
        expect( subject.pool_type ).to eq( pool_type )
        expect( subject.begin_time ).to eq( '' )
        expect( subject.warm_up_time ).to eq( '' )
        expect( subject.pool_name ).to eq( '' )
        expect( subject.pool_address ).to eq( '' )
        expect( subject.city ).to eq( '' )
        expect( subject.maps_uri ).to be_nil
        expect( subject.day_part ).to be_nil
        expect( subject.notes ).to eq( '' )
        expect( subject.events.size ).to eq( 0 )
      end
    end

    describe "when initialized with optional parameters" do
      it "returns given values" do
        result = MeetingScheduleDAO::MeetingScheduleSessionDAO.new( session_id, session_order, date, pool.id, pool_type, pool.lanes_number, time1, time2, pool_name, address, city, url, day_part, notes )
        expect( result.session_id ).to eq( session_id )
        expect( result.session_order ).to eq( session_order )
        expect( result.scheduled_date ).to eq( date )
        expect( result.pool_id ).to eq( pool.id )
        expect( result.pool_type ).to eq( pool_type )
        expect( result.lanes ).to eq( pool.lanes_number )
        expect( result.begin_time ).to eq( time1 )
        expect( result.warm_up_time ).to eq( time2 )
        expect( result.pool_name ).to eq( pool_name )
        expect( result.pool_address ).to eq( address )
        expect( result.city ).to eq( city )
        expect( result.maps_uri ).to eq( url )
        expect( result.day_part ).to eq( day_part )
        expect( result.notes ).to eq( notes )
        expect( result.events.size ).to eq( 0 )
      end
    end

    describe "#add_event" do
      it "increases events count" do
        prev_count = subject.events.size
        count = subject.add_event( 1, event_id, event_code )
        expect( count ).to eq( prev_count + 1 )
        expect( subject.events.size ).to eq( count )
      end

      it "sets the given event key in events structure" do
        event_key = 1
        wrong_key = '_NOT_' # Event surely not already present
        another_key = '130FO' # Event surely not already present
        subject.add_event( event_key, event_id, event_code )
        count = subject.add_event( another_key, event_id + 1, event_code )
        expect( subject.events.size ).to eq( count )
        expect( subject.events.has_key?( event_key )).to eq( true )
        expect( subject.events.has_key?( another_key )).to eq( true )
        expect( subject.events.has_key?( wrong_key )).to eq( false )
      end

      it "sets the given data in the events structure" do
        event_key = 1
        subject.add_event( event_key, event_id, event_code, is_a_relay, event_order, heat_type, boolean1, boolean2, boolean3, notes )
        expect( subject.events[event_key].event_id ).to eq( event_id )
        expect( subject.events[event_key].event_code ).to eq( event_code )
        expect( subject.events[event_key].is_a_relay ).to eq( is_a_relay )
        expect( subject.events[event_key].event_order ).to eq( event_order )
        expect( subject.events[event_key].heat_type ).to eq( heat_type )
        expect( subject.events[event_key].is_out_of_race ).to eq( boolean1 )
        expect( subject.events[event_key].has_separate_gender ).to eq( boolean2 )
        expect( subject.events[event_key].has_separate_categories ).to eq( boolean3 )
        expect( subject.events[event_key].notes ).to eq( notes )
      end
    end

    describe "#get_event" do
      it "returns nil if event key doesn't exists" do
        wrong_key = '_NOT_' # Event surely not already present
        expect( subject.events.has_key?( wrong_key )).to eq( false )
        expect( subject.get_event( wrong_key )).to be_nil
      end
      it "returns a MeetingScheduleEventDAO cotaining event if event key exists" do
        another_key = '130FO' # Event surely not already present
        event_key = 1
        subject.add_event( another_key, event_id - 1, 'PUPPA' )
        subject.add_event( event_key, event_id, event_code )
        expect( subject.events.has_key?( event_key )).to eq( true )
        event = subject.get_event( event_key )
        expect( event ).to be_an_instance_of( MeetingScheduleDAO::MeetingScheduleEventDAO )
        expect( event.event_code ).to eq( event_code )
        expect( subject.get_event( another_key ).event_code ).to eq( 'PUPPA' )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "MeetingScheduleDAO general element," do

    subject { MeetingScheduleDAO.new( meeting ) }

    it_behaves_like( "(the existance of a method)", [
      :meeting,
      :meeting_date
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

    describe "#meeting_date" do
      it "returns a date" do
        expect( subject.meeting_date ).to be_an_instance_of( Date )
      end
    end

    describe "#add_session" do
      it "increases sessions count" do
        prev_count = subject.sessions.size
        count = subject.add_session( 1, session_id, session_order, date, pool.id, pool_type )
        expect( count ).to eq( prev_count + 1 )
        expect( subject.sessions.size ).to eq( count )
      end

      it "sets the given session key in sessions structure" do
        session_key = 1
        wrong_key = '_NOT_' # Event surely not already present
        another_key = '130FO' # Event surely not already present
        subject.add_session( session_key, session_id, session_order, date, pool.id, pool_type )
        count = subject.add_session( another_key, session_id + 1, session_order + 1, date + 1, pool.id, pool_type )
        expect( subject.sessions.size ).to eq( count )
        expect( subject.sessions.has_key?( session_key )).to eq( true )
        expect( subject.sessions.has_key?( another_key )).to eq( true )
        expect( subject.sessions.has_key?( wrong_key )).to eq( false )
      end

      it "sets the given data in the sessions structure" do
        session_key = 1
        subject.add_session( session_key, session_id, session_order, date, pool.id, pool_type, pool.lanes_number, time1, time2, pool_name, address, city, url, day_part, notes )
        expect( subject.sessions[session_key].session_id ).to eq( session_id )
        expect( subject.sessions[session_key].session_order ).to eq( session_order )
        expect( subject.sessions[session_key].scheduled_date ).to eq( date )
        expect( subject.sessions[session_key].pool_id ).to eq( pool.id )
        expect( subject.sessions[session_key].pool_type ).to eq( pool_type )
        expect( subject.sessions[session_key].lanes ).to eq( pool.lanes_number )
        expect( subject.sessions[session_key].begin_time ).to eq( time1 )
        expect( subject.sessions[session_key].warm_up_time ).to eq( time2 )
        expect( subject.sessions[session_key].pool_name ).to eq( pool_name )
        expect( subject.sessions[session_key].pool_address ).to eq( address )
        expect( subject.sessions[session_key].city ).to eq( city )
        expect( subject.sessions[session_key].maps_uri ).to eq( url )
        expect( subject.sessions[session_key].day_part ).to eq( day_part )
        expect( subject.sessions[session_key].notes ).to eq( notes )
      end
    end

    describe "#get_session" do
      it "returns nil if sessio  key doesn't exists" do
        wrong_key = '_NOT_' # Session surely not already present
        expect( subject.sessions.has_key?( wrong_key )).to eq( false )
        expect( subject.get_session( wrong_key )).to be_nil
      end
      it "returns a MeetingScheduleSessionDAO cotaining session if session key exists" do
        another_key = '130FO' # Session surely not already present
        session_key = 1
        subject.add_session( another_key, session_id - 1, session_order - 1, date - 1, pool.id, pool_type )
        subject.add_session( session_key, session_id, session_order, date, pool.id, pool_type )
        expect( subject.sessions.has_key?( session_key )).to eq( true )
        session = subject.get_session( session_key )
        expect( session ).to be_an_instance_of( MeetingScheduleDAO::MeetingScheduleSessionDAO )
        expect( session.session_id ).to eq( session_id )
        expect( session.session_order ).to eq( session_order )
        expect( session.scheduled_date ).to eq( date )
        expect( session.pool_type ).to eq( pool_type )
        expect( subject.get_session( another_key ).session_order ).to eq( session_order - 1 )
      end
    end

  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- -------------------------------------------------------------------------
#++
