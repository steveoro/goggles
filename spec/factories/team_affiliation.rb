require 'date'
require 'ffaker'


FactoryGirl.define do

  factory :team_affiliation do
    team
    season
    name                      { team.name }
    random_badge_code
    user

    factory :team_affiliation_with_badges do
      after(:create) do |created_instance, evaluator|
        create_list(
          :badge,
          ((rand * 10).to_i + 2),                   # total number of results
          team:             created_instance.team,
          team_affiliation: created_instance,
          season:           created_instance.season,
          category_type:    create(:category_type, season: created_instance.season)
        )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
