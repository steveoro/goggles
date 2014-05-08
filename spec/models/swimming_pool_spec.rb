require 'spec_helper'


shared_examples_for "(not a valid istance of swimming pool without values)" do |attribute_name_array|
  attribute_name_array.each do |attribute_name|
    it "not a valid instance without ##{attribute_name}" do
      FactoryGirl.build( :swimming_pool, attribute_name.to_sym=>nil ).should_not be_valid
    end    
  end
end

shared_examples_for "(existance of method that returns non empty strings)" do |method_name_array|
  method_name_array.each do |method_name|
    it "responds to ##{method_name}" do
      expect( subject ).to respond_to( method_name )
    end
    
    it "##{method_name} returns a non empty string" do
      expect( subject.send(method_name.to_sym) ).to be_an_instance_of( String )
      expect( subject.send(method_name.to_sym) ).not_to eq( '' )
    end
  end
end

shared_examples_for "(existance of method that returns numeric values)" do |method_name_array|
  method_name_array.each do |method_name|
    it "responds to ##{method_name}" do
      expect( subject ).to respond_to( method_name )
    end
    
    it "##{method_name} returns a numeric value" do
      expect( subject.send(method_name.to_sym) ).to be_a_kind_of( Integer )
    end
  end
end

describe SwimmingPool do
  
  describe "not valid istance of swimming pool" do
    it_should_behave_like( "(not a valid istance of swimming pool without values)", [ 
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
      it_should_behave_like( "(existance of method that returns non empty strings)", [ 
        :get_full_name,
        :get_verbose_name,
        :get_full_address,
        :get_pool_type,
        :get_city_name,
        :get_locker_cabinet_type,
        :get_shower_type,
        :get_hair_dryer_type
      ])

      #it_should_behave_like( "(existence of method that returns numeric values)", [ 
      #  :get_pool_length_in_meters,
      #  :get_pool_lanes_number
      #])

      #it "#get_pool_length_in_meters returns a number between 0 and 50" do
      #  expect( subject.get_pool_length_in_meters ).to be >= 0
      #  expect( subject.get_pool_length_in_meters ).to be <= 50                
      #end    
      
      #it "#get_pool_lanes_number returns a number between 0 and 10" do
      #  expect( subject.get_pool_lanes_number ).to be >= 0
      #  expect( subject.get_pool_lanes_number ).to be <= 10        
      #end     
      
      it "#get_maps_url returns a URL or nil"
      
    end
  end
end
