require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../app/data_import/v3/dao/entity_dao'



describe EntityDAO, :type => :model do

  subject { EntityDAO.new( (rand * 10000).to_i, FFaker::Lorem.word.to_sym ) }


  it_behaves_like( "(the existance of a method)", [
    :id, :name,
    :text_token, :parent_context, :parsed_value, :destination_class
  ])
  #-- -------------------------------------------------------------------------
  #++


  # TODO
end
