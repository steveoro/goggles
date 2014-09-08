# encoding: utf-8
require 'spec_helper'

require 'parsers/fin_result_defs'


describe FinResultDefs, type: :model do

  context "for a well-defined instance," do

    subject { FinResultDefs.new( '', ConsoleLogger.new ) }

    it_behaves_like( "(the existance of a method)", [
      :full_pathname, :logger,
      :context_types, :defined_keys, :required_keys,
      :field_list_for, :detector_for, :tokenizers_for, :is_a_parent,
      :tokenizer_types_for, :tokenizer_fields_for
    ] )
    #-- -----------------------------------------------------------------------
    #++


    describe "#full_pathname" do
      it "is a String" do
        expect( subject.full_pathname ).to be_an_instance_of( String )
      end
    end


    describe "#logger (when defined)" do
      it "is a Logger or ConsoleLogger instance" do
        expect( subject.logger ).to be_an_instance_of( Logger ).or be_an_instance_of( ConsoleLogger )
      end
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
