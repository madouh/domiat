require 'test_helper'

class DomiatControllerTest < ActionController::TestCase
  test "should get welcome" do
    get :welcome
    assert_response :success
  end

  test "should get end" do
    get :end
    assert_response :success
  end

end
