# encoding: utf-8
require 'rails_helper'
require 'passage_updater'


describe MeetingReservationUpdater, type: :strategy do
  context "for a nil current user," do
    it "raises an ArgumentError" do
      expect{ MeetingReservationUpdater.new(nil) }.to raise_error( ArgumentError )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "for any valid user," do
    let(:current_user)  { User.all.sample }
    subject { MeetingReservationUpdater.new( current_user ) }

    it "is a valid (new) instance" do
      expect( subject ).to be_a( MeetingReservationUpdater )
    end

    it_behaves_like( "(the existance of a method)", [
      :process!,
    ] )
    #-- -----------------------------------------------------------------------
    #++


    describe "#process" do
      let(:meeting_ind)   { Meeting.has_results.order(created_at: :desc).limit(100).sample }
      let(:event_ind)     { meeting_ind.meeting_events.joins(:event_type).includes(:event_type).where('event_types.is_a_relay' => false).sample }
      let(:mir)           { event_ind.meeting_individual_results.sample }
      let(:badge_ind)     { mir.badge }
      let(:min)           { mir.minutes }
      let(:sec)           { mir.seconds }
      let(:hun)           { mir.hundreds }
      let(:timing_text)   { "#{ min }'#{ sec }\"#{ hun }" }

      let(:mrr)           { MeetingRelayResult.order(created_at: :desc).limit(100).sample }
      let(:event_rel)     { mrr.meeting_event }
      let(:meeting_rel)   { mrr.meeting }
      let(:badge_rel)     { mrr.team_affiliation.badges.sample }

      let(:destroyable_mrs) { MeetingEventReservation.order(created_at: :desc).limit(100).sample }


      context "for a valid user w/ incomplete parameters (nil Event ID)," do
        it "returns nil" do
          expect( subject.process!( nil, badge_ind.id, false ) ).to be nil
        end
      end


      context "for a valid user w/ valid parameters (full data, indivdual event => CREATE or UPDATE)," do
        let(:result) do
          subject.process!( event_ind.id, badge_ind.id, true, false, false, timing_text, nil )
        end

        it "returns the created or updated MRS instance" do
          expect( result ).to be_a( MeetingEventReservation )
        end
        it "persists the specified values into the Passage row specified" do
          expect( result.get_timing_instance.to_hundreds ).to eq( TimingParser.parse( timing_text ).to_hundreds )
          expect( result.meeting_id ).to eq( meeting_ind.id )
          expect( result.team_id ).to eq( badge_ind.team_id )
          expect( result.swimmer_id ).to eq( badge_ind.swimmer_id )
          expect( result.badge_id ).to eq( badge_ind.id )
          expect( result.meeting_event_id ).to eq( event_ind.id )
          expect( result.is_doing_this ).to be true
          expect( result.user_id ).to eq( current_user.id )
        end
      end


      context "for a valid user w/ valid parameters (full data, relay event => CREATE or UPDATE)," do
        let(:fake_notes)  { "Fake notes" }
        let(:result) do
          expect( event_rel.event_type.is_a_relay? ).to be true
          subject.process!( event_rel.id, badge_rel.id, true,
                            false, false,
                            timing_text, fake_notes )
        end

        it "returns the created or updated MRS instance" do
          expect( result ).to be_a( MeetingRelayReservation )
        end
        it "persists the specified values into the Passage row specified" do
          expect( result.meeting_id ).to eq( meeting_rel.id )
          expect( result.team_id ).to eq( badge_rel.team_id )
          expect( result.swimmer_id ).to eq( badge_rel.swimmer_id )
          expect( result.badge_id ).to eq( badge_rel.id )
          expect( result.meeting_event_id ).to eq( event_rel.id )
          expect( result.is_doing_this ).to be true
          expect( result.user_id ).to eq( current_user.id )
          expect( result.notes ).to eq( fake_notes )
        end
      end


      context "for a valid user w/ valid parameters for an existing Meeting reservation & is_not_coming = true (DELETE detail rows)," do
        let( :result ) do
          subject.process!(
            destroyable_mrs.meeting_event_id,
            destroyable_mrs.badge_id,
            false,
            true
          )
        end

        it "returns true to signal the deletion of the row" do
          expect( result ).to be true
        end
      end
    end # (#process)
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
