require 'spec_helper'


describe SeasonCreator, type: :strategy do

  let(:older_season_id) { 141 }
  let(:newer_season_id) { 141 + 10 }
  let(:older_season)    { Season.find( older_season_id ) }
  let(:description)     { 'Spec proof season ' + newer_season_id }
  
  context "with requested parameters" do
    subject { SeasonCreator.new( older_season, description ) }

    it_behaves_like( "(the existance of a method)", [
      :description, 
      :new_id, :begin_date, :end_date, :categories, :meetings
    ] )

    describe "#parameters," do
      it "are the given parameters" do
        expect( subject.older_season ).to be_equal( older_season )
        expect( subject.description ).to be_equal( description )
      end
    end

    describe "#new_id," do
      it "is a valid number" do
        expect( subject.new_id ).to be_a_kind_of( Number )
      end
      it "is 10 greater than older season id" do
        expect( subject.new_id ).to be = ( newer_season_id ) 
      end
    end
    describe "#begin_date," do
      it "is a valid date" do
        expect( subject.begin_date ).to be_a_kind_of( Date )
      end
      it "is one year older than older season begin date" do
        expect( subject.begin_date ).to be = subject.older_season.begin_date.next_year 
      end
    end
    describe "#end_date," do
      it "is a valid date" do
        expect( subject.end_date ).to be_a_kind_of( Date )
      end
      it "is one year older than older season end date" do
        expect( subject.end_date ).to be = subject.older_season.end_date.next_year 
      end
    end
    #-- -----------------------------------------------------------------------
    
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
        expect( new_categories ).to be_a_kind_of( ActiveRecord::Relation )
        expect( new_categories ).to all(be_an_instance_of( CategoryType ))
      end
      it "returns a collection of category types associated to the new season" do
        new_categories = subject.renew_categories
        new_categories.each do |category_type|
          expect( category_type.season_id ).to be_equal( newer_season_id )
          expect( category_type.season_id ).to be_equal( subject.new_season.id )
        end
      end
    end
    describe "#categories," do
      it "is a collection of categories" do
        expect( subject.get_categories ).to be_a_kind_of( ActiveRecord::Relation )
        expect( subject.get_categories ).to all(be_an_instance_of( CategoryType ))
      end
    end
    #-- -----------------------------------------------------------------------


    describe "#meetings," do
      it "is a collection of meetings" do
        expect( subject.get_meetings ).to be_a_kind_of( ActiveRecord::Relation )
        expect( subject.get_meetings ).to all(be_an_instance_of( Meeting ))
      end
    end
    #-- -----------------------------------------------------------------------

    describe "#save_new_season," do
      it "saves the new season" do
        expect( subject.save_new_season ).to be_true
      end
    end
    #-- -----------------------------------------------------------------------

  end
  #-- -------------------------------------------------------------------------
  #++

  context "without requested parameters" do
    subject { SeasonCreator.new( 'wrong parameter' ) }
  end
  #-- -------------------------------------------------------------------------
  #++
end
