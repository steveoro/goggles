require 'rails_helper'


describe SwimmerTrainingPaceCalculator, type: :strategy do

  let(:fix_test_type)     { '2000' }
  let(:fix_minutes_2000 ) { (rand * 15).to_i + 25 }
  let(:fix_seconds_2000 ) { (rand * 59).to_i + 1 }
  let(:fix_minutes )      { (rand * 5).to_i + 1 }
  let(:fix_seconds )      { (rand * 59).to_i + 1 }
  let(:fix_minutes_cmp )  { fix_minutes + (rand * 5).to_i + 1 }
  let(:fix_seconds_cmp )  { (rand * 59).to_i + 1 }

  context "with requested parameters" do
    subject { SwimmerTrainingPaceCalculator.new( fix_test_type, fix_minutes_2000, fix_seconds_2000 ) }

    it_behaves_like( "(the existance of a method)", [
      :calculate_paces, :calculate_paces_2000
    ] )

    describe "#calculate_paces" do
      
    end

    describe "calculate_paces_2000" do
      it "returns a number" do
        expect( subject.calculate_paces_2000 ).to be > 0
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
