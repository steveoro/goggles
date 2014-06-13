require 'spec_helper'


describe TrainingDecorator do
  before :each do
    @random_seed_row = Training.find_by_id( ((rand * 10) % Training.count).to_i + 1 )
    @decorated_instance = TrainingDecorator.decorate( @random_seed_row )
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
#    it_behaves_like "(the existance of a method returning numeric values)", [ 
#      :compute_total_distance,
#      :compute_total_seconds
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
