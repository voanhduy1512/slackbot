require 'test_helper'

class CallbackControllerTest < ActionController::TestCase
  test "should get gitlab" do
    get :gitlab
    assert_response :success
  end

end
