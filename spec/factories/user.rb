require 'date'
require 'ffaker'


FactoryGirl.define do

  factory :user do
    name                      { Faker::Internet.user_name }
    email                     { Faker::Internet.email }
    sequence( :description )  { |n| "Randomly-generated registered user n.#{n}" }

    password                  "password"
    password_confirmation     "password"
    confirmed_at              { DateTime.now }
    created_at                { DateTime.now }
    updated_at                { DateTime.now }
    swimmer_level_type_id     { ((rand * 100) % 15).to_i } # ASSERT: there exists at least 14 rows for this entity in test DB

    factory :admin do
      # Admin obj will have only these changed attributes:
      sequence( :description )  { |n| "Randomly-generated admin n.#{n}" }
    end
  end
  # ---------------------------------------------------------------------------

end
