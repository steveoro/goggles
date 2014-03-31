# Read about factories at https://github.com/thoughtbot/factory_girl
require 'date'


FactoryGirl.define do
  factory :federation_type do
    sequence( :code )  { |n| "FN #{n}" }
    description "FEDERAZIONE REGGIANA NUOTO"
    short_name "FRN"
  end

  factory :season_type do
    sequence( :code )  { |n| "MASFN #{n}" }
    description "CIRCUITO REGGIANO MASTER FRN"
    short_name "MASTER FRN"
    federation_type
  end

  factory :season do
    sequence( :description )  { |n| "2013-2014 Farloque season #{n}" }
    begin_date  Date.parse("2013-09-01")
    end_date    Date.parse("2014-06-15")
    header_year 2014
    season_type
  end

  factory :random_season do
    sequence( :description )  { |n| "Random Farloque season #{n}" }
    begin_date  { Date.parse("#{ 2000 + ((rand * 100) % 15).to_i }-09-01") }
    end_date    { Date.parse("#{ begin_date.year + 1 }-06-15") }
    header_year { end_date.year }
    season_type
  end
end
