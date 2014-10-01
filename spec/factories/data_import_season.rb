require 'date'
require 'ffaker'


FactoryGirl.define do
  factory :data_import_season do
    data_import_session

    conflicting_id            nil
    import_text               { Faker::Lorem.paragraph[0..255] }

    random_season             # Trait defined in factories/seasons.rb

    # Make the circular reference between the session and the
    # season valid:
    after(:create) do |created_instance, evaluator|
      created_instance.data_import_session.data_import_season_id = created_instance.id
    end
  end
end
