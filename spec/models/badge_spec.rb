require 'spec_helper'


describe Badge do
  shared_examples "shared_method_existance_examples"

  describe "not valid istance of badge" do
    it_behaves_like( "(not a valid istance without required values)", [ 
      :number
    ])    
  end

  describe "well formed badge" do
    subject {
      FactoryGirl.create( :badge )
    }
  
    context "[well formed badge instance]" do
      it "is a valid istance" do
        subject.should be_valid
      end

      it_behaves_like( "(valid istance if belongs to required classes)", [ 
        :team,
        :season,
        :swimmer,
        :team_affiliation,
        :category_type,
        :entry_time_type
      ])    
    end

    context "[badge general methods]" do
      it_behaves_like( "(the existance of a method returning non-empty strings)", [ 
        :get_full_name,
        :get_verbose_name
      ])
    end
  end
end
