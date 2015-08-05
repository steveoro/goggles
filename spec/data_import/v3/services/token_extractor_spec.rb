# encoding: utf-8
require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../app/data_import/v3/services/token_extractor'
require_relative '../../../../app/data_import/v3/fin_result_consts'
require_relative '../../../../lib/framework/console_logger'


describe V3::TokenExtractor, type: :service do

  context "for a well-defined instance," do
    let( :dummy_wrapper ) do
      class V3::TokenExtractor::DummyWrapper; include V3::FinResultConsts; end
      V3::TokenExtractor::DummyWrapper.new
    end
    let( :tokenizers_array ) { dummy_wrapper.get_tokenizers_list() }

    subject { tokenizers_array[ (rand * tokenizers_array.size).to_i ] }

    it_behaves_like( "(the existance of a method)", [
      :field_name, :starting_with, :ending_with, :line_timeout,
      :clear, :get_start_index, :get_end_index,
      :tokenize, :to_s
    ] )
    #-- -----------------------------------------------------------------------
    #++


    context "with random attributes," do
      let(:field_name)        { FFaker::Lorem.word }
      let(:starting_with)     { (rand * 10).to_i }
      let(:ending_with)       { (rand * 100).to_i }
      subject { V3::TokenExtractor.new( field_name, starting_with, ending_with ) }

      describe "#field_name" do
        it "returns the field name specified in the constructor" do
          expect( subject.field_name ).to eq( field_name )
        end
      end

      describe "#starting_with" do
        it "returns the field name specified in the constructor" do
          expect( subject.starting_with ).to eq( starting_with )
        end
      end

      describe "#ending_with" do
        it "returns the field name specified in the constructor" do
          expect( subject.ending_with ).to eq( ending_with )
        end
      end
    end


    describe "#initialize" do
      it "returns a V3::TokenExtractor instance" do
        expect( subject ).to be_an_instance_of( V3::TokenExtractor )
      end
      it "has a #field_name Symbol" do
        expect( subject.field_name ).to be_an_instance_of( Symbol )
      end
      it "has a #starting_with Fixnum or Regexp" do
        expect( subject.starting_with ).to be_an_instance_of( Fixnum ).or be_an_instance_of( Regexp )
      end
      it "has a #ending_with Fixnum or Regexp" do
        expect( subject.ending_with ).to be_an_instance_of( Fixnum ).or be_an_instance_of( Regexp )
      end
      it "has a #line_timeout Fixnum value" do
        expect( subject.line_timeout ).to be_an_instance_of( Fixnum )
      end
    end


    describe "#to_s" do
      it "returns a String" do
        expect( subject.to_s ).to be_an_instance_of( String )
      end
      it "includes the class name" do
        expect( subject.to_s ).to include( subject.class.name )
      end
      it "includes the #field_name" do
        expect( subject.to_s ).to include( subject.field_name.to_s )
      end
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
