require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../app/data_import/v2/context_type_def'


describe V2::ContextTypeDef, type: :model do
  let( :fix_conditions ) do
    [
      /(\s*(Distanze speciali|((\d{1,3}\D{1,2}|[IXVMCDL]{1,8})\s(\S+|Trof|Region))))|(\d{1,2}((\/|-|\,)\d{1,2})*\s(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic).*\s\d{4})/ui,
      /(\s*Manifestazione organizzata da)|(\s*(Distanze speciali|((\d{1,3}\D{1,2}|[IXVMCDL]{1,8})\s(\S+|Trof|Region))))/ui
    ]
  end


  context "for a well-defined instance," do
    subject { V2::ContextTypeDef.new( :fixture_context, fix_conditions ) }


    it_behaves_like( "(the existance of a method)", [
      :context_name, :condition_array, :parent_context_name, :line_timeout,
      :to_s, :==
    ] )
    #-- -----------------------------------------------------------------------
    #++


    describe "#context_name" do
      it "is a String or a Symbol" do
        expect( subject.context_name ).to be_an_instance_of( String ).or be_an_instance_of( Symbol )
      end
    end

    describe "#condition_array" do
      it "is an Array" do
        expect( subject.condition_array ).to be_an_instance_of( Array )
      end
      it "is has the specified size" do
        expect( subject.condition_array.size ).to eq( fix_conditions.size )
      end
    end

    describe "#parent_context_name" do
      it "is nil when not defined" do
        expect( subject.parent_context_name ).to be nil
      end
    end

    describe "#line_timeout" do
      it "is nil when not defined" do
        expect( subject.line_timeout ).to be 0
      end
    end

    describe "#to_s" do
      it "returns a String" do
        expect( subject.to_s ).to be_an_instance_of( String )
      end
      it "includes the context name" do
        expect( subject.to_s ).to include( subject.context_name.to_s.upcase )
      end
      it "includes the number of conditions defined" do
        expect( subject.to_s ).to include( subject.condition_array.size.to_s )
      end
    end

    describe "#==" do
      it "returns false for a nil object" do
        expect( subject.==( nil ) ).to be false
      end
      it "returns false for a different class" do
        expect( subject == 'whatever' ).to be false
      end
      it "returns false for a different object with the same name" do
        expect(
          subject == V2::ContextTypeDef.new( :fixture_context, [/(\s*(dummytest))/ui] )
        ).to be false
      end
      it "returns true for another object with the same values" do
        expect(
          subject == V2::ContextTypeDef.new( :fixture_context, fix_conditions )
        ).to be true
      end
    end
    #-- -----------------------------------------------------------------------
    #++


    context "with a parent context specified," do
      subject { V2::ContextTypeDef.new( :whatever, [ /(\s*(dummytest))/ui ], :dummy_parent ) }

      it "has the specified parent context name" do
        expect( subject.parent_context_name ).to eq( :dummy_parent )
      end
    end


    context "with a line timeout specified," do
      subject { V2::ContextTypeDef.new( :whatever, [ /(\s*(dummytest))/ui ], nil, 3 ) }

      it "has line timeout value" do
        expect( subject.line_timeout ).to be 3
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
