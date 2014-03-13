require 'date'


FactoryGirl.define do

  factory :user do
    sequence( :name )         { |n| "FullName#{n}" }
    sequence( :email )        { |n| "full.name#{n}@fasar.org" }
    sequence( :description )  { |n| "Typical registered user n.#{n}" }
    password                  "password"
    password_confirmation     "password"
    confirmed_at              { DateTime.now }
    created_at                { DateTime.now }
    updated_at                { DateTime.now }
    swimmer_level_type_id     { ((rand * 100) % 15).to_i } # ASSERT: there exists at least 14 rows for this entity in test DB

    factory :admin do
      # Admin obj will have only these changed attributes:
      sequence( :name )         { |n| "NewAdmin#{n}" }
      sequence( :email )        { |n| "new.admin#{n}@fasar.org" }
      sequence( :description )  { |n| "Typical new admin n.#{n}" }
    end
  end
  # ---------------------------------------------------------------------------

end
