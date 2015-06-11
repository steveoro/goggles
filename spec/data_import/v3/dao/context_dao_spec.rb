require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../app/data_import/v3/dao/context_dao'



describe ContextDAO, :type => :model do

  subject { ContextDAO.new( (rand * 10000).to_i, FFaker::Lorem.word.to_sym ) }


  it_behaves_like( "(the existance of a method)", [
    :id, :name, :parent_context,
    :text_token, :entity_list
  ])
  #-- -------------------------------------------------------------------------
  #++


  # TODO
end
