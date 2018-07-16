# encoding: utf-8
require 'rails_helper'
require 'relay_swimmer_updater'


describe RelaySwimmerUpdater, type: :strategy do
  context "for a nil current user," do
    it "raises an ArgumentError" do
      expect{ RelaySwimmerUpdater.new(nil) }.to raise_error( ArgumentError )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "for any valid user," do
    let(:current_user)  { User.all.sample }
    subject { RelaySwimmerUpdater.new( current_user ) }

    it "is a valid (new) instance" do
      expect( subject ).to be_a( RelaySwimmerUpdater )
    end

    it_behaves_like( "(the existance of a method)", [
      :process!,
    ] )
    #-- -----------------------------------------------------------------------
    #++


    describe "#process" do
      let(:mrr_sample)    { MeetingRelayResult.limit(200).sample }
      let(:relay_order)   { (1..4).to_a.sample }
      let(:ta)            { TeamAffiliation.where( team_id: mrr_sample.team_id, season_id: mrr_sample.season.id ).first }
      let(:swimmer)       { ta.badges.sample.swimmer }
      let(:min)           { (0..1).to_a.sample }
      let(:sec)           { (0..59).to_a.sample }
      let(:hun)           { (0..59).to_a.sample }
      let(:reaction)      { (0..99).to_a.sample }
      let(:timing_text)   { "#{ min }'#{ sec }\"#{ hun }" }
      let(:reaction_text) { "0\"#{ reaction }" }


      context "for a valid user w/ incomplete parameters (nil MRR)," do
        it "returns nil" do
          expect( subject.process!( nil, relay_order, swimmer.id, timing_text, reaction_text ) ).to be nil
        end
      end


      context "for a valid user w/ incomplete parameters (nil or 0 relay_order)," do
        it "returns nil" do
          expect( subject.process!( mrr_sample, [0, nil].sample, swimmer.id, timing_text, reaction_text ) ).to be nil
        end
      end


      context "for a valid user w/ valid parameters (full data)," do
        let(:mrs_sample)    { MeetingRelaySwimmer.includes(:meeting_relay_result).joins(:meeting_relay_result).last(100).sample }
        let(:new_reaction)  { "1\"#{ (0..99).to_a.sample }" }
        let(:result) do
# DEBUG
#          puts "\r\nBEFORE process: #{ mrs_sample.inspect }"
          subject.process!(
            mrs_sample.meeting_relay_result,
            mrs_sample.relay_order,
            mrs_sample.swimmer_id,
            mrs_sample.get_timing,
            new_reaction
          )
        end

        it "returns the created or updated MRS instance" do
          expect( result ).to be_a( MeetingRelaySwimmer )
        end
        it "persists the specified values into the MeetingRelaySwimmer row specified by the keys" do
          expect( result.minutes ).to eq( mrs_sample.minutes )
          expect( result.seconds ).to eq( mrs_sample.seconds )
          expect( result.hundreds ).to eq( mrs_sample.hundreds )
          expect( result.reaction_time.to_f ).to eq( TimingParser.parse( new_reaction ).to_hundreds / 100.0 )
          expect( result.swimmer_id ).to eq( mrs_sample.swimmer_id )
          expect( result.badge_id ).to eq( mrs_sample.badge_id )
          expect( result.stroke_type_id ).to eq( mrs_sample.stroke_type_id )
        end
      end


      context "for a valid user w/ valid parameters (full data, changing only the reaction text)," do
        let(:result) do
          subject.process!( mrr_sample, relay_order, swimmer.id, timing_text, reaction_text )
        end

        it "returns the created or updated MRS instance" do
          expect( result ).to be_a( MeetingRelaySwimmer )
        end
        it "persists the specified values into the MeetingRelaySwimmer row specified by the keys" do
          expect( result.minutes ).to eq( min )
          expect( result.seconds ).to eq( sec )
          expect( result.hundreds ).to eq( hun )
          expect( result.reaction_time.to_f ).to eq( TimingParser.parse( reaction_text ).to_hundreds / 100.0 )
          expect( result.badge_id ).to be > 0
          expect( result.stroke_type_id ).to be > 0
        end
      end


      context "for a valid user w/ valid parameters for an existing MRS row (no swimmer ID, no timings)," do
        let( :result ) do
          FactoryBot.create(:meeting_relay_swimmer, meeting_relay_result: mrr_sample, relay_order: 5)
          subject.process!( mrr_sample, 5, nil, nil, nil )
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
