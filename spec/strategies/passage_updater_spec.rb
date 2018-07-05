# encoding: utf-8
require 'rails_helper'
require 'passage_updater'


describe PassageUpdater, type: :strategy do
  context "for a nil current user," do
    it "raises an ArgumentError" do
      expect{ PassageUpdater.new(nil) }.to raise_error( ArgumentError )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "for any valid user," do
    let(:current_user)  { User.all.sample }
    subject { PassageUpdater.new( current_user ) }

    it "is a valid (new) instance" do
      expect( subject ).to be_a( PassageUpdater )
    end

    it_behaves_like( "(the existance of a method)", [
      :process!,
    ] )
    #-- -----------------------------------------------------------------------
    #++


    describe "#process" do
      let(:destroyable_passage) { Passage.order(created_at: :asc).limit(100).sample }
      let(:passage)       { Passage.includes(:meeting_individual_result).limit(100).sample }
      let(:min)           { (0..1).to_a.sample }
      let(:sec)           { (0..59).to_a.sample }
      let(:hun)           { (0..59).to_a.sample }
      let(:reaction)      { (0..99).to_a.sample }
      let(:timing_text)   { "#{ min }'#{ sec }\"#{ hun }" }
      let(:reaction_text) { "0\"#{ reaction }" }


      context "for a valid user w/ incomplete parameters (nil Passage ID & timing)," do
        it "returns nil" do
          expect( subject.process!( nil, nil ) ).to be nil
        end
      end


      context "for a valid user w/ valid parameters (full data)," do
        let(:result) do
          subject.process!( passage, timing_text, passage.passage_type_id, passage.meeting_individual_result_id, reaction_text )
        end

        it "returns the created or updated MRS instance" do
          expect( result ).to be_a( Passage )
        end
        it "persists the specified values into the Passage row specified" do
          expect( result.get_timing_instance.to_hundreds ).to eq( TimingParser.parse( timing_text ).to_hundreds )
          expect( result.reaction_time ).to eq( TimingParser.parse( reaction_text ).to_hundreds / 100.0 )
          expect( result.passage_type_id ).to eq( passage.passage_type_id )
          expect( result.meeting_individual_result_id ).to eq( passage.meeting_individual_result_id )
        end
      end


      context "for a valid user w/ valid parameters for an existing Passage row  but no timings," do
        let( :result ) do
          subject.process!( destroyable_passage, nil )
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
