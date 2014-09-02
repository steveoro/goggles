require 'spec_helper'

# require 'parsers/context_type_def'


describe ContextTypeDef do
  before :each do
  end

  context "for a well-defined instance," do
    subject do
      ContextTypeDef.new(
        :meeting_header,
        [
          /(\s*(Distanze speciali|((\d{1,3}\D{1,2}|[IXVMCDL]{1,8})\s(\S+|Trof|Region))))|(\d{1,2}((\/|-|\,)\d{1,2})*\s(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic).*\s\d{4})/ui,
          /(\s*Manifestazione organizzata da)|(\s*(Distanze speciali|((\d{1,3}\D{1,2}|[IXVMCDL]{1,8})\s(\S+|Trof|Region))))/ui,
          /(\d{1,2}((\/|-|\,)\d{1,2})*\s(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic).*\s\d{4})|(\s*Manifestazione organizzata da)|/ui
        ],
        nil,                                          # parent context
        4                                             # line_timeout (line after which these checks will be skipped)
      )
    end

    it_behaves_like( "(the existance of a method)", [
        :context_name, :condition_array, :parent_context_name, :line_timeout
    ] )

    it "has a context name"
    it "has a condition array"

    context "with a parent context specified," do
      it "has parent context name"
    end

    context "with a line timeout specified," do
      it "has line timeout value"
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
