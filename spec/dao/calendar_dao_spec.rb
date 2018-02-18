# encoding: utf-8

require 'rails_helper'
require 'common/format'


describe CalendarDAO, type: :model do
  #let(:meeting)         { create(:meeting_with_sessions) }
  #let(:meeting_session) { meeting.meeting_sessions.first }
  let(:meeting)         { Meeting.find(13106) }
  let(:meeting_session) { meeting.meeting_sessions.first }
  let(:csi_season)      { Season.where( season_type_id: 2 ).sample }
  let(:season)          { Season.sample }
  let(:date_start)      { Date.today - (rand * 30).to_i }
  let(:date_end)        { Date.today + (rand * 30).to_i }

  context "MeetingSessionDAO subclass," do

    subject { CalendarDAO::MeetingSessionDAO.new( meeting_session ) }

    it_behaves_like( "(the existance of a method)", [
      :id, :session_order, :scheduled_date, :warm_up_time, :begin_time, :events_list, :swimming_pool, :date_span, :pool_span
    ] )

    describe "#id" do
      it "is the id of the session specified for the construction" do
        expect( subject.id ).to eq( meeting_session.id )
      end
    end
    describe "#session_order" do
      it "is the order of the session specified for the construction" do
        expect( subject.session_order ).to eq( meeting_session.session_order )
      end
    end
    describe "#scheduled_date" do
      it "is the date of the session specified for the construction" do
        expect( Format.a_date(subject.scheduled_date) ).to eq( Format.a_date(meeting_session.scheduled_date) )
      end
    end
    describe "#warm_up_time" do
      it "is the warm_up_time of the session specified for the construction" do
        expect( Format.a_time(subject.warm_up_time) ).to eq( Format.a_time(meeting_session.get_warm_up_time) )
      end
    end
    describe "#begin_time" do
      it "is the begin_time of the session specified for the construction" do
        expect( Format.a_time(subject.begin_time) ).to eq( Format.a_time(meeting_session.get_begin_time) )
      end
    end
    describe "#events_list" do
      it "is the events of the session specified for the construction" do
        expect( subject.events_list ).to eq( meeting_session.get_short_events )
      end
    end
    describe "#date_span" do
      it "is the default value" do
        expect( subject.date_span ).to eq( 1 )
      end
    end
    describe "#pool_span" do
      it "is the default value" do
        expect( subject.pool_span ).to eq( 1 )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "MeetingDAO subclass," do

    subject { CalendarDAO::MeetingDAO.new( meeting ) }

    it_behaves_like( "(the existance of a method)", [
      :id, :description, :header_date, :is_confirmed, :are_results_acquired, :has_start_list, :meeting_sessions
    ] )

    describe "#id" do
      it "is the id of meeting specified for the construction" do
        expect( subject.id ).to eq( meeting.id )
      end
    end
    describe "#description" do
      it "is the description of meeting specified for the construction" do
        expect( subject.description ).to eq( meeting.get_full_name )
      end
    end
    describe "#header_date" do
      it "is the header date of meeting specified for the construction" do
        expect( subject.header_date ).to eq( meeting.header_date )
      end
    end
    describe "#is_confirmed" do
      it "is the confirmed flag meeting specified for the construction" do
        expect( subject.is_confirmed ).to eq( meeting.is_confirmed )
      end
    end
    describe "#are_results_acquired" do
      it "is the are_results_acquired flag meeting specified for the construction" do
        expect( subject.are_results_acquired ).to eq( meeting.are_results_acquired )
      end
    end
    describe "#has_start_list" do
      it "is the has_start_list flag meeting specified for the construction" do
        expect( subject.has_start_list ).to eq( meeting.has_start_list )
      end
    end
    describe "#meeting_sessions" do
      it "is an array" do
        expect( subject.meeting_sessions ).to be_a_kind_of( Array )
      end
      it "contains MeetingSessionDAO instances" do
        subject.meeting_sessions.each do |meeting_session_dao|
          expect( meeting_session_dao ).to be_an_instance_of( CalendarDAO::MeetingSessionDAO )
        end
      end
    end

    describe "#calculate_span" do
      it "sets span values as numbers between 0 and sessions count" do
        subject.calculate_span
        subject.meeting_sessions.each do |meeting_session_dao|
          expect( meeting_session_dao.date_span ).to be >= 0
          expect( meeting_session_dao.pool_span ).to be >= 0
          expect( meeting_session_dao.date_span ).to be <= subject.meeting_sessions.size 
          expect( meeting_session_dao.pool_span ).to be <= subject.meeting_sessions.size 
        end
      end
      it "the sum of each span types is the sessions count" do
        date_span = 0
        pool_span = 0
        subject.calculate_span
        subject.meeting_sessions.each do |meeting_session_dao|
          date_span += meeting_session_dao.date_span
          pool_span += meeting_session_dao.pool_span
        end
        expect( date_span ).to eq( subject.meeting_sessions.size ) 
        expect( pool_span ).to eq( subject.meeting_sessions.size ) 
      end
      it "return correct spans on Molinella 2016 meeting" do
        molinella_meeting = Meeting.find(15213)
        molinella_calendar_dao = CalendarDAO::MeetingDAO.new( molinella_meeting )
        expect( molinella_calendar_dao.meeting_sessions.count ).to eq( 5 )
        expect( molinella_calendar_dao.meeting_sessions[0].date_span ).to eq( 3 )
        expect( molinella_calendar_dao.meeting_sessions[1].date_span ).to eq( 0 )
        expect( molinella_calendar_dao.meeting_sessions[2].date_span ).to eq( 0 )
        expect( molinella_calendar_dao.meeting_sessions[3].date_span ).to eq( 2 )
        expect( molinella_calendar_dao.meeting_sessions[4].date_span ).to eq( 0 )
        expect( molinella_calendar_dao.meeting_sessions[0].pool_span ).to eq( 5 )
        expect( molinella_calendar_dao.meeting_sessions[1].pool_span ).to eq( 0 )
        expect( molinella_calendar_dao.meeting_sessions[2].pool_span ).to eq( 0 )
        expect( molinella_calendar_dao.meeting_sessions[3].pool_span ).to eq( 0 )
        expect( molinella_calendar_dao.meeting_sessions[4].pool_span ).to eq( 0 )
      end
    end
  end


  context "without parameters," do

    subject { CalendarDAO.new() }

    it_behaves_like( "(the existance of a method)", [
      :meetings, :meeting_count, :season_id, :date_start, :date_end, :id_list, :get_meetings
    ] )

    describe "#meetings" do
      it "is an array" do
        expect( subject.meetings ).to be_a_kind_of( Array )
      end
      it "contains MeetingDAO instances" do
        subject.meetings.each do |meeting_dao|
          expect( meeting_dao ).to be_an_instance_of( CalendarDAO::MeetingDAO )
        end
      end
    end
    describe "#meeting_count" do
      it "is a number" do
        expect( subject.meeting_count ).to be >= 0
      end
    end
    describe "#season_id" do
      it "is nil" do
        expect( subject.season_id ).to be_nil
      end
    end
    describe "#date_start" do
      it "is nil" do
        expect( subject.date_start ).to be_nil
      end
    end
    describe "#date_end" do
      it "is nil" do
        expect( subject.date_end ).to be_nil
      end
    end
    
  end
  #-- -------------------------------------------------------------------------
  #++

  context "with season (CSI) parameter," do

    subject { CalendarDAO.new( csi_season.id ) }

    describe "#meetings" do
      it "is an array" do
        expect( subject.meetings ).to be_a_kind_of( Array )
      end
      it "contains MeetingDAO instances" do
        subject.meetings.each do |meeting_dao|
          expect( meeting_dao ).to be_an_instance_of( CalendarDAO::MeetingDAO )
        end
      end
    end
    describe "#season_id" do
      it "is the season specified" do
        expect( subject.season_id ).to eq( csi_season.id )
      end
    end
    describe "#date_start" do
      it "is nil" do
        expect( subject.date_start ).to be_nil
      end
    end
    describe "#date_end" do
      it "is nil" do
        expect( subject.date_end ).to be_nil
      end
    end

    describe "#get_meetings" do
      it "returns a number" do
        expect( subject.get_meetings ).to be >= 0
      end
      it "returns the number of season not cancelled meetings" do
        expect( subject.get_meetings ).to eq( csi_season.meetings.is_not_cancelled.count )
      end
      it "populates @meetings with season not cancelled meetings" do
        expect( subject.meetings.size ).to eq( 0 )
        found_meetings = subject.get_meetings
        expect( subject.meetings.size ).to eq( found_meetings )
      end
      it "populates @meetings with MeetingDAO instances" do
        expect( subject.meetings ).to be_a_kind_of( Array )
        subject.get_meetings
        subject.meetings.each do |meeting_dao|
          expect( meeting_dao ).to be_an_instance_of( CalendarDAO::MeetingDAO )
        end
      end
    end
  end

  context "with dates parameter," do

    subject { CalendarDAO.new( nil, date_start, date_end ) }

    describe "#meetings" do
      it "is an array" do
        expect( subject.meetings ).to be_a_kind_of( Array )
      end
      it "contains MeetingDAO instances" do
        subject.meetings.each do |meeting_dao|
          expect( meeting_dao ).to be_an_instance_of( CalendarDAO::MeetingDAO )
        end
      end
    end
    describe "#season_id" do
      it "is nil" do
        expect( subject.season_id ).to be_nil
      end
    end
    describe "#date_start" do
      it "is the start date specified" do
        expect( subject.date_start ).to eq( date_start )
      end
    end
    describe "#date_end" do
      it "is the end date specified" do
        expect( subject.date_end ).to eq( date_end )
      end
    end

    describe "#get_meetings" do
      it "returns a number" do
        expect( subject.get_meetings ).to be >= 0
      end
      it "returns the number of not cancelled meetings between specified dates" do
        expect( subject.get_meetings ).to eq( Meeting.is_not_cancelled.where( "(header_date >= '#{date_start}') AND (header_date <= '#{date_end}')" ).count )
      end
      it "populates @meetings with not cancelled meetings" do
        expect( subject.meetings.size ).to eq( 0 )
        found_meetings = subject.get_meetings
        expect( subject.meetings.size ).to eq( found_meetings )
      end
      it "populates @meetings with MeetingDAO instances" do
        expect( subject.meetings ).to be_a_kind_of( Array )
        subject.get_meetings
        subject.meetings.each do |meeting_dao|
          expect( meeting_dao ).to be_an_instance_of( CalendarDAO::MeetingDAO )
        end
      end
    end
  end
end

