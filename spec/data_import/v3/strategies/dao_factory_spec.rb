require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../app/data_import/v3/dao/entity_dao'
require_relative '../../../../app/data_import/v3/dao/context_dao'
require_relative '../../../../app/data_import/v3/strategies/dao_factory'



describe V3::DAOFactory, :type => :strategy do

  subject { V3::DAOFactory.new() }


  it_behaves_like( "(the existance of a method)", [
    :entity_list, :context_list,
    :clear, :new_entity, :new_context
  ])
  #-- -------------------------------------------------------------------------
  #++


  describe "#new_entity" do
    it "returns an V3::EntityDAO object" do
      expect( subject.new_entity( FFaker::Lorem.word.to_sym ) ).to be_an_instance_of( V3::EntityDAO )
    end
    it "increases the count of the #entity_list" do
      expect{
        subject.new_entity( FFaker::Lorem.word.to_sym )
      }.to change{ subject.entity_list.keys.count }.by(1)
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#new_context" do
    it "returns a V3::ContextDAO object" do
      expect( subject.new_context( FFaker::Lorem.word.to_sym ) ).to be_an_instance_of( V3::ContextDAO )
    end
    it "increases the count of the #context_list" do
      expect{
        subject.new_context( FFaker::Lorem.word.to_sym )
      }.to change{ subject.context_list.keys.count }.by(1)
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "when serializing with Marshal (dump+load)," do
    let( :non_empty_subject ) do
      factory = V3::DAOFactory.new()
# DEBUG
      puts "\r\n---- Factory dump: ----"

      (1..5).each do |outer_idx|
        context = factory.new_context("ctx_#{outer_idx}".to_sym)

        ((outer_idx * 10 + 1)..(outer_idx * 10 + 5)).each do |inner_idx|
          entity_name = "ent_#{inner_idx}".to_sym
          entity = factory.new_entity( entity_name, context )
          entity.text_token = inner_idx.to_s
          entity.parsed_value = inner_idx
# DEBUG
          puts entity
        end
# DEBUG
        puts context
      end
      factory
    end

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
