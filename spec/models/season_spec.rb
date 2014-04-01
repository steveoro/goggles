require 'spec_helper'
require 'date'

describe Season do
  
  describe "not valid factory" do
    it "not a valid season without description" do
      FactoryGirl.build( :season, description: nil ).should_not be_valid
    end    

    it "not a valid season without header_year" do
      FactoryGirl.build( :season, header_year: nil ).should_not be_valid
    end    

    it "not a valid season without edition" do
      FactoryGirl.build( :season, edition: nil ).should_not be_valid
    end    

    it "not a valid season without begin_date" do
      FactoryGirl.build( :season, begin_date: nil, end_date: Date.parse('2014-06-15'), header_year: 2014 ).should_not be_valid
    end    
  end

  describe "well formed season" do
    before( :each ) do
      @season1 = FactoryGirl.create( :season )
    end
  
    context "well formed season factory" do
      it "has a valid factory" do
        @season1.should be_valid
        expect( @season1.season_type ).to be_a( SeasonType )
        expect( @season1.federation_type ).to be_a( FederationType )
      end
    end
    
    context "season general methods" do
      it "has a method to return if a season is ended at a certain date" do
        expect( @season1 ).to respond_to( :is_season_ended_at )
      end
  
      it "is_season_ended_at should evaluate dates" do 
        expect( @season1.is_season_ended_at(Date.parse('2025-12-31')) ).to be_true
        expect( @season1.is_season_ended_at(Date.parse('1999-01-01')) ).to be_false       
        @season1.end_date = nil
        expect( @season1.is_season_ended_at(Date.parse('2025-12-31')) ).to be_false       
        expect( @season1.is_season_ended_at(Date.parse('1999-01-01')) ).to be_false       
        expect( @season1.is_season_ended_at() ).to be_false       
      end
  
      it "has a method to return if a season is started at a certain date" do
        expect( @season1 ).to respond_to( :is_season_started_at )
      end
  
      it "is_season_started_at should evaluate dates" do 
        expect( @season1.is_season_started_at(Date.parse('2025-12-31')) ).to be_false
        expect( @season1.is_season_started_at(Date.parse('1999-01-01')) ).to be_true       
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
    
    context "season result methods" do
      it "has a method to determine the season ranking"
      
      it "has a method to determine the season team charts"
      
      it "has a method to determine the season athlete charts"
    end
  end
end
