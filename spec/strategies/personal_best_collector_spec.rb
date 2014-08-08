require 'spec_helper'
require 'benchmark'


describe PersonalBestCollector do
  # Use pre-loaded seeds:
  let( :swimmer )  { Swimmer.find( 23 ) }
  let( :results )  { swimmer.meeting_individual_result }
  let( :events_by_pool_type ) { EventsByPoolType.find( 11 )}

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
        :get_collected_season_types,
        :full_scan
      ]
    )
    it_behaves_like( "(the existance of a method returning an Enumerable of non-empty Strings)",
      [
        :pool_type_codes_list,
      ]
    )
    it_behaves_like( "(the existance of a method with parameter returning an Enumerable of non-empty Strings)",
      :event_type_codes_list,
      '25'
    )
  end


  describe "#initialize" do
    it "allows a list of IndividualRecord rows as a parameter" do
      list = create_list(:individual_record, 3, swimmer_id: swimmer.id)
      result = PersonalBestCollector.new( swimmer, list: list )
      expect( result ).to be_an_instance_of( PersonalBestCollector )
      expect( result.count ).to eq( list.size )
      expect( result.count ).to eq(3)
    end
    it "allows a list of MeetingIndividualResult rows as a parameter" do
      list = create_list(:meeting_individual_result, 3, swimmer_id: swimmer.id)
      result = PersonalBestCollector.new( swimmer, list: list )
      expect( result ).to be_an_instance_of( PersonalBestCollector )
      expect( result.count ).to eq( list.size )
      expect( result.count ).to eq(3)
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
      subject.collect_from_all_category_results_having( events_by_pool_type )
      expect( subject.count ).to be > 0
    end
  end

  describe "#clear" do
    it "returns the cleared collection instance" do
      expect( subject.clear ).to be_an_instance_of( PersonalBestCollection )
    end
    it "clears the internal list" do
      subject.collect_from_all_category_results_having( events_by_pool_type )
      expect{ subject.clear }.to change{ subject.count }.to(0)
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#get_collected_season_types" do
    it "returns an instance of Hash" do
      expect( subject.get_collected_season_types ).to be_an_instance_of( Hash )
    end
    it "returns at least a number lesser or equal to the total collection count" do
      expect( subject.get_collected_season_types.count ).to be <= subject.count
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#get_collected_season_types" do
    xit "returns a collection of personal bests"
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
