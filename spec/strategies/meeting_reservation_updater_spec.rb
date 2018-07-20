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


      context "for a valid user w/ incomplete parameters (nil Meeting ID)," do
        it "returns nil" do
          expect( subject.process!( nil, badge_ind.id, event_ind.id, false ) ).to be nil
        end
      end


      context "for a valid user w/ incomplete parameters (nil Badge ID)," do
        it "returns nil" do
          expect( subject.process!( meeting_ind.id, nil, event_ind.id, false ) ).to be nil
        end
      end


      context "for a valid user w/ valid parameters (full data, individual event => CREATE or UPDATE)," do
        let(:fake_hdr_notes)  { "Fake header notes #0" }
        let(:result) do
          subject.process!( meeting_ind.id, badge_ind.id, event_ind.id, true, false, false, timing_text, fake_hdr_notes )
        end

        it "returns the created or updated ind. reservation instance" do
          expect( result ).to be_a( MeetingEventReservation )
        end
        it "persists the specified values into the detail row specified" do
          expect( result.get_timing_instance.to_hundreds ).to eq( TimingParser.parse( timing_text ).to_hundreds )
          expect( result.meeting_id ).to eq( meeting_ind.id )
          expect( result.team_id ).to eq( badge_ind.team_id )
          expect( result.swimmer_id ).to eq( badge_ind.swimmer_id )
          expect( result.badge_id ).to eq( badge_ind.id )
          expect( result.meeting_event_id ).to eq( event_ind.id )
          expect( result.is_doing_this ).to be true
          expect( result.user_id ).to eq( current_user.id )
        end
        it "persists the specified values into the associated HEADER row" do
          header_row = MeetingReservation.where( meeting_id: result.meeting_id, badge_id: result.badge_id ).first
          expect( header_row.meeting_id ).to eq( meeting_ind.id )
          expect( header_row.team_id ).to eq( badge_ind.team_id )
          expect( header_row.swimmer_id ).to eq( badge_ind.swimmer_id )
          expect( header_row.badge_id ).to eq( badge_ind.id )
          expect( header_row.is_not_coming ).to be false
          expect( header_row.has_confirmed ).to be false
          expect( header_row.user_id ).to eq( current_user.id )
          expect( header_row.notes ).to eq( fake_hdr_notes )
        end
      end


      context "for a valid user w/ valid parameters (full data, relay event => CREATE or UPDATE)," do
        let(:fake_hdr_notes)  { "Fake header notes #1" }
        let(:fake_rel_notes)  { "Fake relay notes" }
        let(:result) do
          expect( event_rel.event_type.is_a_relay? ).to be true
          subject.process!( meeting_rel.id, badge_rel.id, event_rel.id, true,
                            false, false, timing_text, fake_hdr_notes, fake_rel_notes )
        end
        it "returns the created or updated relay reservation instance" do
          expect( result ).to be_a( MeetingRelayReservation )
        end
        it "persists the specified values into the relay row" do
          expect( result.meeting_id ).to eq( meeting_rel.id )
          expect( result.team_id ).to eq( badge_rel.team_id )
          expect( result.swimmer_id ).to eq( badge_rel.swimmer_id )
          expect( result.badge_id ).to eq( badge_rel.id )
          expect( result.meeting_event_id ).to eq( event_rel.id )
          expect( result.is_doing_this ).to be true
          expect( result.user_id ).to eq( current_user.id )
          expect( result.notes ).to eq( fake_rel_notes )
        end
        it "persists the specified values into the associated HEADER row" do
          header_row = MeetingReservation.where( meeting_id: result.meeting_id, badge_id: result.badge_id ).first
          expect( header_row.meeting_id ).to eq( meeting_rel.id )
          expect( header_row.team_id ).to eq( badge_rel.team_id )
          expect( header_row.swimmer_id ).to eq( badge_rel.swimmer_id )
          expect( header_row.badge_id ).to eq( badge_rel.id )
          expect( header_row.is_not_coming ).to be false
          expect( header_row.has_confirmed ).to be false
          expect( header_row.user_id ).to eq( current_user.id )
          expect( header_row.notes ).to eq( fake_hdr_notes )
        end
      end


      context "for a valid user w/ valid parameters (full data, relay event, nil timing => CREATE or UPDATE)," do
        let(:fake_hdr_notes)  { "Fake header notes #1" }
        let(:fake_rel_notes)  { "Fake relay notes" }
        let(:result) do
          expect( event_rel.event_type.is_a_relay? ).to be true
          subject.process!( meeting_rel.id, badge_rel.id, event_rel.id, true,
                            false, false, nil, fake_hdr_notes, fake_rel_notes )
        end
        it "returns the created or updated relay reservation instance" do
          expect( result ).to be_a( MeetingRelayReservation )
        end
        it "persists the specified values into the relay row" do
          expect( result.meeting_id ).to eq( meeting_rel.id )
          expect( result.team_id ).to eq( badge_rel.team_id )
          expect( result.swimmer_id ).to eq( badge_rel.swimmer_id )
          expect( result.badge_id ).to eq( badge_rel.id )
          expect( result.meeting_event_id ).to eq( event_rel.id )
          expect( result.is_doing_this ).to be true
          expect( result.user_id ).to eq( current_user.id )
          expect( result.notes ).to eq( fake_rel_notes )
        end
        it "persists the specified values into the associated HEADER row" do
          header_row = MeetingReservation.where( meeting_id: result.meeting_id, badge_id: result.badge_id ).first
          expect( header_row.meeting_id ).to eq( meeting_rel.id )
          expect( header_row.team_id ).to eq( badge_rel.team_id )
          expect( header_row.swimmer_id ).to eq( badge_rel.swimmer_id )
          expect( header_row.badge_id ).to eq( badge_rel.id )
          expect( header_row.is_not_coming ).to be false
          expect( header_row.has_confirmed ).to be false
          expect( header_row.user_id ).to eq( current_user.id )
          expect( header_row.notes ).to eq( fake_hdr_notes )
        end
      end


      context "for a valid user w/ valid parameters (nil Event ID, nil timing => CREATE or UPDATE just HEADER)," do
        let(:fake_notes)  { "Fake header notes #2" }
        let(:result) do
          expect( badge_ind ).to be_a( Badge )
          subject.process!( meeting_ind.id, badge_ind.id, nil, nil, false, false, nil, fake_notes )
        end

        it "returns the created or updated reservation HEADER instance" do
          expect( result ).to be_a( MeetingReservation )
        end
        it "persists the specified values into the HEADER row" do
          expect( result.meeting_id ).to eq( meeting_ind.id )
          expect( result.team_id ).to eq( badge_ind.team_id )
          expect( result.swimmer_id ).to eq( badge_ind.swimmer_id )
          expect( result.badge_id ).to eq( badge_ind.id )
          expect( result.is_not_coming ).to be false
          expect( result.has_confirmed ).to be false
          expect( result.notes ).to eq( fake_notes )
          expect( result.user_id ).to eq( current_user.id )
        end
      end


      context "for a valid user w/ valid parameters for an existing Meeting reservation & is_not_coming = true (DELETE detail rows)," do
        let(:destroyable_mrs) { MeetingEventReservation.order(created_at: :desc).limit(100).sample }
        let( :result ) do
          subject.process!(
            destroyable_mrs.meeting_id,
            destroyable_mrs.badge_id,
            destroyable_mrs.meeting_event_id,
            false,
            true  # is_not_coming
          )
        end
        it "returns true to signal the deletion of the row" do
          expect( result ).to be true
        end
      end


      context "for a valid user w/ valid parameters for an existing Meeting reservation & nil timing (DELETE detail row)," do
        let(:res_header) do
          MeetingReservation.order(created_at: :desc).limit(200).sample
        end
        let(:destroyable_res) do
# DEBUG
#          puts "\r\n- BEFORE res_header: #{ res_header.inspect }"
          MeetingEventReservation.where( meeting_id: res_header.meeting_id, badge_id: res_header.badge_id )
            .sample
        end
        let(:fake_notes)  { "Fake header notes #3" }

        let( :result ) do
          subject.process!(
            destroyable_res.meeting_id,
            destroyable_res.badge_id,
            destroyable_res.meeting_event_id,
            false,
            false,  # is_not_coming
            false,  # has_confirmed
            nil,    # timing
            fake_notes
          )
        end
        it "returns true to signal the deletion of the row" do
          expect( result ).to be true
        end
        it "persists the specified values into the associated HEADER row" do
          result
          res_header.reload
# DEBUG
#          puts "\r\n- AFTER res_header: #{ res_header.inspect }"
          expect( res_header.notes ).to eq( fake_notes )
        end
      end
    end # (#process)
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
