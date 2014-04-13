require 'spec_helper'

describe PassageType do
  shared_examples "shared_drop_down_listable_examples"
  shared_examples "shared_localizable_examples"

  it_behaves_like "DropDownListable concern"
  it_behaves_like "Localizable"
end
