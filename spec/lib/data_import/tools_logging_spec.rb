require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../lib/data_import/tools_logging'


describe Tools::Logging, type: :model do

  subject { class Dummy; include Tools::Logging; end.new }

  it_behaves_like( "(the existance of a method)", [
    :log_somehow
  ] )
  #-- -------------------------------------------------------------------------
  #++
end
