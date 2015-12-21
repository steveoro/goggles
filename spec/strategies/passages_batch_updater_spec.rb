# encoding: utf-8
require 'spec_helper'
require 'passages_batch_updater'


describe PassagesBatchUpdater, type: :strategy do
  # [Steve] We don't need to save the random user instance created, since we
  # won't use any of its associations, nor its ID, so "build" is enough.
  subject { PassagesBatchUpdater.new( FactoryGirl.build(:user) ) }

  it_behaves_like( "(the existance of a method)", [
    :edited_passages, :new_passages, :destroyed_passages,
    :total_errors,
    :sql_diff_text_log,
    :edit_existing_passage,
    :create_new_passage
  ] )
  #-- -------------------------------------------------------------------------
  #++

  let(:minutes)   { (rand * 59).to_i }
  let(:seconds)   { (rand * 59).to_i }
  let(:hundreds)  { (rand * 59).to_i }
  let(:fixture_value) { "#{ minutes }\'#{ seconds }\"#{ hundreds }" }
  let(:passage) { FactoryGirl.create( :meeting_individual_result_with_passages ).passages.first }
  #-- -------------------------------------------------------------------------
  #++

  describe "#edit_existing_passage" do
    context "when editing an existing row with valid parameters," do
      it "updates the row successfully" do
        expect(
          subject.edit_existing_passage( passage.id, fixture_value )
        ).to be true
      end
      it "changes the resulting SQL diff log" do
        expect{
          subject.edit_existing_passage( passage.id, fixture_value )
        }.to change{ subject.sql_diff_text_log }
      end
      it "increases the number of edited rows" do
        expect{
          subject.edit_existing_passage( passage.id, fixture_value )
        }.to change{ subject.edited_passages }.by(1)
      end
    end

    context "when editing an existing row with valid parameters but an empty value," do
      it "deletes the row successfully, returning the deleted instance" do
        expect(
          subject.edit_existing_passage( passage.id, '' )
        ).to be_a( Passage )
      end
      it "changes the resulting SQL diff log" do
        expect{
          subject.edit_existing_passage( passage.id, '' )
        }.to change{ subject.sql_diff_text_log }
      end
      it "increases the number of deleted rows" do
        expect{
          subject.edit_existing_passage( passage.id, '' )
        }.to change{ subject.destroyed_passages }.by(1)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#create_new_passage" do
    context "when creating a new row with valid parameters," do
      it "creates the row" do
        expect(
          subject.create_new_passage( passage.meeting_individual_result_id, passage.passage_type_id, fixture_value )
        ).to be true
      end
      it "changes the resulting SQL diff log" do
        expect{
          subject.create_new_passage( passage.meeting_individual_result_id, passage.passage_type_id, fixture_value )
        }.to change{ subject.sql_diff_text_log }
      end
      it "increases the number of created rows" do
        expect{
          subject.create_new_passage( passage.meeting_individual_result_id, passage.passage_type_id, fixture_value )
        }.to change{ subject.new_passages }.by(1)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
