require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../app/data_import/v3/dao/parse_result'
require_relative '../../../../app/data_import/v3/dao/entity_dao'
require_relative '../../../../app/data_import/v3/dao/context_dao'
require_relative '../../../../app/data_import/v3/strategy/dao_factory'



describe ParseResult, :type => :model do

  subject { ParseResult.new( FFaker::Lorem.word ) }


  it_behaves_like( "(the existance of a method)", [
    :file_name, :entity_list, :context_list
  ])
  #-- -------------------------------------------------------------------------
  #++


  # TODO
end
