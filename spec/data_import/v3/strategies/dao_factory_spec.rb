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
    :clear, :new_entity, :new_context,
    :serialize, :deserialize
  ])
  #-- -------------------------------------------------------------------------
  #++


  describe "#new_entity" do
    it "returns an EntityDAO object" do
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
    it "returns an ContextDAO object" do
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
end
