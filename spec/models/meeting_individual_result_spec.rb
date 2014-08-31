require 'spec_helper'


describe MeetingIndividualResult, :type => :model do
  it_behaves_like "SwimmerRelatable"
  it_behaves_like "TimingGettable"
  #-- -------------------------------------------------------------------------
  #++

  context "[a well formed instance]" do
    subject { create(:meeting_individual_result) }
  
    it "is a valid istance" do
      expect( subject ).to be_valid
    end
    # Validated relations:
    it_behaves_like( "(belongs_to required models)", [
      :meeting_program,
      :team,
      :team_affiliation,
      :badge,
      :disqualification_code_type
    ])
    # Filtering scopes:
    it_behaves_like( "(the existance of a class method)", [
      :is_valid,
      :is_male,
      :is_female,
      :has_rank,
      :for_event_by_pool_type,
      :for_pool_type,
      :sort_by_pool_and_event
    ])

    context "[general methods]" do
      it_behaves_like( "(the existance of a method returning non-empty strings)", [ 
        :get_full_name,
        :get_verbose_name
      ])
    end

    context "[methods used for selecting records]" do
      it_behaves_like( "(the existance of a method with parameters, returning boolean values)",
        [ 
          :has_pool_type_code?,
          :has_event_type_code?,
          :has_category_type_code?,
          :has_gender_type_code?,
          :has_federation_type_code?
        ],
        'fakecode'
      )
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
        fixture = create( :meeting_individual_result_with_passages )
        expect( fixture.get_passages.count ).to be > 0
      end
      it "returns a list of sorted passages" do
        fixture = create( :meeting_individual_result_with_passages )
        current_item_distance = 0
        fixture.get_passages.each do |item|
          expect(item.passage_type.length_in_meters).to be >= current_item_distance  # >= because the factory can create passages having same distance
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
