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

    # TODO Add more specs for all the other methods

  end
  #-- -------------------------------------------------------------------------
  #++
end