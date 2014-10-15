require 'date'
require 'ffaker'


FactoryGirl.define do

  factory :computed_season_ranking do
    season
    team
    rank                      { (((rand * 10) % 3).to_i + 1) }
    total_points              { ((rand * 5000).to_i + 1) }
  end
  #-- -------------------------------------------------------------------------
  #++
end
