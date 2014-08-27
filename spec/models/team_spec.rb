require 'spec_helper'


describe Team, :type => :model do
  describe "[a non-valid instance]" do
    it_behaves_like( "(missing required values)", [ 
      :name, :editable_name
    ])    
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "[a well formed instance]" do
    subject { Team.find(1) }
#    subject { create( :team ) }

    it "is a valid istance" do
      expect( subject ).to be_valid
    end
    # Validated (owned foreign-key) relations:
    it_behaves_like( "(belongs_to required models)", [ :city ] )
    # Test the existance of all the required has_many / has_one relationships:
    it_behaves_like( "(the existance of a method returning a collection of some kind of instances)",
      [ 
        :badges,
        :meeting_individual_results,
        :meetings,
        :seasons,
        :meeting_relay_results,
        :team_affiliations,
        :seasons,
        :season_types,
        :goggle_cups
      ],
      ActiveRecord::Base
    )    

    context "[general methods]" do
      it_behaves_like( "(the existance of a method returning non-empty strings)", 
        [ 
          :get_full_name,
          :get_verbose_name
        ]
      )
      it_behaves_like( "(the existance of a method returning a boolean value)",
        [
          :has_goggle_cup_at?
        ]
      )
    end
    # ---------------------------------------------------------------------------
    #++

    describe "#has_goggle_cup_at?" do
      it "accepts a date as a parameter" do
        result = subject.has_goggle_cup_at?( Date.today )
        if result
          expect( result ).to be true
        else
          expect( result ).to be false
        end
      end
      it "returns true for CSI Ober Ferrari at 01/01/2014" do
        fix_date = Date.parse("2014-01-01")
        expect( subject.has_goggle_cup_at?( fix_date ) ).to be true
      end
      it "returns false for CSI Ober Ferrari at 01/01/1990" do
        fix_date = Date.parse("1990-01-01")
        expect( subject.has_goggle_cup_at?( fix_date ) ).to be false
      end
    end
    # ---------------------------------------------------------------------------
    #++
    
    describe "#get_current_goggle_cup_at" do
      it "responds to #get_current_goggle_cup_at" do
        expect( subject ).to respond_to( :get_current_goggle_cup_at )
      end
      context "without parameters" do
        it "returns an instance of goggle_cup or nil" do
          expect( subject.get_current_goggle_cup_at ).to be_an_instance_of( GoggleCup ).or be_nil
        end
      end
      context "with a date as parameter" do
        it "returns an instance of goggle_cup or nil" do
          fix_date = Date.today
          expect( subject.get_current_goggle_cup_at( fix_date ) ).to be_an_instance_of( GoggleCup ).or be_nil
        end
        it "returns an instance of goggle_cup for CSI Ober Ferrari at 01-01-2014" do
          fix_date = Date.parse("2014-01-01")
          expect( subject.get_current_goggle_cup_at( fix_date ) ).to be_an_instance_of( GoggleCup )
        end
        it "returns Ober Cup 2014 for CSI Ober Ferrari at 01-01-2014" do
          fix_date = Date.parse("2014-01-01")
          expect( subject.get_current_goggle_cup_at( fix_date ).get_full_name ).to include( 'Ober Cup 2014' )
        end
        it "returns nil for CSI Ober Ferrari at 01-01-1990" do
          fix_date = Date.parse("1990-01-01")
          expect( subject.get_current_goggle_cup_at( fix_date ) ).to be_nil
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
