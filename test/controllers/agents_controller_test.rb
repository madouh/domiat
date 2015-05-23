require 'test_helper'

class AgentsControllerTest < ActionController::TestCase
  setup do
    @agent = agents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:agents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create agent" do
    assert_difference('Agent.count') do
      post :create, agent: { activity_id: @agent.activity_id, address: @agent.address, brief_of_activity: @agent.brief_of_activity, can_announce: @agent.can_announce, day_off: @agent.day_off, email: @agent.email, end: @agent.end, name: @agent.name, neighbour_id: @agent.neighbour_id, region_id: @agent.region_id, start: @agent.start, street: @agent.street, tel1: @agent.tel1, tel2: @agent.tel2, tel3: @agent.tel3, twenty_four: @agent.twenty_four, website1: @agent.website1, website2: @agent.website2, word1: @agent.word1, word2: @agent.word2, word3: @agent.word3, word4: @agent.word4, word5: @agent.word5 }
    end

    assert_redirected_to agent_path(assigns(:agent))
  end

  test "should show agent" do
    get :show, id: @agent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @agent
    assert_response :success
  end

  test "should update agent" do
    patch :update, id: @agent, agent: { activity_id: @agent.activity_id, address: @agent.address, brief_of_activity: @agent.brief_of_activity, can_announce: @agent.can_announce, day_off: @agent.day_off, email: @agent.email, end: @agent.end, name: @agent.name, neighbour_id: @agent.neighbour_id, region_id: @agent.region_id, start: @agent.start, street: @agent.street, tel1: @agent.tel1, tel2: @agent.tel2, tel3: @agent.tel3, twenty_four: @agent.twenty_four, website1: @agent.website1, website2: @agent.website2, word1: @agent.word1, word2: @agent.word2, word3: @agent.word3, word4: @agent.word4, word5: @agent.word5 }
    assert_redirected_to agent_path(assigns(:agent))
  end

  test "should destroy agent" do
    assert_difference('Agent.count', -1) do
      delete :destroy, id: @agent
    end

    assert_redirected_to agents_path
  end
end
