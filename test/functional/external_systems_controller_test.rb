require 'test_helper'

class ExternalSystemsControllerTest < ActionController::TestCase
  setup do
    @external_system = external_systems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:external_systems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create external_system" do
    assert_difference('ExternalSystem.count') do
      post :create, :external_system => @external_system.attributes
    end

    assert_redirected_to external_system_path(assigns(:external_system))
  end

  test "should show external_system" do
    get :show, :id => @external_system.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @external_system.to_param
    assert_response :success
  end

  test "should update external_system" do
    put :update, :id => @external_system.to_param, :external_system => @external_system.attributes
    assert_redirected_to external_system_path(assigns(:external_system))
  end

  test "should destroy external_system" do
    assert_difference('ExternalSystem.count', -1) do
      delete :destroy, :id => @external_system.to_param
    end

    assert_redirected_to external_systems_path
  end
end
