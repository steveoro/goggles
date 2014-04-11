require 'date'
require 'ffaker'


FactoryGirl.define do
  factory :federation_type do
    sequence( :code )         { |n| "SF#{n}" }
    description               { "#{ Faker::Lorem.word.camelcase } Swimming Federation" }
    short_name                "SFX"
  end

  factory :season_type do
    code                      { "MAS#{federation_type.code}" }
    description               { "MASTER #{federation_type.code} #{ Faker::Lorem.word.upcase }" }
    short_name                { "MASTER #{federation_type.code}" }
    federation_type
  end

  factory :season do
    sequence( :description )  { |n| "Farloque season #(n)" }
    begin_date                { Date.parse("#{ 2000 + ((rand * 100) % 15).to_i }-09-01") }
    end_date                  { Date.parse("#{ begin_date.year + 1 }-06-15") }
    header_year               { end_date.year }
    season_type
  end

  factory :meeting do
    sequence( :code )         { |n| "farloque#(n)" }
    description               { "#{Faker::Name.suffix} #{Faker::Address.city} Meeting" }
    edition                   { ((rand * 100) % 40).to_i }
    season
    header_year               { season.header_year }
    timing_type_id            1
    edition_type_id           1
    user_id                   user
  end
end
