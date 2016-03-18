require 'spec_helper'

describe SwimmerMatchEvaluator, :type => :model do

  let( :swimmer )  { create( :swimmer ) }
  
  subject { SwimmerMatchEvaluator.new( swimmer ) }

  describe "[a well formed instance]" do
    it "locale_swimmer is the one used in costruction" do
      expect( subject.locale_swimmer ).to eq( swimmer )
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#set_visitor" do
    it "responds to #set_visitor" do
      expect( subject ).to respond_to( :set_visitor )
    end
    it "sets the visitor swimmer if a valid swimmer given" do
      expect( subject.visitor_swimmer ).to be nil
      expect( subject.set_visitor( swimmer ) ).to be true
      expect( subject.visitor_swimmer ).to eq( swimmer )
    end
    it "sets the visitor swimmer if a valid younger swimmer given" do
      younger_swimmer = create( :swimmer, year_of_birth: swimmer.year_of_birth + ( (rand * 4).to_i ), gender_type: swimmer.gender_type )
      expect( subject.visitor_swimmer ).to be nil
      expect( subject.set_visitor( younger_swimmer ) ).to be true
      expect( subject.visitor_swimmer ).to eq( younger_swimmer )
    end
    it "sets the visitor swimmer if a valid older swimmer given" do
      older_swimmer = create( :swimmer, year_of_birth: swimmer.year_of_birth - ( (rand * 4).to_i ), gender_type: swimmer.gender_type )
      expect( subject.visitor_swimmer ).to be nil
      expect( subject.set_visitor( older_swimmer ) ).to be true
      expect( subject.visitor_swimmer ).to eq( older_swimmer )
    end
    it "doesn't set visitor swimmer if wrong swimmer parameter" do
      older_swimmer = create( :swimmer, year_of_birth: swimmer.year_of_birth - ( (rand * 20).to_i + 5 ) )
      younger_swimmer = create( :swimmer, year_of_birth: swimmer.year_of_birth + ( (rand * 5).to_i + 5 ) )
      gender_swimmer = create( :swimmer, year_of_birth: swimmer.year_of_birth )
      gender_swimmer.gender_type = swimmer.gender_type.code == 'M' ? GenderType.find_by_code('F') : GenderType.find_by_code('M')
      expect( subject.visitor_swimmer ).to be nil
      expect( subject.set_visitor( 'wrong_parameter' ) ).to be false
      expect( subject.set_visitor( younger_swimmer ) ).to be false
      expect( subject.set_visitor( older_swimmer ) ).to be false
      expect( subject.set_visitor( gender_swimmer ) ).to be false
      expect( subject.visitor_swimmer ).to be nil
    end   
  end
  #-- -------------------------------------------------------------------------

  context "not a valid instance" do   
    it "raises an exception for wrong swimmer parameter" do
      expect{ SwimmerMatchEvaluator.new() }.to raise_error( ArgumentError )
      expect{ SwimmerMatchEvaluator.new( 'Wrong parameter' ) }.to raise_error( ArgumentError )
    end   
  end
  #-- -------------------------------------------------------------------------
  #++
end
