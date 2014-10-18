require 'spec_helper'

describe SwimmingPoolDecorator, type: :model do

  subject { SwimmingPool.find(1).decorate }

  context "[implemented methods]" do
    it_behaves_like "(the existance of a method returning non-empty strings)", [
      :get_verbose_name,
      :get_city_full_name,
      :get_full_address,
      :get_city_and_attributes,
      :get_pool_type,
      :get_pool_attributes,
      :get_locker_cabinet_type,
      :get_shower_type,
      :get_hair_dryer_type
    ]
    it_behaves_like "(the existance of a method)", [
      :get_maps_url
    ]
    it_behaves_like "(the existance of a method returning numeric values)", [
      :get_pool_length_in_meters,
      :get_pool_lanes_number
    ]
  end

  describe "#get_maps_url" do
    it "returns a non-empty string for a pool with an address" do
      expect( subject.get_maps_url ).to be_an_instance_of(String)
      expect( subject.get_maps_url ).to include('maps/')
    end
    it "returns nil for a pool with no address" do
      fix_pool = create(:swimming_pool, address: nil)
      expect( fix_pool.decorate.get_maps_url ).to be_nil
    end
  end

  describe "#get_pool_length_in_meters" do
    it "returns a number between 0 and 50" do
      expect( subject.get_pool_length_in_meters ).to be >= 0
      expect( subject.get_pool_length_in_meters ).to be <= 50
    end
  end

  describe "#get_pool_lanes_number" do
    it "returns a number between 0 and 10" do
      expect( subject.get_pool_lanes_number ).to be >= 0
      expect( subject.get_pool_lanes_number ).to be <= 10
    end
  end
end
