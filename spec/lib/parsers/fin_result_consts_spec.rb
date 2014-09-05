require 'spec_helper'

require 'parsers/context_type_def'
require 'parsers/fin_result_consts'
require 'parsers/token_extractor'


describe FinResultConsts, type: :model do

  context "as a stand-alone module," do
    it "defines a list of constant ContextTypeDef(s)" do
      expect( FinResultConsts::ALL_CONTEXT_TYPE_DEFS ).to all be_an_instance_of( ContextTypeDef )
    end

    it "defines a list of constant TokenExtractor(s)" do
      expect( FinResultConsts::ALL_TOKEN_EXTRACTOR ).to all be_an_instance_of( TokenExtractor )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
