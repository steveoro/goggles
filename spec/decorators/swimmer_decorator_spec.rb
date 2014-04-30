require 'spec_helper'

describe SwimmersDecorator do
  before :each do
    @user = create( :user )
    @swimmer = create( :swimmer )
    @decorated_swimmer = SwimmersDecorator.decorate( @swimmer )
  end
end
