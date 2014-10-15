require 'date'
require 'ffaker'


FactoryGirl.define do

  trait :common_swimmer_fields do
    first_name                { Faker::Name.first_name }
    last_name                 { Faker::Name.last_name }
    gender_type_id            { (rand * 100).to_i.even? ? GenderType::FEMALE_ID : GenderType::MALE_ID }
    year_of_birth             { 18.year.ago.year - ((rand * 100) % 60).to_i } # was Date.today.year -
    complete_name             { "#{last_name} #{first_name}" }
    user
  end
  #-- -------------------------------------------------------------------------
  #++


  factory :data_import_swimmer do
    data_import_session
    conflicting_id        nil
    common_swimmer_fields
    import_text               { "#{year_of_birth} #{complete_name}" }
  end


  factory :swimmer do
    common_swimmer_fields
    fake_phone_numbers
    e_mail                    { Faker::Internet.email }
    nickname                  { Faker::Internet.user_name  }
    associated_user_id        nil

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
  #-- -------------------------------------------------------------------------
  #++
end
