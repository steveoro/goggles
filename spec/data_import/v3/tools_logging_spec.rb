require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../app/data_import/v3/tools_logging'
require_relative '../../../lib/framework/string_logger'


describe Tools::Logging::V3, type: :model do

  class Tools::Logging::V3::Dummy1
    include Tools::Logging::V3
    def logger
      @logger ||= StringLogger.new
    end
  end

  class Tools::Logging::V3::Dummy2
    include Tools::Logging::V3
  end

  let(:fixture_message)         { FFaker::Lorem.paragraph }
  subject                       { Tools::Logging::V3::Dummy1.new }
  let(:subject_without_logger)  { Tools::Logging::V3::Dummy2.new }

  it_behaves_like( "(the existance of a method)", [
    :process_log, :log, :update_process_logs
  ] )


  describe "#process_log" do
    it "returns a String instance" do
      expect( subject.process_log ).to be_an_instance_of( String )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#log" do
    context "when the condition is true and the logger is defined," do
      it "executes without error" do
        expect{ subject.log(fixture_message, true) }.not_to raise_error
      end
      it "updates the logger with the specified message" do
        subject.log( fixture_message, true )
        expect( subject.logger.captured ).to include(fixture_message)
      end
    end

    context "when the condition is true and the logger is NOT defined," do
      it "executes without error" do
        expect{ subject_without_logger.log(fixture_message, true) }.not_to raise_error
      end
    end

    context "when the condition is false and the logger is defined," do
      it "does not update the logger with the specified message" do
        expect{ subject.log(fixture_message, false) }.not_to raise_error
        expect( subject.logger.captured ).not_to include(fixture_message)
      end
    end
  end


  describe "#update_process_logs" do
    it "executes without error even if the message is nil" do
      expect{ subject.update_process_logs(nil) }.not_to raise_error
    end
    it "updates the process log with the specified message" do
      subject.update_process_logs(fixture_message)
      expect( subject.process_log ).to include(fixture_message)
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
