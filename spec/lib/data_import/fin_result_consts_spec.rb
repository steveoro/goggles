require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../lib/data_import/fin_result_consts'
require_relative '../../../lib/data_import/context_type_def'
require_relative '../../../lib/data_import/services/token_extractor'


describe FinResultConsts, type: :model do

  context "as an included module," do
    subject { class DummyWrapper; include FinResultConsts; end }

    it "defines a list of constant ContextTypeDef(s)" do
      expect( subject.new.get_context_types_list ).to all be_an_instance_of( ContextTypeDef )
    end

    it "defines a list of constant TokenExtractor(s)" do
      expect( subject.new.get_tokenizers_list ).to all be_an_instance_of( TokenExtractor )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
