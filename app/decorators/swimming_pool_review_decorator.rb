=begin

= SwimmingPoolReviewDecorator

  - version:  6.002
  - author:   Steve A.

  Decorator for the SwimmingPoolReview model.
  Contains all presentation-logic centered methods.

=end
class SwimmingPoolReviewDecorator < Draper::Decorator
  delegate_all
end
