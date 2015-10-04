# encoding: utf-8

require 'spec_helper'

describe SeasonPonderatedBestsDAO, type: :model do
  let(:season)              { Season.find(141) }
  let(:gender_type)         { GenderType.individual_only[ ((rand * GenderType.individual_only.count) % GenderType.individual_only.count).to_i ] }
  let(:category_type)       { season.category_types[ ((rand * season.category_types.count) % season.category_types.count).to_i ] }
  let(:event_type)          { season.event_types[ ((rand * season.event_types.count) % season.event_types.count).to_i ] }
  let(:pool_type)           { PoolType.find_by_code('25') }  # FIXME Randomize
  
  let(:sure_event_type)     { EventType.find_by_code('50SL') }
  let(:sure_pool_type)      { PoolType.find_by_code('25') }
  let(:sure_category_type)  { season.category_types.find_by_code('M25') }
  
  let(:best_to_be_ignored)  { 1 }
  let(:max_results_number)  { ((rand * 3) % 3).to_i + 3 }

  let(:time_swam)     { ((rand * 15000) % 15000).to_i + 1 }

  context "EventPonderatedBestDAO subclass," do

    subject { SeasonPonderatedBestsDAO::EventPonderatedBestDAO.new( gender_type, category_type, event_type, pool_type ) }

    it_behaves_like( "(the existance of a method)", [
      :gender_type, :category_type, :event_type, :pool_type, 
      :get_max_results, :get_bests_to_be_ignored, 
      :best_results, 
      :collect_event_bests, :clear, :set_ponderated_best, :get_ponderated_best
    ] )

    describe "#gender_type" do
      it "is the gender type used in construction" do
        expect( subject.gender_type ).to eq( gender_type )
      end
    end
    describe "#category_type" do
      it "is the category type used in construction" do
        expect( subject.category_type ).to eq( category_type )
      end
    end
    describe "#event_type" do
      it "is the event type used in construction" do
        expect( subject.event_type ).to eq( event_type )
      end
    end
    describe "#pool_type" do
      it "is the pool type used in construction" do
        expect( subject.pool_type ).to eq( pool_type )
      end
    end
    describe "#max_results" do
      it "is the maximum number of best results used in construction" do
        expect( subject.max_results ).to eq( max_results )
      end
    end
    describe "#bests_to_be_ignored" do
      it "is the number of best results to be ignored used in construction" do
        expect( subject.bests_to_be_ignored ).to eq( bests_to_be_ignored )
      end
    end
    #-- -------------------------------------------------------------------------
    #++
    
    describe "#best_results" do
      it "is the collection of best meeting individal results to considered for the event" do
        subject.find_event_bests( max_results_number )
        expect( subject.best_results ).to be_a_kind_of( Enumerable )
        expect( subject.best_results ).to all(be_a_kind_of( MeetingIndivudlaResult ))
      end
    end
    #-- -------------------------------------------------------------------------
    #++

    conetxt "as a valid instance" do
      describe "#clear" do
        it "it makes the best_results collection empty" do
          subject.clear
          expect( subject.best_results.count ).to be = 0
          expect( subject.get_pondered_best ).to be_null
          
          #TODO ensure it clears the list with almost an element
        end
      end
      #-- -------------------------------------------------------------------------
      #++

      describe "#collect_event_bests" do
        it "it collects the first given number of best results for the event" do
          # Ensure there are times swam
          subject.clear
          subjetc.category_type = sure_categroy_type
          subjetc.event_type    = sure_event_type
          subjetc.pool_type     = sure_pool_type

          subject.collect_event_bests( max_results_number )
          expect( subject.best_results.count ).to be > 0
          expect( subject.best_results.count ).to be <= max_results
        end
      end
      #-- -------------------------------------------------------------------------
      #++

      describe "#set_ponderated_best" do
        it "it sets teh value of pondered best time for the event" do
          # Ensure there are times swam
          subject.clear
          subjetc.category_type = sure_categroy_type
          subjetc.event_type    = sure_event_type
          subjetc.pool_type     = sure_pool_type
          
          subject.collect_event_bests( max_results_number )
          subject.set_ponderated_best
          expect( subject.get_ponderated_best ).to be_an_instance_of( Timing )
          expect( subject.get_ponderated_best ).to be >= subject.event_bests.get_timing.first
          expect( subject.get_ponderated_best ).to be <= subject.event_bests.get_timing.last
        end
      end
      #-- -------------------------------------------------------------------------
      #++

      describe "#get_ponderated_best" do
        context "without bests collected" do
          it "returns null" do
            subject.clear
            expect( subject.get_ponderated_best ).to be_null
          end
        end
        context "with bests collected" do
          it "returns the value of pondered best time for the event" do
            subject.find_event_bests( max_results_number )
            subject.set_ponderated_best
            expect( subject.get_ponderated_best ).to be_an_instance_of( Timing )
          end
        end
      end
      #-- -------------------------------------------------------------------------
      #++
    end    
    
  end
  #-- -------------------------------------------------------------------------
  #++


  context "as a valid instance," do

    subject { SeasonPonderatedBestDAO.new( season ) }

    it_behaves_like( "(the existance of a method)", [
      :season, :single_events, :scan_for_gender_category_and_event
    ] )

    describe "#season" do
      it "is the season specified for the construction" do
        expect( subject.season ).to eq( season )
      end
    end
    describe "#single_events" do
      it "is a collection of EventTargetTimeDAO" do
        expect( subject.single_events ).to be_a_kind_of( Enumerable )
        expect( subject.single_events ).to all(be_a_kind_of( SeasonPonderatedBestsDAO::EventPonderatedBestDAO ))
      end
    end

    describe "#scan_for_gender_category_and_event" do
      it "returns a collection of EventTargetTimeDAO" do
        subject.scan_for_gender_category_and_event
        expect( subject.single_events.size ).to be >= 0
        expect( subject.single_events ).to all(be_a_kind_of( SeasonPonderatedBestsDAO::EventPonderatedBestDAO ))
      end
    end
    
  end
  #-- -------------------------------------------------------------------------
  #++



  context "not a valid instance" do
    it "raises an exception for wrong season parameter" do
      expect{ SeasonPonderatedBestDAO.new( 'Wrong parameter' ) }.to raise_error( ArgumentError )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end

