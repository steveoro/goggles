require 'date'
require 'ffaker'


FactoryGirl.define do

  factory :user_achievement do
    user
    # The following column uses the pre-loaded seed records:
    achievement_id     { ((rand * 100) % 12).to_i + 1 }  # ASSERT: at least 12 Achievement rows defined in seed
  end
  # ---------------------------------------------------------------------------

end
