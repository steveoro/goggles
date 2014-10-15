require 'date'
require 'ffaker'


FactoryGirl.define do

  factory :federation_type do
    sequence( :code )         { |n| "F#{n}" }
    description               { "Fake #{ Faker::Lorem.word.camelcase } Swimming Federation" }
    short_name                { "FSF#{code}" }
  end
  #-- -------------------------------------------------------------------------
  #++
end
