require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../app/data_import/v3/tools_logging'


describe Tools::Logging::V3, type: :model do

  subject { class Dummy; include Tools::Logging::V3; end.new }

  it_behaves_like( "(the existance of a method)", [
    :log
  ] )
  #-- -------------------------------------------------------------------------
  #++
end
