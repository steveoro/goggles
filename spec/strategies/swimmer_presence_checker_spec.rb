require 'rails_helper'


describe SwimmerPresenceChecker, type: :strategy do

  let(:fix_swimmer)       { Swimmer.find(23) }
  let(:fix_date)          { Date.today() - 100 + (rand * 200).to_i }

  let(:fix_pace_type )    { ['A2','B1','B2'].sample }

  subject { SwimmerPresenceChecker.new(fix_swimmer, fix_date) }

  describe "[a well formed instance]" do
    it_behaves_like( "(the existance of a method returning strings)", [
      :get_current_header_year
    ])
  end
  #-- -------------------------------------------------------------------------
  #++
  
  describe "#get_current_header_year" do
    it "returns a string current year" do
      expect( subject.get_current_header_year ).to include( Date.today().year.to_s )
    end
    it "returns a string containing / separator" do
      expect( subject.get_current_header_year ).to include( '/' )
    end
    it "returns a string 9 cars long" do
      expect( subject.get_current_header_year.length ).to eq( 9 )
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#get_swimmer_current_badges" do
    it "returns a collection of badges" do
      badges = subject.get_swimmer_current_badges()
      expect( badges ).to all(be_an_instance_of( Badge ))
    end

    it "returns the same number as current seasons" do
      expect( subject.get_swimmer_current_badges().count ).to eq( subject.get_swimmer_current_seasons().count )
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#get_swimmer_current_seasons" do
    it "returns a collection of seasons" do
      seasons = subject.get_swimmer_current_seasons()
      expect( seasons ).to all(be_an_instance_of( Season ))
    end

    it "returns the same number as current badges" do
      expect( subject.get_swimmer_current_seasons().count ).to eq( subject.get_swimmer_current_badges().count )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
