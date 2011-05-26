require 'test_helper'

class WfApprovalStepsControllerTest < ActionController::TestCase
  setup do
    @wf_approval_step = wf_approval_steps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wf_approval_steps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wf_approval_step" do
    assert_difference('WfApprovalStep.count') do
      post :create, :wf_approval_step => @wf_approval_step.attributes
    end

    assert_redirected_to wf_approval_step_path(assigns(:wf_approval_step))
  end

  test "should show wf_approval_step" do
    get :show, :id => @wf_approval_step.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @wf_approval_step.to_param
    assert_response :success
  end

  test "should update wf_approval_step" do
    put :update, :id => @wf_approval_step.to_param, :wf_approval_step => @wf_approval_step.attributes
    assert_redirected_to wf_approval_step_path(assigns(:wf_approval_step))
  end

  test "should destroy wf_approval_step" do
    assert_difference('WfApprovalStep.count', -1) do
      delete :destroy, :id => @wf_approval_step.to_param
    end

    assert_redirected_to wf_approval_steps_path
  end
end
