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

  factory :swimmer do
    first_name                { Faker::Name.first_name }
    last_name                 { Faker::Name.last_name }
    gender_type_id            { (rand * 100).to_i.even? ? GenderType::FEMALE_ID : GenderType::MALE_ID }
    year_of_birth             { 18.year.ago.year - ((rand * 100) % 60).to_i } # was Date.today.year - 
    complete_name             { "#{last_name} #{first_name}" }
    fake_phone_numbers 
    e_mail                    { Faker::Internet.email }
    nickname                  { Faker::Internet.user_name  }
  end
  # ---------------------------------------------------------------------------

  factory :team do
    name                      { "#{city.name} swimming club ASD" }
    editable_name             { name }
    address                   { Faker::Address.street_address }
    fake_phone_numbers 
    e_mail                    { Faker::Internet.email }   
    city
    user
  end

  factory :badge do
    random_badge_code
    team
    swimmer
    season_id                 { team_affiliation.season_id }
    team_affiliation
    entry_time_type_id        { ((rand * 10) % 5).to_i + 1} # ASSERT: at least 5 entry time types
    category_type_id          { swimmer.get_category_type_for_season( season_id ).id }
    user
  end

  factory :team_affiliation do
    name                      { team.name }
    random_badge_code
    team
    season_id                 132  # FIXME Randomize season
    user
  end

end
