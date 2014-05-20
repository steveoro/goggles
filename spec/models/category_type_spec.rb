require 'spec_helper'


describe CategoryType do
  shared_examples "shared_method_existance_examples"
  shared_examples "shared_drop_down_listable_examples"

  it_behaves_like "DropDownListable concern"

  describe "not valid istance of category type" do
    it_behaves_like( "(not a valid istance without required values)", [ 
      #:age_begin,
      #:age_end,
      :code
    ])    
  end

  describe "well formed category type" do
    subject {
      FactoryGirl.create( :category_type )
    }
  
    context "[well formed category type instance]" do
      it "is a valid istance" do
        subject.should be_valid
      end

      it_behaves_like( "(valid istance if belongs to required classes)", [ 
        :season
      ])    
    end

    context "[category type general methods]" do
      it_behaves_like( "(the existance of a method returning non-empty strings)", [ 
        :get_short_name,
        :get_full_name,
        :get_verbose_name
      ])

      it_behaves_like "(the existance of a method returning boolean values)", [
        :is_age_in_category
      ],
      30
    end
    
    context "#is_age_in_category" do
      it "#is_age_in_category correctly evaluates age" do
        expect(subject.is_age_in_category(subject.age_begin + 1)).to be_true
        expect(subject.is_age_in_category(subject.age_begin - 5)).to be_false
        expect(subject.is_age_in_category(subject.age_end + 5)).to be_false
      end
    end

    # Add other method validations     
  end
end
