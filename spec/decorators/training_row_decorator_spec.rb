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


#  context "[implemented methods]" do
#    it_behaves_like "(the existance of a method)", [ 
#      :build_group_list_hash
#    ]
#  end
  #-- -------------------------------------------------------------------------
  #++

#  describe "#build_group_list_hash" do
#    it "returns an Hash" do
#      expect( subject.build_group_list_hash() ).to be_an_instance_of( Hash )
#    end
#  end
  #-- -------------------------------------------------------------------------
  #++
end
