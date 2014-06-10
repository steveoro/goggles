require 'spec_helper'


describe ExerciseRowDecorator do
  before :each do
    rnd_id = ((rand * 500) % ExerciseRow.count).to_i + 1
    @random_seed_row = ExerciseRow.find_by_id( rnd_id )
    expect( @random_seed_row ).not_to be_nil
    @decorated_instance = ExerciseRowDecorator.decorate( @random_seed_row )
  end

  subject { @decorated_instance }

  context "[implemented methods]" do
    it_behaves_like "(the existance of a method returning non-empty strings)", [ 
      :get_full_name
    ]
    it_behaves_like "(the existance of a method returning numeric values)", [ 
      :compute_total_seconds
    ]
    it_behaves_like "(the existance of a method returning strings)", [ 
      :compute_displayable_distance,
      :get_formatted_pause,
      :get_formatted_start_and_rest,
      :get_base_movement_full,
      :get_base_movement_short,
      :get_execution_note_type_name,
      :get_training_mode_type_name
    ]
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#compute_total_seconds" do
    before :each do
      @inline_fixture = ExerciseRowDecorator.decorate(ExerciseRow.new(
        part_order: 1,
        distance: 100,
        pause: 10
      ))
    end

    it "returns 0 or a positive number" do
      expect( subject.compute_total_seconds ).to be >= 0
    end
    it "returns the total seconds when using start_and_rest" do
      @inline_fixture.start_and_rest = 100
      expect( @inline_fixture.compute_total_seconds ).to be == 100
    end
    it "returns the esteemed seconds when using pause" do
      @inline_fixture.start_and_rest = 0
      expect( @inline_fixture.compute_total_seconds(true) ).to be >= 130
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#compute_displayable_distance" do
    before :each do
      @inline_fixture = ExerciseRowDecorator.decorate(ExerciseRow.new(
        part_order: 1,
        percentage: 50,
        pause: 10
      ))
    end

    it "returns the distance by default" do
      @inline_fixture.distance = 100
      expect( @inline_fixture.compute_displayable_distance ).to eq('100')
    end
    it "returns the percentage of the total distance when using total_distance" do
      @inline_fixture.distance = 0
      expect( @inline_fixture.compute_displayable_distance(300) ).to eq('150')
    end
    it "returns just the percentage when not using total_distance" do
      @inline_fixture.distance = 0
      expect( @inline_fixture.compute_displayable_distance() ).to eq('50%')
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
