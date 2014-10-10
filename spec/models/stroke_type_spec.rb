require 'spec_helper'

describe StrokeType, :type => :model do

  # Filtering scopes:
  it_behaves_like( "(the existance of a class method)", [
    :is_eventable,
    :parse_stroke_type_from_import_text
  ])

  it_behaves_like( "(the existance of a method returning non-empty strings)", [
    :i18n_short, :i18n_description
  ])
end
