require 'spec_helper'


describe Exercise, :type => :model do
  context "[a well formed instance]" do
    subject { Exercise.find_by_id( ((rand * 500) % Exercise.count).to_i + 1 ) }

    it_behaves_like "DropDownListable"

    it "is a not nil" do
      expect( subject ).not_to be_nil
    end
    it "is a valid istance" do
      expect( subject ).to be_valid
    end


    context "[implemented methods]" do
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
      it_behaves_like( "(the existance of a method returning a boolean value)",
        [
          :is_arm_aux_allowed,
          :is_kick_aux_allowed,
          :is_body_aux_allowed,
          :is_breath_aux_allowed
        ]
      )
      it_behaves_like( "(the existance of a method returning numeric values)",
        [ 
          :compute_total_distance,
          :compute_total_seconds
        ]
      )
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "self.belongs_to_training_step_code()" do
    let(:result) { subject.class.belongs_to_training_step_code(1) }

    it "returns a scoped enumberable of rows" do
      expect( result ).to be_a_kind_of( Enumerable )
      result.each { |row| expect( row ).to be_a_kind_of( Exercise ) }
    end 
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#compute_total_distance" do
    it "returns 0 or a positive number" do
      expect( subject.compute_total_distance ).to be >= 0
    end
  end

  describe "#compute_total_seconds" do
    it "returns 0 or a positive number" do
      expect( subject.compute_total_seconds ).to be >= 0
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
