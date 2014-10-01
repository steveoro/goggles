require 'date'
require 'ffaker'


FactoryGirl.define do
  factory :data_import_session do
    file_name               { "#{ Faker::Internet.domain_word }.txt" }
    source_data             { Faker::Lorem.paragraphs }
    phase                   0
    total_data_rows         0
    file_format             { Faker::Lorem.word.camelcase }
    phase_1_log             { Faker::Lorem.paragraph }
    phase_2_log             { Faker::Lorem.paragraph }
    phase_3_log             { Faker::Lorem.paragraph }
    data_import_season_id   nil
    season
    user
  end
end
