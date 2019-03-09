require 'rails_helper'


describe RelaySwimmersCombiner, type: :strategy do

  let(:fix_team)             { Team.find( 1 ) }
  let(:fix_meeting)          { Meeting.find( 18104 ) }
  let(:fix_relay)            { fix_meeting.meeting_events.joins(:event_type).where("event_types.is_a_relay").first }

  
  subject { RelaySwimmersCombiner.new(fix_team, fix_relay) }

  describe "[a well formed instance]" do
    it "sets given team" do
      expect( subject.team ).to be_an_instance_of( Team )
      expect( subject.team.id ).to eq( fix_team.id )
    end
    it "sets given meeting_event" do
      expect( subject.meeting_event ).to be_an_instance_of( MeetingEvent )
      expect( subject.meeting_event.id ).to eq( fix_relay.id )
    end
    
  end
  #-- -------------------------------------------------------------------------
  #++
end
