require 'spec_helper'


describe TrainingRow do
  context "[a well formed instance]" do
    subject { TrainingRow.find_by_id( ((rand * 100) % TrainingRow.count).to_i + 1 ) }

    it "is a not nil" do
      expect( subject ).not_to be_nil
    end
    it "is a valid istance" do
      expect( subject ).to be_valid
    end


    context "[implemented methods]" do
      it_behaves_like( "(the existance of a class method)",
        [
# FIXME where it is used?
          :get_label_symbol,
# TODO CHECK better:
          :compute_total_seconds
        ]
      )

      it_behaves_like( "(the existance of a method)",
        [
          :get_full_name,
# TODO CHECK better:
          :to_array,
          :get_formatted_pause,
          :get_formatted_start_and_rest,
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
      it_behaves_like( "(the existance of a method returning numeric values)",
        [ 
          :compute_distance,
          :compute_total_seconds
        ]
      )
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
