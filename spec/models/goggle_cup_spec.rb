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
  end
  #-- -------------------------------------------------------------------------
  #++
end
