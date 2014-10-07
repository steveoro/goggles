require 'date'
require 'ffaker'


FactoryGirl.define do
  factory :federation_type do
    sequence( :code )
    description               { "Fake #{ Faker::Lorem.word.camelcase } Swimming Federation" }
    short_name                { "FSF#{code}" }
  end

  factory :season_type do
    # Code has a unique index on season_type, so we must use a sequence here:
    sequence( :code )         { |n| "#{federation_type.code}-#{n}" }
    federation_type           { FederationType.all.to_a[ rand * 10 % 5 ] } # ASSERT: at least 5 season types
    description               { "MASTER #{federation_type.code} #{ Faker::Lorem.word.upcase }"[0..99] }
    short_name                { "MASTER #{federation_type.code}"[0..39] }
  end
  #-- -------------------------------------------------------------------------
  #++

  trait :random_season do
    sequence( :edition )
    sequence( :description )  { |n| "Fake Season #{n}/#{edition}" }
    # The following column uses the pre-loaded seed records:
    edition_type_id           { ((rand * 100) % 5).to_i + 1 } # ASSERT: at least 5 edition types
    begin_date                { Date.parse("#{ 2000 + ((rand * 100) % 15).to_i }-09-01") }
    end_date                  { Date.parse("#{ begin_date.year + 1 }-08-30") }
    header_year               { end_date.year }
    season_type               { SeasonType.all.to_a[ rand * 10 % 8 ] } # ASSERT: at least 8 season types
  end

  factory :season do
    random_season
  end
  #-- -------------------------------------------------------------------------
  #++

  factory :category_type do
    age_begin                 { ((((rand * 100) % 15).to_i * 5) + 25) }
    age_end                   { age_begin ? age_begin + 5 : 99 }
    code                      { "M#{age_begin ? age_begin : 25}" }
    description               { "MASTER #{age_begin ? age_begin : 25}" }
    short_name                { code }
    #group_name
    federation_code           { (rand * 100).to_i.to_s }
    season
  end
end
