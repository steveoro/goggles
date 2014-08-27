require 'ffaker'


FactoryGirl.define do
  factory :goggle_cup do
    description               { "#{Faker::Name.suffix} #{Faker::Address.city} Fun Cup" }
    team
    season_year               { ((rand * 100) % 10).to_i + 2007 }
    max_points                1000
    max_performance           { ((rand * 100) % 5).to_i + 3 }
    user

    factory :goggle_cup_with_definitions do
      after(:create) do |created_instance, evaluator|
        create_list(
          :goggle_cup_definition,
          ((rand * 3).to_i + 1),               # total number of seasons
          goggle_cup: created_instance         # association enforce for each sub-row
        )
      end
    end

    factory :goggle_cup_with_standards do
      after(:create) do |created_instance, evaluator|
        create_list(
          :goggle_cup_standard,
          ((rand * 30).to_i + 1),              # total number of standard times
          goggle_cup: created_instance         # association enforce for each sub-row
        )
      end
    end

    factory :goggle_cup_complete do
      after(:create) do |created_instance, evaluator|
        create_list(
          :goggle_cup_standard,
          ((rand * 30).to_i + 1),              # total number of results
          goggle_cup: created_instance         # association enforce for each sub-row
        )
        create_list(
          :goggle_cup_definition,
          ((rand * 3).to_i + 1),               # total number of seasons
          goggle_cup: created_instance         # association enforce for each sub-row
        )
      end
    end
  end
  
  factory :goggle_cup_standard do
    goggle_cup
    swimmer
    pool_type_id              { PoolType.only_for_meetings[ ((rand * 100) % PoolType.only_for_meetings.count).to_i ].id }  # From seeds
    event_type_id             { EventType.are_not_relays[ ((rand * 100) % EventType.are_not_relays.count).to_i ].id } # From seeds
    minutes                   { ((rand * 100) % 2).to_i}
    seconds                   { ((rand * 60) % 60).to_i }
    hundreds                  { ((rand * 100) % 100).to_i }
  end

  factory :goggle_cup_definition do
    goggle_cup
    season
  end
end
