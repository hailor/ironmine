require 'test_helper'

class WfApprovalProcessesControllerTest < ActionController::TestCase
  setup do
    @wf_approval_process = wf_approval_processes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wf_approval_processes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wf_approval_process" do
    assert_difference('WfApprovalProcess.count') do
      post :create, :wf_approval_process => @wf_approval_process.attributes
    end

    assert_redirected_to wf_approval_process_path(assigns(:wf_approval_process))
  end

  test "should show wf_approval_process" do
    get :show, :id => @wf_approval_process.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @wf_approval_process.to_param
    assert_response :success
  end

  test "should update wf_approval_process" do
    put :update, :id => @wf_approval_process.to_param, :wf_approval_process => @wf_approval_process.attributes
    assert_redirected_to wf_approval_process_path(assigns(:wf_approval_process))
  end

  test "should destroy wf_approval_process" do
    assert_difference('WfApprovalProcess.count', -1) do
      delete :destroy, :id => @wf_approval_process.to_param
    end

    assert_redirected_to wf_approval_processes_path
  end
end
