require 'test_helper'

class MapsControllerTest < ActionController::TestCase
  test "should get showmap" do
    get :showmap
    assert_response :success
  end

  test "should get showroute" do
    get :showroute
    assert_response :success
  end

end
