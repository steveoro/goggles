require 'date'


FactoryGirl.define do

  # Use this progressive counter with:
  # generate :counter
  # 
  sequence :counter do |n|
    n
  end


  factory :user do
    name { "Mario Brothers N.#{ generate :counter }" }
    email { "mario.brothers.#{ generate :counter }@fasar.org" }
    description  "Typical registered user"
    password "password"
    password_confirmation "password"
    confirmed_at { DateTime.now }
  end


  factory :admin do
    name { "Admina Strator N.#{ generate :counter }" }
    email { "admina.strator.#{ generate :counter }@fasar.org" }
    description  "A new Admin"
    password "password"
    password_confirmation "password"
    confirmed_at { DateTime.now }
  end
  # ---------------------------------------------------------------------------

end
