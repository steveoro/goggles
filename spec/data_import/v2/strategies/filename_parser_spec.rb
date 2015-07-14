# encoding: utf-8

require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../app/data_import/v2/strategies/filename_parser'
require_relative '../../../../app/data_import/v2/dao/header_fields_dao'


describe V2::FilenameParser, type: :strategy do

  context "as a valid instance," do
    let(:pathname)      { File.join(FFaker::Lorem.word, FFaker::Lorem.word) }
    let(:prefix)        { FFaker::Lorem.word[0..2] }
    let(:year)          { ((rand * 100) % 10).to_i + 2007 }
    let(:month)         { ((rand * 100) % 12).to_i + 1 }
    let(:day)           { ((rand * 100) % 28).to_i + 1 }
    let(:header_date)   { "%04d%02d%02d" % [year, month, day] }
    let(:invalid_date)  { "%04d%02d%02d" % [year, month, day+31] }
    let(:code_name)     { FFaker::Lorem.word }

    subject do
      V2::FilenameParser.new(
        File.join( pathname, "#{ prefix }#{ header_date }#{ code_name }.txt" )
      )
    end


    it_behaves_like( "(the existance of a method)", [
      :full_pathname, :prefix, :header_date, :code_name, :header_year,
      :parse
    ] )

    describe "#parse" do
      it "returns an HeaderFieldsDAO DAO for a valid date" do
        expect( subject.parse() ).to be_an_instance_of( HeaderFieldsDAO )
      end
      it "raises ArgumentError for a non-valid date" do
        parser = V2::FilenameParser.new( File.join( pathname, "#{ prefix }#{ invalid_date }#{ code_name }.txt" ) )
        expect{ parser.parse }.to raise_error( ArgumentError )
      end
      it "raises ArgumentError for a non-valid filename" do
        parser = V2::FilenameParser.new( File.join( pathname, "#{ prefix }#{ code_name }.txt" ) )
        expect{ parser.parse }.to raise_error( ArgumentError )
      end

      describe "after a successful parsing," do
        before(:each) do
          @result = subject.parse
          expect( @result ).to be_an_instance_of( HeaderFieldsDAO )
        end

        it "updates the :prefix member" do
          expect( @result.prefix ).to eq( prefix )
        end
        it "updates the :header_date member" do
          expect( @result.header_date ).to be_an_instance_of( Date )
          expect( @result.header_date ).to eq( Date.parse(header_date) )
        end
        it "updates the :code_name member" do
          expect( @result.code_name ).to eq( code_name )
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
