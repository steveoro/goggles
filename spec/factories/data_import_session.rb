require 'ffaker'


FactoryGirl.define do
  factory :data_import_session do
    file_name               { "#{ Faker::Internet.domain_word }.txt" }
    source_data             { Faker::Lorem.paragraph[0..250] }
    phase                   0
    total_data_rows         0
    season
    user_id                 1
    file_format             { Faker::Lorem.word.camelcase }
    phase_1_log             { Faker::Lorem.paragraph[0..250] }
    phase_2_log             { Faker::Lorem.paragraph[0..250] }
    phase_3_log             { Faker::Lorem.paragraph[0..250] }
    data_import_season_id   nil
  end
end
