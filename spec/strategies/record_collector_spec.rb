require 'spec_helper'
require 'benchmark'


describe RecordCollector do
  # Use pre-loaded seeds:
  let( :results )  { MeetingIndividualResult.where( swimmer_id: 142 ) }
  let( :fixture )  { results.at( ((rand * 1000) % results.size).to_i ) }
  let( :fixture2 ) { results.at( ((rand * 1000) % results.size).to_i ) }
  let( :fixture3 ) { results.at( ((rand * 1000) % results.size).to_i ) }

  # Using a pre-filtered collector on a Team will speed-up the tests:
  subject { RecordCollector.new( team: Team.find_by_id(1) ) }


  context "[implemented methods]" do
    it_behaves_like( "(the existance of a method)",
      [
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
  #-- -------------------------------------------------------------------------
  #++


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
    before(:each) { subject.collect_from_results_having('25', '50FA', 'M35', 'M') }

    it "stores the internal list to the database" do
      expect{ subject.save }.to change{ IndividualRecord.count }.to( subject.count )
    end
    it "does not clear the internal list" do
      expect{ subject.save }.not_to change{ subject.count }
    end
  end


  describe "#commit" do
    before(:each) { subject.collect_from_results_having('25', '50FA', 'M35', 'M') }

    it "stores the internal list to the database" do
      before_count = subject.count
      expect{ subject.commit }.to change{ IndividualRecord.count }.to( before_count )
    end
    it "returns true on no-errors found" do
      expect{ subject.commit }.to be_true
    end
    it "clears the internal list" do
      expect{ subject.commit }.to change{ subject.count }.to(0)
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
