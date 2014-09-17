=begin

= UserAchievement model

  - version:  4.00.501
  - author:   Leega, Steve A.

  Mapper for achievements reached by users.
  This class must be kept free from descriprions and locales.

=end
class UserAchievement < ActiveRecord::Base
  belongs_to :user
  belongs_to :achievement

  delegate :name, to: :user, prefix: true
  #-- -------------------------------------------------------------------------
  #++

  # Commodity alias to retrieve the read-only value of the triggering
  # date for this user achievement.
  def date_triggered
    self.created_at
  end
  #-- -------------------------------------------------------------------------
  #++
end
