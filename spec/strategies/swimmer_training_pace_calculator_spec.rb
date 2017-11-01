require 'rails_helper'


describe SwimmerTrainingPaceCalculator, type: :strategy do

  let(:fix_test_type)     { '2000' }
  let(:fix_minutes_2000 ) { (rand * 15).to_i + 25 }
  let(:fix_seconds_2000 ) { (rand * 59).to_i + 1 }
  let(:fix_minutes )      { (rand * 5).to_i + 1 }
  let(:fix_seconds )      { (rand * 59).to_i + 1 }
  let(:fix_minutes_cmp )  { fix_minutes + (rand * 5).to_i + 1 }
  let(:fix_seconds_cmp )  { (rand * 59).to_i + 1 }

  let(:fix_time_swam_2000 ) { Timing.new( 0, fix_seconds_2000, fix_minutes_2000 ) }
  let(:fix_base_pace )      { Timing.new( 0, fix_seconds, fix_minutes ) }

  context "with requested parameters" do
    subject { SwimmerTrainingPaceCalculator.new( fix_test_type, fix_time_swam_2000 ) }

    it_behaves_like( "(the existance of a method)", [
      :parameters, :base_pace, :time_swam, :time_compared, :calculated_swimmer_paces,
      :calculate_paces, :calculate_base_pace_2000, :calculate_paces_2000, :compute_pace_timing
    ] )

    describe "#parameters" do
      it "returns an array" do
        expect( subject.parameters ).to be_a_kind_of( Array )
      end
      it "returns a non empty array" do
        expect( subject.parameters.count ).to be > 0        
      end
    end

    describe "#base_pace" do
      it "returns a Timing" do
        expect( subject.base_pace ).to be_an_instance_of( Timing )
      end
      it "contains 0 before calculation" do
        expect( subject.base_pace.to_hundreds ).to eq( 0 )  
      end
    end

    describe "#calculated_swimmer_paces" do
      it "returns a SwimmerTrainingPaceDAO" do
        expect( subject.calculated_swimmer_paces ).to be_an_instance_of( SwimmerTrainingPaceDAO )
      end
      it "doesn't contain any pace before calculation" do
        subject.parameters.each do |parameter| 
          expect( subject.calculated_swimmer_paces.get_pace( parameter[:pace_type], parameter[:distance].to_s ) ).to eq( 0 )
        end
      end
    end
      
    describe "#calculate_paces" do
      it "returns a timing" do
        expect( subject.calculate_paces ).to be_an_instance_of( Timing ) 
      end
      it "calculates all paces in parameters" do
        expect( subject.parameters.count ).to be > 0
        subject.calculate_paces
        stp = subject.calculated_swimmer_paces
        expect( stp.count_paces ).to eq( subject.parameters.count )
        subject.parameters.each do |parameter|
          expect( stp.get_pace( parameter[:pace_type], parameter[:distance].to_s ) ).to be > 0
        end
      end
    end

    describe "#calculate_base_pace_2000" do
      it "returns a Timing" do
        expect( subject.calculate_base_pace_2000 ).to be_an_instance_of( Timing )
      end
      it "sets base pace" do
        expect( subject.base_pace.to_hundreds ).to eq( 0 )
        subject.calculate_base_pace_2000
        expect( subject.base_pace.to_hundreds ).to be > 0
      end
      it "sets the swam time / 20 as base pace" do
        subject.calculate_base_pace_2000
        expect( subject.base_pace ).to eq( Timing.new( ( subject.time_swam.to_hundreds / 20 ).to_i ) )
      end
    end

    describe "#calculate_paces_2000" do
      it "returns a SwimmerTrainingPaceDAO" do
        expect( subject.calculate_paces_2000 ).to be_an_instance_of( SwimmerTrainingPaceDAO )
      end
      it "sets base pace" do
        expect( subject.base_pace.to_hundreds ).to eq( 0 )
        subject.calculate_paces_2000
        expect( subject.base_pace.to_hundreds ).to be > 0
      end
      it "calculates A2 pace for 100 meters same as base pace" do
        expect( subject.parameters.count ).to be > 0
        stp = subject.calculate_paces_2000
        expect( stp.get_pace( 'A2', '100' ) ).to eq( subject.base_pace.to_hundreds )
      end
      it "calculates A2, B1 and B2 pace for 100, 200 and 400 meters" do
        stp = subject.calculate_paces_2000
        expect( stp.get_pace( 'A2', '100' ) ).to be > 0
        expect( stp.get_pace( 'B1', '100' ) ).to be > 0
        expect( stp.get_pace( 'B2', '100' ) ).to be > 0
        expect( stp.get_pace( 'A2', '200' ) ).to be > 0
        expect( stp.get_pace( 'B1', '200' ) ).to be > 0
        expect( stp.get_pace( 'B2', '200' ) ).to be > 0
        expect( stp.get_pace( 'A2', '400' ) ).to be > 0
        expect( stp.get_pace( 'B1', '400' ) ).to be > 0
        expect( stp.get_pace( 'B2', '400' ) ).to be > 0
      end
      it "calculates B1 for 100 meters faster than B1 for 400 meters" do
        stp = subject.calculate_paces_2000
        expect( stp.get_pace( 'B1', '100' ) ).to be < stp.get_pace( 'B1', '400' )
      end
      it "calculates B2 for 400 meters slower than B2 for 100 meters" do
        stp = subject.calculate_paces_2000
        expect( stp.get_pace( 'B2', '400' ) ).to be > stp.get_pace( 'B2', '100' )
      end
    end

    describe "#compute_pace_timing" do
      it "returns a timing instance" do
        expect( subject.compute_pace_timing() ).to be_an_instance_of( Timing )
      end
      it "returns base pace if no parameters given" do
        subject.base_pace = fix_base_pace
        expect( subject.compute_pace_timing() ).to eq( subject.base_pace )
      end
      it "returns a timing instance with one or more parameters given" do
        subject.base_pace = fix_base_pace
        fix_par1 = rand * 2
        fix_par2 = rand * 4
        expect( subject.compute_pace_timing( fix_par1 ) ).to be_an_instance_of( Timing )
        expect( subject.compute_pace_timing( fix_par1, fix_par2 ) ).to be_an_instance_of( Timing )
      end
      it "returns base pace if 1 rate given" do
        subject.base_pace = fix_base_pace
        expect( subject.compute_pace_timing( 1 ) ).to eq( subject.base_pace )
      end
      it "returns a timing greater than base pace if < 1 rate given" do
        fix_rate = rand
        expect( fix_rate ).to be <= 1
        subject.base_pace = fix_base_pace
        expect( subject.compute_pace_timing( fix_rate ) ).to be >= subject.base_pace
      end
      it "returns a timing smaller than base pace if > 1 rate given" do
        fix_rate = rand + 1
        expect( fix_rate ).to be >= 1
        subject.base_pace = fix_base_pace
        expect( subject.compute_pace_timing( fix_rate ) ).to be <= subject.base_pace
      end
      it "returns base pace if 1 rate and 1 moltiplier given" do
        subject.base_pace = fix_base_pace
        expect( subject.compute_pace_timing( 1, 1 ) ).to eq( subject.base_pace )
      end
      it "returns a timing greater than base pace if > 1 moltiplier given" do
        fix_moltiplier = (rand * 4).to_i + 1
        subject.base_pace = fix_base_pace
        expect( subject.compute_pace_timing( 1, fix_moltiplier ) ).to be >= subject.base_pace
      end
      it "returns a timing greater than base pace if > 1 moltiplier given" do
        fix_moltiplier = rand
        subject.base_pace = fix_base_pace
        expect( subject.compute_pace_timing( 1, fix_moltiplier ) ).to be <= subject.base_pace
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
