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
      let(:passage)             { Passage.includes(:meeting_individual_result).joins(:meeting_individual_result).limit(100).sample }
      let(:min)                 { (0..1).to_a.sample }
      let(:sec)                 { (0..59).to_a.sample }
      let(:hun)                 { (0..59).to_a.sample }
      let(:reaction)            { (0..99).to_a.sample }
      let(:timing_text)         { "#{ min }'#{ sec }\"#{ hun }" }
      let(:reaction_text)       { "0\"#{ reaction }" }


      context "for a valid user w/ incomplete parameters (nil Passage ID & timing)," do
        it "returns nil" do
          expect( subject.process!( nil, nil ) ).to be nil
        end
      end


      context "for a valid user w/ valid parameters (full data, existing Passage)," do
        let(:result) do
# DEBUG
#          puts "\r\nBEFORE Passage: #{ passage.inspect }, timing_text: #{ timing_text }"
          subject.process!( passage, timing_text, passage.passage_type_id, passage.meeting_individual_result_id, reaction_text )
        end

        it "returns the created or updated row instance" do
# DEBUG
#          puts "\r\nresult: #{ result.inspect }, timing_text: #{ timing_text }"
          expect( result ).to be_a( Passage )
        end
        it "persists the specified values into the row specified" do
          # Timing will be converted to delta-timing depending on its value, so we check both values with an OR:
          expect( min ).to eq( result.minutes ).or eq( result.minutes_from_start )
          expect( sec ).to eq( result.seconds ).or eq( result.seconds_from_start )
          expect( hun ).to eq( result.hundreds ).or eq( result.hundreds_from_start )
          expect( result.reaction_time.to_f ).to eq( TimingParser.parse( reaction_text ).to_hundreds / 100.0 )
          expect( result.passage_type_id ).to eq( passage.passage_type_id )
          expect( result.meeting_individual_result_id ).to eq( passage.meeting_individual_result_id )
        end
      end


      context "for a valid user w/ valid parameters (full data, existing Passage but no MIR & MPRG)," do
        let(:passage_wrongdata) do
          FactoryBot.create(
            :passage,
            meeting_individual_result_id: nil,
            meeting_program_id: nil,
            swimmer_id: Swimmer.limit(100).sample.id,
            team_id: Team.limit(100).sample.id
          )
        end
        let(:result) do
# DEBUG
#          puts "\r\nBEFORE Passage: #{ passage_wrongdata.inspect }, timing_text: #{ timing_text }"
          subject.process!( passage_wrongdata, timing_text, passage_wrongdata.passage_type_id, passage_wrongdata.meeting_individual_result_id, reaction_text )
        end

        it "returns the created or updated row instance" do
# DEBUG
#          puts "\r\nresult: #{ result.inspect }, timing_text: #{ timing_text }"
          expect( result ).to be_a( Passage )
        end
        it "persists the specified values into the Passage row specified" do
          # Timing will be converted to delta-timing depending on its value, so we check both values with an OR:
          expect( min ).to eq( result.minutes ).or eq( result.minutes_from_start )
          expect( sec ).to eq( result.seconds ).or eq( result.seconds_from_start )
          expect( hun ).to eq( result.hundreds ).or eq( result.hundreds_from_start )
          expect( result.reaction_time.to_f ).to eq( TimingParser.parse( reaction_text ).to_hundreds / 100.0 )
          expect( result.passage_type_id ).to eq( passage_wrongdata.passage_type_id )
          expect( result.meeting_individual_result_id ).to be nil
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
