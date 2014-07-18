require 'spec_helper'
require 'benchmark'


describe RecordCollector do
  # Use pre-loaded seeds:
  let( :results )  { MeetingIndividualResult.where( swimmer_id: 142 ) }
  let( :fixture )  { results.at( ((rand * 1000) % results.size).to_i ) }
  let( :fixture2 ) { results.at( ((rand * 1000) % results.size).to_i ) }
  let( :fixture3 ) { results.at( ((rand * 1000) % results.size).to_i ) }

  # TODO refactor tests using a 4-element array of subjects, for each subject do the tests
  # TODO test context for prefiltering with a SeasonType
  # TODO test context for prefiltering with a Swimmer
  # TODO test context for prefiltering with a Meeting

  # Using a pre-filtered collector on a Team will speed-up the tests:
  subject { RecordCollector.new( team: Team.find_by_id(1) ) }


  context "[implemented methods]" do
    it_behaves_like( "(the existance of a method)",
      [
        :swimmer,
        :team,
        :season_type,
        :meeting,
        :collection,
        :count,
        :clear,
        :collect_from_results_having,
        :collect_from_records_having,
        :save,
        :commit,
        :full_scan
      ]
    )
    it_behaves_like( "(the existance of a method returning an Enumerable of non-empty Strings)",
      [
        :pool_type_code_list,
        :event_type_codes_list,
        :category_type_codes_list,
        :gender_type_codes_list
      ]
    )
  end


  describe "#initialize" do
    it "allows a list of IndividualRecord rows as a parameter" do
      result = RecordCollector.new( list: create_list(:individual_record, 5) )
      expect( result ).to be_an_instance_of( RecordCollector )
      expect( result.count ).to eq(5)
    end
    it "allows a list of MeetingIndividualResult rows as a parameter" do
      result = RecordCollector.new( list: create_list(:meeting_individual_result, 5) )
      expect( result ).to be_an_instance_of( RecordCollector )
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

  describe "#clear" do
    it "returns the cleared collection instance" do
      expect( subject.clear ).to be_an_instance_of( RecordCollection )
    end    
    it "clears the internal list" do
      subject.collect_from_results_having('25', '50FA', 'M35', 'M')
      expect{ subject.clear }.to change{ subject.count }.to(0)
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#collect_from_results_having" do
    it "returns an instance of RecordCollection" do
      expect( subject.collect_from_results_having('25', '50FA', 'M35', 'M') ).to be_an_instance_of( RecordCollection )
    end
    it "returns collection of no more than 2 records" do
      result = subject.collect_from_results_having('50', '50FA', 'M40', 'M')
      expect( result.count < 3 ).to be_true
    end
  end

  describe "#collect_from_records_having" do
    it "returns an instance of RecordCollection" do
      expect( subject.collect_from_records_having('25', '50FA', 'M35', 'M') ).to be_an_instance_of( RecordCollection )
    end
    it "returns collection of no more than 2 records" do
      result = subject.collect_from_records_having('50', '50FA', 'M40', 'M')
      expect( result.count < 3 ).to be_true
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#save" do
    before(:each) { subject.collect_from_records_having('25', '50FA', 'M35', 'M') }

    it "returns true on no-errors found" do
      expect( subject.save ).to be_true
    end
    it "does not clear the internal list" do
      expect{ subject.save }.not_to change{ subject.count }
    end
    it "doesn't increase the table size when persisting existing records" do
      expect( subject.save ).to be_true  # make the record persist, without clearing the list
      expect{ subject.save }.not_to change{ IndividualRecord.count }
    end
  end


  describe "#commit" do
    before(:each) { subject.collect_from_records_having('25', '50FA', 'M35', 'M') }

    it "returns true on no-errors found" do
      expect( subject.commit ).to be_true
    end
    it "clears the internal list" do
      expect{ subject.commit }.to change{ subject.count }.to(0)
    end
    it "doesn't increase the table size when persisting existing records" do
      before_count = subject.count
      subject.save  # make sure the record persist, without clearing the list
      expect{ subject.commit }.not_to change{ IndividualRecord.count }
    end
    it "doesn't increase the table size when updating existing records" do
      before_count = subject.count
      expect( subject.commit ).to be_true
      # Search again, with same params, but from results, to update existing records:
      subject.collect_from_results_having('25', '50FA', 'M35', 'M')
      expect{ subject.commit }.not_to change{ IndividualRecord.count }
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#full_scan" do
    it "returns an instance of RecordCollection" do
      # Do nothing, just test the result
      expect( subject.full_scan() ).to be_an_instance_of( RecordCollection )
    end

    # Disabled to speed-up the testing process:
#    it "benchmarks the scan duration" do
#      puts "\r\n\t*** Benchmark for #full_scan() ***"
#      Benchmark.bmbm do |x|
#        x.report("records")  {
#          subject.full_scan() do |this, pool_code, event_code, category_code, gender_code|
#            this.collect_from_records_having( pool_code, event_code, category_code, gender_code )
#          end
#        }
#        # Worthless comparison:
#        x.report("no block") { subject.full_scan() }
#      end
#      puts ''
#    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
