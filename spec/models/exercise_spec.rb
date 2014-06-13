require 'spec_helper'


describe Exercise do
  context "[a well formed instance]" do
    subject { Exercise.find_by_id( ((rand * 500) % Exercise.count).to_i + 1 ) }

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

  describe "self.belongs_to_training_step_code()" do
    let(:result) { subject.class.belongs_to_training_step_code(1) }

    it "returns a scoped enumberable of rows" do
      expect( result ).to be_a_kind_of( Enumerable )
      result.each { |row| expect( row ).to be_a_kind_of( Exercise ) }
    end 
  end
  #-- -------------------------------------------------------------------------
  #++
end
