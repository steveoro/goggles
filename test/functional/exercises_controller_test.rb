require 'test_helper'

class ExercisesControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should redirect for get json_list" do
    get :json_list
    assert_redirected_to( {controller: :exercises, action: :index} )
  end
end
