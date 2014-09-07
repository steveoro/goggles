require 'spec_helper'

describe SeasonType, :type => :model do
  # Assumes presence in seeds
  subject { SeasonType.find( ((rand * 100) % SeasonType.count).to_i + 1 ) }

  it_behaves_like "DropDownListable"
  
  # Filtering scopes:
  it_behaves_like( "(the existance of a class method)", [
    :is_master
  ])

  it_behaves_like( "(the existance of a method returning non-empty strings)", [ 
    :get_full_name
  ])    
end
