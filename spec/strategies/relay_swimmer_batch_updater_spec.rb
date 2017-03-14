# encoding: utf-8
require 'rails_helper'
require 'relay_swimmer_batch_updater'


describe RelaySwimmerBatchUpdater, type: :strategy do
  context "for a nil current user," do
    it "raises an ArgumentError" do
      expect{ RelaySwimmerBatchUpdater.new(nil) }.to raise_error( ArgumentError )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "for a logged-in generic current user (which is NOT a team manager)," do
    it "raises an ArgumentError" do
      expect{ RelaySwimmerBatchUpdater.new( FactoryGirl.build(:user) ) }.to raise_error( ArgumentError )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "for a logged-in current user team-manager," do
    let(:team_manager_user) do
      TeamManager.includes(:user).joins(:user).limit(100)
        .sort{0.5-rand}.first
        .user
    end
    subject { RelaySwimmerBatchUpdater.new( team_manager_user ) }

    it "is a valid (new) instance" do
      expect( subject ).to be_a( RelaySwimmerBatchUpdater )
    end

    it_behaves_like( "(the existance of a method)", [
      :edited_rows_count, :created_rows_count, :destroyed_rows_count,
      :errors_count, :processed_rows,
      :edit_existing_row, :create_new_row
    ] )

    describe "#edited_rows_count" do
      it "is zero" do
        expect( subject.edited_rows_count ).to eq(0)
      end
    end

    describe "#created_rows_count" do
      it "is zero" do
        expect( subject.created_rows_count ).to eq(0)
      end
    end

    describe "#errors_count" do
      it "is zero" do
        expect( subject.errors_count ).to eq(0)
      end
    end

    describe "#processed_rows" do
      it "is zero" do
        expect( subject.processed_rows ).to eq(0)
      end
    end
    #-- -----------------------------------------------------------------------
    #++


    describe "#edit_existing_row" do
      # (User/team manager isn't actually checked (for edit grants or not) while updating or creating relay swimmer rows)
      let(:team_manager_user) { User.find(1) }
      let(:team) { Team.first }
      let(:editable_mrr)      { create(:meeting_relay_result, team_id: team.id) }
      let(:editable_mrs)      { create(:meeting_relay_swimmer, meeting_relay_result_id: editable_mrr.id ) }
      subject { RelaySwimmerBatchUpdater.new( team_manager_user ) }

      context "when changing the timing," do
        let(:updated_minutes)   { (rand * 100 % 60).to_i }
        let(:updated_seconds)   { (rand * 100 % 60).to_i }
        let(:updated_hundreds)  { (rand * 100 % 60).to_i }
        let(:updated_timing)    { "#{updated_minutes}\'#{updated_seconds}\"#{updated_hundreds}" }
        before(:each) do
          subject.edit_existing_row( editable_mrr, editable_mrs, editable_mrs.swimmer_id, editable_mrs.badge_id, updated_timing )
        end
        it "updates the MRS" do
          expect( editable_mrs.minutes ).to eq( updated_minutes )
          expect( editable_mrs.seconds ).to eq( updated_seconds )
          expect( editable_mrs.hundreds ).to eq( updated_hundreds )
        end
        it "records the updates into the DB diff log" do
          expect( subject.sql_diff_text_log ).to include(
            "`minutes`=#{updated_minutes}, `seconds`=#{updated_seconds}, `hundreds`=#{updated_hundreds}"
          )
        end
        it "increases the #edited_rows_count" do
          expect( subject.edited_rows_count ).to be > 0
        end
        it "increases the #processed_rows" do
          expect( subject.processed_rows ).to be > 0
        end
      end

      context "when changing the swimmer_id," do
        let(:updated_rnd_badge) { Badge.where(team_id: team.id).limit(200).sort{0.5 - rand}.first }
        before(:each) do
          subject.edit_existing_row( editable_mrr, editable_mrs, updated_rnd_badge.swimmer_id, updated_rnd_badge.id, editable_mrs.get_timing )
        end
        it "updates the MRS" do
          expect( editable_mrs.swimmer_id ).to eq( updated_rnd_badge.swimmer_id )
        end
        it "records the updates into the DB diff log" do
          expect( subject.sql_diff_text_log ).to include(
            "`swimmer_id`=#{updated_rnd_badge.swimmer_id}, `badge_id`=#{updated_rnd_badge.id}"
          )
        end
        it "increases the #edited_rows_count" do
          expect( subject.edited_rows_count ).to be > 0
        end
        it "increases the #processed_rows" do
          expect( subject.processed_rows ).to be > 0
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++


    describe "#create_new_row" do
      # (User/team manager isn't actually checked (for edit grants or not) while updating or creating relay swimmer rows)
      let(:team_manager_user) { User.find(1) }
      let(:team)          { Team.first }
      let(:editable_mrr)  { create(:meeting_relay_result, team_id: team.id) }
      let(:relay_order)   { (rand * 10 % 4 + 1).to_i }
      let(:minutes)       { (rand * 100 % 60).to_i }
      let(:seconds)       { (rand * 100 % 60).to_i }
      let(:hundreds)      { (rand * 100 % 60).to_i }
      let(:timing)        { "#{ minutes }\'#{ seconds }\"#{ hundreds }" }
      let(:rnd_badge)     { Badge.where(team_id: team.id).limit(200).sort{0.5 - rand}.first }

      subject { RelaySwimmerBatchUpdater.new( team_manager_user ) }

      before(:each) do
        subject.create_new_row( editable_mrr, relay_order, rnd_badge.swimmer_id, rnd_badge.id, timing )
      end

      it "creates a new row for the MRS" do
        expect( MeetingRelaySwimmer.where( meeting_relay_result_id: editable_mrr.id ).count ).to be > 0
      end
      it "creates the new MRS with the expected values" do
        mrs = MeetingRelaySwimmer.where( meeting_relay_result_id: editable_mrr.id ).last
        expect( mrs ).to be_a( MeetingRelaySwimmer )
        expect( mrs.meeting_relay_result_id ).to eq( editable_mrr.id )
        expect( mrs.relay_order ).to eq( relay_order )
        expect( mrs.minutes ).to eq( minutes )
        expect( mrs.seconds ).to eq( seconds )
        expect( mrs.hundreds ).to eq( hundreds )
        expect( mrs.swimmer_id ).to eq( rnd_badge.swimmer_id )
        expect( mrs.badge_id ).to eq( rnd_badge.id )
        expect( mrs.user_id ).to eq( team_manager_user.id )
      end
      it "records the creation into the DB diff log" do
        expect( subject.sql_diff_text_log ).to include( "#{ relay_order }, #{ rnd_badge.swimmer_id }, #{ rnd_badge.id }" )
        expect( subject.sql_diff_text_log ).to include( "#{ minutes }, #{ seconds }, #{ hundreds }, #{ editable_mrr.id }" )
      end
      it "increases the #created_rows_count" do
        expect( subject.created_rows_count ).to be > 0
      end
      it "increases the #processed_rows" do
        expect( subject.processed_rows ).to be > 0
      end
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "self.get_fractionist_stroke_type_id_by()" do
    context "for a non-mixed relay ID," do
      [
        StrokeType::FREESTYLE_ID, StrokeType::BUTTERFLY_ID, StrokeType::BACKSTROKE_ID,
        StrokeType::BREASTSTROKE_ID, StrokeType::MIXED_ID
      ].each do |stroke_type_id|
        it "returns the stroke type ID specified as parameter" do
          (1..8).each do |relay_phase|
            expect(
              RelaySwimmerBatchUpdater.get_fractionist_stroke_type_id_by( stroke_type_id, relay_phase )
            ).to eq( stroke_type_id )
          end
        end
      end
    end

    context "for a mixed relay ID," do
      it "returns the standard mixed relay stroke type ID for the corresponding relay phase" do
        expected_stroke_type_sequence = [
          StrokeType::BACKSTROKE_ID, StrokeType::BREASTSTROKE_ID,
          StrokeType::BUTTERFLY_ID, StrokeType::FREESTYLE_ID
        ]
        (1..4).each do |relay_phase|
          expect(
            RelaySwimmerBatchUpdater.get_fractionist_stroke_type_id_by( StrokeType::MIXED_RELAY_ID, relay_phase )
          ).to eq( expected_stroke_type_sequence[relay_phase-1] )
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
