require 'spec_helper'


describe RecordGridBuilder do
  let(:individual_record_list) { create_list(:individual_record, 5) }

  # Using a pre-filled collector will speed-up the tests:
  subject { RecordGridBuilder.new( RecordCollector.new(list: individual_record_list) ) }


  context "[implemented methods]" do
    it_behaves_like( "(the existance of a method)",
      [
        :collection,
        :count
      ]
    )
    it_behaves_like( "(the existance of a method returning a collection of some kind of instances)",
      [
        :pool_types,
        :event_types,
        :category_types,
        :gender_types
      ],
      ActiveRecord::Base
    )
  end


  describe "#initialize" do
    it "allows an instance of RecordCollector as a parameter" do
      expect( subject ).to be_an_instance_of( RecordGridBuilder )
      expect( result.count ).to eq(5)
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#collection" do
    it "returns the collection instance" do
      expect( subject.collection ).to be_an_instance_of( RecordCollection )
    end
    # This is useful if the getter is implemented using #dup or #clone.
    # [Steve, 20140717] *** Currently: NOT ***    
    it "returns a collection having the same number of elements of the internal collection" do
      expect( subject.collection.count ).to eq(subject.count)
    end    
  end

  describe "#count" do
    it "returns the size of the internal collection" do
      subject.clear
      expect( subject.count ).to eq(0)
    end    
    it "clears the internal list" do
      subject.collect_from_results_having('25', '50FA', 'M35', 'M')
      expect{ subject.count > 0 }.to be_true
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
