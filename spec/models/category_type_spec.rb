require 'spec_helper'


describe CategoryType do
  it_behaves_like "DropDownListable"

  describe "[a non-valid instance]" do
    it_behaves_like( "(missing required values)", [ :code ])    
  end

  describe "[a well formed instance]" do
    subject { create(:category_type) }
  
    context "[well formed category type instance]" do
      it "is a valid istance" do
        expect( subject ).to be_valid
      end
      it_behaves_like( "(belongs_to required models)", [ 
        :season
      ])    
    end

    # Filtering scopes:
    it_behaves_like( "(the existance of a class method)", [
      :is_valid,
      :only_relays,
      :are_not_relays
    ])

    context "[general methods]" do

      it_behaves_like( "(the existance of a method returning non-empty strings)", [ 
        :get_short_name,
        :get_full_name,
        :get_verbose_name
      ])

      it_behaves_like "(the existance of a method with parameters, returning boolean values)", [
        :is_age_in_category
      ],
      30
    end

    context "#is_age_in_category" do
      it "#is_age_in_category correctly evaluates age" do
        expect( subject.is_age_in_category(subject.age_begin + 1) ).to be_true
        expect( subject.is_age_in_category(subject.age_begin - 5) ).to be_false
        expect( subject.is_age_in_category(subject.age_end + 5) ).to be_false
      end
    end

    # Add other method validations     
  end
end
