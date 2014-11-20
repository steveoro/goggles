# encoding: utf-8
require 'spec_helper'

require 'common/encoding_tools'
require 'framework/console_logger'
require_relative './context_detector_checks_for_parsing'


describe "'FIN2 result'-filetype Context Type Definitions", type: :integration do
  include ContextDetectorChecksForParsing

  let( :dummy_wrapper ) do
    class DummyWrapper; include Fin2ResultConsts; end
    DummyWrapper.new
  end
  #-- -------------------------------------------------------------------------
  #++


  [
    File.join(Rails.root, 'test/fixtures/samples/ris20081221mussi-sample.txt'),
    File.join(Rails.root, 'test/fixtures/samples/ris20091213livorno-sample.txt'),
    File.join(Rails.root, 'test/fixtures/samples/ris20101212livorno-sample.txt'),
    File.join(Rails.root, 'test/fixtures/samples/ris20101219mussi-sample.txt'),
    File.join(Rails.root, 'test/fixtures/samples/ris20130513pontedera-sample.txt'),
    File.join(Rails.root, 'test/fixtures/samples/ris20131117poggibonsi-sample.txt'),
    File.join(Rails.root, 'test/fixtures/samples/ris20140330lucca-sample.txt')
  ].each do |filename|
    context "when parsing :meeting_header," do
      subject { ContextDetector.new( dummy_wrapper.context_type_meeting_header, nil ) }

      let(:contents) do
        contents = []
        File.open( filename ).each_line do |curr_line|
          contents << EncodingTools.force_valid_encoding( curr_line )
        end
        contents
      end

      it "recognizes the presence of the context for #{File.basename(filename)}" do
        check_for_parsing_ok( contents )
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    context "when parsing :event_individual," do
      subject { ContextDetector.new( dummy_wrapper.context_type_event_individual, nil ) }

      let(:contents) do
        contents = []
        File.open( filename ).each_line do |curr_line|
          contents << EncodingTools.force_valid_encoding( curr_line )
        end
        contents
      end

      it "recognizes the presence of the context for #{File.basename(filename)}" do
        check_for_parsing_ok( contents )
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    context "when parsing :event_relay," do
      subject { ContextDetector.new( dummy_wrapper.context_type_event_relay, nil ) }

      let(:contents) do
        contents = []
        File.open( filename ).each_line do |curr_line|
          contents << EncodingTools.force_valid_encoding( curr_line )
        end
        contents
      end

# FIXME this should fail for 'ris20101219mussi-sample.txt' & 'ris20131117poggibonsi-sample.txt'
      xit "recognizes the presence of the context for #{File.basename(filename)}" do
        check_for_parsing_ok( contents )
      end
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
