require 'date'
require 'ffaker'


FactoryGirl.define do

  trait :fake_phone_numbers do
    phone_mobile              { Faker::PhoneNumber.phone_number }
    phone_number              { Faker::PhoneNumber.phone_number }
  end
  #-- -------------------------------------------------------------------------
  #++


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
  #-- -------------------------------------------------------------------------
  #++
end
