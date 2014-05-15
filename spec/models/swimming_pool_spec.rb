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
    subject {
      FactoryGirl.create( :swimming_pool )
    }
  
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
        :get_full_address,
        :get_pool_attributes,
        :get_pool_type,
        :get_city_name,
        :get_locker_cabinet_type,
        :get_shower_type,
        :get_hair_dryer_type
      ])

      it_behaves_like( "(the existance of a method returning numeric values)", [ 
        :get_pool_length_in_meters,
        :get_pool_lanes_number
      ])

      it "#get_pool_length_in_meters returns a number between 0 and 50" do
        expect( subject.get_pool_length_in_meters ).to be >= 0
        expect( subject.get_pool_length_in_meters ).to be <= 50                
      end    
      
      it "#get_pool_lanes_number returns a number between 0 and 10" do
        expect( subject.get_pool_lanes_number ).to be >= 0
        expect( subject.get_pool_lanes_number ).to be <= 10        
      end     
      
      it "#get_maps_url returns a URL or nil"
      
    end
  end
end
