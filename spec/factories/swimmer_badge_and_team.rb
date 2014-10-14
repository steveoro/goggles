require 'date'
require 'ffaker'


FactoryGirl.define do

  trait :random_badge_code do
    number                    { 8.times.collect{ |i| (rand * 10).to_i }.join }
  end

  trait :fake_phone_numbers do
    phone_mobile              { Faker::PhoneNumber.phone_number }
    phone_number              { Faker::PhoneNumber.phone_number }
  end
  # ---------------------------------------------------------------------------


  factory :data_import_swimmer do
    data_import_session
    conflicting_id        nil
    first_name                { Faker::Name.first_name }
    last_name                 { Faker::Name.last_name }
    gender_type_id            { (rand * 100).to_i.even? ? GenderType::FEMALE_ID : GenderType::MALE_ID }
    year_of_birth             { 18.year.ago.year - ((rand * 100) % 60).to_i } # was Date.today.year -
    complete_name             { "#{last_name} #{first_name}" }
    import_text               { "#{year_of_birth} #{complete_name}" }
  end


  factory :swimmer do
    first_name                { Faker::Name.first_name }
    last_name                 { Faker::Name.last_name }
    gender_type_id            { (rand * 100).to_i.even? ? GenderType::FEMALE_ID : GenderType::MALE_ID }
    year_of_birth             { 18.year.ago.year - ((rand * 100) % 60).to_i } # was Date.today.year -
    complete_name             { "#{last_name} #{first_name}" }
    fake_phone_numbers
    e_mail                    { Faker::Internet.email }
    nickname                  { Faker::Internet.user_name  }

    factory :swimmer_with_results do
      after(:create) do |created_instance, evaluator|
        meeting_individual_result = create_list(
          :meeting_individual_result_with_passages,
          ((rand * 10).to_i + 2),                   # total number of results
          swimmer: created_instance                 # association enforce for each sub-row
        )
      end
    end
  end
  # ---------------------------------------------------------------------------


  factory :data_import_team do
    data_import_session
    city
    name                      { "#{city.name} Swimming Club ASD" }
    import_text               { name }
    data_import_city          nil
    badge_number              nil
    user
  end


  factory :team do
    city
    name                      { "#{city.name} Swimming Club ASD" }
    editable_name             { name }
    address                   { Faker::Address.street_address }
    fake_phone_numbers
    e_mail                    { Faker::Internet.email }
    user
  end
  # ---------------------------------------------------------------------------


  trait :badge_common_fields do
    random_badge_code
    team
    swimmer
    entry_time_type           { EntryTimeType.all.sort{ rand - 0.5 }[0] }
    user
  end


  factory :data_import_badge do
    data_import_session
    badge_common_fields
    season
    category_type             { create(:category_type, season: season) }
    import_text               { number }
  end


  factory :badge do
    badge_common_fields
    team_affiliation          { create(:team_affiliation, team: team) }
    season                    { team_affiliation.season }
    category_type             { create(:category_type, season: season) }
  end


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
  # ---------------------------------------------------------------------------
end
