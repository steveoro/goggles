require 'ffaker'


FactoryGirl.define do

  factory :city do
    name              { Faker::Address.city }
    zip               { Faker::AddressFR.postal_code }
    area              { Faker::AddressUS.state }
    country           { Faker::Address.country }
    country_code      { Faker::Address.country_code }
  end
  # ---------------------------------------------------------------------------

end
