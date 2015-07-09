# encoding: utf-8

require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../app/data_import/v2/dao/header_fields_dao'


describe HeaderFieldsDAO, type: :model do

  context "as a valid instance," do
    let(:pathname)      { File.join(FFaker::Lorem.word, FFaker::Lorem.word) }
    let(:prefix)        { FFaker::Lorem.word[0..2] }
    let(:year)          { ((rand * 100) % 10).to_i + 2007 }
    let(:month)         { ((rand * 100) % 12).to_i + 1 }
    let(:day)           { ((rand * 100) % 28).to_i + 1 }
    let(:header_date)   { "%04d%02d%02d" % [year, month, day] }
    let(:header_year)   { "%04d/%04d" % [year, year+1] }
    let(:code_name)     { FFaker::Lorem.word }
    let(:full_pathname) { File.join( pathname, "#{ prefix }#{ header_date }#{ code_name }.txt" ) }

    subject { HeaderFieldsDAO.new( full_pathname, prefix, header_date, header_year, code_name ) }


    it_behaves_like( "(the existance of a method)", [
      :full_pathname, :prefix, :header_date, :code_name,
      :header_year, :edition, :edition_type_id, :timing_type_id
    ] )

    describe "#full_pathname" do
      it "is the pathname specified for the construction" do
        expect( subject.full_pathname ).to eq( full_pathname )
      end
    end
    describe "#prefix" do
      it "is the prefix specified for the construction" do
        expect( subject.prefix ).to eq( prefix )
      end
    end
    describe "#header_date" do
      it "is the header_date specified for the construction" do
        expect( subject.header_date ).to eq( header_date )
      end
    end
    describe "#code_name" do
      it "is the code_name specified for the construction" do
        expect( subject.code_name ).to eq( code_name )
      end
    end
    describe "#header_year" do
      it "is the header_year specified for the construction" do
        expect( subject.header_year ).to eq( header_year )
      end
    end
    describe "#edition" do
      it "is 0" do
        expect( subject.edition ).to eq( 0 )
      end
    end
    describe "#edition_type_id" do
      it "is nil" do
        expect( subject.edition_type_id ).to be nil
      end
    end
    describe "#timing_type_id" do
      it "is nil" do
        expect( subject.timing_type_id ).to be nil
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end

