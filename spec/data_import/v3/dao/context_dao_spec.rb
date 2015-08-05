require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../app/data_import/v3/dao/context_dao'
require_relative '../../../../app/data_import/v3/dao/entity_dao'



describe V3::ContextDAO, :type => :model do
  let( :length_token ) { [50, 100, 200, 400].sort{ rand - 0.5 }[0] }
  let( :random_fixture )    { StrokeType.is_eventable.all.sort{ rand - 0.5 }[0] }
  let( :stroke_type_token ) { random_fixture.code }
  let( :stroke_type_value ) { random_fixture.id }
  let( :stroke_entity ) do
    entity = V3::EntityDAO.new( (rand * 10000).to_i, "stroke_type" )
    entity.text_token = stroke_type_token
    entity.parsed_value = stroke_type_value
    entity.destination_class = StrokeType
    entity
  end
  let( :length_entity ) do
    entity = V3::EntityDAO.new( (rand * 10000).to_i, "length" )
    entity.text_token = length_token.to_s
    entity.parsed_value = length_token
    entity
  end

  subject do
    context = V3::ContextDAO.new( (rand * 10000).to_i, FFaker::Lorem.word.to_sym )
    context.text_token = "#{ length_token }#{stroke_type_token}"
    context.entity_list[ length_entity.name.to_sym ] = length_entity
    context.entity_list[ stroke_entity.name.to_sym ] = stroke_entity
    context
  end


  it_behaves_like( "(the existance of a method)", [
    :id, :name, :parent_context, :==, :to_s,
    :text_token, :entity_list
  ])
  #-- -------------------------------------------------------------------------
  #++


  describe "#==" do
    it "returns true for equal objects" do
      expect( subject == subject ).to be true
    end
    it "returns false when comparing with a different object" do
      expect( subject == V3::ContextDAO.new( (rand * 10000).to_i, "another thing" ) ).to be false
    end
    it "returns false when comparing with an instance of a different class" do
      expect( subject == "Any string" ).to be false
    end
    it "returns false when comparing with nil" do
      expect( subject == nil ).to be false
    end
  end


  describe "#to_s" do
    it "returns a String" do
      expect( subject.to_s ).to be_an_instance_of( String )
    end
    it "includes the context id" do
      expect( subject.to_s ).to include( subject.id.to_s )
    end
    it "includes the context name" do
      expect( subject.to_s ).to include( subject.name.to_s )
    end
    it "includes the number of entities enclosed" do
      expect( subject.to_s ).to include( subject.entity_list.size.to_s )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "when serializing with Marshal::dump," do
    it "marshalls the whole object" do
      data = Marshal.dump( subject )
      expect( Marshal.load(data) ).to eq( subject )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # TODO
end
