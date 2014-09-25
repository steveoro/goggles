# encoding: utf-8

require 'spec_helper'
require 'ffaker'

#require 'data_import/strategies/filename_parser'
#require 'data_import/header_fields'


describe FilenameParser, type: :strategy do

  context "as a valid instance," do
    let(:pathname)    { File.join(Faker::Lorem.word, Faker::Lorem.word) }
    let(:prefix)      { Faker::Lorem.word[0..2] }
    let(:header_date) do
      "#{ ((rand * 100) % 10).to_i + 2007 }" +
      "%02d" % "#{ ((rand * 100) % 12).to_i + 1 }" +
      "%02d" % "#{ ((rand * 100) % 28).to_i + 1 }"
    end
    let(:invalid_date) do
      "#{ ((rand * 100) % 10).to_i + 2007 }" +
      "%02d" % "#{ ((rand * 100) % 12).to_i + 1 }" +
      "%02d" % "#{ ((rand * 100) % 28).to_i + 31 }"
    end
    let(:code_name)   { Faker::Lorem.word }

    subject do
      FilenameParser.new(
        File.join( pathname, "#{ prefix }#{ header_date }#{ code_name }.txt" )
      )
    end


    it_behaves_like( "(the existance of a method)", [
      :full_pathname, :prefix, :header_date, :code_name, :parse
    ] )

    describe "#parse" do
      it "returns an HeaderFields DAO for a valid date" do
        expect( subject.parse() ).to be_an_instance_of( HeaderFields )
      end
      it "returns nil for a non-valid date" do
        parser = FilenameParser.new( File.join( pathname, "#{ prefix }#{ invalid_date }#{ code_name }.txt" ) )
        expect( parser.parse ).to be nil
      end
      it "returns nil for a non-valid filename" do
        parser = FilenameParser.new( File.join( pathname, "#{ prefix }#{ code_name }.txt" ) )
        expect( parser.parse ).to be nil
      end

      describe "after a successful parsing," do
        before(:each) do
          @result = subject.parse
          expect( @result ).to be_an_instance_of( HeaderFields )
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
