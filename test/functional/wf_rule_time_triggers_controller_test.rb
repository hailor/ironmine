require 'test_helper'

class WfRuleTimeTriggersControllerTest < ActionController::TestCase
  setup do
    @wf_rule_time_trigger = wf_rule_time_triggers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wf_rule_time_triggers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wf_rule_time_trigger" do
    assert_difference('WfRuleTimeTrigger.count') do
      post :create, :wf_rule_time_trigger => @wf_rule_time_trigger.attributes
    end

    assert_redirected_to wf_rule_time_trigger_path(assigns(:wf_rule_time_trigger))
  end

  test "should show wf_rule_time_trigger" do
    get :show, :id => @wf_rule_time_trigger.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @wf_rule_time_trigger.to_param
    assert_response :success
  end

  test "should update wf_rule_time_trigger" do
    put :update, :id => @wf_rule_time_trigger.to_param, :wf_rule_time_trigger => @wf_rule_time_trigger.attributes
    assert_redirected_to wf_rule_time_trigger_path(assigns(:wf_rule_time_trigger))
  end

  test "should destroy wf_rule_time_trigger" do
    assert_difference('WfRuleTimeTrigger.count', -1) do
      delete :destroy, :id => @wf_rule_time_trigger.to_param
    end

    assert_redirected_to wf_rule_time_triggers_path
  end
end
