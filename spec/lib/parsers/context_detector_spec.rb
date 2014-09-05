require 'spec_helper'

require 'parsers/context_detector'


describe ContextDetector, type: :model do

  context "for a well-defined instance," do
    let( :fix_context_type ) do
      ContextTypeDef.new(
        :meeting_header,
        [
          /(\s*(Distanze speciali|((\d{1,3}\D{1,2}|[IXVMCDL]{1,8})\s(\S+|Trof|Region))))|(\d{1,2}((\/|-|\,)\d{1,2})*\s(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic).*\s\d{4})/ui,
          /(\s*Manifestazione organizzata da)|(\s*(Distanze speciali|((\d{1,3}\D{1,2}|[IXVMCDL]{1,8})\s(\S+|Trof|Region))))/ui
        ]
      )
    end

    subject { ContextDetector.new( fix_context_type ) }


    it_behaves_like( "(the existance of a method)", [
      :context_type, :logger, :current_context,
      :clear, :is_a_parent_context, :dump_line_cache, :feed_and_detect, :to_s
    ] )
    #-- -----------------------------------------------------------------------
    #++


    describe "#context_type" do
      it "is a ContextTypeDef instance" do
        expect( subject.context_type ).to be_an_instance_of( ContextTypeDef )
      end
      it "is returns the ContextTypeDef specified in the constructor" do
        expect( subject.context_type.context_name ).to eq( fix_context_type.context_name )
        # TODO add == operator for contexts
      end
    end


    describe "#logger" do
      # TODO set a logger and test the getter
      it "is a Logger or nil" do
        expect( subject.logger ).to be_an_instance_of( Logger ).or be nil
      end
    end


    describe "#current_context" do
      # TODO parse a line setting the current context
      it "is a ContextTypeDef or nil" do
        expect( subject.current_context ).to be_an_instance_of( ContextTypeDef ).or be nil
      end
    end


    describe "#clear" do
      # TODO parse a line setting the current context
      it "resets the current contex" do
        subject.clear
        expect( subject.current_context ).to be nil
      end
    end


    describe "#to_s" do
      it "returns a String" do
        expect( subject.to_s ).to be_an_instance_of( String )
      end
      it "includes the context name" do
        expect( subject.to_s ).to include( subject.context_type.context_name.to_s )
      end
      it "includes the number of conditions defined" do
        expect( subject.to_s ).to include( subject.context_type.condition_array.size.to_s )
      end
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
