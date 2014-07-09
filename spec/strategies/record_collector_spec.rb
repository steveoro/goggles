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
        :collect_for,
        :full_scan
      ]
    )
  end

  describe "#collect_for" do
    it "returns an instance of RecordCollection" do
      expect( subject.collect_for('25', '50FA', 'M35', 'M') ).to be_an_instance_of( RecordCollection )
    end
    it "returns collection of no more than 2 records" do
      result = subject.collect_for('50', '50FA', 'M40', 'M')
      expect( result.count < 3 ).to be_true
    end
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
