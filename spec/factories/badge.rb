require 'date'
require 'ffaker'


FactoryGirl.define do

  trait :random_badge_code do
    number                    { 8.times.collect{ |i| (rand * 10).to_i }.join }
  end

  trait :common_badge_fields do
    random_badge_code
    team
    swimmer
    entry_time_type           { EntryTimeType.all.sort{ rand - 0.5 }[0] }
    user
  end
  #-- -------------------------------------------------------------------------
  #++


  factory :data_import_badge do
    data_import_session
    common_badge_fields
    season                    { data_import_session.season }
    category_type             { create(:category_type, season: season) }
    import_text               { number }
  end


  factory :badge do
    common_badge_fields
    team_affiliation          { create(:team_affiliation, team: team) }
    season                    { team_affiliation.season }
    category_type             { create(:category_type, season: team_affiliation.season) }
  end
  #-- -------------------------------------------------------------------------
  #++
end
