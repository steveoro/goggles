require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../app/data_import/v3/dao/entity_dao'
require_relative '../../../../app/data_import/v3/dao/context_dao'
require_relative '../../../../app/data_import/v3/strategies/dao_factory'



describe V3::DAOFactory, :type => :strategy do

  # These two will affect the length of the tests:
  MAX_DEPTH_1_OBJECTS = 5
  MAX_DEPTH_2_OBJECTS = 3
  PARENT_CONTEXT_NAME = "ctx_#{MAX_DEPTH_1_OBJECTS}"
  CHILD_CONTEXT_NAME  = "child"

  subject { V3::DAOFactory.new() }

  let( :non_empty_subject ) do
    factory = V3::DAOFactory.new()
    context = nil
    (1..MAX_DEPTH_1_OBJECTS).each do |outer_idx|
      context = factory.new_context( "ctx_#{outer_idx}" )
      ((outer_idx * 10 + 1)..(outer_idx * 10 + MAX_DEPTH_1_OBJECTS)).each do |inner_idx|
        entity_name = "ent_#{inner_idx}"
        entity = factory.new_entity( entity_name, context )
        entity.text_token = inner_idx.to_s
        entity.parsed_value = inner_idx
      end
    end
    # Let's use the last defined context to sample a child context creation with
    # some level-2 entities...
    child_context = factory.new_context( CHILD_CONTEXT_NAME, context )
    (1..MAX_DEPTH_2_OBJECTS).each do |inner_idx|
      entity_name = "child_ent_#{inner_idx}"
      entity = factory.new_entity( entity_name, child_context )
      entity.text_token = inner_idx.to_s
      entity.parsed_value = inner_idx
    end
# DEBUG
#    puts factory.dump_to_s
    factory
  end


  it_behaves_like( "(the existance of a method)", [
    :entity_list, :context_list,
    :clear,
    :new_entity, :new_context,
    :get_entity_unique_name,
    :get_entity,
    :get_contexts_named,
    :get_entities_for_context,
    :get_siblings_for_context,
    :dump_to_s
  ])
  #-- -------------------------------------------------------------------------
  #++


  describe "#new_entity" do
    it "returns an V3::EntityDAO object" do
      expect( subject.new_entity( FFaker::Lorem.word ) ).to be_an_instance_of( V3::EntityDAO )
    end
    it "increases the count of the #entity_list" do
      expect{
        subject.new_entity( FFaker::Lorem.word )
      }.to change{ subject.entity_list.keys.count }.by(1)
    end
  end


  describe "#new_context" do
    it "returns a V3::ContextDAO object" do
      expect( subject.new_context( FFaker::Lorem.word ) ).to be_an_instance_of( V3::ContextDAO )
    end
    it "increases the count of the #context_list" do
      expect{
        subject.new_context( FFaker::Lorem.word )
      }.to change{ subject.context_list.keys.count }.by(1)
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#get_entity_unique_name" do
    it "returns a String" do
      expect( subject.get_entity_unique_name(FFaker::Lorem.word) ).to be_an_instance_of( String )
    end
    it "contains the name of the entity" do
      name = FFaker::Lorem.word
      expect( subject.get_entity_unique_name(name) ).to include( name )
    end
  end


  describe "#get_entity" do
    it "returns a V3::EntityDAO object for an existing entity" do
      (1..5).each do |outer_idx|
        ((outer_idx * 10 + 1)..(outer_idx * 10 + MAX_DEPTH_1_OBJECTS)).each do |inner_idx|
          expect(
            non_empty_subject.get_entity(
              "ent_#{inner_idx}",
              non_empty_subject.get_contexts_named( "ctx_#{outer_idx}" ).first
            )
          ).to be_an_instance_of( V3::EntityDAO )
        end
      end
    end
    it "returns nil for a non-existing entity or wrong parent context" do
      (6..8).each do |outer_idx|
        ((outer_idx * 10 + 1)..(outer_idx * 10 + 3)).each do |inner_idx|
          expect(
            non_empty_subject.get_entity(
              "ent_#{inner_idx}",
              non_empty_subject.get_contexts_named( "ctx_#{outer_idx}" ).first
            )
          ).to be nil
        end
      end
    end
  end

  describe "#get_contexts_named" do
    it "returns an Array with a single V3::ContextDAO for an existing context with an unique name" do
      (1..MAX_DEPTH_1_OBJECTS).each do |outer_idx|
        result = non_empty_subject.get_contexts_named( "ctx_#{outer_idx}" )
        expect( result ).to be_an_instance_of( Array )
        expect( result[0] ).to be_an_instance_of( V3::ContextDAO )
        expect( result.length ).to eq( 1 )
      end
    end
    it "returns an empty Array for a non-existing context name" do
      (6..9).each do |outer_idx|
        expect(
          non_empty_subject.get_contexts_named( "ctx_#{outer_idx}" )
        ).to eq( [] )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#get_entities_for_context" do
    it "returns an empty array for a non existing context (non-nil)" do
      context_out_of_subject = V3::ContextDAO.new( 1, "non_existing" )
      result = non_empty_subject.get_entities_for_context( context_out_of_subject )
      expect( result ).to be_an_instance_of( Array )
      expect( result.length ).to eq( 0 )
    end
    it "returns an empty array for a non existing context (nil)" do
      result = non_empty_subject.get_entities_for_context( nil )
      expect( result ).to be_an_instance_of( Array )
      expect( result.length ).to eq( 0 )
    end
    it "returns a non-empty array for an existing context, with the correct length" do
      (1..MAX_DEPTH_1_OBJECTS).each do |outer_idx|
        context = non_empty_subject.get_contexts_named( "ctx_#{outer_idx}" ).first
        result = non_empty_subject.get_entities_for_context( context )
        expect( result ).to be_an_instance_of( Array )
        expect( result.length ).to eq( MAX_DEPTH_1_OBJECTS )
      end
    end
  end


  describe "#get_siblings_for_context" do
    it "returns an empty array for a non existing context (non-nil)" do
      context_out_of_subject = V3::ContextDAO.new( 1, "non_existing" )
      result = non_empty_subject.get_siblings_for_context( context_out_of_subject )
      expect( result ).to be_an_instance_of( Array )
      expect( result.length ).to eq( 0 )
    end
    it "returns the list of root contexts for a nil context" do
      result = non_empty_subject.get_siblings_for_context( nil )
      expect( result ).to be_an_instance_of( Array )
      expect( result.length ).to eq( MAX_DEPTH_1_OBJECTS )
    end
    it "returns a non-empty array for an existing parent context, with the correct length" do
      parent_context = non_empty_subject.get_contexts_named( PARENT_CONTEXT_NAME ).first
      result = non_empty_subject.get_siblings_for_context( parent_context )
      expect( result ).to be_an_instance_of( Array )
      expect( result.length ).to eq( 1 )
      expect( result.first ).to be_an_instance_of( V3::ContextDAO )
      expect( result.first.entity_list.length ).to eq( MAX_DEPTH_2_OBJECTS )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#dump_to_s" do
    it "returns a String" do
      expect( subject.dump_to_s ).to be_an_instance_of( String )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "when serializing with Marshal (dump+load)," do

    it "stores and restores the whole object" do
      data = Marshal.dump( non_empty_subject )
      restored = Marshal.load(data)
      expect( restored.entity_list.count ).to eq( non_empty_subject.entity_list.count )
      expect( restored.entity_list ).to match_array( non_empty_subject.entity_list )
      expect( restored.context_list.count ).to eq( non_empty_subject.context_list.count )
      expect( restored.context_list ).to match_array( non_empty_subject.context_list )
# DEBUG
      expect(
        restored.entity_list.values.map{ |e| e.to_s }
      ).to match_array(
        non_empty_subject.entity_list.values.map{ |e| e.to_s }
      )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
