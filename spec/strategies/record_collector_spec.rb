require 'spec_helper'
require 'benchmark'


describe RecordCollector, type: :strategy do
  # Use pre-loaded seeds:
  let( :results )  { MeetingIndividualResult.where( swimmer_id: 23 ) }
  let( :fixture )  { results.at( ((rand * 1000) % results.size).to_i ) }
  let( :fixture2 ) { results.at( ((rand * 1000) % results.size).to_i ) }
  let( :fixture3 ) { results.at( ((rand * 1000) % results.size).to_i ) }

  # TODO refactor tests using a 4-element array of subjects, for each subject do the tests

  subject { RecordCollector.new() }
  # TODO Extract all tests on subject as shared examples & test subject with different context pre-filtering as below:
  # TODO test context for prefiltering with a Team => subject { RecordCollector.new(team: Team.find_by_id(1)) }
  # TODO test context for prefiltering with a SeasonType
  # TODO test context for prefiltering with a Swimmer
  # TODO test context for prefiltering with a Meeting
  # TODO test context for prefiltering with a Season


  context "[implemented methods]" do
    it_behaves_like( "(the existance of a method)",
      [
        :swimmer,
        :team,
        :season,
        :season_type,
        :meeting,
        :collection,
        :count,
        :clear,
        :collect_from_results_having,
        :collect_from_all_category_results_having,
        :collect_from_records_having,
        :get_collected_season_types,
        :save,
        :commit,
        :full_scan
      ]
    )
    it_behaves_like( "(the existance of a method returning an Enumerable of non-empty Strings)",
      [
        :record_type_code_list,
        :pool_type_code_list,
        :event_type_codes_list,
        :category_type_codes_list,
        :gender_type_codes_list
      ]
    )
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#initialize" do
    it "allows a list of IndividualRecord rows as a parameter" do
      # The created list must be of unique, distict rows or the add
      # process of the constructor may overwrite items falling into
      # the same category, type & age groups.
      #
      # For this reason, here we cannot use a simple "create_list(:individual_record, 5)".
      list = IndividualRecordFactoryTools.create_personal_best_list( create(:swimmer) )
      # default record_type_code: 'SPB' => "Swimmer Personal-best"-type of record, ID ~> 1
      result = RecordCollector.new( list: list )
      expect( result ).to be_an_instance_of( RecordCollector )
      expect( result.count ).to eq( list.size )
    end
    it "allows a list of MeetingIndividualResult rows as a parameter" do
      # Same previous example above, if we want to test the exact lenght
      # of the internal result list, we cannot rely on a simple "create_list".
      list = MeetingIndividualResultFactoryTools.create_unique_result_list( create(:swimmer) )
      # record_type_code: 'FOR' => Federation-type record, ID ~> 7
      result = RecordCollector.new( list: list, record_type_code: 'FOR' )
      expect( result ).to be_an_instance_of( RecordCollector )
      expect( result.count ).to eq( list.size )
    end
    it "allows a season instance as a parameter" do
      fix_par = create(:season)
      result = RecordCollector.new( season: fix_par )
      expect( result ).to be_an_instance_of( RecordCollector )
      expect( result.season ).to eq( fix_par )
    end
    it "allows a meeting instance as a parameter" do
      fix_par = create(:meeting)
      result = RecordCollector.new( meeting: fix_par )
      expect( result ).to be_an_instance_of( RecordCollector )
      expect( result.meeting ).to eq( fix_par )
    end
    it "allows a team instance as a parameter" do
      fix_par = create(:team)
      result = RecordCollector.new( team: fix_par )
      expect( result ).to be_an_instance_of( RecordCollector )
      expect( result.team ).to eq( fix_par )
    end
    it "allows a swimmer instance as a parameter" do
      fix_par = create(:swimmer)
      result = RecordCollector.new( swimmer: fix_par )
      expect( result ).to be_an_instance_of( RecordCollector )
      expect( result.swimmer ).to eq( fix_par )
    end
    it "allows a season type instance as a parameter" do
      fix_par = create(:season_type)
      result = RecordCollector.new( season_type: fix_par )
      expect( result ).to be_an_instance_of( RecordCollector )
      expect( result.season_type ).to eq( fix_par )
    end
    it "allows a start date instance as a parameter" do
      fix_par = Date.new
      result = RecordCollector.new( start_date: fix_par )
      expect( result ).to be_an_instance_of( RecordCollector )
      expect( result.start_date ).to eq( fix_par )
    end
    it "allows an end date instance as a parameter" do
      fix_par = Date.new
      result = RecordCollector.new( end_date: fix_par )
      expect( result ).to be_an_instance_of( RecordCollector )
      expect( result.end_date ).to eq( fix_par )
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
      subject.collect_from_results_having('25', '100DO', 'M35', 'M', 'FOR')
      expect( subject.count ).to be > 0
    end
  end

  describe "#clear" do
    it "returns the cleared collection instance" do
      expect( subject.clear ).to be_an_instance_of( RecordCollection )
    end
    it "clears the internal list" do
      subject.collect_from_results_having('25', '100DO', 'M35', 'M', 'FOR')
      expect{ subject.clear }.to change{ subject.count }.to(0)
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#collect_from_results_having" do
    it "returns an instance of RecordCollection" do
      expect( subject.collect_from_results_having('25', '100DO', 'M35', 'M', 'FOR') ).to be_an_instance_of( RecordCollection )
    end
    it "returns collection of no more than 2 records" do
      result = subject.collect_from_results_having('50', '100DO', 'M40', 'M', 'FOR')
      expect( result.count ).to be < 3
    end
  end

  describe "#collect_from_records_having" do
    it "returns an instance of RecordCollection" do
      expect( subject.collect_from_records_having('25', '100DO', 'M35', 'M', 'FOR') ).to be_an_instance_of( RecordCollection )
    end
    it "returns collection of no more than 2 records" do
      result = subject.collect_from_records_having('50', '100DO', 'M40', 'M', 'FOR')
      expect( result.count ).to be < 3
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


  describe "#save" do
    before(:each) do
      subject.collect_from_records_having('25', '100DO', 'M35', 'M', 'FOR')
      expect( subject.count ).to be > 0
    end

    it "returns true on no-errors found" do
      expect( subject.save ).to be true
    end
    it "does not clear the internal list" do
      expect{ subject.save }.not_to change{ subject.count }
    end
    it "doesn't increase the table size when persisting existing records" do
      expect( subject.save ).to be true  # make the record persist, without clearing the list
      expect{ subject.save }.not_to change{ IndividualRecord.count }
    end
  end


  describe "#commit" do
    before(:each) do
      subject.collect_from_records_having('25', '100DO', 'M35', 'M', 'FOR')
      expect( subject.count ).to be > 0
    end

    it "returns true on no-errors found" do
      expect( subject.commit ).to be true
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
      expect( subject.commit ).to be true
      # Search again, with same params, but from results, to update existing records:
      subject.collect_from_results_having('25', '100DO', 'M35', 'M', 'FOR')
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
#            this.collect_from_records_having( pool_code, event_code, category_code, gender_code, 'FOR' )
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
