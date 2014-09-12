require 'spec_helper'
require 'date'

describe Season, :type => :model do
  it_behaves_like "DropDownListable"
  it_behaves_like "UserRelatable"

  describe "[a non-valid instance]" do
    it "is not a valid season without description" do
      expect( build(:season, description: nil) ).not_to be_valid
    end
    it "is not a valid season without header_year" do
      expect( build(:season, header_year: nil) ).not_to be_valid
    end
    it "is not a valid season with incorrect header_year" do
      expect( build(:season, header_year: "More_than_9_char_string") ).not_to be_valid
    end
    it "is not a valid season without edition" do
      expect( build(:season, edition: nil) ).not_to be_valid
    end
    it "is not a valid season with incorrect edition" do
      expect( build(:season, edition: 1234567890) ).not_to be_valid
    end
    it "is not a valid season without begin_date" do
      # Should pass end_date and header_year, calculated from begin_date
      expect( build(:season, begin_date: nil, end_date: Date.parse('2014-06-15'), header_year: 2014) ).not_to be_valid
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "[a well formed instance]" do
    subject { create( :season ) }

    it "is a valid istance" do
      expect( subject ).to be_valid
      expect( subject.season_type ).to be_a( SeasonType )
      expect( subject.federation_type ).to be_a( FederationType )
    end
    it "has a method to return full description of the season" do
      expect( subject ).to respond_to( :get_full_name )
    end
    it "#get_full_name should return correct full description" do
      expect( subject.get_full_name ).to be_an_instance_of( String )
      expect( subject.get_full_name ).not_to eq( '' )
      expect( subject.get_full_name ).not_to eq( '?' )
    end
    it "has a method to return verbose description of the season" do
      expect( subject ).to respond_to( :get_verbose_name )
    end
    it "#get_verbose_name should return correct verbose description" do
      expect( subject.get_verbose_name ).to be_an_instance_of( String )
      expect( subject.get_verbose_name ).not_to eq( '' )
      expect( subject.get_verbose_name ).not_to eq( '?' )
    end
    it "has a method to return if a season is ended at a certain date" do
      expect( subject ).to respond_to( :is_season_ended_at )
    end

    it "#is_season_ended_at should evaluate dates" do
      expect( subject.is_season_ended_at( subject.end_date + 365 ) ).to be true
      expect( subject.is_season_ended_at( subject.end_date - 365 ) ).to be false

      subject.begin_date = Date.today - 465
      subject.end_date = Date.today - 100
      expect( subject.is_season_ended_at() ).to be true

      subject.begin_date = Date.today - 265
      subject.end_date = Date.today + 100
      expect( subject.is_season_ended_at() ).to be false

      subject.end_date = nil
      expect( subject.is_season_ended_at(Date.parse('2025-12-31')) ).to be false
      expect( subject.is_season_ended_at(Date.parse('1999-01-01')) ).to be false
      expect( subject.is_season_ended_at() ).to be false
    end

    it "has a method to return if a season is started at a certain date" do
      expect( subject ).to respond_to( :is_season_started_at )
    end

    it "#is_season_started_at should evaluate dates" do
      expect( subject.is_season_started_at( subject.begin_date + 365 ) ).to be true
      expect( subject.is_season_started_at( subject.begin_date - 365 ) ).to be false

      subject.begin_date = Date.today - 200
      expect( subject.is_season_started_at() ).to be true

      subject.begin_date = Date.today + 100
      expect( subject.is_season_started_at() ).to be false
    end

    it "has a method to return the season type" do
      expect( subject ).to respond_to( :get_season_type )
    end

    it "#get_season_type should return correct season type" do
      expect( subject.get_season_type ).to be_an_instance_of( String )
      expect( subject.get_season_type ).not_to eq( '' )
      expect( subject.get_season_type ).not_to eq( '?' )
    end

    it "has a method to return the federation type" do
      expect( subject ).to respond_to( :get_federation_type )
    end
    it "#get_federation_type should return the correct fedeation type" do
      expect( subject.get_federation_type ).to be_an_instance_of( String )
      expect( subject.get_federation_type ).not_to eq( '' )
      expect( subject.get_federation_type ).not_to eq( '?' )
    end

    it "has a method to return the last season for a certain season type" do
      expect( subject ).to respond_to( :get_last_season_by_type )
    end

    it "#get_last_season_by_type returns a season, that should be the last one for the season_type" do
      expect( subject.get_last_season_by_type( subject.season_type.code ) ).to be_a( Season )
      create(
        :season,
        description: "Older season",
        edition: subject.edition - 1,
        begin_date: subject.begin_date - 365,
        end_date: subject.end_date - 365,
        season_type: subject.season_type
      )
      seasonnewer = create(
        :season,
        description: "Newer season",
        edition: subject.edition + 1,
        begin_date: subject.begin_date + 365,
        end_date: subject.end_date + 365,
        season_type: subject.season_type
      )
      expect( subject.get_last_season_by_type( subject.season_type.code ) ).to eq( seasonnewer )
    end
    # --------------------------------------------------------------------------

    context "[season result methods]" do
      it "has a method to determine the season ranking"

      it "has a method to determine the season team charts"

      it "has a method to determine the season athlete charts"
    end
    # --------------------------------------------------------------------------
  end
  #-- -------------------------------------------------------------------------
  #++
end
