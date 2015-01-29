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
      season do
        # 1) Extract pre-built fixtures that already have categories:
        season_ids_with_categories = Season.joins(:category_types)
          .select('seasons.id')
          .group('seasons.id')
          .having( 'count(category_types.season_id) > 0' )
        # 2) Choose a random season among the above list of IDs:
        Season.where( id: season_ids_with_categories ).sort{ rand() - 0.5 }[0]
      end

      after(:create) do |created_instance, evaluator|
        create_list(
          :badge,
          ((rand * 10).to_i + 2),                   # total number of results
          team:             created_instance.team,
          team_affiliation: created_instance,
          season:           created_instance.season,
          # Force a random category type among the ones available for the
          # pre-built & selected season:
          category_type:    created_instance.season.category_types.sort{ rand() - 0.5 }[0]
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
    # 1) Extract pre-built fixtures that already have categories:
    season_ids_with_categories = Season.joins(:category_types)
      .select('seasons.id')
      .group('seasons.id')
      .having( 'count(category_types.season_id) > 0' )
    # 2) Choose a random season among the above list of IDs:
    rand_season = Season.where( id: season_ids_with_categories ).sort{ rand() - 0.5 }[0]

    affiliation = FactoryGirl.create(
      :team_affiliation,
      team:   team,
      season: rand_season
    )
    FactoryGirl.create_list(
      :badge,
      swimmer_count,
      team:             team,
      team_affiliation: affiliation,
      season:           rand_season,
      # Force a random category type among the ones available for the
      # pre-built & selected season:
      category_type:    rand_season.category_types.sort{ rand() - 0.5 }[0]
    )
    affiliation
  end
end
#-- ---------------------------------------------------------------------------
#++
