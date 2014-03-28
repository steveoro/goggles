require 'spec_helper'

describe Season do

  before(:each) do
    @season1 = Factory(:season)
  end

  context "season details" do
    it "has a valid factory" do
      @season1.should be_valid
      expect( @season1.season_type ).to be_a( SeasonType )
      expect( @season1.federation_type ).to be_a( FederationType )
    end
    
    it "has a method to return if season is ended" do
      expect( @season1 ).to respond_to( :is_season_ended )
    end
    
    it "is_season_ended should evaluate dates" do 
      @season1.is_season_ended(20201231).should true
      @season1.is_season_ended(20100101).should false
    end

    it "has a method to return season type" do
      expect( @season1 ).to respond_to( :get_season_type )
    end
    
    it "get_season_tpe should return correct season type" do
      expect( @season1.get_season_type ).to eq( "MASFIN" )
    end

    it "has a method to return federation type" do
      expect( @season1 ).to respond_to( :get_federation_type )
    end
    
    it "get_federation_tpe should return correct fedeation type" do
      expect( @season1.get_season_type ).to eq( "FIN" )
    end
  end
  
  context "season results" do
    it "has a method to return meeting list"

    it "has a method to determine season ranking"
    
    it "has a method to determine season team charts"
    
    it "has a method to determine season athlete charts"
  end

end
