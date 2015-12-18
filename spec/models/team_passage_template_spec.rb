require 'spec_helper'

describe TeamPassageTemplate, type: :model do

  context "[a well formed instance]" do
    subject { create(:team_passage_template) }

    it "is a valid istance" do
      expect( subject ).to be_valid
    end

    it_behaves_like( "(belongs_to required models)", [
      :team,
      :event_type,
      :pool_type,
      :passage_type
    ])

    it_behaves_like( "(the existance of a class method)", [
      :get_default_passage_types_for
    ])
    #-- -----------------------------------------------------------------------
    #++
  end
end
