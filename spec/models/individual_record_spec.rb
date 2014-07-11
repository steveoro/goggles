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

    context "[implemented methods]" do
      it_behaves_like( "(the existance of a method)",
        [
          :from_individual_result
        ]
      )
    end
    #-- -----------------------------------------------------------------------
    #++

    describe "#from_individual_result" do
      it "accepts a MeetingIndividualResult parameter" do
        expect(
          subject.from_individual_result( create(:meeting_individual_result) )
        ).to be_an_instance_of( IndividualRecord )
      end
      it "raises an exception for a nil parameter" do
        expect{ subject.from_individual_result( nil ) }.to raise_error( ArgumentError )
      end
      it "raises an exception for an unsupported parameter" do
        expect{ subject.from_individual_result( '' ) }.to raise_error( ArgumentError )
      end
      it "copies the member values into the instance" do
        fixture = create( :meeting_individual_result )
        result = IndividualRecord.new.from_individual_result( fixture )
        expect( result.pool_type_id ).to eq( fixture.pool_type.id )
        expect( result.event_type_id ).to eq( fixture.event_type.id )
        expect( result.category_type_id ).to eq( fixture.category_type.id )
        expect( result.gender_type_id ).to eq( fixture.gender_type.id )
        expect( result.minutes ).to eq( fixture.minutes )
        expect( result.seconds ).to eq( fixture.seconds )
        expect( result.hundreds ).to eq( fixture.hundreds )
        expect( result.swimmer_id ).to eq( fixture.swimmer.id )
        expect( result.team_id ).to eq( fixture.team.id )
        expect( result.season_id ).to eq( fixture.season.id )
        expect( result.federation_type_id ).to eq( fixture.season.federation_type.id )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
