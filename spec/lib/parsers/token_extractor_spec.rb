# encoding: utf-8
require 'spec_helper'

require 'framework/console_logger'
require 'parsers/token_extractor'
require 'parsers/fin_result_consts'


describe TokenExtractor, type: :model do

  context "for a well-defined instance," do

    subject { FinResultConsts::ALL_TOKEN_EXTRACTOR[ (rand * FinResultConsts::ALL_TOKEN_EXTRACTOR.size).to_i ] }

    it_behaves_like( "(the existance of a method)", [
      :field_name, :starting_with, :ending_with, :line_timeout,
      :clear, :get_start_index, :get_end_index,
      :tokenize, :to_s
    ] )
    #-- -----------------------------------------------------------------------
    #++


    describe "#initialize" do
      it "returns a TokenExtractor instance" do
        expect( subject ).to be_an_instance_of( TokenExtractor )
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