require 'spec_helper'


shared_examples_for "(existance of meeting stats relation of swimmers)" do |method_name_array|
  method_name_array.each do |method_name|
    it "responds to ##{method_name}" do
      expect( subject ).to respond_to( method_name )
    end

    it "#{method_name} returns a list of swimmer instances" do
      subject.send(method_name.to_sym).each do |item|
        expect(item).to be_an_instance_of( Swimmer )
      end
    end
  end
end

shared_examples_for "(existance of meeting stats relation of meeting individual results)" do |method_name_array|
  method_name_array.each do |method_name|
    it "responds to ##{method_name}" do
      expect( subject ).to respond_to( method_name )
    end

    it "#{method_name} returns a list of swimmer instances" do
      subject.send(method_name.to_sym).each do |item|
        expect(item).to be_an_instance_of( MeetingIndividualResult )
      end
    end
  end
end
# =============================================================================


describe MeetingStat, :type => :model do
  subject {
    # Pre-loaded seeded last two years CSI season
    seeded_meets = [12101, 12102, 12103, 12104, 12105, 13101, 13102, 13103, 13104, 13105, 13106]
    MeetingStat.new( Meeting.find(seeded_meets.at( ((rand * 100) % seeded_meets.size).to_i) ))
  }

  describe "[a well formed instance]" do
    it_behaves_like( "(the existance of a method returning numeric values)", [
      # Fields
      :swimmer_male_count,
      :result_male_count,
      :disqualified_male_count,
      :swimmer_female_count,
      :result_female_count,
      :disqualified_female_count,

      # Methods
      :swimmer_count,
      :result_count,
      :disqualified_count
    ])

    it_behaves_like( "(existance of meeting stats relation of swimmers)", [
      # Methods
      :oldest_male_swimmers,
      :oldest_female_swimmers
   ])

    it_behaves_like( "(existance of meeting stats relation of meeting individual results)", [
      # Methods
      :best_standard_male_scores,
      :worst_standard_male_scores,
      :best_standard_female_scores,
      :worst_standard_female_scores
   ])

    it "has a valid meeting instance" do
      expect(subject.get_meeting).to be_an_instance_of( Meeting )
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#swimmer_count" do
    it "returns sum of male and female swimmers count" do
      expect(subject.swimmer_count).to eq(subject.swimmer_male_count + subject.swimmer_female_count)
    end
  end

  describe "#result_count" do
    it "returns sum of male and female results count" do
      expect(subject.result_count).to eq(subject.result_male_count + subject.result_female_count)
    end
  end

  describe "#disqualified_count" do
    it "returns sum of male and female results count" do
      expect(subject.disqualified_count).to eq(subject.disqualified_male_count + subject.disqualified_female_count)
    end
  end

  describe "#oldest_male_athlets" do
    it "returns only male swimmers" do
      subject.oldest_male_swimmers.each do |item|
        expect(item.is_male).to be true
      end
    end
    it "returns a list sorted by swimmer year_of_birth" do
      current_item_year = subject.oldest_male_swimmers.first.year_of_birth
      subject.oldest_male_swimmers.each do |item|
        expect(item.year_of_birth).to be >= current_item_year
        current_item_year = item.year_of_birth
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#oldest_female_athlets" do
    it "returns only female swimmers" do
      subject.oldest_female_swimmers.each do |item|
        expect(item.is_female).to be true
      end
    end
    it "returns a list sorted by swimmer year_of_birth" do
      current_item_year = subject.oldest_female_swimmers.first.year_of_birth
      subject.oldest_female_swimmers.each do |item|
        expect(item.year_of_birth).to be >= current_item_year
        current_item_year = item.year_of_birth
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#best_standard_male_scores" do
    it "returns only not disqualified results" do
      subject.best_standard_male_scores.each do |item|
        expect(item.is_disqualified).to be false
      end
    end
    it "returns a list sorted by standard points descending" do
      current_item_score = subject.best_standard_male_scores.first.standard_points
      subject.best_standard_male_scores.each do |item|
        expect(item.standard_points).to be <= current_item_score
        current_item_score = item.standard_points
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#best_standard_female_scores" do
    it "returns only not disqualified results" do
      subject.best_standard_female_scores.each do |item|
        expect(item.is_disqualified).to be false
      end
    end
    it "returns a list sorted by standard points descending" do
      current_item_score = subject.best_standard_female_scores.first.standard_points
      subject.best_standard_female_scores.each do |item|
        expect(item.standard_points).to be <= current_item_score
        current_item_score = item.standard_points
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#worst_standard_male_scores" do
    it "returns only not disqualified results" do
      subject.worst_standard_male_scores.each do |item|
        expect(item.is_disqualified).to be false
      end
    end
    it "returns a list sorted by standard points" do
      current_item_score = subject.worst_standard_male_scores.first.standard_points
      subject.worst_standard_male_scores.each do |item|
        expect(item.standard_points).to be >= current_item_score
        current_item_score = item.standard_points
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#worst_standard_female_scores" do
    it "returns only not disqualified results" do
      subject.worst_standard_female_scores.each do |item|
        expect(item.is_disqualified).to be false
      end
    end
    it "returns a list sorted by standard points" do
      current_item_score = subject.worst_standard_female_scores.first.standard_points
      subject.worst_standard_female_scores.each do |item|
        expect(item.standard_points).to be >= current_item_score
        current_item_score = item.standard_points
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
