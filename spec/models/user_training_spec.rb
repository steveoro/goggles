require 'spec_helper'


describe UserTraining do
  context "[a well formed instance]" do
    subject { create(:user_training_with_rows) }

    it_behaves_like "TrainingSharable"

    it "is a valid istance" do
      expect( subject ).to be_valid
    end

    context "[implemented methods]" do
      it_behaves_like( "(the existance of a method)",
        [
          :get_full_name, 
          :get_verbose_name,
          :get_user_name,
          :get_swimmer_level_type,
          :compute_total_distance,
          :compute_total_seconds,
          :build_group_list_hash
        ]
      )
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
