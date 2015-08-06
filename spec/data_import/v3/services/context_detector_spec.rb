# encoding: utf-8
require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../app/data_import/v3/services/context_detector'
require_relative '../../../../app/data_import/v3/fin_result_consts'
require_relative '../../../../app/data_import/v3/dao/context_type'


describe V3::ContextDetector, type: :service do

  context "for a well-defined instance," do
    let( :dummy_wrapper ) do
      class V3::ContextDetector::DummyWrapper; include V3::FinResultConsts; end
      V3::ContextDetector::DummyWrapper.new
    end
    let( :context_types_array ) { dummy_wrapper.get_context_types_list() }
    let( :fix_context_type )    { context_types_array[ (rand * context_types_array.size).to_i ] }

    subject { V3::ContextDetector.new( fix_context_type ) }

    it_behaves_like( "(the existance of a method)", [
      :context_type,
      :current_context, :dump_line_cache, :feed_and_detect,
      :detection_index, :detection_is_in_progress,
      :clear, :parent_context_name, :is_a_parent_context, :to_s,
      # The following one is given by the inclusion of Tools::Logging::V3
      :log
    ] )
    #-- -----------------------------------------------------------------------
    #++


    describe "#initialize" do
      it "is a V3::ContextDetector instance" do
        expect( subject ).to be_an_instance_of( V3::ContextDetector )
      end
    end

    describe "#context_type" do
      it "is a V3::ContextType instance" do
        expect( subject.context_type ).to be_an_instance_of( V3::ContextType )
      end
      it "is the same context specified in the constructor" do
        expect( subject.context_type ).to be == fix_context_type
      end
      it "has the expected V2::ContextTypeDef name" do
        expect( subject.context_type.context_name ).to eq( fix_context_type.context_name )
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    context "when out of parsing loop," do
      describe "#current_context" do
        it "is a always nil" do
          expect( subject.current_context ).to be nil
        end
      end

      describe "#detection_index" do
        it "is a always 0" do
          expect( subject.detection_index ).to eq(0)
        end
      end

      describe "#detection_is_in_progress" do
        it "is a always false" do
          expect( subject.detection_is_in_progress ).to be false
        end
      end

      describe "#dump_line_cache" do
        it "returns an empty array" do
          expect( subject.dump_line_cache ).to eq( [] )
        end
      end

      describe "#clear" do
        it "resets the current context and the cache of parsed lines" do
          subject.clear
          expect( subject.current_context ).to be nil
          expect( subject.dump_line_cache.size ).to eq( 0 )
        end
      end
    end

    context "after a successful parsing," do
      let( :fixture_line_0 ) { "                                  Campionati Regionali Emilia                                  " }
      let( :fixture_line_1 ) { "                     Manifestazione organizzata da a.s.d. Molinella Nuoto                      " }
      let( :fixture_line_2 ) { "                              Molinella - 15/16/17 Febbraio 2009                               " }
      subject { V3::ContextDetector.new( dummy_wrapper.context_type_meeting_header ) }

      before(:each) do
        subject.feed_and_detect( fixture_line_0, 0, nil )
        subject.feed_and_detect( fixture_line_1, 1, nil )
        @result = subject.feed_and_detect( fixture_line_2, 2, nil )
      end

      describe "#current_context" do
        it "returns the last recognized context" do
          expect( subject.current_context ).to be == dummy_wrapper.context_type_meeting_header
        end
      end
      describe "#detection_is_in_progress" do
        it "is a always false" do
          expect( subject.detection_is_in_progress ).to be false
        end
      end
      describe "#dump_line_cache" do
        it "returns the list of lines defining the current context" do
          expect( subject.dump_line_cache ).to contain_exactly( fixture_line_0, fixture_line_1, fixture_line_2 )
        end
      end

      describe "#feed_and_detect" do
        it "returns true when it recognizes the context" do
          expect( @result ).to be true
        end
      end

      describe "#clear" do
        it "resets the current context and the cache of parsed lines" do
          expect( subject.current_context ).not_to be nil
          expect( subject.dump_line_cache.size ).to be > 0
          subject.clear
          expect( subject.current_context ).to be nil
          expect( subject.dump_line_cache.size ).to eq( 0 )
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    describe "#is_a_parent_context" do
      it "returns true when the context definition has no parent name associated" do
        expect( subject.is_a_parent_context ).to eq( fix_context_type.parent_context_name.nil? )
      end
    end

    describe "#to_s" do
      it "returns a String" do
        expect( subject.to_s ).to be_an_instance_of( String )
      end
      it "includes the context name" do
        expect( subject.to_s ).to include( subject.context_type.context_name.to_s.upcase )
      end
      it "includes the number of conditions defined" do
        expect( subject.to_s ).to include( subject.context_type.conditions.size.to_s )
      end
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
