require 'spec_helper'


describe TeamAffiliation do
  shared_examples "shared_method_existance_examples"

  describe "not valid istance of team affiliation" do
    it_behaves_like( "(not a valid istance without required values)", [ 
      :name
    ])    
  end

  describe "well formed team affiliation" do
    subject {
      FactoryGirl.create( :team_affiliation )
    }
  
    context "[well formed team affiliation instance]" do
      it "is a valid istance" do
        subject.should be_valid
      end

      it_behaves_like( "(valid istance if belongs to required classes)", [ 
        :team,
        :season
      ])    
    end

    context "[team affiliation general methods]" do
      it_behaves_like( "(the existance of a method returning non-empty strings)", [ 
        :get_full_name,
        :get_verbose_name
      ])
    end
  end
end
