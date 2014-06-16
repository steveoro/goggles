require 'spec_helper'


describe TrainingRowDecorator do
  before :each do
    @random_seed_row = TrainingRow.find_by_id( ((rand * 100) % TrainingRow.count).to_i + 1 )
    @decorated_instance = TrainingRowDecorator.decorate( @random_seed_row )
  end

  subject { @decorated_instance }

  it "has a not nil source row" do
    expect( @random_seed_row ).not_to be_nil
  end
  it "has a valid source row" do
    expect( @random_seed_row ).to be_valid
  end


  context "[implemented methods]" do
    it_behaves_like( "(the existance of a class method)",
      [
# FIXME where it is used?
        :get_label_symbol
      ]
    )

    it_behaves_like( "(the existance of a method)",
      [
        :get_full_name,
# TODO REMOVE THIS:
        :to_array
      ]
    )
    it_behaves_like( "(the existance of a method returning strings)",
      [ 
        :get_formatted_pause,
        :get_formatted_start_and_rest,
        :get_formatted_part_order,
        :get_formatted_total_seconds,
        :get_formatted_distance,
        :get_row_description,

        :get_training_group_text,
        :get_formatted_group_pause,
        :get_formatted_group_start_and_rest,
        :get_training_step_type_short,
        :get_exercise_full,
        :get_arm_aux_type_name,
        :get_kick_aux_type_name,
        :get_body_aux_type_name,
        :get_breath_aux_type_name
      ]
    )
  end
  #-- -----------------------------------------------------------------------
  #++
end
