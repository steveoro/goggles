# encoding: utf-8

require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../lib/data_import/strategies/city_comparator'


describe CityComparator, type: :strategy do

  let(:composed_city_names) do
    [
      "REGGIO NELL'EMILIA",
      "CADELBOSCO DI SOTTO",
      "CASTENUOVO NE' MONTI",
      "REGGIO CALABRIA"
    ]
  end
  let(:single_city_names) do
    [
      "PARMA",
      "MODENA",
      "MILANO",
      "BOLOGNA"
    ]
  end

  let(:team_names) do
    [
      "CSI Nuoto Ober Ferrari ASD",
      "CSI NUOTO CORREGGIO",
      "CSI NUOTO MASTER IMOLA",
      "FERRARI NUOTO MODENA",
      "NUOTO MASTER CSI LUGO"
    ]
  end
  let(:city_from_team_expectations) do
    [
      "Reggio Emilia,Reggio Emilia",
      "Correggio,Reggio Emilia",
      "Imola,Imola",
      "Modena,Modena",
      "Lugo,Ravenna,48022"
    ]
  end

  context "as a stand-alone class," do
    subject { CityComparator }

    # Since subject is already a class, we just need to use this shared existance example
    # instead of the "(the existance of a class method)":
    it_behaves_like( "(the existance of a method)", [
      :guess_city_from_team_name,
      :get_token_array_from_city_member_name,
      :compare_city_member_strings, :seems_the_same
    ] )
    #-- -----------------------------------------------------------------------
    #++


    describe "#known_cities" do
      it "is the list of all known (primary entity) cities" do
        comparator = CityComparator.new
        expect( comparator.known_cities.count ).to eq(City.count)
      end
    end

    describe "#known_data_import_cities" do
      it "is the list of all known (secondary entity, data-import) cities" do
        comparator = CityComparator.new
        expect( comparator.known_data_import_cities.count ).to eq(DataImportCity.count)
      end
    end
    #-- -----------------------------------------------------------------------
    #++


    describe "self.guess_city_from_team_name()" do
      it "returns a comma-separated string list with a matching City and Area name when successful" do
        # Test some examples with possible false-positives:
        team_names.each_with_index do |team_name, index|
          result = subject.guess_city_from_team_name( team_name )
          expect( result ).to be_an_instance_of( String )
          expect( result.split(',').size ).to be >= 2
          expect( result ).to eq( city_from_team_expectations[index] )
        end
      end
      it "returns an empty string when not successful" do
        result = subject.guess_city_from_team_name( 'Fake Team ASD' )
        expect( result ).to eq('')
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    describe "self.get_token_array_from_city_member_name()" do
      it "returns an Array of basic name tokens for a composed name" do
        composed_city_names.each_with_index do |city_name, index|
          result = subject.get_token_array_from_city_member_name( city_name )
# DEBUG
#          puts "\r\n#Checking #{city_name}: #{result.inspect}"
          expect( result ).to be_an_instance_of( Array )
          expect( result.size ).to eq(2)
          expect( result ).to all( be_an_instance_of( String ) )
        end
      end
      it "returns an Array with just the string for a simple city name" do
        single_city_names.each_with_index do |city_name, index|
          result = subject.get_token_array_from_city_member_name( city_name )
          expect( result ).to be_an_instance_of( Array )
          expect( result.size ).to eq(1)
          expect( result.first ).to be_an_instance_of( String )
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    describe "self.compare_city_member_strings()" do
      it "returns true when two city member (city, area, country) names looks the same" do
        [
          ["Reggio Emilia", "Reggio nell'Emilia"],
          ["Cadelbosco Sopra", "Cadelbosco di Sopra"],
          ["Castelnovo Monti", "Castelnovo Ne'Monti"]
        ].each do |city_name_pair|
          name_1, name_2 = city_name_pair
# DEBUG
#          puts "\r\n#Checking #{name_1} vs. #{name_2}"
          expect( subject.compare_city_member_strings(name_1, name_2) ).to be true
        end
      end
      it "returns false for two completely unrelated names" do
        [
          ["Rome", "New York"],
          ["Borzano", "Bolzano"],
          ["Parto", "Prato"]
        ].each do |city_name_pair|
          name_1, name_2 = city_name_pair
          expect( subject.compare_city_member_strings(name_1, name_2) ).to be false
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    describe "self.seems_the_same()" do
      it "returns true when cities looks the same" do
        [
          [ "Reggio Emilia",    "Reggio nell'Emilia",  "RE", "RE", "I", "I" ],
          [ "Cadelbosco Sopra", "Cadelbosco di Sopra", "RE", "RE", "I", "I" ],
          [ "Castelnovo Monti", "Castelnovo Ne'Monti", "RE", "RE", "I", "I" ]
        ].each do |city_member_list|
# DEBUG
#          puts "\r\n#Checking #{city_member_list.inspect}"
          city_1, city_2, area_1, area_2, country_1, country_2 = city_member_list
          expect( subject.seems_the_same( city_1, city_2, area_1, area_2, country_1, country_2 ) ).to be true
        end
      end
      it "returns false for two completely unrelated cities" do
        [
          ["Reggio Calabria", "Reggio Emilia",  "RC", "RE", "I", "I"],
          ["Rome",            "New York",       "RE", "NY", "I", "USA"],
          ["Borzano",         "Bolzano",        "RE", "BZ", "I", "I"],
          ["Parto",           "Prato",          "??", "SI", "I", "I"]
        ].each do |city_name_pair|
          name_1, name_2 = city_name_pair
          expect( subject.compare_city_member_strings(name_1, name_2) ).to be false
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
