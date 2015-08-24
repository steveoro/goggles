require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../app/data_import/v3/strategies/swimmer_analysis_result_processor'


describe V3::SwimmerAnalysisResultProcessor, type: :strategy do
  let(:data_import_session)  { create( :data_import_session ) }

  context "for a new empty instance," do
    subject { V3::SwimmerAnalysisResultProcessor.new( nil, nil ) }

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
      it "returns a V3::SwimmerAnalysisResultProcessor instance" do
        expect( subject ).to be_an_instance_of( V3::SwimmerAnalysisResultProcessor )
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
        @subject = V3::SwimmerAnalysisResultProcessor.new( nil, nil )
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


      context "when NOT CONFIRMED or can CREATE SWIMMER (No chosen override + unconfirmed + same name best match)," do
        let(:swimmer_analysis_result) { create( :data_import_swimmer_analysis_result, data_import_session: data_import_session ) }

        it "adds just a new DataImportSwimmer row" do
          is_ok = nil
          new_swimmer = build( :swimmer )
          swimmer_analysis_result.chosen_swimmer_id = nil
          swimmer_analysis_result.searched_swimmer_name = new_swimmer.complete_name
          swimmer_analysis_result.match_name            = new_swimmer.complete_name
          swimmer_analysis_result.best_match_name       = new_swimmer.complete_name
          expect( swimmer_analysis_result.can_insert_swimmer ).to be true
          alias_count = DataImportSwimmerAlias.count
# DEBUG
#          puts "\r\n#{swimmer_analysis_result}"
#          puts "=> count BEFORE: Swimmer=#{Swimmer.count}, DataImportSwimmer=#{DataImportSwimmer.count}, DataImportSwimmerAlias=#{alias_count}"
          expect{
            is_ok = @subject.run(
              swimmer_analysis_result,
              false, # (is confirmed)
              nil
            )
# DEBUG
#            puts @subject.process_log
#            puts "=> count AFTER:  Swimmer=#{Swimmer.count}, DataImportSwimmer=#{DataImportSwimmer.count}, DataImportSwimmerAlias=#{DataImportSwimmerAlias.count}"
          }.to change{ DataImportSwimmer.count }.by(1)

          expect( is_ok ).to be true
          expect( DataImportSwimmerAlias.count ).to eq( alias_count )
        end
      end
      #-- ---------------------------------------------------------------------
      #++


      context "when CONFIRMED and can CREATE ALIAS (Swimmer match + override with same ID + same name best match + confirm)," do
        let(:swimmer_analysis_result) { create( :data_import_swimmer_analysis_result, data_import_session: data_import_session ) }

        it "adds just a new DataImportSwimmerAlias row" do
          is_ok = nil
          # Force and check conditions for aliasing:
          swimmer_analysis_result.searched_swimmer_name = build( :swimmer ).complete_name

          expect( swimmer_analysis_result.chosen_swimmer_id.to_i ).to be > 0
          expect( swimmer_analysis_result.can_insert_alias ).to be true
          swimmer_count = Swimmer.count
# DEBUG
#          puts "\r\n#{swimmer_analysis_result}"
#          puts "=> count BEFORE: Swimmer=#{Swimmer.count}, DataImportSwimmer=#{DataImportSwimmer.count}, DataImportSwimmerAlias=#{DataImportSwimmerAlias.count}"
          expect{
            is_ok = @subject.run(
              swimmer_analysis_result,
              true, # (is confirmed)
              swimmer_analysis_result.chosen_swimmer_id
            )
# DEBUG
#            puts @subject.process_log
#            puts "=> count AFTER:  Swimmer=#{Swimmer.count}, DataImportSwimmer=#{DataImportSwimmer.count}, DataImportSwimmerAlias=#{DataImportSwimmerAlias.count}"
           }.to change{ DataImportSwimmerAlias.count }.by(1)

          expect( is_ok ).to be true
          expect( Swimmer.count ).to eq( swimmer_count )
        end
      end
      #-- ---------------------------------------------------------------------
      #++
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
