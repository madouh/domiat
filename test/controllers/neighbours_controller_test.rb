require 'test_helper'

class NeighboursControllerTest < ActionController::TestCase
  setup do
    @neighbour = neighbours(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:neighbours)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create neighbour" do
    assert_difference('Neighbour.count') do
      post :create, neighbour: { name: @neighbour.name }
    end

    assert_redirected_to neighbour_path(assigns(:neighbour))
  end

  test "should show neighbour" do
    get :show, id: @neighbour
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @neighbour
    assert_response :success
  end

  test "should update neighbour" do
    patch :update, id: @neighbour, neighbour: { name: @neighbour.name }
    assert_redirected_to neighbour_path(assigns(:neighbour))
  end

  test "should destroy neighbour" do
    assert_difference('Neighbour.count', -1) do
      delete :destroy, id: @neighbour
    end

    assert_redirected_to neighbours_path
  end
end
