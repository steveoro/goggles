require 'ffaker'


FactoryGirl.define do


  trait :random_city do
    name                    { Faker::Address.city }
    zip                     { Faker::AddressFR.postal_code }
    area                    { Faker::AddressUS.state }
    country                 { Faker::Address.country }
    country_code            { Faker::Address.country_code }
  end


  factory :city do
    random_city

    factory :data_import_city do
      data_import_session
      conflicting_id        nil
      import_text           { Faker::Lorem.paragraph[0..100] }
    end
  end
  # ---------------------------------------------------------------------------

end
