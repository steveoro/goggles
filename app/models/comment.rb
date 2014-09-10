=begin

= Comment model

  - version:  4.00.409
  - author:   Steve A.

=end
class Comment < ActiveRecord::Base
  belongs_to :user                                  # [Steve, 20120212] Do not validate associated user!
  belongs_to :swimming_pool_review
  belongs_to :comment

  validates_presence_of :entry_text


  delegate :name, to: :user, prefix: true

  scope :sort_by_user,  ->(dir) { order("users.name #{dir.to_s}, comments.created_at #{dir.to_s}") }
  #-- -------------------------------------------------------------------------
  #++
end
