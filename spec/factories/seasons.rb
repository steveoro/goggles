# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :federation_type do
    code "FIN"
    descrition "FEDERAZIONE ITALIANA NUOTO"
    short_name "FIN"
  end

  factory :season_type do
    code "MASFIN"
    descrition "CIRCUITO ITALIANO MASTER FIN"
    short_name "MASTER FIN"
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
