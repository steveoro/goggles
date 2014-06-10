require 'active_support'

=begin

= TrainingSharable

  - version:  4.00.297.20140531
  - author:   Steve A.

  Concern that adds special visibility scopes to any model concerning the sharing
  of trainings between Users.

  The includee model will +belong_to+ :user by including this concern.

=end
module TrainingSharable
  extend ActiveSupport::Concern

  included do
    belongs_to :user
  end

  module ClassMethods
    # This scope will select only the rows visible to a specified <tt>any_user</tt>.
    def visible_to_user( any_user )
      allowed_user_ids = any_user.friends_sharing_trainings.select{id} << any_user.id
      where{ user_id.in( allowed_user_ids ) }
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
