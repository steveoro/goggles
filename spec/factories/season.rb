require 'date'
require 'ffaker'


FactoryGirl.define do

  trait :random_season do
    sequence( :edition )
    sequence( :description )  { |n| "Fake Season #{n}/#{edition}" }
    edition_type              { EditionType.all.sort{ rand - 0.5 }[0] }
    begin_date                { Date.parse("#{ 2000 + ((rand * 100) % 15).to_i }-09-01") }
    end_date                  { Date.parse("#{ begin_date.year + 1 }-08-30") }
    header_year               { "#{begin_date.year}/#{end_date.year}" }
    season_type               { SeasonType.all.sort{ rand - 0.5 }[0] }
    timing_type               { TimingType.all.sort{ rand - 0.5 }[0] }
  end
  #-- -------------------------------------------------------------------------
  #++


  factory :season do
    random_season
  end
  #-- -------------------------------------------------------------------------
  #++
end
