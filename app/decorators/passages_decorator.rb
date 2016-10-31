=begin

= PassagesDecorator

  - version:  6.002
  - author:   Steve A.

  Decorator for the Passage model.
  Contains all presentation-logic centered methods.

=end
class PassagesDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
