require 'spec_helper'


describe UserTrainingStory do
  context "[a well formed instance]" do
    subject { create(:user_training_story) }

    it_behaves_like "TrainingSharable"

    it "is a valid istance" do
      expect( subject ).to be_valid
    end

    context "[implemented instance methods]" do
      it_behaves_like( "(the existance of a method)",
        [
          :get_user_name, 
          :get_user_training_name,
          :get_user_training_compute_total_distance,
          :get_user_training_compute_total_seconds,
          :get_swimmer_level_type,
          :get_user_swimmer_level_type
        ]
      )
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
