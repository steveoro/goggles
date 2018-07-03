require 'rails_helper'


RSpec.describe SendDbDiffJob, type: :job do
  context "when there are serialized text changes," do
    let( :row_1_contents )  { "Whatever, row 1" }
    let( :row_2_contents )  { "Whatever, row 2" }

    before(:each) do
      row = AppParameter.find_or_create_by!( code: 100001 )
      expect( row ).to be_a( AppParameter )
      row.update( free_text_1: row_1_contents )

      row = AppParameter.find_or_create_by!( code: 100002 )
      expect( row ).to be_a( AppParameter )
      row.update( free_text_1: row_2_contents )

      row = AppParameter.find_or_create_by!( code: 100003 )
      expect( row ).to be_a( AppParameter )
      row.update( free_text_1: '' ) # (No serialized contents)
    end

    it "clears the pending DB-diff text from the dedicated rows in AppParameter" do
      rows = AppParameter.where('code > 100000')
      expect( rows.count ).to be >= 3
      expect( rows.first ).to be_a( AppParameter )
      expect( rows.first.free_text_1 ).to eq( row_1_contents )
      expect( rows.second ).to be_a( AppParameter )
      expect( rows.second.free_text_1 ).to eq( row_2_contents )
      expect( rows.third ).to be_a( AppParameter )
      expect( rows.third.free_text_1 ).to be_empty

      SendDbDiffJob.perform_now()

      rows.reload
      rows.each{|row| expect(row.free_text_1).to be_empty }
    end
  end
end
