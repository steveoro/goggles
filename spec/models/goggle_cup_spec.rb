require 'spec_helper'


describe GoggleCup, :type => :model do
  describe "[a non-valid instance]" do
    it_behaves_like( "(missing required values)", [ 
      :description, 
      :season_year, 
      :max_points,
      :max_performance
    ])    
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "[a well formed instance]" do
    #subject { GoggleCup.find(1) }
    subject { create( :goggle_cup ) }

    it "is a valid istance" do
      expect( subject ).to be_valid
    end
    
    # Validated (owned foreign-key) relations:
    it_behaves_like( "(belongs_to required models)", [
       :team
    ])
    
    # Test the existance of all the required has_many / has_one relationships:
    it_behaves_like( "(the existance of a method returning a collection of some kind of instances)",
      [ 
        :goggle_cup_definitions,
        :goggle_cup_standards
      ],
      ActiveRecord::Base
    )
        
    # Filtering scopes:
    it_behaves_like( "(the existance of a class method)", [
      :sort_goggle_cup_by_user,
      :sort_goggle_cup_by_team
    ])

    context "[general methods]" do
      it_behaves_like( "(the existance of a method returning non-empty strings)", [
        :get_full_name,
        :get_verbose_name
      ])
    end
    # ---------------------------------------------------------------------------
    #++

    describe "class #has_team_goggle_cup_for_season method" do
      it "responds to #has_team_goggle_cup_for_season" do
        expect( subject.class ).to respond_to( :has_team_goggle_cup_for_season? )
      end
      it "returns a boolean" do
        fix_team_id   = ((rand * 100) % 30).to_i + 1
        fix_season_id = ((rand * 100) % 20).to_i + 1
        result = subject.class.has_team_goggle_cup_for_season?(fix_team_id, fix_season_id)
        if result
          expect( result == true ).to be true
        else
          expect( result == false ).to be true
        end
      end
      it "returns true if goggle cup present" do
        # Assumes CSI Ober Ferrari, Campionato regionale CSI 2013/2014
        fix_team_id   = 1
        fix_season_id = 131
        expect( subject.class.has_team_goggle_cup_for_season?(fix_team_id, fix_season_id) ).to be true
      end
      it "returns false if goggle cup not present" do
        # Assumes id given doesn't exists
        fix_team_id   = 12456
        fix_season_id = 56897
        expect( subject.class.has_team_goggle_cup_for_season?(fix_team_id, fix_season_id) ).to be false
      end
    end
    # ---------------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
