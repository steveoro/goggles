require 'date'
require 'ffaker'

require 'common/validation_error_tools'


FactoryGirl.define do

  trait :random_season do
    edition                   { ((rand * 1000) % 1000).to_i } # mediumint(9), using a sequence yields validation errors
    sequence( :description )  { |n| "Fake Season #{n}/#{edition}" }

    season_type               { SeasonType.all.sort{ rand - 0.5 }[0] }
    edition_type              { EditionType.all.sort{ rand - 0.5 }[0] }
    timing_type               { TimingType.all.sort{ rand - 0.5 }[0] }

    begin_date                { Date.parse("#{ 2000 + ((rand * 100) % 15).to_i }-09-01") }
    end_date                  { Date.parse("#{ begin_date.year + 1 }-08-30") }
    header_year               { "#{begin_date.year}/#{end_date.year}" }
  end
  #-- -------------------------------------------------------------------------
  #++


  factory :season do
    random_season

    before(:create) do |built_instance|
      if built_instance.invalid?
        puts "\r\nFactory def. error => " << ValidationErrorTools.recursive_error_for( built_instance )
        puts built_instance.inspect
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
