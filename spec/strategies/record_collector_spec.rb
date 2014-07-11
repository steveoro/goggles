require 'spec_helper'
require 'benchmark'


describe RecordCollector do
  # Use pre-loaded seeds:
  let( :results )  { MeetingIndividualResult.where( swimmer_id: 142 ) }
  let( :fixture )  { results.at( ((rand * 1000) % results.size).to_i ) }
  let( :fixture2 ) { results.at( ((rand * 1000) % results.size).to_i ) }
  let( :fixture3 ) { results.at( ((rand * 1000) % results.size).to_i ) }

  subject { RecordCollector.new() }


  context "[implemented methods]" do
    it_behaves_like( "(the existance of a method)",
      [
        :clear,
        :collect_from_results_having,
        :save,
        :commit,

# FIXME This must be refactored:
        :full_scan
      ]
    )
#    it_behaves_like( "(the existance of a method returning an Enumerable of non-empty Strings)",
#      [
#        :pool_type_codes,
#        :event_type_codes,
#        :category_type_codes,
#        :gender_type_codes
#      ]
#    )
  end

  describe "#collect_from_results_having" do
    it "returns an instance of RecordCollection" do
      expect( subject.collect_from_results_having('25', '50FA', 'M35', 'M') ).to be_an_instance_of( RecordCollection )
    end
    it "returns collection of no more than 2 records" do
      result = subject.collect_from_results_having('50', '50FA', 'M40', 'M')
      expect( result.count < 3 ).to be_true
    end
  end


  describe "#clear" do
    it "clears the internal list"
  end


  describe "#save" do
    it "stores the internal list to the database"
  end


  describe "#commit" do
    it "stores the internal list to the database"
    it "returns true on no-errors found"
    it "clears the internal list"
  end


  # XXX [Steve, 20140709] ~175" is too much! Disabled because this method is stupid & slow
  # describe "#full_scan" do
    # it "returns an instance of RecordCollection" do
      # expect( subject.full_scan() ).to be_an_instance_of( RecordCollection )
    # end
    # it "benchmarks the scan duration" do
      # puts "\r\n\t*** Benchmark for #full_scan() ***"
      # Benchmark.bmbm do |x|
        # x.report("#full_scan()") { subject.full_scan() }
      # end
      # puts ''
    # end
  # end
  #-- -------------------------------------------------------------------------
  #++
end
