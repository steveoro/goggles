require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../app/data_import/v2/tools_logging'


describe Tools::Logging, type: :model do

  subject { class Tools::Logging::Dummy; include Tools::Logging; end.new }

  it_behaves_like( "(the existance of a method)", [
    :log_somehow
  ] )
  #-- -------------------------------------------------------------------------
  #++
end
