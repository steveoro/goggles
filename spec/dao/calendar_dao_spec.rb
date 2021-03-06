# encoding: utf-8

require 'rails_helper'
require 'common/format'


describe CalendarDAO, type: :model do
  #let(:meeting)         { create(:meeting_with_sessions) }
  #let(:meeting_session) { meeting.meeting_sessions.first }
  let(:fin_meeting)     { Meeting.find(16201) }
  let(:csi_meeting)     { Meeting.find(13106) }
  let(:csi_meeting_2)   { Meeting.find(15101) }
  let(:csi_meeting_3)   { Meeting.find(16102) }
  let(:meeting)         { Meeting.all.sample }
  let(:meeting_session) { meeting.meeting_sessions.first }

  context "MeetingSessionDAO subclass," do

    subject { CalendarDAO::MeetingSessionDAO.new( meeting_session ) }

    it_behaves_like( "(the existance of a method)", [
      :id, :session_order, :scheduled_date, :warm_up_time, :begin_time, :events_list, :linked_pool,
      :date_span, :pool_span,
      :get_scheduled_date, :get_warm_up_time, :get_begin_time, :get_short_events
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
    describe "#linked_pool" do
      it "is the linked session's swimming pool name specified for the construction" do
        expect( subject.linked_pool ).to be_a_kind_of( String ) 
        expect( subject.linked_pool ).to include( 'href' ) 
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
      :id, :description, :header_date, :is_confirmed, :are_results_acquired, :has_start_list, :has_invitation, :season_id,
      :linked_name, :season_type_code, :reservation_button, :month,
      :can_manage, :team_affiliation_id,
      :meeting_sessions
    ] )

    it_behaves_like( "(the existance of a method returning a boolean value)", [
      :is_user_starred, :is_team_starred, :is_current,
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

    describe "#season_type_code" do
      it "returns a string" do
        expect( subject.season_type_code ).to be_an_instance_of( String )
      end
      it "contains CSI for MASCSI meetings" do
        csi_mDAO = CalendarDAO::MeetingDAO.new( csi_meeting )
        expect( csi_mDAO.season_type_code ).to include( 'CSI' )
      end
      it "contains FIN for MASFIN meetings" do
        fin_mDAO = CalendarDAO::MeetingDAO.new( fin_meeting )
        expect( fin_mDAO.season_type_code ).to include( 'FIN' )
      end
    end

    describe "#month" do
      it "returns a string" do
        expect( subject.month ).to be_an_instance_of( String )
      end
      it "is the month of the header date of meeting specified for the construction" do
        expect( subject.month ).to eq( subject.month_name( meeting.header_date ) )
      end
    end

    describe "#month_name" do
      it "retturns a string" do
        expect( subject.month_name( meeting.header_date ) ).to be_an_instance_of( String )
      end
      it "retturns 'Da definire' if not date present" do
        expect( subject.month_name( nil ) ).to include('Da definire')
      end
    end

    describe "#is_current" do
      it "returns true if meeting header date is a week near today" do
        if subject.header_date >= (Date.today() - 6) && subject.header_date <= (Date.today() + 6)
          expect( subject.is_current ).to eq( true )
        else
          expect( subject.is_current ).to eq( false )
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
  #-- -------------------------------------------------------------------------
  #++

  context "a valid instance," do

    subject { CalendarDAO.new() }

    it_behaves_like( "(the existance of a method)", [
      :meeting_count, :months, :first_current, :column_to_be_shown,
      :meetings, :get_meetings, :get_paginated_meetings, :add_meeting
    ] )

    it_behaves_like( "(the existance of a method returning a boolean value)", [
      :paginated?, :show_months_index?, :show_months_header?, :show_season?
    ] )

    describe "#meeting_count" do
      it "is a number" do
        expect( subject.meeting_count ).to be >= 0
      end
    end

    describe "#months" do
      it "is an array" do
        expect( subject.months ).to be_a_kind_of( Array )
      end
    end

    describe "#first_current" do
      it "is a number" do
        expect( subject.first_current ).to be >= 0
      end
    end

    describe "#paginated?" do
      it "is a boolean" do
        expect( subject.paginated? ).to eq( false ).or( eq( true ) )
      end
    end

    describe "#column_to_be_shown" do
      it "is a number" do
        expect( subject.column_to_be_shown ).to be >= 0
      end
      it "is a number between 6 and 7" do
        expect( subject.column_to_be_shown ).to be >= 6
        expect( subject.column_to_be_shown ).to be <= 7
      end
    end

    describe "#meetings" do
      it "is an array" do
        expect( subject.meetings ).to be_a_kind_of( Array )
      end
      it "contains MeetingDAO instances" do
        subject.meetings.each do |meeting_dao|
          expect( meeting_dao ).to be_an_instance_of( CalendarDAO::MeetingDAO )
        end
      end
      it "isn't pagintaed" do
        subject.get_meetings
        expect( subject.paginated? ).to eq( false )
      end
    end

    describe "#get_meetings" do
      it "is an array" do
        expect( subject.get_meetings ).to be_a_kind_of( Array )
      end
      it "contains MeetingDAO instances" do
        subject.get_meetings.each do |meeting_dao|
          expect( meeting_dao ).to be_an_instance_of( CalendarDAO::MeetingDAO )
        end
      end
      it "isn't pagintaed" do
        subject.get_meetings
        expect( subject.paginated? ).to eq( false )
      end
    end

    describe "#get_paginated_meetings" do
      it "is an array" do
        expect( subject.get_paginated_meetings ).to be_a_kind_of( Array )
      end
      it "contains MeetingDAO instances" do
        subject.get_paginated_meetings.each do |meeting_dao|
          expect( meeting_dao ).to be_an_instance_of( CalendarDAO::MeetingDAO )
        end
      end
      it "is paginated" do
        subject.get_paginated_meetings
        expect( subject.paginated? ).to eq( true )
      end
      it "doesn't show month index" do
        subject.get_paginated_meetings
        expect( subject.show_months_index? ).to eq( false )
      end
    end
    
    describe "#add_meeting" do
      it "returns a number" do
        expect( subject.add_meeting( meeting ) ).to be >= 0
      end
      it "increases meetings count" do
        count = subject.meeting_count
        subject.add_meeting( meeting )
        expect( subject.meeting_count ).to be > count
      end
      it "increases months count" do
        size = subject.months.size
        subject.add_meeting( meeting )
        expect( subject.months.size ).to be > 0
        expect( subject.months.size ).to be >= size
      end
      it "increases seasons count" do
        count = subject.seasons.size
        subject.add_meeting( meeting )
        expect( subject.seasons.size ).to be > count
      end
      it "creates only one season for meetings of same season" do
        expect( subject.seasons.size ).to eq( 0 )
        subject.add_meeting( csi_meeting )
        expect( subject.seasons.size ).to eq( 1 )
        subject.add_meeting( csi_meeting_2 )
        expect( subject.seasons.size ).to eq( 1 )
        subject.add_meeting( csi_meeting_3 )
        expect( subject.seasons.size ).to eq( 1 )
      end
      it "creates two seasons for meetings of different seasons" do
        expect( subject.seasons.size ).to eq( 0 )
        subject.add_meeting( csi_meeting )
        expect( subject.seasons.size ).to eq( 1 )
        subject.add_meeting( fin_meeting )
        expect( subject.seasons.size ).to eq( 2 )
        subject.add_meeting( csi_meeting_2 )
        expect( subject.seasons.size ).to eq( 2 )
      end
      it "create meeting header date month in months array" do
        subject.add_meeting( meeting )
        expect( subject.months.size ).to be > 0
      end
      it "doesn't increases meetings count if wrong parameters" do
        count = subject.meeting_count
        subject.add_meeting("wrong")
        expect( subject.meeting_count ).to be == count
      end
      
      
    end
  end
  #-- -------------------------------------------------------------------------
  #++

end

