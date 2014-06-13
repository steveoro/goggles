require 'spec_helper'


describe Training do
  context "[a well formed instance]" do
    subject { Training.find_by_id( ((rand * 10) % Training.count).to_i + 1 ) }

    it "is a not nil" do
      expect( subject ).not_to be_nil
    end
    it "is a valid istance" do
      expect( subject ).to be_valid
    end


    context "[implemented methods]" do
      it_behaves_like( "(the existance of a method returning strings)",
        [
          :get_user_name
        ]
      )
      it_behaves_like( "(the existance of a method returning non-empty strings)",
        [
          :get_full_name, 
          :get_verbose_name,
          :get_swimmer_level_type
        ]
      )
      it_behaves_like( "(the existance of a method)",
        [ 
          :build_group_list_hash
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

  describe "#build_group_list_hash" do
    it "returns an Hash" do
      expect( subject.build_group_list_hash() ).to be_an_instance_of( Hash )
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
