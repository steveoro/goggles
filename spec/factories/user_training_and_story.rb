require 'date'


FactoryGirl.define do

  # TODO define factory for exercise?

  # TODO define factory for training_row?

  # TODO define factory for training?

  # TODO define factory for user_training_row

  factory :user_training do
    description "Full Anaerobic workout"
    user

    # TODO nest define factory for user_training_with_rows
  end

  factory :user_training_story do
    swam_date { Date.today } 
    total_training_time 65
    notes  "Dude, that was hard!"
    user
    user_training
    swimming_pool
    swimmer_level_type
  end
  # ---------------------------------------------------------------------------

end
