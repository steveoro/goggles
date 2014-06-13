require 'spec_helper'


describe ExerciseRow do
  context "[a well formed instance]" do
    subject { ExerciseRow.find_by_id( ((rand * 500) % ExerciseRow.count).to_i + 1 ) }

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
          :get_label_symbol,
          :esteem_time_in_seconds
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

  describe "self.esteem_time_in_seconds()" do
    let(:result) { subject.class.esteem_time_in_seconds( (rand * 1000 % 50).to_i * 50 ) }

    it "returns an integer number of seconds" do
      expect( result ).to be_a_kind_of( Integer )
    end 
    it "returns a zero or a positive number of seconds" do
      expect( result ).to be >= 0
    end 
  end
  #-- -------------------------------------------------------------------------
  #++
end
