require 'date'
require 'ffaker'


FactoryGirl.define do

  factory :swimming_pool_review do
    sequence( :title )    { |n| "Something happened n.#{n}" }
    entry_text            { "#{Faker::Lorem.paragraph}\r\n#{Faker::Lorem.paragraph}" }
    user
    swimming_pool
  end
  # ---------------------------------------------------------------------------

end
