require 'spec_helper'

describe SwimmingPoolReview do

  context "[a well formed instance]" do
    it "is a valid istance" do
      expect( create( :swimming_pool_review ) ).to be_valid
    end

    it "has a method to return the full description" do
      expect( subject ).to respond_to( :get_full_name )
    end

    it "has a method to return the extended description" do
      expect( subject ).to respond_to( :get_verbose_name )
    end

    it "has a method to return the user name" do
      expect( subject ).to respond_to( :user_name )
    end
  end
end
