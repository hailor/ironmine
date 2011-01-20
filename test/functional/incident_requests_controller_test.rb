require 'test_helper'

class IncidentRequestsControllerTest < ActionController::TestCase
  setup do
    @incident_request = incident_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:incident_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create incident_request" do
    assert_difference('IncidentRequest.count') do
      post :create, :incident_request => @incident_request.attributes
    end

    assert_redirected_to incident_request_path(assigns(:incident_request))
  end

  test "should show incident_request" do
    get :show, :id => @incident_request.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @incident_request.to_param
    assert_response :success
  end

  test "should update incident_request" do
    put :update, :id => @incident_request.to_param, :incident_request => @incident_request.attributes
    assert_redirected_to incident_request_path(assigns(:incident_request))
  end

  test "should destroy incident_request" do
    assert_difference('IncidentRequest.count', -1) do
      delete :destroy, :id => @incident_request.to_param
    end

    assert_redirected_to incident_requests_path
  end
end
