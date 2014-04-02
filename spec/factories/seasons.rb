# Read about factories at https://github.com/thoughtbot/factory_girl
require 'date'


FactoryGirl.define do
  factory :federation_type do
    sequence( :code )  { |n| "FN#{n}" }
    description "FEDERAZIONE REGGIANA NUOTO"
    short_name  "FRN"
  end

  factory :season_type do
    #sequence( :code ) { |n| "MAS_#(n)" }
    code { "MAS#{federation_type.code}" }
    description { "CIRCUITO REGGIANO MASTER #{federation_type.code}" }
    short_name { "MASTER #{federation_type.code}" }
    federation_type
  end

  factory :season do
    sequence( :description )  { |n| "Farloque season #(n)" }
    begin_date  { Date.parse("#{ 2000 + ((rand * 100) % 15).to_i }-09-01") }
    end_date    { Date.parse("#{ begin_date.year + 1 }-06-15") }
    header_year { end_date.year }
    season_type
  end

  factory :meeting do
    sequence( :description )  { |n| "Farloque meeting #(n)" }
    sequence( :code )  { |n| "farloque#(n)" }
    edition { ((rand * 100) % 40).to_i }
    season
    #header_year { 2000 + ((rand * 100) % 15).to_i }
    header_year { season.header_year }
    timing_type_id 1
    edition_type_id 1
    user_id user
  end
end
