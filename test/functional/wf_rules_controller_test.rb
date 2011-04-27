require 'test_helper'

class WfRulesControllerTest < ActionController::TestCase
  setup do
    @wf_rule = wf_rules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wf_rules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wf_rule" do
    assert_difference('WfRule.count') do
      post :create, :wf_rule => @wf_rule.attributes
    end

    assert_redirected_to wf_rule_path(assigns(:wf_rule))
  end

  test "should show wf_rule" do
    get :show, :id => @wf_rule.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @wf_rule.to_param
    assert_response :success
  end

  test "should update wf_rule" do
    put :update, :id => @wf_rule.to_param, :wf_rule => @wf_rule.attributes
    assert_redirected_to wf_rule_path(assigns(:wf_rule))
  end

  test "should destroy wf_rule" do
    assert_difference('WfRule.count', -1) do
      delete :destroy, :id => @wf_rule.to_param
    end

    assert_redirected_to wf_rules_path
  end
end
