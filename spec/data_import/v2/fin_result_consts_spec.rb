require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../app/data_import/v2/fin_result_consts'
require_relative '../../../app/data_import/v2/context_type_def'
require_relative '../../../app/data_import/v2/services/token_extractor'


describe V2::FinResultConsts, type: :model do

  context "as an included module," do
    subject { class V2::FinResultConsts::DummyWrapper; include V2::FinResultConsts; end }

    it "defines a list of constant V2::ContextTypeDef(s)" do
      expect( subject.new.get_context_types_list ).to all be_an_instance_of( V2::ContextTypeDef )
    end

    it "defines a list of constant V2::TokenExtractor(s)" do
      expect( subject.new.get_tokenizers_list ).to all be_an_instance_of( V2::TokenExtractor )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
