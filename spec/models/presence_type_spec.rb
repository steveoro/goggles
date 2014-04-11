require 'spec_helper'

describe PresenceType do
  shared_examples "active_record_extension"
  shared_examples "shared_ic_i18n_examples"

  it_behaves_like "ActiveRecord extension"
  it_behaves_like "Interfaced Concern I18n"

end
