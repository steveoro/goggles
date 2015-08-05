require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../app/data_import/v3/tools_logging'


describe Tools::Logging::V3, type: :model do

  subject { class Tools::Logging::V3::Dummy; include Tools::Logging::V3; end.new }

  it_behaves_like( "(the existance of a method)", [
    :log
  ] )

  describe "#log" do
    it "runs without error when the condition is true, even when logger is undefined" do
      expect{ subject.log("whatever, dude!", true) }.not_to raise_error
    end
    it "runs without error when the condition is false, even when logger is undefined" do
      expect{ subject.log("whatever, dude!", true) }.not_to raise_error
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
