# encoding: utf-8
require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../app/data_import/v3/builders/entity_committer'


describe V3::EntityCommitter, type: :service do
  let(:data_import_session) { create( :data_import_session ) }
  let(:total_detail_rows)   { 5 }
  let(:create_di_swimmers)  { create_list( :data_import_swimmer, total_detail_rows, data_import_session: data_import_session ) }
  let(:create_di_badge)     { create_list( :data_import_badge,   total_detail_rows, data_import_session: data_import_session ) }
  #-- -------------------------------------------------------------------------
  #++

  subject do
    create_di_swimmers
    V3::EntityCommitter.new( data_import_session, DataImportSwimmer, 6 )
  end

  it_behaves_like( "(the existance of a method)", [
    :data_import_session, :committed_data_rows, :last_error,
    :is_ok?,
    :commit,
    :check_for_non_nil_links
  ] )


  context "after a successful #initialize," do
    it "returns an instance of V3::EntityCommitter" do
      expect( subject ).to be_an_instance_of( V3::EntityCommitter )
    end

    context "#is_ok?" do
      it "is true" do
        expect( subject.is_ok? ).to be true
      end
    end
    context "#data_import_session" do
      it "returns the associated DataImportSession" do
        expect( subject.data_import_session.id ).to eq( data_import_session.id )
      end
    end
    context "#committed_data_rows" do
      it "is 0" do
        expect( subject.committed_data_rows ).to eq( 0 )
      end
    end
    context "#last_error" do
      it "is nil" do
        expect( subject.last_error ).to be nil
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#last_error" do
    it "catches any exception/error raised during the commit block" do
      expect{
        subject.commit do
          raise RuntimeError.new( 'Test!' )
          nil
        end
      }.not_to raise_error
      expect( subject.last_error ).to be_an_instance_of( RuntimeError )
      expect( subject.last_error.message ).to eq( 'Test!' )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#commit" do
    it "raises an error if a block is not given" do
      expect{ subject.commit }.to raise_error
    end

    it "passes the current source_row as a parameter for the block" do
      subject.commit do |source_row|
        expect( source_row ).to be_an_instance_of( DataImportSwimmer )
      end
    end

    context "with a fake commit block," do
      let(:perform_fake_commit) { subject.commit { |src_row| src_row } }

      it "returns true when no errors are raised" do
        expect( perform_fake_commit ).to be true
      end
      it "updates the SQL diff text log with an INSERT statement for each committed row" do
        expected_statements = create_di_swimmers.map { |row| subject.to_sql_insert(row, false) }
        perform_fake_commit
        expected_statements.each do |sql_statement|
          expect( data_import_session.sql_diff ).to include( sql_statement )
        end
      end
      it "sets #committed_data_rows with the total of the committed rows" do
        perform_fake_commit
        expect( subject.committed_data_rows ).to eq( total_detail_rows )
      end
      it "sets #is_ok? to true" do
        perform_fake_commit
        expect( subject.is_ok? ).to be true
      end
      it "sets #last_error to nil" do
        perform_fake_commit
        expect( subject.last_error ).to be nil
      end
    end


    context "with a commit block with an error inside," do
      let(:perform_error_commit) { subject.commit { |src_row| raise "Forced error inside block!" } }

      it "returns false when errors are raised" do
        expect( perform_error_commit ).to be false
      end
      it "sets #committed_data_rows to 0" do
        perform_error_commit
        expect( subject.committed_data_rows ).to eq( 0 )
      end
      it "sets #is_ok? to false" do
        perform_error_commit
        expect( subject.is_ok? ).to be false
      end
      it "sets #last_error to the Error generated" do
        perform_error_commit
        expect( subject.last_error ).to be_an_instance_of(RuntimeError)
      end
      it "sets #last_error.message to the message of the Error" do
        perform_error_commit
        expect( subject.last_error.message ).to eq( "Forced error inside block!" )
      end
      it "updates #data_import_session.phase_2_log with the message of the Error" do
        perform_error_commit
        expect( subject.data_import_session.phase_2_log ).to include( "commit: exception caught during save!" )
        expect( subject.data_import_session.phase_2_log ).to include( "Forced error inside block!" )
      end
    end


    context "with a fake commit block using the @additional_row variable," do
      # Any existing row will suffice, we just want to generate its SQL insert statement:
      let(:other_rows) { CategoryType.all.sort{ rand - 0.5 }[ 0.. total_detail_rows-1 ] }

      let(:perform_fake_commit) do
        additional_rows = other_rows.dup
        subject.commit( additional_rows ) do |src_row, array_of_rows|
          # Pop the last element and set it as the "additional_row" for SQL output:
          @additional_row = array_of_rows.pop
          # Return the actual element
          src_row
        end
      end

      it "updates the SQL diff text log with an INSERT statement for each committed row" do
        expected_statements = create_di_swimmers.map { |row| subject.to_sql_insert(row, false) } +
                              other_rows.map { |row| subject.to_sql_insert(row, false) }
        perform_fake_commit
        expected_statements.each do |sql_statement|
          expect( data_import_session.sql_diff ).to include( sql_statement )
        end
      end
      it "sets #committed_data_rows with the total of the committed rows" do
        perform_fake_commit
        expect( subject.committed_data_rows ).to eq( total_detail_rows * 2 )
      end
      it "sets #is_ok? to true" do
        perform_fake_commit
        expect( subject.is_ok? ).to be true
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "after a successful #commit with an empty block and NO detail rows," do
    subject do
      committer = V3::EntityCommitter.new( data_import_session, DataImportTeam, 7 )
      is_ok = committer.commit {}
      expect( is_ok ).to be true
      committer
    end

    context "#is_ok?" do
      it "is true" do
        expect( subject.is_ok? ).to be true
      end
    end
    context "#data_import_session" do
      it "returns the associated DataImportSession" do
        expect( subject.data_import_session.id ).to eq( data_import_session.id )
      end
    end
    context "#committed_data_rows" do
      it "is 0" do
        expect( subject.committed_data_rows ).to eq( 0 )
      end
    end
    context "#last_error" do
      it "is nil" do
        expect( subject.last_error ).to be nil
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
