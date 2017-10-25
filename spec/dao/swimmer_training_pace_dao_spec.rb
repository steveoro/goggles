require 'rails_helper'


describe SwimmerTrainingPaceDAO, type: :model do

  let(:fix_test_type)     { '2000' }
  let(:fix_pool_length)   { 50 }
  let(:fix_date_swam)     { Date.today() - 100 + (rand * 200).to_i }

  let(:fix_pace_type )    { ['A2','B1','B2'].sample }
  let(:fix_distance )     { ['100','200','400'].sample }
  let(:fix_separator )    { '-' }

  let(:fix_minutes )      { (rand * 5).to_i + 1 }
  let(:fix_seconds )      { (rand * 59).to_i + 1 }
  
  subject { SwimmerTrainingPaceDAO.new() }

  describe "[a well formed instance]" do
    it "responds to to_csv" do
      expect( subject ).to respond_to( :to_csv )
    end

    it "responds to to_db!" do
      expect( subject ).to respond_to( :to_db! )
    end

    it_behaves_like( "(existance of a member array)", [
      :pace_types,
      :distances
    ])

    it_behaves_like( "(the existance of a method returning numeric values)", [
      :get_pace
    ])

    it_behaves_like( "(the existance of a method returning strings)", [
      :get_pace_code
    ])

  end
  #-- -------------------------------------------------------------------------
  #++
  
  describe "#get_pace_code" do
    it "returns a string containing pace type" do
      expect( subject.get_pace_code( fix_pace_type ) ).to include( fix_pace_type )
    end
    it "returns a string containing distance" do
      expect( subject.get_pace_code( fix_pace_type, fix_distance ) ).to include( fix_distance )
    end
    it "returns a string containing separator" do
      expect( subject.get_pace_code( fix_pace_type, fix_distance ) ).to include( fix_separator )
    end
    it "returns a string long as pace_type plus distance plus separator" do
      expect( subject.get_pace_code( fix_pace_type, fix_distance ).length ).to eq( ( fix_pace_type + fix_separator + fix_distance ).length )
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#set_pace" do
    it "returns a number" do
      expect( subject.set_pace( fix_pace_type, fix_distance, fix_minutes, fix_seconds ) ).to be > 0
    end
    it "returns the time in seconds" do
      expect( subject.set_pace( fix_pace_type, fix_distance, fix_minutes, fix_seconds ) ).to eq( (fix_minutes * 60) + fix_seconds )
    end
    it "sets the time in seconds in the specified pace and distance" do
      expect( subject.get_pace( fix_pace_type, fix_distance ) ).to eq( 0 )
      given_time = subject.set_pace( fix_pace_type, fix_distance, fix_minutes, fix_seconds )
      expect( subject.get_pace( fix_pace_type, fix_distance ) ).to eq( given_time )
    end   
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#get_pace" do
    it "returns 0 if not pace set" do
      expect( subject.get_pace( fix_pace_type, fix_distance ) ).to eq( 0 )
    end
    it "returns the time in seconds of the specified pace and distance" do
      expect( subject.get_pace( fix_pace_type, fix_distance ) ).to eq( 0 )
      given_time = subject.set_pace( fix_pace_type, fix_distance, fix_minutes, fix_seconds )
      expect( subject.get_pace( fix_pace_type, fix_distance ) ).to eq( given_time )      
    end   
  end
  #-- -------------------------------------------------------------------------
  #++
end
