# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :meeting_entry do
    meeting_program
    badge
    team              { badge.team }
    team_affiliation  { badge.team_affiliation }
    swimmer           { badge.swimmer }
  end
end
