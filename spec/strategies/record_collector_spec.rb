require 'spec_helper'


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
        :collect_for
      ]
    )
  end

  describe "#collect_for" do
    xit "returns an instance of RecordCollection" do
      expect( subject.collect_for('25', '50FA', 'M35', 'M') ).to be_an_instance_of( RecordCollection )
    end

    # TODO other test
  end
  #-- -------------------------------------------------------------------------
  #++
end
