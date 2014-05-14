require 'spec_helper'
require 'wrappers/timing'


shared_examples_for "(not a valid istance without required values)" do |attribute_name_array|
  attribute_name_array.each do |attribute_name|
    it "not a valid instance without ##{attribute_name}" do
      FactoryGirl.build( subject.class, attribute_name.to_sym=>nil ).should_not be_valid
    end    
  end
end
# -----------------------------------------------------------------------------

shared_examples_for "(the existance of a method returning non-empty strings)" do |method_name_array|
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
# -----------------------------------------------------------------------------

shared_examples_for "(the existance of a method returning numeric values)" do |method_name_array|
  method_name_array.each do |method_name|
    it "responds to ##{method_name}" do
      expect( subject ).to respond_to( method_name )
    end
    
    it "##{method_name} returns a numeric value" do
      expect( subject.send(method_name.to_sym) ).to be_a_kind_of( Integer )
    end
  end
end
# -----------------------------------------------------------------------------

shared_examples_for "(existance of method returning array)" do |method_name_array|
  method_name_array.each do |method_name|
    it "responds to ##{method_name}" do
      expect( subject ).to respond_to( method_name )
    end
    
    it "##{method_name} returns a list" do
      expect( subject.send(method_name.to_sym) ).to be_a_kind_of( Enumerable )
    end
  end
end
# -----------------------------------------------------------------------------
