require 'date'


FactoryGirl.define do

  factory :user do
    name "Gino Pino"
    email "gino.pino@rino.com"
    description  "Typical registered user"
    password "password"
    password_confirmation "password"
    confirmed_at { DateTime.now }
  end

  factory :admin do
    name "Admina Strator"
    email "admina.strator@whatever.com"
    description  "A new Admin"
    password "password"
    password_confirmation "password"
    confirmed_at { DateTime.now }
  end
  # ---------------------------------------------------------------------------

end
