require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../lib/data_import/strategies/swimmer_analysis_result_processor'


describe SwimmerAnalysisResultProcessor, type: :strategy do
  let(:data_import_session)  { create( :data_import_session ) }

  context "for a new empty instance," do
    subject { SwimmerAnalysisResultProcessor.new( nil, nil ) }

    it_behaves_like( "(the existance of a method)", [
      :logger,
      :flash,
      :sql_executable_log,
      :process_log,
      :run
    ] )
    #-- -----------------------------------------------------------------------
    #++


    describe "#initialize" do
      it "returns a SwimmerAnalysisResultProcessor instance" do
        expect( subject ).to be_an_instance_of( SwimmerAnalysisResultProcessor )
      end
      it "sets the #sql_executable_log to an empty string" do
        expect( subject.sql_executable_log ).to eq('')
      end
      it "sets the #process_log to an empty string" do
        expect( subject.process_log ).to eq('')
      end
    end
    #-- -----------------------------------------------------------------------
    #++


    describe "#run" do
      # Initialize a sharable subject using an instance
      before(:all) do
        @subject = SwimmerAnalysisResultProcessor.new( nil, nil )
      end
      # Clean-up in case of errors or example failures leftovers
      after(:all) do
        @subject.committed_rows.each do |committed_row|
          begin
            committed_row.destroy
          rescue
          end
        end
      end

      # context "when NOT CONFIRMED or can CREATE SWIMMER (No chosen override + unconfirmed + same name best match)," do
        # let(:swimmer_analysis_result) { create( :data_import_swimmer_analysis_result, data_import_session: data_import_session ) }
#
        # it "adds just a new DataImportSwimmer row" do
          # is_ok = nil
          # new_swimmer = build( :swimmer )
          # swimmer_analysis_result.chosen_swimmer_id = nil
          # swimmer_analysis_result.searched_swimmer_name = new_swimmer.complete_name
          # swimmer_analysis_result.match_name            = new_swimmer.complete_name
          # swimmer_analysis_result.best_match_name       = new_swimmer.complete_name
          # expect( swimmer_analysis_result.can_insert_swimmer ).to be true
          # alias_count = DataImportSwimmerAlias.count
# # DEBUG
# #          puts "\r\n#{swimmer_analysis_result}"
# #          puts "=> count BEFORE: Swimmer=#{Swimmer.count}, DataImportSwimmer=#{DataImportSwimmer.count}, DataImportSwimmerAlias=#{alias_count}"
          # expect{
            # is_ok = @subject.run( swimmer_analysis_result, false, nil )
# # DEBUG
# #            puts @subject.process_log
# #            puts "=> count AFTER:  Swimmer=#{Swimmer.count}, DataImportSwimmer=#{DataImportSwimmer.count}, DataImportSwimmerAlias=#{DataImportSwimmerAlias.count}"
          # }.to change{ DataImportSwimmer.count }.by(1)
#
          # expect( is_ok ).to be true
          # expect( DataImportSwimmerAlias.count ).to eq( alias_count )
        # end
      # end
      # #-- ---------------------------------------------------------------------
      # #++
#
      # context "when CONFIRMED and can CREATE ALIAS (Swimmer match + override with same ID + same name best match + confirm)," do
        # let(:swimmer_analysis_result) { create( :data_import_swimmer_analysis_result, data_import_session: data_import_session ) }
#
        # it "adds just a new DataImportSwimmerAlias row" do
          # is_ok = nil
          # expect( swimmer_analysis_result.can_insert_alias ).to be true
          # swimmer_count = Swimmer.count
# # DEBUG
# #          puts "\r\n#{swimmer_analysis_result}"
# #          puts "=> count BEFORE: Swimmer=#{Swimmer.count}, DataImportSwimmer=#{DataImportSwimmer.count}, DataImportSwimmerAlias=#{DataImportSwimmerAlias.count}"
          # expect{
            # is_ok = @subject.run( swimmer_analysis_result, true, swimmer_analysis_result.chosen_swimmer_id )
# # DEBUG
# #            puts @subject.process_log
# #            puts "=> count AFTER:  Swimmer=#{Swimmer.count}, DataImportSwimmer=#{DataImportSwimmer.count}, DataImportSwimmerAlias=#{DataImportSwimmerAlias.count}"
           # }.to change{ DataImportSwimmerAlias.count }.by(1)
#
          # expect( is_ok ).to be true
          # expect( Swimmer.count ).to eq( swimmer_count )
        # end
      # end
      # #-- ---------------------------------------------------------------------
      # #++
#
# # FIXME
      # context "when CONFIRMED and can CREATE AFFILIATION (Swimmer match + no override + missing affiliation + confirmed)," do
        # let(:swimmer_analysis_result) { create( :data_import_swimmer_analysis_result, data_import_session: data_import_session ) }
#
        # it "adds a new SwimmerAffiliation row (w/ its own alias)" do
          # is_ok = nil
          # swimmer_analysis_result.best_match_name = nil
# # FIXME
# #          expect( swimmer_analysis_result.can_insert_affiliation ).to be true
          # swimmer_count = Swimmer.count
          # alias_count = DataImportSwimmerAlias.count
# # DEBUG
# #          puts "\r\n#{swimmer_analysis_result}"
# #          puts "=> count BEFORE: Swimmer=#{Swimmer.count}, DataImportSwimmer=#{DataImportSwimmer.count}, DataImportSwimmerAlias=#{DataImportSwimmerAlias.count}"
          # expect( is_ok ).to be true
          # expect( Swimmer.count ).to eq( swimmer_count )
          # expect( DataImportSwimmerAlias.count ).to eq( alias_count + 1 )
        # end
      # end
      #-- ---------------------------------------------------------------------
      #++
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
