require 'spec_helper'


describe UserTrainingDecorator do
  before :each do
    @random_seed_row = UserTraining.find_by_id( ((rand * 10) % UserTraining.count).to_i + 1 )
    @decorated_instance = UserTrainingDecorator.decorate( @random_seed_row )
  end

  subject { @decorated_instance }

  it "has a not nil source row" do
    expect( @random_seed_row ).not_to be_nil
  end
  it "has a valid source row" do
    expect( @random_seed_row ).to be_valid
  end


  context "[implemented methods]" do
    it_behaves_like( "(the existance of a method returning strings)",
      [
        :get_swimmer_level_type
      ]
    )
    it_behaves_like( "(the existance of a method)",
      [ 
        :build_group_list_hash
      ]
    )
  end
  #-- -----------------------------------------------------------------------
  #++

  describe "#build_group_list_hash" do
    it "returns an Hash" do
      expect( subject.build_group_list_hash() ).to be_an_instance_of( Hash )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
