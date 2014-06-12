require 'spec_helper'


describe ExerciseRow do
  context "[a well formed instance]" do
    before :each do
      rnd_id = ((rand * 500) % ExerciseRow.count).to_i + 1
      @random_seed_row = ExerciseRow.find_by_id( rnd_id )
    end

    subject { @random_seed_row }

    it_behaves_like "DropDownListable"

    it "is a not nil" do
      expect( subject ).not_to be_nil
    end
    it "is a valid istance" do
      expect( subject ).to be_valid
    end


    context "[general methods]" do
      it_behaves_like( "(the existance of a class method)",
        [
          :belongs_to_training_step_code,
          :get_label_symbol
        ]
      )
      it_behaves_like( "(the existance of a method)",
        [
          :get_full_name
        ]
      )
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
