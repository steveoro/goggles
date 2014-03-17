require 'spec_helper'

describe PassageType do
  shared_examples "active_record_extension"
  shared_examples "shared_ic_i18n_examples"

  it_should_behave_like "ActiveRecord extension"
  it_should_behave_like "ICI18n"

end
