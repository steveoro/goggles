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

  context "general features" do
    subject { CalendarMeetingPicker.new() }

    it_behaves_like( "(the existance of a method)", [
      :parameters, :meetings_count,
      :pick_meetings, :get_manageable_seasons, :get_swimmer_badges, 
      :pick_meetings_by_ids, :pick_meetings_by_season, :pick_meetings_by_team, :pick_meetings_by_swimmer, :pick_meetings_by_dates
    ] )

    describe "#parameters" do
      it "returns an hash" do
        expect( subject.parameters ).to be_a_kind_of( Hash )
      end
      it "returns an empty array" do
        expect( subject.parameters.count ).to eq( 0 )        
      end
    end

    describe "#meetings_count" do
      it "returns a number" do
        expect( subject.meetings_count ).to be >= 0
      end
      it "it's empty before picking" do
        expect( subject.meetings_count ).to eq( 0 )
      end
    end

    describe "#pick_meetings" do
      it "returns a calendarDAO" do
        expect( subject.pick_meetings ).to be_an_instance_of( CalendarDAO )
      end
    end

    describe "#pick_meetings_by_ids" do
      it "returns 0 beacuse no id_list parameter set" do
        expect( subject.pick_meetings_by_ids ).to eq( 0 )
      end
    end
    describe "#pick_meetings_by_season" do
      it "returns 0 beacuse no id_list parameter set" do
        expect( subject.pick_meetings_by_season ).to eq( 0 )
      end
    end
    describe "#pick_meetings_by_team" do
      it "returns 0 beacuse no id_list parameter set" do
        expect( subject.pick_meetings_by_team ).to eq( 0 )
      end
    end
    describe "#pick_meetings_by_swimmer" do
      it "returns 0 beacuse no id_list parameter set" do
        expect( subject.pick_meetings_by_swimmer ).to eq( 0 )
      end
    end
    describe "#pick_meetings_by_dates" do
      it "returns 0 beacuse no id_list parameter set" do
        expect( subject.pick_meetings_by_dates ).to eq( 0 )
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

  context "with season parameter" do
    subject { CalendarMeetingPicker.new( nil, nil, season ) }

    describe "#parameters" do
      it "returns a non empty array" do
        expect( subject.parameters.count ).to eq( 1 )        
      end
      it "contains the season specified" do
        expect( subject.parameters[:season_id] ).to eq( season.id )
      end
    end
    
    describe "#pick_meetings_by_ids" do
      it "returns 0 beacuse no id_list parameter set" do
        expect( subject.pick_meetings_by_ids ).to eq( 0 )
      end
    end
    describe "#pick_meetings_by_season" do
      it "returns 0 or more meetings" do
        expect( subject.pick_meetings_by_season ).to be >= 0
      end
      it "returns the number of season meetings" do
        expect( subject.pick_meetings_by_season ).to eq( season.meetings.count )
      end
      it "returns the number of season not cancelled meetings if request" do
        expect( subject.pick_meetings_by_season( nil, false ) ).to eq( season.meetings.is_not_cancelled.count )
      end
    end
    describe "#pick_meetings_by_team" do
      it "returns 0 beacuse no id_list parameter set" do
        expect( subject.pick_meetings_by_team ).to eq( 0 )
      end
    end
    describe "#pick_meetings_by_swimmer" do
      it "returns 0 beacuse no id_list parameter set" do
        expect( subject.pick_meetings_by_swimmer ).to eq( 0 )
      end
    end
    describe "#pick_meetings_by_dates" do
      it "returns 0 beacuse no id_list parameter set" do
        expect( subject.pick_meetings_by_dates ).to eq( 0 )
      end
    end

    describe "#pick_meetings" do
      it "returns a well formed calendarDAO" do
        calendar = subject.pick_meetings
        expect( calendar ).to be_an_instance_of( CalendarDAO )
        expect( calendar.meetings ).to be_a_kind_of( Array )
        expect( calendar.meetings.size ).to eq( subject.meetings_count )
        calendar.meetings.each do |meeting_dao|
          expect( meeting_dao ).to be_an_instance_of( CalendarDAO::MeetingDAO )
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "with season (CSI) parameter," do

    subject { CalendarMeetingPicker.new( nil, nil, csi_season ) }

    describe "#parameters" do
      it "returns a non empty array" do
        expect( subject.parameters.count ).to eq( 1 )        
      end
      it "contains the season specified" do
        expect( subject.parameters[:season_id] ).to eq( csi_season.id )
      end
    end

    describe "#pick_meetings_by_ids" do
      it "returns 0 beacuse no id_list parameter set" do
        expect( subject.pick_meetings_by_ids ).to eq( 0 )
      end
    end
    describe "#pick_meetings_by_season" do
      it "returns 0 or more meetings" do
        expect( subject.pick_meetings_by_season ).to be >= 0
      end
      it "returns the number of season meetings" do
        expect( subject.pick_meetings_by_season ).to eq( csi_season.meetings.count )
      end
      it "returns the number of season not cancelled meetings if request" do
        expect( subject.pick_meetings_by_season( nil, false ) ).to eq( csi_season.meetings.is_not_cancelled.count )
      end
    end
    describe "#pick_meetings_by_team" do
      it "returns 0 beacuse no id_list parameter set" do
        expect( subject.pick_meetings_by_team ).to eq( 0 )
      end
    end
    describe "#pick_meetings_by_swimmer" do
      it "returns 0 beacuse no id_list parameter set" do
        expect( subject.pick_meetings_by_swimmer ).to eq( 0 )
      end
    end
    describe "#pick_meetings_by_dates" do
      it "returns 0 beacuse no id_list parameter set" do
        expect( subject.pick_meetings_by_dates ).to eq( 0 )
      end
    end

    describe "#pick_meetings" do
      it "returns a well formed calendarDAO" do
        calendar = subject.pick_meetings
        expect( calendar ).to be_an_instance_of( CalendarDAO )
        expect( calendar.meetings ).to be_a_kind_of( Array )
        calendar.meetings.each do |meeting_dao|
          expect( meeting_dao ).to be_an_instance_of( CalendarDAO::MeetingDAO )
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "with team parameter," do

    subject { CalendarMeetingPicker.new( nil, nil, nil, nil, team ) }

    describe "#parameters" do
      it "returns a non empty array" do
        expect( subject.parameters.count ).to eq( 1 )        
      end
      it "contains the team specified" do
        expect( subject.parameters[:team_id] ).to eq( team.id )
      end
    end

    describe "#pick_meetings_by_ids" do
      it "returns 0 beacuse no id_list parameter set" do
        expect( subject.pick_meetings_by_ids ).to eq( 0 )
      end
    end
    describe "#pick_meetings_by_season" do
      it "returns 0 beacuse no season parameter set" do
        expect( subject.pick_meetings_by_season ).to eq( 0 )
      end
    end
    describe "#pick_meetings_by_team" do
      it "returns 0 or more meetings" do
        expect( subject.pick_meetings_by_team ).to be >= 0
      end
      it "returns the number of meetings attended by team not cancelled if request" do
        expect( subject.pick_meetings_by_team( nil, false ) ).to eq( team.meetings.distinct.select('meetings.id, meetings.is_cancelled').is_not_cancelled.count )
      end
      it "returns the number of meetings attended by team" do
        expect( subject.pick_meetings_by_team ).to eq( team.meetings.distinct.select('meetings.id').count )
      end
    end
    describe "#pick_meetings_by_swimmer" do
      it "returns 0 beacuse no id_list parameter set" do
        expect( subject.pick_meetings_by_swimmer ).to eq( 0 )
      end
    end
    describe "#pick_meetings_by_dates" do
      it "returns 0 beacuse no id_list parameter set" do
        expect( subject.pick_meetings_by_dates ).to eq( 0 )
      end
    end

    describe "#pick_meetings" do
      it "returns a well formed calendarDAO" do
        calendar = subject.pick_meetings
        expect( calendar ).to be_an_instance_of( CalendarDAO )
        expect( calendar.meetings ).to be_a_kind_of( Array )
        calendar.meetings.each do |meeting_dao|
          expect( meeting_dao ).to be_an_instance_of( CalendarDAO::MeetingDAO )
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "with dates parameter," do

    subject { CalendarMeetingPicker.new( date_start, date_end ) }

    describe "#parameters" do
      it "returns a non empty array" do
        expect( subject.parameters.count ).to eq( 2 )        
      end
      it "contains the dates specified" do
        expect( subject.parameters[:date_start] ).to eq( date_start )
        expect( subject.parameters[:date_end] ).to eq( date_end )
      end
    end

    describe "#pick_meetings_by_ids" do
      it "returns 0 beacuse no id_list parameter set" do
        expect( subject.pick_meetings_by_ids ).to eq( 0 )
      end
    end
    describe "#pick_meetings_by_season" do
      it "returns 0 beacuse no season parameter set" do
        expect( subject.pick_meetings_by_season ).to eq( 0 )
      end
    end
    describe "#pick_meetings_by_team" do
      it "returns 0 beacuse no team parameter set" do
        expect( subject.pick_meetings_by_team ).to eq( 0 )
      end
    end
    describe "#pick_meetings_by_swimmer" do
      it "returns 0 beacuse no swimmer parameter set" do
        expect( subject.pick_meetings_by_swimmer ).to eq( 0 )
      end
    end
    describe "#pick_meetings_by_dates" do
      it "returns 0 or more meetings" do
        expect( subject.pick_meetings_by_dates ).to be >= 0
      end
      it "returns the number of not cancelled meetings between specified dates if request" do
        expect( subject.pick_meetings_by_dates( nil, false ) ).to eq( Meeting.is_not_cancelled.where( "(header_date >= '#{date_start}') AND (header_date <= '#{date_end}')" ).count )
      end
      it "returns the number of meetings between specified dates" do
        expect( subject.pick_meetings_by_dates ).to eq( Meeting.where( "(header_date >= '#{date_start}') AND (header_date <= '#{date_end}')" ).count )
      end
    end

    describe "#pick_meetings" do
      it "returns a well formed calendarDAO" do
        calendar = subject.pick_meetings
        expect( calendar ).to be_an_instance_of( CalendarDAO )
        expect( calendar.meetings ).to be_a_kind_of( Array )
        calendar.meetings.each do |meeting_dao|
          expect( meeting_dao ).to be_an_instance_of( CalendarDAO::MeetingDAO )
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
