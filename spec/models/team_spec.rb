require 'spec_helper'


describe Team do
  describe "[a non-valid instance]" do
    it_behaves_like( "(missing required values)", [ 
      :name, :editable_name
    ])    
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "[a well formed instance]" do
    subject { Team.find(1) }
#    subject { create( :team ) }

    it "is a valid istance" do
      expect( subject ).to be_valid
    end
    # Validated (owned foreign-key) relations:
    it_behaves_like( "(belongs_to required models)", [ :city ] )
    # Test the existance of all the required has_many / has_one relationships:
    it_behaves_like( "(the existance of a method returning a collection of some kind of instances)",
      [ 
        :badges,
        :meeting_individual_results,
        :meetings,
        :seasons,
        :meeting_relay_results,
        :team_affiliations,
        :seasons,
        :season_types
      ],
      ActiveRecord::Base
    )    

    context "[general methods]" do
      it_behaves_like( "(the existance of a method returning non-empty strings)",
        [ 
          :get_full_name,
          :get_verbose_name
        ]
      )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
