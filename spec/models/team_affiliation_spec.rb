require 'spec_helper'


describe TeamAffiliation do
  describe "[a non-valid instance]" do
    it_behaves_like( "(missing required values)", [ 
      :name
    ])    
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "[a well formed instance]" do
    subject { create( :team_affiliation ) }
  
    it "is a valid istance" do
      expect( subject ).to be_valid
    end
    # Validated relations:
    it_behaves_like( "(belongs_to required models)", [ 
      :team,
      :season,
      :season_type
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
