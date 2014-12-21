require 'date'
require 'ffaker'


FactoryGirl.define do

  factory :data_import_meeting do
    data_import_session
    conflicting_id            nil
    import_text               { Faker::Lorem.paragraph[0..200] }

    sequence( :code )         { |n| "meeting#(n)" }
    description               { "#{Faker::Name.suffix} #{Faker::Address.city} Meeting" }

    edition                   { ((rand * 100) % 40).to_i }
    season                    { Season.all.sort{ rand - 0.5 }[0] } # Get all Season rows, choose a random one
    header_date               { season.begin_date + (rand * 100).to_i.days }
    header_year               { season.header_year }
    # The following 2 columns use the pre-loaded seed records:
    edition_type_id           { ((rand * 100) % 5).to_i + 1 } # ASSERT: at least 5 edition types (1..5)
    timing_type_id            { ((rand * 100) % 3).to_i + 1 } # ASSERT: at least 3 timing types (1..3)
    user
  end
  #-- -------------------------------------------------------------------------
  #++
end
