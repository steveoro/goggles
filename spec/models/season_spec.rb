require 'spec_helper'
require 'date'

describe Season do

  before( :each ) do
    @season1 = FactoryGirl.create( :season )
  end

  context "season details" do
    it "has a valid factory" do
      @season1.should be_valid
      expect( @season1.season_type ).to be_a( SeasonType )
      expect( @season1.federation_type ).to be_a( FederationType )
    end
    
    it "has a method to return if a season is ended at a certain date" do
      expect( @season1 ).to respond_to( :is_season_ended_at )
    end

    it "is_season_ended_at should evaluate dates" do 
      expect( @season1.is_season_ended_at(Date.parse('2025-12-31')) ).to be_true
      expect( @season1.is_season_ended_at(Date.parse('1999-01-01')) ).to be_false
    end

    it "has a method to return the season type" do
      expect( @season1 ).to respond_to( :get_season_type )
    end

    it "get_season_tpe should return correct season type" do
      expect( @season1.get_season_type ).to be_an_instance_of( String )
      expect( @season1.get_season_type ).not_to eq( '' )
      expect( @season1.get_season_type ).not_to eq( '?' )
    end

    it "has a method to return the federation type" do
      expect( @season1 ).to respond_to( :get_federation_type )
    end
    
    it "get_federation_tpe should return the correct fedeation type" do
      expect( @season1.get_federation_type ).to be_an_instance_of( String )
      expect( @season1.get_federation_type ).not_to eq( '' )
      expect( @season1.get_federation_type ).not_to eq( '?' )
    end
  end
  
  context "season results" do
    it "has a method to return the meeting list" do
      expect( @season1 ).to respond_to( :get_season_meetings )
    end

    it "get_season_meetings should return a collection of meetings" do
      @meeting1 = FactoryGirl.create( :meeting, season_id: @season1.id )
      @meeting2 = FactoryGirl.create( :meeting, season_id: @season1.id )
      collection = @season1.get_season_meetings
      expect( collection ).to include( @meeting1 )
      expect( collection ).to include( @meeting2 )
    end

    it "has a method to determine the season ranking"

    it "has a method to determine the season team charts"

    it "has a method to determine the season athlete charts"
  end

end
