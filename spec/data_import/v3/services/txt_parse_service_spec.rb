require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../app/data_import/v3/services/txt_parse_service'
require_relative '../../../../app/data_import/v3/services/context_detector'
require_relative '../../../../app/data_import/v3/fin_result_consts'
require_relative '../../../../app/data_import/v3/dao/context_type'


describe V3::TxtParseService, type: :service do

  let(:fake_file_name) { "import/whatever.txt" }
  let(:fixture_data) do
    [
      "",
      "        50 stile libero  maschile   -  Categoria  Master 30       Tempo Base   :  0'23\"26",
      "----------------------------------------------------------------------------------------------"
    ]
  end

  context "for a new empty instance," do
    subject { V3::TxtParseService.new( V3::FinResultDefs.new, fake_file_name ) }

    it_behaves_like( "(the existance of a method)", [
      :result, :full_pathname, :line_count, :total_data_rows, :previous_parent_context,
      :clear, :parse, :result_for,
      :increase_line_count, :clear_parent_context, :log_parsing_stats
    ] )


    describe "#result" do
      it "is a V3::ParseResult instance" do
        expect( subject.result ).to be_an_instance_of( V3::ParseResult )
      end
      it "has no contexts or entities" do
        expect( subject.result.context_list ).to be_empty
        expect( subject.result.entity_list ).to be_empty
      end
    end
    describe "#full_pathname" do
      it "is a String" do
        expect( subject.full_pathname ).to be_an_instance_of( String )
      end
      it "has the value specified in the constructor" do
        expect( subject.full_pathname ).to eq( fake_file_name )
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
      it "returns a total data rows of 0 (when no parsing has been done)" do
        expect( subject.log_parsing_stats() ).to eq(0)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "for a valid instance," do
    subject { V3::TxtParseService.new( V3::FinResultDefs.new, fake_file_name ) }

    let( :dummy_wrapper ) do
      class V3::TxtParseService::DummyWrapper; include V3::FinResultConsts; end
      V3::TxtParseService::DummyWrapper.new
    end


    describe "#parse" do
      it "recognizes a 'in progress' change of a multi-line context with a single correct feed" do
        subject.clear                               # Clear the service and do a quick parsing:
        expect(
          subject.parse(
            V3::ContextDetector.new(dummy_wrapper.context_type_category_header),
            fixture_data.first
          )
        ).to be true
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    context "after a successful context recognition," do
      before(:each) do
        subject.clear                               # Clear the service and do a quick parsing:
        last_result = false
        detector    = V3::ContextDetector.new( dummy_wrapper.context_type_category_header )
        fixture_data.each do |curr_line|
          last_result = subject.parse( detector, curr_line )
          subject.increase_line_count
        end
        expect( last_result ).to be true
      end

      describe "#clear" do
        it "clears the line count" do
          expect{ subject.clear }.to change{ subject.line_count }.to(0)
        end
        it "clears the result" do
          subject.clear
          expect( subject.result ).to eq( V3::ParseResult.new( subject.result.file_name ) )
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
        it "is a V3::ParseResult instance" do
          expect( subject.result ).to be_an_instance_of( V3::ParseResult )
        end
        it "is has the recognized context" do
          last_detected_context = subject.result.get_contexts_named( "category_header" ).last
          expect( last_detected_context ).to be_an_instance_of( V3::ContextDAO )
          expect( last_detected_context.name ).to eq( "category_header" )
        end
      end

      describe "#line_count" do
        it "equals the sum of the parsed lines" do
          expect( subject.line_count ).to eq( fixture_data.length )
        end
      end

      describe "#previous_parent_context" do
        it "equals the freshly recognized parent context" do
          expect( subject.previous_parent_context ).to be_an_instance_of( V3::ContextDAO )
          expect( subject.previous_parent_context.name ).to eq( "category_header" )
        end
      end

    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
