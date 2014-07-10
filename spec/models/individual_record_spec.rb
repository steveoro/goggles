require 'spec_helper'
require 'date'

describe IndividualRecord do

  context "[a well formed instance]" do
    subject { create( :individual_record ) }

    it "is a valid istance" do
      expect( subject ).to be_valid
    end
    # Validated relations:
    it_behaves_like( "(belongs_to required models)", [ 
      :pool_type,
      :event_type,
      :gender_type,
      :team,
      :season,
      :federation_type,
      :meeting_individual_result
    ])    

    # Filtering scopes:
    it_behaves_like( "(the existance of a class method)", [
      :team_records,
      :federation_records
    ])
  end
  #-- -------------------------------------------------------------------------
  #++
end
