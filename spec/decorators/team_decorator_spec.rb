require 'spec_helper'


describe TeamDecorator do
  subject { create( :team ).decorate }

  it_behaves_like("(the existance of a method returning strings)", [
    :get_season_type_list,
    :get_contacts,
    :get_complete_address,
    :get_home_site,
    :get_first_meeting_name,
    :get_last_meeting_name
  ])
  #-- --------------------------------------------------------------------------
  #++
end
