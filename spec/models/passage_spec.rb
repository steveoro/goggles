require 'spec_helper'


describe Passage do
  it_behaves_like "SwimmerRelatable"
  it_behaves_like "TimingGettable"
  # ---------------------------------------------------------------------------
  
  context "[a well formed instance]" do
    #subject { Passage.find_by_id( ((rand * Passage.count) % Passage.count).to_i + 1 ) }
    subject { create( :passage ) }

    xit "is a not nil" do                            # (we check for nil to make sure the seed exists in the DB)
      expect( subject ).not_to be_nil
    end
    it "is a valid istance" do
      expect( subject ).to be_valid
    end

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
          :compute_distance_swam,
          :get_passages_count
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
        :compute_passage_time
      ].each do |method_name|
        describe "##{method_name}" do
          it "returns a timing istance" do
            expect( subject.send(method_name) ).to be_an_instance_of( Timing )
          end
        end
      end
    end
      
    context "[passage list]" do
      it "return a list of passages for the given result" do
        subject.get_passages_list.each do |element| 
          expect( element ).to be_an_instance_of( Passage )
        end
      end
      
      it "the returned list of passages is sorted" do
        current_item_distance = subject.get_passages_list.first.passage_type.length_in_meters
        subject.get_passages_list.each do |item|
          expect(item.passage_type.length_in_meters).to be <= current_item_distance
          current_item_distance = item.passage_type.length_in_meters 
        end      
      end
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
  
end
