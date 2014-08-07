require 'spec_helper'


describe Passage, :type => :model do
  it_behaves_like "SwimmerRelatable"
  it_behaves_like "TimingGettable"
  #-- -------------------------------------------------------------------------
  #++

  context "[a well formed instance]" do
    #subject { Passage.find_by_id( ((rand * Passage.count) % Passage.count).to_i + 1 ) }
    #subject { create( :passage ) }
    subject { create( :meeting_individual_result_with_passages ).passages.first }

    it "is a not nil" do                            # (we check for nil to make sure the seed exists in the DB)
      expect( subject ).not_to be_nil
    end
    it "is a valid istance" do
      expect( subject ).to be_valid
    end

    # Required values
    # minutes, second, hundreds too, but already included in TimingGettable
    it_behaves_like( "(missing required values)", [
      :minutes_from_start,
      :hundreds_from_start,
      :seconds_from_start
    ])

    # Validated relations:
    it_behaves_like( "(belongs_to required models)", [
      :meeting_program,
      :passage_type,
      :team
    ])

    # Filtering scopes:
    it_behaves_like( "(the existance of a class method)", [
      :sort_by_distance,
    ])

    context "[implemented methods]" do
      it_behaves_like( "(the existance of a method returning strings)",
        [
          :get_short_name,
          :get_full_name,
          :get_verbose_name,
          :get_final_time,
          :get_user_name
        ]
      )
      it_behaves_like( "(the existance of a method returning numeric values)",
        [
          :get_passage_distance,
          :compute_distance_swam
        ]
      )
      it_behaves_like( "(the existance of a method returning a boolean value)",
        [
          :is_passage_total_correct
        ]
      )

      # Methods that return timimg istancies
      [
        :compute_final_time,
        :compute_incremental_time,
      ].each do |method_name|
        describe "##{method_name}" do
          it "returns a timing istance" do
            expect( subject.send(method_name) ).to be_an_instance_of( Timing )
          end
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++


    describe "#get_passages" do
      it "returns a collection responding to :each" do
        expect( subject.get_passages ).to respond_to(:each)
      end
      it "returns a list of passages for the given result" do
        subject.get_passages.each do |element|
          expect( element ).to be_an_instance_of( Passage )
        end
      end
      it "returns a non-empty list of passages when passages are found" do
        mir = create( :meeting_individual_result_with_passages )
        fixture = mir.passages.first                # Get the first passage from the linked set
        expect( fixture.get_passages.count ).to be > 0
      end
      it "returns a list of sorted passages" do
        mir = create( :meeting_individual_result_with_passages )
        fixture = mir.passages.first                # Get the first passage from the linked set
        current_item_distance = 0
        fixture.get_passages.each do |item|
          expect(item.passage_type.length_in_meters).to be >= current_item_distance  # >= because the factory can create passages having same distance
          current_item_distance = item.passage_type.length_in_meters
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++


    describe "#compute_final_time" do
      context "within a sequence of passages," do
        before(:each) do
          # TODO define a list of passages linked together
          # TODO compute the expected total
          # FIXME this can be used for both #compute_final_time & #compute_incremental_time
        end
        it "returns a Timing instance"
        it "returns a result which is equal to the sum of each passage time"
      end
    end
    #-- -----------------------------------------------------------------------
    #++


    describe "#compute_incremental_time" do
      context "within a sequence of passages," do
        before(:each) do
          # TODO define a list of passages linked together
          # TODO compute the expected total
          # FIXME this can be used for both #compute_final_time & #compute_incremental_time
        end
        it "returns a Timing instance"
        it "returns a result which is equal to the sum of each passage time"
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
