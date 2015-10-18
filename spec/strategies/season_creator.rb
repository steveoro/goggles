require 'spec_helper'


describe SeasonCreator, type: :strategy do

  let(:older_season_id) { 141 }
  let(:newer_season_id) { 141 + 10 }
  let(:older_season)    { Season.find( older_season_id ) }
  let(:description)     { 'Spec proof season ' + newer_season_id.to_s }
  
  context "with requested parameters" do
    subject { SeasonCreator.new( older_season, description ) }

    it_behaves_like( "(the existance of a method)", [
      :description, 
      :new_id, :begin_date, :end_date, :header_year, :edition, 
      :categories, :meetings,
      :renew_season, :renew_categories, :renew_meetings
    ] )

    describe "#parameters," do
      it "are the given parameters" do
        expect( subject.older_season ).to be_equal( older_season )
        expect( subject.description ).to be_equal( description )
      end
    end

    describe "#new_id," do
      it "is a valid number" do
        expect( subject.new_id ).to be > 0
      end
      it "is 10 greater than older season id" do
        expect( subject.new_id ).to be_equal( newer_season_id ) 
      end
    end
    describe "#begin_date," do
      it "is a valid date" do
        expect( subject.begin_date ).to be_a_kind_of( Date )
      end
      it "is one year older than older season begin date" do
        expect( subject.begin_date ).to be_equal( subject.older_season.begin_date.next_year ) 
      end
    end
    describe "#end_date," do
      it "is a valid date" do
        expect( subject.end_date ).to be_a_kind_of( Date )
      end
      it "is one year older than older season end date" do
        expect( subject.end_date ).to be_equal( subject.older_season.end_date.next_year ) 
      end
    end
    describe "#header_year," do
      it "is a valid string" do
        expect( subject.header_year ).to be_a_kind_of( String )
      end
    end
    describe "#edition," do
      it "is a valid number" do
        expect( subject.edition ).to be >= 0
      end
      it "is greater than older season one" do
        expect( subject.edition ).to be > subject.older_season.edition 
      end
    end
    #-- -----------------------------------------------------------------------

    describe "#next_header_year," do
      it "returns a valid string" do
        expect( subject.next_header_year( subject.older_season.header_year ) ).to be_a_kind_of( String )
      end
      it "returns a string representing a greater value if simple year given" do
        simple_year = 2000 + (rand * 25).to_i
        expect( subject.next_header_year( simple_year.to_s ) ).to be_a_kind_of( String )
        expect( subject.next_header_year( simple_year.to_s ).to_i ).to be > simple_year 
      end
      it "returns a string representing a greater couple of year if couple of year given" do
        year = 2000 + ( rand * 25 ).to_i
        couple_year = year.to_s + '/' + ( year + 1 ).to_s
        next_couple_year = subject.next_header_year( couple_year )
        expect( next_couple_year ).to be_a_kind_of( String )
        expect( next_couple_year.length ).to be_equal( 9 )
        years = next_couple_year.split('/')
        expect( years.size ).to be_equal( 2 ) 
        expect( years[0].to_i ).to be < years[1].to_i
        expect( years[0].to_i ).to be_equal( year + 1 )
        expect( years[1].to_i ).to be_equal( year + 2 )
      end
    end
    #-- -----------------------------------------------------------------------
    
    describe "#renew_season," do
      it "returns a valid season" do
        expect( subject.renew_season ).to be_an_instance_of( Season )
      end
    end
    describe "#new_season," do
      it "is a valid season" do
        expect( subject.new_season ).to be_an_instance_of( Season )
      end
      it "has the calculated id" do
        expect( subject.new_season.id ).to be_equal( subject.new_id )
      end
      it "has the given description" do
        expect( subject.new_season.description ).to be_equal( subject.description )
      end
      it "has the calculated begin date" do
        expect( subject.new_season.begin_date ).to be_equal( subject.begin_date )
      end
      it "has the calculated end date" do
        expect( subject.new_season.end_date ).to be_equal( subject.end_date )
      end
    end
    #-- -----------------------------------------------------------------------
    
    describe "#renew_categories," do
      it "returns a collection of category types" do
        new_categories = subject.renew_categories
        expect( new_categories ).to be_a_kind_of( Array )
        expect( new_categories ).to all(be_an_instance_of( CategoryType ))
      end
      it "returns a collection of category types associated to the new season" do
        new_categories = subject.renew_categories
        new_categories.each do |category_type|
          expect( category_type.season_id ).to be_equal( newer_season_id )
          expect( category_type.season_id ).to be_equal( subject.new_season.id )
        end
      end
      it "returns the same number and types of categories of the older season" do
        expect( subject.renew_categories.count ).to be_equal( older_season.category_types.count )
      end
      it "returns the same category types code of older season" do
        new_categories = subject.renew_categories
        new_categories.each do |category_type|
          expect( older_season.category_types.find_by_code( category_type.code )).to be_an_instance_of( CategoryType )
        end
      end
    end
    describe "#categories," do
      it "is a collection of categories" do
        expect( subject.categories ).to be_a_kind_of( Array )
        expect( subject.categories ).to all(be_an_instance_of( CategoryType ))
      end
    end
    #-- -----------------------------------------------------------------------


    describe "#meetings," do
      it "is a collection of meetings" do
        expect( subject.meetings ).to be_a_kind_of( Array )
        expect( subject.meetings ).to all(be_an_instance_of( Meeting ))
      end
    end
    #-- -----------------------------------------------------------------------

    describe "#save_new_season_categories," do
      it "saves the new season" do
        expect( subject.save_new_season_categories ).to be_true
        expect( subject.categories.count ).to be_equal(  CategoryType.for_season( subject.new_season ).count )       
      end
    end
    #-- -----------------------------------------------------------------------

  end
  #-- -------------------------------------------------------------------------
  #++

  context "without requested parameters" do
    it "raises an exception for wrong season parameter" do
      expect{ SeasonCreator.new }.to raise_error( ArgumentError )
      expect{ SeasonCreator.new( 'only such description' ) }.to raise_error( ArgumentError )
      expect{ SeasonCreator.new( older_season ) }.to raise_error( ArgumentError )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
