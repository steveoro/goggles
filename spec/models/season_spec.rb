require 'spec_helper'
require 'date'

describe Season do

  context "invalid istance" do
    it "is not a valid season without description" do
      FactoryGirl.build( :season, description: nil ).should_not be_valid
    end    

    it "is not a valid season without header_year" do
      FactoryGirl.build( :season, header_year: nil ).should_not be_valid
    end    

    it "is not a valid season with incorrect header_year" do
      FactoryGirl.build( :season, header_year: "More_than_9_char_string" ).should_not be_valid
    end    

    it "is not a valid season without edition" do
      FactoryGirl.build( :season, edition: nil ).should_not be_valid
    end    

    it "is not a valid season with incorrect edition" do
      FactoryGirl.build( :season, edition: 1234567890 ).should_not be_valid
    end    

    it "is not a valid season without begin_date" do
      # Should pass end_date and header_year, calculated from begin_date
      FactoryGirl.build( :season, begin_date: nil, end_date: Date.parse('2014-06-15'), header_year: 2014 ).should_not be_valid
    end    
  end

  describe "[well formed instance]" do
    before( :each ) do
      @season1 = create( :season )
    end

    it "is a valid istance" do
      @season1.should be_valid
      expect( @season1.season_type ).to be_a( SeasonType )
      expect( @season1.federation_type ).to be_a( FederationType )
    end

    it "has a method to return full description of the season" do
      expect( @season1 ).to respond_to( :get_full_name )
    end
  
    it "#get_full_name should return correct full description" do
      expect( @season1.get_full_name ).to be_an_instance_of( String )
      expect( @season1.get_full_name ).not_to eq( '' )
      expect( @season1.get_full_name ).not_to eq( '?' )
    end
  
    it "has a method to return verbose description of the season" do
      expect( @season1 ).to respond_to( :get_verbose_name )
    end
  
    it "#get_verbose_name should return correct verbose description" do
      expect( @season1.get_verbose_name ).to be_an_instance_of( String )
      expect( @season1.get_verbose_name ).not_to eq( '' )
      expect( @season1.get_verbose_name ).not_to eq( '?' )
    end
  
    it "has a method to return if a season is ended at a certain date" do
      expect( @season1 ).to respond_to( :is_season_ended_at )
    end
  
    it "#is_season_ended_at should evaluate dates" do 
      expect( @season1.is_season_ended_at( @season1.end_date + 365 ) ).to be_true
      expect( @season1.is_season_ended_at( @season1.end_date - 365 ) ).to be_false       
        
      @season1.begin_date = Date.today - 465
      @season1.end_date = Date.today - 100
      expect( @season1.is_season_ended_at() ).to be_true       
        
      @season1.begin_date = Date.today - 265
      @season1.end_date = Date.today + 100
      expect( @season1.is_season_ended_at() ).to be_false       
        
      @season1.end_date = nil
      expect( @season1.is_season_ended_at(Date.parse('2025-12-31')) ).to be_false       
      expect( @season1.is_season_ended_at(Date.parse('1999-01-01')) ).to be_false       
      expect( @season1.is_season_ended_at() ).to be_false       
    end
    
    it "has a method to return if a season is started at a certain date" do
      expect( @season1 ).to respond_to( :is_season_started_at )
    end

    it "#is_season_started_at should evaluate dates" do 
      expect( @season1.is_season_started_at( @season1.begin_date + 365 ) ).to be_true
      expect( @season1.is_season_started_at( @season1.begin_date - 365 ) ).to be_false

      @season1.begin_date = Date.today - 200
      expect( @season1.is_season_started_at() ).to be_true       
      
      @season1.begin_date = Date.today + 100
      expect( @season1.is_season_started_at() ).to be_false       
    end

    it "has a method to return the season type" do
      expect( @season1 ).to respond_to( :get_season_type )
    end

    it "#get_season_type should return correct season type" do
      expect( @season1.get_season_type ).to be_an_instance_of( String )
      expect( @season1.get_season_type ).not_to eq( '' )
      expect( @season1.get_season_type ).not_to eq( '?' )
    end

    it "has a method to return the federation type" do
      expect( @season1 ).to respond_to( :get_federation_type )
    end
    
    it "#get_federation_type should return the correct fedeation type" do
      expect( @season1.get_federation_type ).to be_an_instance_of( String )
      expect( @season1.get_federation_type ).not_to eq( '' )
      expect( @season1.get_federation_type ).not_to eq( '?' )
    end

    it "has a method to return the last season for a certain season type" do
      expect( @season1 ).to respond_to( :get_last_season_by_type )
    end

    it "#get_last_season_by_type returns a season, that shuld be the last one for the season_type" do
      expect( @season1.get_last_season_by_type( @season1.season_type.code ) ).to be_a( Season )
      
      @seasonolder = FactoryGirl.create( :season, description: "Older season", edition: @season1.edition - 1, begin_date: @season1.begin_date - 365, end_date: @season1.end_date - 365, season_type: @season1.season_type )
      @seasonnewer = FactoryGirl.create( :season, description: "Newer season", edition: @season1.edition + 1, begin_date: @season1.begin_date + 365, end_date: @season1.end_date + 365, season_type: @season1.season_type )
      expect( @season1.get_last_season_by_type( @season1.season_type.code ) ).to eq( @seasonnewer )
    end
    # --------------------------------------------------------------------------


    context "[season result methods]" do
      it "has a method to determine the season ranking"
      
      it "has a method to determine the season team charts"
      
      it "has a method to determine the season athlete charts"
    end
    # --------------------------------------------------------------------------
  end
  # ----------------------------------------------------------------------------
end
