# Read about factories at https://github.com/thoughtbot/factory_girl

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
    sequence( :description )  { |n| "Farloque season #{n}" }
    begin_date 20130901
    end_date 20140615
    header_year 2014
    season_type
  end
end
