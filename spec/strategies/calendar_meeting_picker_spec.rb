require 'rails_helper'


describe CalendarMeetingPicker, type: :strategy do

  #let(:meeting)         { create(:meeting_with_sessions) }
  #let(:meeting_session) { meeting.meeting_sessions.first }
  let(:meeting)         { Meeting.find(13106) }
  let(:meeting_session) { meeting.meeting_sessions.first }
  let(:csi_season)      { Season.where( season_type_id: 2 ).sample }
  let(:season)          { Season.all.sample }
  let(:date_start)      { Date.today - (rand * 30).to_i }
  let(:date_end)        { Date.today + (rand * 30).to_i }
  let(:swimmer)         { Swimmer.all.sample }
  let(:team)            { Team.all.sample }
  let(:user)            { User.all.sample }
  let(:manager)         { User.find(2) }
  let(:goggler)         { User.where('swimmer_id is not null').sample }
  let(:new_user)        { User.new() }

  context "with season parameter" do
    subject { CalendarMeetingPicker.new( season ) }

    it_behaves_like( "(the existance of a method)", [
      :parameters, :calendarDAO, :meetings_count,
      :pick_meetings, :get_manageable_seasons, :get_swimmer_badges, 
      :pick_meetings_by_ids, :pick_meetings_by_season, :pick_meetings_by_team, :pick_meetings_by_swimmer, :pick_meetings_by_dates
    ] )

    describe "#init" do
      it "doesn't contain meetings" do
        expect( subject.meetings_count ).to eq( 0 )
        expect( subject.calendarDAO ).to be_nil
      end
    end

    describe "#parameters" do
      it "returns an hash" do
        expect( subject.parameters ).to be_a_kind_of( Hash )
      end
      it "returns a non empty array" do
        expect( subject.parameters.count ).to be > 0        
      end
    end

    describe "#meetings_count" do
      it "returns a number" do
        expect( subject.meetings_count ).to be >= 0
      end
    end

    describe "#calendarDAO" do
      it "returns bil or a calendarDAO" do
        expect( subject.calendarDAO ).to be_nil.or be_an_instance_of( CalendarDAO )
      end
    end

    describe "#pick_meetings" do
      it "returns a number" do
        expect( subject.pick_meetings ).to be >= 0
      end
      it "populates a calendarDAO" do
        expect( subject.calendarDAO ).to be_nil
        meetings_count = subject.pick_meetings
        expect( subject.calendarDAO ).to be_an_instance_of( CalendarDAO )
        expect( subject.calendarDAO.meeting_count ).to eq( meetings_count )
      end
    end

    describe "#get_manageable_seasons" do
      it "returns an hash" do
        expect( subject.get_manageable_seasons ).to be_a_kind_of( Hash )
      end
      it "returns an empty hash in current_user not set" do
        expect( subject.get_manageable_seasons.size ).to eq( 0 )
      end
      it "returns an empty hash if current_user set but not a manager" do
        expect( subject.get_manageable_seasons(new_user).size ).to eq( 0 ) 
      end
      it "returns a non empty hash if current_user is a manager" do
        expect( subject.get_manageable_seasons(manager).size ).to be > 0 
      end
    end

    describe "#get_swimmer_badges" do
      it "returns an hash" do
        expect( subject.get_swimmer_badges ).to be_a_kind_of( Hash )
      end
      it "returns an empty hash in current_user not set" do
        expect( subject.get_swimmer_badges.size ).to eq( 0 )
      end
      it "returns an empty hash if current_user set but not associated with a swimmer" do
        expect( subject.get_swimmer_badges(new_user).size ).to eq( 0 ) 
      end
      it "returns a non empty hash if current_user is a swimmer (goggler)" do
        expect( subject.get_swimmer_badges(goggler).size ).to be > 0 
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
