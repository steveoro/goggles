require 'rails_helper'


describe HeaderYearPicker, type: :strategy do

  let(:year)            { 2000 + (rand * 30).to_i }
  let(:this_year)       { Date.today.year }

  context "general features" do
    subject { HeaderYearPicker.new() }

    it_behaves_like( "(the existance of a method)", [
      :season_list,
      :find, :manually, :from_db
    ] )

    describe "#season_list" do
      it "returns an array" do
        expect( subject.season_list ).to be_a_kind_of( Array )
      end
      it "returns an empty array" do
        expect( subject.season_list.count ).to eq( 0 )
      end
    end

    describe "#manually" do
      it "returns an array when invoked with limit" do
        expect( subject.manually(year) ).to be_a_kind_of( Array )
      end
      it "returns non empty array when invoked without limit" do
        expect( subject.manually.count ).to be >= 1
      end
      it "returns empty array when invoked with limit in the future" do
        expect( subject.manually(this_year + 2).count ).to eq( 0 )
      end
    end

    describe "#find" do
      it "returns an array when invoked with limit" do
        expect( subject.find(year) ).to be_a_kind_of( Array )
      end
      it "returns non empty array when invoked without limit" do
        expect( subject.find.count ).to be >= 1
      end
      it "returns empty array when invoked with limit in the future" do
        expect( subject.find(this_year + 2).count ).to eq( 0 )
      end
      it "assignes season_list array" do
        expect( subject.season_list.count ).to eq( 0 )
        subject.find
        expect( subject.season_list.count ).to be >= 1
      end
      it "assignes season_list array with header_years" do
        subject.find
        subject.season_list.each do |header_year|
          expect( header_year.length ).to eq( 9 )
          expect( header_year.include?('-') ).to be true
          expect( header_year.slice(4,1) ).to eq( '-' )
          expect( header_year.slice(0,4).to_i ).to be > 0
          expect( header_year.slice(5,4).to_i ).to be > 0
          expect( header_year.slice(0,4).to_i ).to be < header_year.slice(5,4).to_i
          expect( header_year.slice(0,4).to_i + 1 ).to eq( header_year.slice(5,4).to_i )
        end
      end
    end

  end
  #-- -------------------------------------------------------------------------
  #++


end
