# encoding: utf-8
require 'ffaker'
require 'rails_helper'
require 'common/format'

describe TeamCurrentSwimmersDAO, type: :model do

  let(:team)                { Team.first(300).sample }

  let(:badge_number)        { "BDG #{(rand * 100000).to_i}" }
  let(:category_code)       { CategoryType.all.sample.code }
  let(:meetings_count)      { (rand * 200).to_i }

  let(:swimmer_id)          { (rand * 5000).to_i }
  let(:swimmer_name)        { "#{FFaker::Name.last_name} #{FFaker::Name.first_name}" }
  let(:swimmer_year)        { 1950 + (rand * 50).to_i }

  let(:federation_code)     { FederationType.all.sample.code }
  let(:affiliation_number)  { "AFL 0#{(rand * 100000).to_i}" }

  context "CurrentSwimmerBadgeDAO subelement," do

    subject { TeamCurrentSwimmersDAO::CurrentSwimmerBadgeDAO.new() }

    it_behaves_like( "(the existance of a method)", [
      :badge_number, :category_code, :meetings_count
    ] )

    describe "when initialized without parameters" do
      it "returns default values" do
        expect( subject.badge_number ).to eq( 'ND' )
        expect( subject.category_code ).to eq( 'ND' )
        expect( subject.meetings_count ).to eq( 0 )
      end
    end

    describe "when initialized with parameters" do
      it "returns given values" do
        detail = TeamCurrentSwimmersDAO::CurrentSwimmerBadgeDAO.new( badge_number, category_code, meetings_count )
        expect( detail.badge_number ).to eq( badge_number )
        expect( detail.category_code ).to eq( category_code )
        expect( detail.meetings_count ).to eq( meetings_count )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "CurrentSwimmerDAO subelement," do

    subject { TeamCurrentSwimmersDAO::CurrentSwimmerDAO.new( swimmer_id, swimmer_name, swimmer_year, meetings_count ) }

    it_behaves_like( "(the existance of a method)", [
      :swimmer_id, :swimmer_name, :swimmer_year, :meetings_total
    ] )

    it_behaves_like( "(the existance of a method returning an hash)", [
      :badges
    ] )

    describe "when initialized without parameters" do
      it "returns given values" do
        expect( subject.swimmer_id ).to eq( swimmer_id )
        expect( subject.swimmer_name ).to eq( swimmer_name )
        expect( subject.swimmer_year ).to eq( swimmer_year )
        expect( subject.meetings_total ).to eq( meetings_count )
        expect( subject.badges.size ).to eq( 0 )
      end
    end

    describe "when initialized without optional parameters" do
      it "returns default values" do
        detail = TeamCurrentSwimmersDAO::CurrentSwimmerDAO.new( swimmer_id, swimmer_name, swimmer_year )
        expect( detail.swimmer_id ).to eq( swimmer_id )
        expect( detail.swimmer_name ).to eq( swimmer_name )
        expect( detail.swimmer_year ).to eq( swimmer_year )
        expect( detail.meetings_total ).to eq( 0 )
        expect( subject.badges.size ).to eq( 0 )
      end
    end

    describe "#badges" do
      it "returns an hash" do
        expect( subject.badges ).to be_a_kind_of( Hash )
      end
      it "returns an hash of CurrentSwimmerBadgeDAO ekements" do
        subject.badges.values do |badge|
          expect( subject.badges ).to be_a_kind_of( TeamCurrentSwimmersDAO::CurrentSwimmerBadgeDAO )
        end
      end
    end

    describe "#add_badge" do
      it "returns a positive number" do
        expect( subject.add_badge( federation_code ) ).to be > 0
      end
      it "returns 1 if no other data present" do
        expect( subject.badges.size ).to eq( 0 )
        result = subject.add_badge( federation_code )
        expect( result ).to eq( 1 )
        expect( subject.badges.size ).to eq( result )
      end
      it "creates a CurrentSwimmerBadgeDAO element" do
        subject.add_badge( federation_code )
        subject.add_badge( 'SOME' )
        subject.add_badge( 'OTHER' )
        expect( subject.badges.size ).to eq( 3 )
        subject.badges.values do |badge|
          expect( badge ).to be_a_kind_of( TeamCurrentSwimmersDAO::CurrentSwimmerBadgeDAO )
        end
      end
    end

    describe "#get_badge" do
      it "returns a nil if no data present fro given fedartion" do
        expect( subject.get_badge( 'NONE') ).to be_nil
      end
      it "returns a CurrentSwimmerBadgeDAO element if data present" do
        code = federation_code
        subject.add_badge( code )
        expect( subject.get_badge( code ) ).to be_a_kind_of( TeamCurrentSwimmersDAO::CurrentSwimmerBadgeDAO )
        subject.add_badge( 'SOME' )
        expect( subject.get_badge( 'SOME' ) ).to be_a_kind_of( TeamCurrentSwimmersDAO::CurrentSwimmerBadgeDAO )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "TeamCurrentSwimmersDAO general element," do

    subject { TeamCurrentSwimmersDAO.new( team ) }

    it_behaves_like( "(the existance of a method)", [
      :team, :evaluation_date,
      :updated_at
    ] )

    it_behaves_like( "(the existance of a method returning an hash)", [
      :affiliations, :swimmers
    ] )

    describe "#team" do
      it "returns a team" do
        expect( subject.team ).to be_an_instance_of( Team )
      end
      it "contains the given parameter" do
        expect( subject.team ).to eq( team )
      end
    end

    describe "#affiliations" do
      it "is an empty hash" do
        expect( subject.affiliations.size ).to eq( 0 )
      end
    end

    describe "#add_affiliation" do
      it "returns a positive number" do
        expect( subject.add_affiliation( affiliation_number ) ).to be > 0
      end
      it "returns 1 if no other data present" do
        expect( subject.affiliations.size ).to eq( 0 )
        result = subject.add_affiliation( affiliation_number )
        expect( result ).to eq( 1 )
        expect( subject.affiliations.size ).to eq( result )
      end
      it "responds to added key" do
        affiliation = affiliation_number
        subject.add_affiliation( 'SOME' )
        subject.add_affiliation( 'OTHER' )
        result = subject.add_affiliation( affiliation )
        expect( subject.affiliations.size ).to eq( 3 )
        expect( subject.affiliations ).respond_to? ( affiliation )
        expect( subject.affiliations ).respond_to? ( 'SOME' )
        expect( subject.affiliations ).respond_to? ( 'OTHER' )
      end
    end

    describe "#get_affiliation" do
      it "returns a nil if no data present fro given fedartion" do
        expect( subject.get_affiliation( 'NONE') ).to be_nil
      end
      it "returns a value if data present" do
        affiliation = affiliation_number
        subject.add_affiliation( affiliation )
        expect( subject.get_affiliation( affiliation ) ).not_to be_nil
        subject.add_affiliation( 'SOME' )
        expect( subject.get_affiliation( 'SOME' ) ).not_to be_nil
      end
    end

    describe "#swimmers" do
      it "is an empty hash" do
        expect( subject.swimmers.size ).to eq( 0 )
      end
    end

    describe "#add_swimmer" do
      it "returns a positive number" do
        expect( subject.add_swimmer( swimmer_id, swimmer_name, swimmer_year, meetings_count ) ).to be > 0
      end
      it "returns 1 if no other data present" do
        expect( subject.swimmers.size ).to eq( 0 )
        result = subject.add_swimmer( swimmer_id, swimmer_name, swimmer_year, meetings_count )
        expect( result ).to eq( 1 )
        expect( subject.swimmers.size ).to eq( result )
      end
      it "creates a CurrentSwimmerDAO element" do
        subject.add_swimmer( swimmer_id, swimmer_name, swimmer_year, meetings_count )
        subject.add_swimmer( -5, swimmer_name, swimmer_year, meetings_count )
        subject.add_swimmer( -12, swimmer_name, swimmer_year, meetings_count )
        expect( subject.swimmers.size ).to eq( 3 )
        subject.swimmers.values do |swimmer|
          expect( swimmer ).to be_a_kind_of( TeamCurrentSwimmersDAO::CurrentSwimmerDAO )
        end
      end
    end

    describe "#get_swimmer" do
      it "returns a nil if no data present fro given fedartion" do
        expect( subject.get_swimmer( 'NONE') ).to be_nil
      end
      it "returns a CurrentSwimmerDAO element if data present" do
        id = swimmer_id
        subject.add_swimmer( swimmer_id, swimmer_name, swimmer_year, meetings_count )
        expect( subject.get_swimmer( id ) ).to be_a_kind_of( TeamCurrentSwimmersDAO::CurrentSwimmerDAO )
        subject.add_swimmer( -5, swimmer_name, swimmer_year, meetings_count )
        expect( subject.get_swimmer( -5 ) ).to be_a_kind_of( TeamCurrentSwimmersDAO::CurrentSwimmerDAO )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- -------------------------------------------------------------------------
#++
