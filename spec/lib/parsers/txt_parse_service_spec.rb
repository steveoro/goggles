require 'spec_helper'

require 'parsers/txt_parse_service'
require 'parsers/context_detector'
require 'parsers/fin_result_consts'
require 'parsers/txt_result_defs'
require 'parsers/fin_result_defs'


describe TxtParseService, type: :model do

  context "for a new empty instance," do
    subject { TxtParseService.new( TxtResultDefs.new ) }

    it_behaves_like( "(the existance of a method)", [
      :result, :line_count, :total_data_rows, :previous_parent_context,
      :clear, :parse, :result_for,
      :increase_line_count, :clear_parent_context
    ] )

    describe "#result" do
      it "is an Hash instance" do
        expect( subject.result ).to be_an_instance_of( Hash )
      end
      it "is empty" do
        expect( subject.result ).to be_empty
      end
    end
    describe "#line_count" do
      it "is zero" do
        expect( subject.line_count ).to eq(0)
      end
    end
    describe "#total_data_rows" do
      it "is zero" do
        expect( subject.total_data_rows ).to eq(0)
      end
    end
    describe "#previous_parent_context" do
      it "is nil" do
        expect( subject.previous_parent_context ).to be_nil
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    describe "#increase_line_count" do
      it "adds +1 to the line count" do
        expect{ subject.increase_line_count }.to change{ subject.line_count }.by(1)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "for a valid instance," do
    subject { TxtParseService.new( FinResultDefs.new ) }

    describe "#parse" do
      it "doesn't recognize the change of a multi-line context with a single correct feed" do
        subject.clear                               # Clear the service and do a quick parsing:
        expect( subject.parse( ContextDetector.new(FinResultConsts::CNT_TYPE_STATS), '' ) ).to be false
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    context "after a successful context recognition," do
      before(:each) do
        subject.clear                               # Clear the service and do a quick parsing:
        last_result = false
        detector    = ContextDetector.new( FinResultConsts::CNT_TYPE_STATS )
        ['', ' Statistiche ', ''].each do |curr_line|
          last_result = subject.parse( detector, curr_line )
          subject.increase_line_count
        end
        expect( last_result ).to be true
      end

      describe "#parse" do
        it "changes the previous_parent_context" do
          expect( subject.previous_parent_context ).to eq( :stats )
        end
      end

      describe "#clear" do
        it "clears the line count" do
          expect{ subject.clear }.to change{ subject.line_count }.to(0)
        end
        it "clears the result" do
          subject.clear
          expect( subject.result ).to eq( Hash.new )
        end
        it "clears the total data rows" do
          expect{ subject.clear }.to change{ subject.total_data_rows }.to(0)
        end
        it "clears the previous_parent_context" do
          subject.clear
          expect( subject.previous_parent_context ).to be_nil
        end
      end

      describe "#result" do
        it "is an Hash instance" do
          expect( subject.result ).to be_an_instance_of( Hash )
        end
        it "is has the recognized context key" do
          expect( subject.result.has_key?( :stats ) ).to be true
        end
      end

      describe "#line_count" do
        it "equals the sum of the parsed lines" do
          expect( subject.line_count ).to eq(3)
        end
      end
      describe "#previous_parent_context" do
        it "equals the freshly recognized parent context" do
          expect( subject.previous_parent_context ).to eq( :stats )
        end
      end

    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
