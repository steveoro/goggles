require 'date'
require 'ffaker'


FactoryGirl.define do

  factory :user_training_row do
    user_training
    # The following columns use the pre-loaded seed records:
    exercise_id               { ((rand * 1000) % 196).to_i + 1 }
    training_step_type_id     { ((rand * 10) % 5).to_i + 1 }
    arm_aux_type_id           { ((rand * 10) % 4).to_i + 1 }
    kick_aux_type_id          { ((rand * 10) % 6).to_i + 1 }
    body_aux_type_id          { ((rand * 10) % 6).to_i + 1 }
    breath_aux_type_id        { ((rand * 10) % 2).to_i + 1 }

    group_id                  { ((rand * 10) % 4).to_i + 1 }
    group_times               { ((rand * 10) % 5).to_i + 1 }
    group_start_and_rest      0
    group_pause               { (((rand * 10) % 5).to_i + 1) * 5 }
    sequence( :part_order )
    times                     { ((rand * 10) % 8).to_i + 1 }
    distance                  { (((rand * 10) % 4).to_i + 1) * 50 }
    start_and_rest            { (((rand * 10) % 5).to_i + 1) * 5 }
    pause                     { (((rand * 10) % 5).to_i + 1) * 5 }
  end


  factory :user_training do
    sequence( :description )  { |n| "#{ Faker::Lorem.word } workout n.#{n}" }
    user
    # user_training_with_rows will create detail data after the user_training has been created
    factory :user_training_with_rows do
      # the after(:create) yields two values: the row instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the association is set properly to the created instance:
      after(:create) do |created_instance, evaluator|
        create_list(
          :user_training_row,
          ((rand * 10).to_i + 2),                   # total number or detail rows
          user_training: created_instance           # association enforce for each sub-row
        )
      end
    end
  end


  factory :user_training_story do
    swam_date                 { Date.today } 
    total_training_time       65
    notes                     { "Dude, that was hard!\r\n#{ Faker::Lorem.paragraph }" }
    user
    user_training
    swimming_pool
    swimmer_level_type_id     { ((rand * 100) % 15).to_i }
  end
  # ---------------------------------------------------------------------------

end
