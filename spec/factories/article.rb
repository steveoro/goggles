require 'date'
require 'ffaker'


FactoryGirl.define do

  factory :article do
    sequence( :title )    { |n| "Great dummy article title n.#{n}" }
    body                  { "#{Faker::Lorem.paragraph}\r\n#{Faker::Lorem.paragraph}" }
    is_sticky             { (rand * 100).to_i.even? }
    user
  end
  #-- -------------------------------------------------------------------------
  #++
end
