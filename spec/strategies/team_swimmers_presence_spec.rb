require 'rails_helper'


describe TeamSwimmersPresence, type: :strategy do

  let(:team)            { Team.all.sample.id }
  let(:ober_ferrari)    { 1 }
  let(:this_year)       { Date.today.year }
  let(:future_year)     { this_year + 3 }
  let(:past_year)       { this_year - 3 }

  context "well formed instance" do
    subject { TeamSwimmersPresence.new( team ) }

    it_behaves_like( "(the existance of a method)", [
      :team_id, :current_seasons, :presence_data
    ] )

    it "assigns team_id as given parameter" do
      expect( subject.team_id ).to eq( team )
    end

    it "creates an empty current seasons list" do
      expect( subject.current_seasons ).to be_nil
    end

    it "creates an empty data set" do
      expect( subject.presence_data ).to be_nil
    end

    describe "#team_id" do
      it "returns a valid team id" do
        expect( Team.find(subject.team_id) ).to be_an_instance_of( Team )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "for Ober Ferrari (a team with payments)" do
    subject { TeamSwimmersPresence.new( ober_ferrari ) }

    describe "#get_seasons" do
      it "returns a relation" do
        expect( subject.get_seasons ).to be_a_kind_of( ActiveRecord::Relation )
        expect( subject.get_seasons(this_year) ).to be_a_kind_of( ActiveRecord::Relation )
        expect( subject.get_seasons(past_year) ).to be_a_kind_of( ActiveRecord::Relation )
        expect( subject.get_seasons(future_year) ).to be_a_kind_of( ActiveRecord::Relation )
      end
      it "returns an empty relation if header_year in the future" do
        expect( subject.get_seasons(future_year).count ).to eq(0)
      end
      it "returns a non empty relation if header_year in the recent past" do
        expect( subject.get_seasons(past_year).count ).to be > 0
      end
      it "assigns current_seasons" do
        expect( subject.current_seasons ).to be_nil
        subject.get_seasons
        expect( subject.current_seasons ).to be_a_kind_of( ActiveRecord::Relation )
      end
    end

    describe "#pick_season_ids" do
      it "returns a 0 string if no current seasons" do
        expect( subject.current_seasons ).to be_nil
        result = subject.pick_season_ids
        expect( result ).to be_a_kind_of( String )
        expect( result ).to eq('0')
      end
      it "returns a string not 0 if current seasons set" do
        subject.get_seasons(past_year)
        result = subject.pick_season_ids
        expect( result ).to be_a_kind_of( String )
        expect( result.length ).to be > 1
      end
    end

    describe "#retrieve_data" do
      it "return false if no current seasons set" do
        expect( subject.retrieve_data ).to eq(false)
      end
      it "doesn't sets presence_data if no current seasons set" do
        expect( subject.presence_data ).to be_nil
        expect( subject.retrieve_data ).to eq(false)
        expect( subject.presence_data ).to be_nil
      end
      it "return true and sets presence_data if current seasons set" do
        subject.get_seasons(past_year)
        expect( subject.retrieve_data ).to eq(true)
        expect( subject.presence_data ).not_to be_nil
      end

    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
