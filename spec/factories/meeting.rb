require 'date'
require 'ffaker'

require 'common/validation_error_tools'


FactoryGirl.define do

  factory :meeting do
    sequence( :code )         { |n| "meeting#(n)" }
    description               { "#{FFaker::Name.suffix} #{FFaker::Address.city} Meeting" }
    edition                   { ((rand * 100) % 40).to_i }
    season #                    { Season.all.sort{ rand - 0.5 }[0] } # Get all Season rows, choose a random one
    header_date               { season.begin_date + (rand * 100).to_i.days }
    header_year               { season.header_year }
    # The following 2 columns use the pre-loaded seed records:
    edition_type_id           { ((rand * 100) % 5).to_i + 1 } # ASSERT: at least 5 edition types (1..5)
    timing_type_id            { ((rand * 100) % 3).to_i + 1 } # ASSERT: at least 3 timing types (1..3)
    user

    before(:create) do |built_instance|
      if built_instance.invalid?
        puts "\r\nFactory def. error => " << ValidationErrorTools.recursive_error_for( built_instance )
        puts built_instance.inspect
      end
    end

    factory :meeting_with_sessions do
      after(:create) do |created_instance, evaluator|
        create_list(
          :meeting_session,
          ((rand * 10) % 2).to_i + 1,
          meeting: created_instance            # association enforce for each sub-row
        )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
