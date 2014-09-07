require 'spec_helper'

require 'parsers/fin_result_defs'


describe FinResultDefs, type: :model do
  let( :fixture ) do
    nil
  end


  context "for a well-defined instance," do

    subject { FinResultDefs.new() }

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
        expect( subject.full_pathname ).to be_an_instance_of( String ).or be nil
      end
    end

    describe "#logger" do
      # TODO set a logger and test the getter
      it "is a Logger or nil" do
        expect( subject.logger ).to be_an_instance_of( Logger ).or be nil
      end
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
