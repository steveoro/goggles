require 'date'


FactoryGirl.define do

  factory :user_training do
    description  "Full Anaerobic workout"
    user
  end

  # TODO define factory for user_training_row (at least 2 o 3)

  factory :user_training_story do
    swam_date { Date.today } 
    total_training_time 65
    notes  "Dude, that was hard!"
    user_training
    swimming_pool
    swimmer_level_type
  end
  # ---------------------------------------------------------------------------

end
