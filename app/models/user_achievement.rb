class UserAchievement < ActiveRecord::Base
  belongs_to :user
  belongs_to :achievement


  delegate :name, to: :user, prefix: true
  #-- -------------------------------------------------------------------------
  #++

  # Leega
  # Entity with achievements reached by users.
  # No descriprion. No locales. No specific methods
end
