require 'spec_helper'


describe Swimmer, :type => :model do
  it_behaves_like "DropDownListable"

  describe "[a non-valid instance]" do
    it_behaves_like( "(missing required values)", [
      :complete_name, :year_of_birth
    ])
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "[a well formed instance]" do
    subject { create( :swimmer ) }

    it "is a valid istance" do
      expect( subject ).to be_valid
    end
    # Validated (owned foreign-key) relations:
    it_behaves_like( "(belongs_to required models)",
      [
        :user,
        :gender_type
      ]
    )
    # Test the existance of all the required has_many / has_one relationships:
    it_behaves_like( "(the existance of a method returning a collection of some kind of instances)",
      [
        :user_swimmer_confirmations,
        :badges,
        :teams,
        :category_types,
        :goggle_cups,
        :season_types,
        :meeting_individual_results,
        :meeting_relay_swimmers,
        :meeting_relay_results,
        :meeting_sessions,
        :meetings,
        :user_results
      ],
      ActiveRecord::Base
    )

    context "[general methods]" do
      it_behaves_like( "(the existance of a method returning non-empty strings)",
        [
          :complete_name,
          :get_full_name,
          :get_full_name_with_nickname,
          :get_verbose_name
        ]
      )
      it_behaves_like( "(the existance of a method returning a boolean value)",
        [
          :is_male,
          :is_female
        ]
      )
    end
    # ---------------------------------------------------------------------------
    #++


    describe "#get_badges_array_for_year" do
      it "returns always a processable list" do
        expect( subject.get_badges_array_for_year ).to respond_to( :each )
        expect( subject.get_badges_array_for_year ).to respond_to( :count )
      end
      it "returns a list of Badge rows for a Swimmer w/ badges" do
        swimmer = Swimmer.find(142)
        result = swimmer.get_badges_array_for_year
        expect( result ).to all( be_an_instance_of( Badge ) )
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    # TODO Add more specs for all the other methods

  end
  #-- -------------------------------------------------------------------------
  #++
end
