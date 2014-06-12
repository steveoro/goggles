require 'spec_helper'


describe TrainingDecorator do
  before :each do
    rnd_id = ((rand * 10) % Training.count).to_i + 1
    @random_seed_row = Training.find_by_id( rnd_id )
    @decorated_instance = TrainingDecorator.decorate( @random_seed_row )
  end

  subject { @decorated_instance }

  it "has a not nil source row" do
    expect( @random_seed_row ).not_to be_nil
  end
  it "has a valid source row" do
    expect( @random_seed_row ).to be_valid
  end



  # context "[implemented methods]" do
    # it_behaves_like "(the existance of a method returning a non-empty Hash)", [ 
      # :drop_down_attrs
    # ]
    # it_behaves_like "(the existance of a method returning non-empty strings)", [ 
      # :get_full_name
    # ]
    # it_behaves_like "(the existance of a method returning a boolean value)", [
      # :is_arm_aux_allowed,
      # :is_kick_aux_allowed,
      # :is_body_aux_allowed,
      # :is_breath_aux_allowed
    # ]
    # it_behaves_like "(the existance of a method returning numeric values)", [ 
      # :compute_total_distance,
      # :compute_total_seconds
    # ]
  # end
  #-- -------------------------------------------------------------------------
  #++

  # describe "#drop_down_attrs" do
    # xit "returns an Hash with the expected keys" do
      # result = subject.drop_down_attrs()
      # expect( result.keys ).to include(
        # :label, :value, :tot_distance, :tot_secs, :is_arm_aux_allowed,
        # :is_kick_aux_allowed, :is_body_aux_allowed, :is_breath_aux_allowed
      # )
    # end
  # end
  #-- -------------------------------------------------------------------------
  #++
end
