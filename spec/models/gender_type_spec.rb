require 'spec_helper'

describe GenderType, :type => :model do
  it_behaves_like "DropDownListable"
  it_behaves_like "Localizable"
end
