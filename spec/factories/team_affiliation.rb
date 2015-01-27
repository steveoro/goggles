require 'date'
require 'ffaker'

require 'common/validation_error_tools'


FactoryGirl.define do

  factory :team_affiliation do
    team
    season
    name                      { team.name }
    random_badge_code
    user

    before(:create) do |built_instance|
      if built_instance.invalid?
        puts "\r\nFactory def. error => " << ValidationErrorTools.recursive_error_for( built_instance )
        puts built_instance.inspect
      end
    end

    factory :team_affiliation_with_badges do
      after(:create) do |created_instance, evaluator|
        create_list(
          :badge,
          ((rand * 10).to_i + 2),                   # total number of results
          team:             created_instance.team,
          team_affiliation: created_instance,
          season:           created_instance.season,
          category_type:    create(:category_type, season: created_instance.season)
        )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end


# Quick NameSpace container for creation-tools regarding this factory.
#
module TeamAffiliationFactoryTools

  # Creates a single TeamAffiliation with the specified number of Badges (and Swimmers)
  # associated with it.
  #
  # (Works essentially as the :team_affiliation_with_badges factory, but it allows
  #  to specify both the Team instance and the number of Swimmer/Badges created.)
  #
  def self.create_affiliation_with_badge_list( team, swimmer_count = 5 )
    affiliation = FactoryGirl.create( :team_affiliation, team: team )
    FactoryGirl.create_list(
      :badge,
      swimmer_count,
      team:             team,
      team_affiliation: affiliation,
      season:           affiliation.season,
      category_type:    FactoryGirl.create(:category_type, season: affiliation.season)
    )
    affiliation
  end
end
#-- ---------------------------------------------------------------------------
#++
