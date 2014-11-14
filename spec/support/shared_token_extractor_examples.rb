# encoding: utf-8
require 'spec_helper'

require 'framework/console_logger'
require 'data_import/services/context_detector'
require 'data_import/services/token_extractor'
require 'data_import/fin_result_consts'


shared_examples_for "(extracting tokens only for the matching feed lines)" do
  it "splits correctly in tokens only the recognized feed lines" do
    feed.each_with_index do |feed_line, index|
      # We need to clear the tokenizer since we are re-using the same instance for each test:
      subject.clear
      token = subject.tokenize( feed_line )
      expect( token ).to eq( expected_tokens[index] )
    end
  end
end
#-- ---------------------------------------------------------------------------
#++
