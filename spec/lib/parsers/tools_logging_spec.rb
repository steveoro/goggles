require 'spec_helper'

require 'parsers/tools_logging'


describe Tools::Logging, type: :model do

  subject { class Dummy; include Tools::Logging; end.new }

  it_behaves_like( "(the existance of a method)", [
    :log_somehow
  ] )
  #-- -------------------------------------------------------------------------
  #++
end
