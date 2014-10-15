require 'date'
require 'ffaker'


FactoryGirl.define do

  factory :category_type do
    age_begin                 { ((((rand * 100) % 15).to_i * 5) + 25) }
    age_end                   { age_begin ? age_begin + 5 : 99 }
    code                      { "M#{age_begin ? age_begin : 25}" }
    description               { "MASTER #{age_begin ? age_begin : 25}" }
    short_name                { code }
    season
    #group_name
    federation_code           { (rand * 100).to_i.to_s } # (This has nothing to do with season.federation_type.code)
    is_a_relay                false
    is_out_of_race            false
  end
  #-- -------------------------------------------------------------------------
  #++
end
