require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../app/data_import/v2/services/txt_parse_service'
require_relative '../../../../app/data_import/v2/services/context_detector'
require_relative '../../../../app/data_import/v2/fin_result_consts'
require_relative '../../../../app/data_import/v2/txt_result_defs'
require_relative '../../../../app/data_import/v2/fin_result_defs'


describe V2::TxtParseService, type: :service do

  context "for a new empty instance," do
    subject { V2::TxtParseService.new( V2::FinResultDefs.new ) }

    it_behaves_like( "(the existance of a method)", [
      :result, :line_count, :total_data_rows, :previous_parent_context,
      :clear, :parse, :result_for,
      :increase_line_count, :clear_parent_context, :log_parsing_stats
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

    describe "#log_parsing_stats" do
      it "returns 0 (when no parsing has been done)" do
        expect( subject.log_parsing_stats('dummy_file.txt') ).to eq(0)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "for a valid instance," do
    subject { V2::TxtParseService.new( V2::FinResultDefs.new ) }

    let( :dummy_wrapper ) do
      class V2::TxtParseService::DummyWrapper; include V2::FinResultConsts; end
      V2::TxtParseService::DummyWrapper.new
    end


    describe "#parse" do
      it "recognizes a 'in progress' change of a multi-line context with a single correct feed" do
        subject.clear                               # Clear the service and do a quick parsing:
        expect( subject.parse( V2::ContextDetector.new(dummy_wrapper.context_type_stats), 'Statistiche' ) ).to be true
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    context "after a successful context recognition," do
      before(:each) do
        subject.clear                               # Clear the service and do a quick parsing:
        last_result = false
        detector    = V2::ContextDetector.new( dummy_wrapper.context_type_stats )
        [' Statistiche '].each do |curr_line|
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
          # Since data rows are increased only when parsing children lines and not
          # context (parent) changes, we simply check that the total number of
          # data rows is cleared out:
          subject.clear
          expect( subject.total_data_rows ).to eq( 0 )
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
          expect( subject.line_count ).to eq(1)
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
