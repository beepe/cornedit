require 'test_helper'

class CornwallEventsControllerTest < ActionController::TestCase
  setup do
    @cornwall_event = cornwall_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cornwall_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cornwall_event" do
    assert_difference('CornwallEvent.count') do
      post :create, cornwall_event: @cornwall_event.attributes
    end

    assert_redirected_to cornwall_event_path(assigns(:cornwall_event))
  end

  test "should show cornwall_event" do
    get :show, id: @cornwall_event.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cornwall_event.to_param
    assert_response :success
  end

  test "should update cornwall_event" do
    put :update, id: @cornwall_event.to_param, cornwall_event: @cornwall_event.attributes
    assert_redirected_to cornwall_event_path(assigns(:cornwall_event))
  end

  test "should destroy cornwall_event" do
    assert_difference('CornwallEvent.count', -1) do
      delete :destroy, id: @cornwall_event.to_param
    end

    assert_redirected_to cornwall_events_path
  end
end
