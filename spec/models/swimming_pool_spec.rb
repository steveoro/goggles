require 'spec_helper'


describe SwimmingPool do
  shared_examples "shared_method_existance_examples"

  describe "not valid istance of swimming pool" do
    it_behaves_like( "(not a valid istance without required values)", [ 
      :name,
      :nick_name,
      :lanes_number
    ])
  end

  describe "well formed swimming pool" do
    subject { FactoryGirl.create( :swimming_pool ) }

    context "[well formed swimming pool instance]" do
      it "is a valid istance" do
        subject.should be_valid
      end
      it "has a valid city" do
        expect( subject.city ).to be_an_instance_of( City )
      end
      it "has a valid pool type" do
        expect( subject.pool_type ).to be_an_instance_of( PoolType )
      end
    end

    context "[swimming pool general methods]" do
      it_behaves_like( "(the existance of a method returning non-empty strings)", [ 
        :get_full_name,
        :get_verbose_name,
        :user_name
      ])
    end
  end
end
