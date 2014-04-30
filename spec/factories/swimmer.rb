require 'date'
require 'ffaker'


FactoryGirl.define do

  factory :swimmer do
    first_name                { Faker::Name.first_name }
    last_name                 { Faker::Name.last_name }
    gender_type_id            { (rand * 100).to_i.even? ? GenderType::FEMALE_ID : GenderType::MALE_ID }
    year_of_birth             { Date.today.year - 18 - ((rand * 100) % 60).to_i }

    complete_name             { "#{last_name} #{first_name}" } 
    phone_mobile              { Faker::PhoneNumber.phone_number }
    phone_number              { Faker::PhoneNumber.phone_number }
    e_mail                    { Faker::Internet.email }
    nickname                  { Faker::Internet.user_name  }

#    badge # TODO
  end
  # ---------------------------------------------------------------------------

end
