require 'spec_helper'


describe TeamDecorator, type: :model do
  include Rails.application.routes.url_helpers

  subject { create( :team ).decorate }

  it_behaves_like("(the existance of a method returning strings)", [
    :get_season_type_list,
    :get_contacts,
    :get_complete_address,
    :get_home_site,
    :get_first_meeting_name,
    :get_last_meeting_name,
    :get_current_goggle_cup_name_at
  ])
  #-- --------------------------------------------------------------------------
  #++

  describe "#get_linked_name" do
    it "responds to #get_linked_name method" do
      expect( subject ).to respond_to( :get_linked_name )
    end
    it "returns an HTML link" do
      expect( subject.get_linked_name ).to include( 'href' )
    end
    it "returns an HTML link to the swimmer radiography path" do
      expect( subject.get_linked_name ).to include( team_radio_path(id: subject.id) )
    end
    it "returns a string containing the team full name" do
      expect( subject.get_linked_name ).to include( ERB::Util.html_escape(subject.get_full_name) )
    end
  end
  #-- --------------------------------------------------------------------------
  #++
end
