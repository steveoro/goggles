# encoding: utf-8

require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../lib/data_import/header_fields_dao'


describe HeaderFieldsDAO, type: :model do

  context "as a valid instance," do
    let(:pathname)    { File.join(Faker::Lorem.word, Faker::Lorem.word) }
    let(:prefix)      { Faker::Lorem.word[0..2] }
    let(:header_date) do
      "#{ ((rand * 100) % 10).to_i + 2007 }" +
      "%02d" % "#{ ((rand * 100) % 12).to_i + 1 }" +
      "%02d" % "#{ ((rand * 100) % 28).to_i + 1 }"
    end
    let(:code_name)     { Faker::Lorem.word }
    let(:full_pathname) { File.join( pathname, "#{ prefix }#{ header_date }#{ code_name }.txt" ) }

    subject { HeaderFieldsDAO.new( full_pathname, prefix, header_date, code_name ) }


    it_behaves_like( "(the existance of a method)", [
      :full_pathname, :prefix, :header_date, :code_name,
      :header_year, :edition, :edition_type_id, :timing_type_id
    ] )
  end
  #-- -------------------------------------------------------------------------
  #++
end

