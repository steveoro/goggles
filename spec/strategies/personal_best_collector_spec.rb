require 'spec_helper'
require 'benchmark'


describe PersonalBestCollector do
  # Use pre-loaded seeds:
  let( :swimmer )  { Swimmer.find( 23 ) }  # Assumes swimmer Leega from seeds
  let( :events_by_pool_type ) { EventsByPoolType.find( 11 )}  # Assumes 50FA, 25 mt from seeds
  let( :record_type )  { RecordType.find( 1 ) }  # Assumes Swimmer persoanl best from seeds

  # TODO refactor tests using a 4-element array of subjects, for each subject do the tests
  # TODO test context for prefiltering with a SeasonType
  # TODO test context for prefiltering with a Season

  # Using a given swimmer
  subject { PersonalBestCollector.new( swimmer ) }


  context "[implemented methods]" do
    it_behaves_like( "(the existance of a method)",
      [
        :season,
        :season_type,
        :collection,
        :count,
        :clear,
        :collect_from_all_category_results_having,
        :full_scan,
        :events_by_pool_type_list
      ]
    )
  end


  describe "#initialize" do
    it "doesn't allows initialization without swimmer" do
      expect{ PersonalBestCollector.new() }.to raise_error( ArgumentError )
    end
    it "allows a list of IndividualRecord rows as a parameter" do
      list = create_list(:individual_record, 5, swimmer_id: swimmer.id)
      result = PersonalBestCollector.new( swimmer, list: list )
      expect( result ).to be_an_instance_of( PersonalBestCollector )
      expect( result.count ).to eq( list.size )
      expect( result.count ).to eq(5)
    end
    it "allows a list of MeetingIndividualResult rows and a record type as parameters" do
      list = create_list(:meeting_individual_result, 5, swimmer_id: swimmer.id)
      result = PersonalBestCollector.new( swimmer, list: list, record_type: record_type )
      expect( result ).to be_an_instance_of( PersonalBestCollector )
      expect( result.count ).to be > 0
    end
    it "doesn't allows a list of MeetingIndividualResult rows as a parameter without record type" do
      list = create_list(:meeting_individual_result, 3, swimmer_id: swimmer.id)
      expect{ PersonalBestCollector.new( swimmer, list: list) }.to raise_error( ArgumentError )
    end
    it "allows a season instance as a parameter" do
      fix_par = create(:season)
      result = PersonalBestCollector.new( swimmer, season: fix_par )
      expect( result ).to be_an_instance_of( PersonalBestCollector )
      expect( result.season ).to eq( fix_par )
    end
    it "allows a season type instance as a parameter" do
      fix_par = create(:season_type)
      result = PersonalBestCollector.new( swimmer, season_type: fix_par )
      expect( result ).to be_an_instance_of( PersonalBestCollector )
      expect( result.season_type ).to eq( fix_par )
    end
    it "allows a start date instance as a parameter" do
      fix_par = Date.new
      result = PersonalBestCollector.new( swimmer, start_date: fix_par )
      expect( result ).to be_an_instance_of( PersonalBestCollector )
      expect( result.start_date ).to eq( fix_par )
    end    
    it "allows an end date instance as a parameter" do
      fix_par = Date.new
      result = PersonalBestCollector.new( swimmer, end_date: fix_par )
      expect( result ).to be_an_instance_of( PersonalBestCollector )
      expect( result.end_date ).to eq( fix_par )
    end    
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#collection" do
    it "returns the collection instance" do
      expect( subject.collection ).to be_an_instance_of( PersonalBestCollection )
    end
    # This is useful if the getter is implemented using #dup or #clone.
    # [Steve, 20140717] *** Currently: NOT ***
    it "returns a collection having the same number of elements of the internal collection" do
      expect( subject.collection.count ).to eq(subject.count)
    end
  end

  describe "#collect_from_all_category_results_having" do
    it "returns the size of the internal collection" do
      subject.collect_from_all_category_results_having( events_by_pool_type, record_type )
      expect( subject.count ).to be > 0
    end
  end

  describe "#clear" do
    it "returns the cleared collection instance" do
      expect( subject.clear ).to be_an_instance_of( PersonalBestCollection )
    end
    it "clears the internal list" do
      subject.collect_from_all_category_results_having( events_by_pool_type, record_type )
      expect{ subject.clear }.to change{ subject.count }.to(0)
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#events_by_pool_type_list" do
    xit "returns a collection of EventsByPoolType"
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#full_scan" do
    it "returns an instance of RecordCollection" do
      # Do nothing, just test the result
      expect( subject.full_scan() ).to be_an_instance_of( PersonalBestCollection )
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
