# encoding: utf-8

require 'spec_helper'

describe CalendarDAO, type: :model do
  let(:meeting)         { create(:meeting_with_sessions) }
  let(:meeting_session) { meeting.meeting_sessions.first }

  context "MeetingSessionDAO subclass," do

    subject { CalendarDAO::MeetingSessionDAO.new( meeting_session ) }

    it_behaves_like( "(the existance of a method)", [
      :order, :date, :warm_up_time, :begin_time, :events, :swimming_pool
    ] )

    describe "#order" do
      it "is the order of the session specified for the construction" do
        expect( subject.order ).to eq( meeting_session.session_order )
      end
    end
    describe "#date" do
      it "is the date of the session specified for the construction" do
        expect( subject.date ).to eq( meeting_session.scheduled_date )
      end
    end
    describe "#warm_up_time" do
      it "is the warm_up_time of the session specified for the construction" do
        expect( subject.warm_up_time ).to eq( meeting_session.warm_up_time )
      end
    end
    describe "#begin_time" do
      it "is the begin_time of the session specified for the construction" do
        expect( subject.begin_time ).to eq( meeting_session.begin_time )
      end
    end
    describe "#events" do
      it "is the events of the session specified for the construction" do
        expect( subject.events ).to eq( meeting_session.get_short_events )
      end
    end   
    describe "#swimming_pool" do
      it "is the swimming_pool of the session specified for the construction" do
        expect( subject.swimming_pool ).to eq( meeting_session.swimming_pool )
      end
    end
    
  end
  #-- -------------------------------------------------------------------------
  #++
  

  context "as a valid instance," do
    let(:meeting_session) { CalendarDAO::MeetingSessionDAO.new( meeting_session ) }

    subject { CalendarDAO.new( meeting, [ meeting_session ]) }

    it_behaves_like( "(the existance of a method)", [
      :meeting, :meeting_sessions
    ] )

    describe "#meeting" do
      it "is the meeting specified for the construction" do
        expect( subject.meeting ).to eq( meeting )
      end
    end
    describe "#meeting_sessions" do
      it "is the array specified for the construction" do
        expect( subject.meeting_sessions ).to eq( meeting_sessions )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  
  context "not a valid instance" do   
    it "raises an exception for wrong meeting_sessions parameter" do
      expect{ ChampionshipDAO.new( meeting, 'Wrong parameter' ) }.to raise_error( ArgumentError )
    end   
    it "raises an exception for wrong meeting_sessions parameter element type" do
      expect{ ChampionshipDAO.new( meeting, ['Wrong parameter'] ) }.to raise_error( ArgumentError )
    end   
  end
  #-- -------------------------------------------------------------------------
  #++
end

