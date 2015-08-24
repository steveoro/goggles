require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../app/data_import/v3/dao/parse_result'
require_relative '../../../../app/data_import/v3/dao/entity_dao'
require_relative '../../../../app/data_import/v3/dao/context_dao'
require_relative '../../../../app/data_import/v3/strategies/dao_factory'



describe V3::ParseResult, :type => :model do

  let( :length_token ) { [50, 100, 200, 400].sort{ rand - 0.5 }[0] }
  let( :random_fixture )    { StrokeType.is_eventable.all.sort{ rand - 0.5 }[0] }
  let( :stroke_type_token ) { random_fixture.code }
  let( :stroke_type_value ) { random_fixture.id }
  let( :fixture_parse_result ) do
    result = V3::ParseResult.new( FFaker::Lorem.word )
    context = result.new_context( "event" )
    @context_id = context.id
    entity  = result.new_entity( "stroke_type", context )
    entity.text_token   = stroke_type_token
    entity.parsed_value = stroke_type_value
    entity.destination_class = StrokeType
    @stroke_entity_id = entity.id
    entity  = result.new_entity( "length", context )
    entity.text_token   = length_token.to_s
    entity.parsed_value = length_token
    @length_entity_id = entity.id
# DEBUG
#    puts result.dump_to_s
    result
  end

  let( :fixture_context ) { fixture_parse_result.context_list[ @context_id ] }
  let( :stroke_entity )   { fixture_parse_result.entity_list[ @stroke_entity_id ] }
  let( :length_entity )   { fixture_parse_result.entity_list[ @length_entity_id ] }

  subject { fixture_parse_result }


  it_behaves_like( "(the existance of a method)", [
    :file_name, :entity_list, :context_list,
    :is_serialized?,
    :serialize, :deserialize, :==,
    :to_s,
    # The following are wrappers for factory methods, so we don't need to test
    # their implementation here, just their existance:
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


  context "for a newly created instance" do
    it "is not is_serialized?" do
      expect( subject.is_serialized? ).to be false
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#entity_list" do
    it "is a Hash" do
      expect( subject.entity_list ).to be_an_instance_of( Hash )
    end
    it "includes the fixture entities" do
      expect( subject.entity_list.values ).to match_array(
        [stroke_entity, length_entity]
      )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#context_list" do
    it "is a Hash" do
      expect( subject.context_list ).to be_an_instance_of( Hash )
    end
    it "includes the fixture context" do
      expect( subject.context_list.values ).to match_array( [fixture_context] )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#to_s" do
    it "returns a String" do
      expect( subject.to_s ).to be_an_instance_of( String )
    end
    it "includes the file_name" do
      expect( subject.to_s ).to include( subject.file_name.to_s )
    end
    it "includes the number of entities enclosed" do
      expect( subject.to_s ).to include( subject.entity_list.size.to_s )
    end
    it "includes the number of contexts enclosed" do
      expect( subject.to_s ).to include( subject.context_list.size.to_s )
    end
  end


  describe "#dump_to_s" do
    it "returns a String" do
      expect( subject.dump_to_s ).to be_an_instance_of( String )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "when serializing (low-level) with Marshal (dump+load)," do
    it "stores and restores the whole object" do
      data = Marshal.dump( subject )
      expect( Marshal.load(data) ).to eq( subject )
    end
  end


  context "when using both #serialize & #deserialize," do
    it "stores and restores the whole object" do
      string_dump = subject.dump_to_s
      cloned_subject = subject.deserialize( subject.serialize )
      expect( cloned_subject.dump_to_s ).to eq( string_dump )
    end

    it "sets is_serialized? to true after each method" do
      bin_data = subject.serialize
      expect( subject.is_serialized? ).to be true
      subject.deserialize( bin_data )
      expect( subject.is_serialized? ).to be true
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
