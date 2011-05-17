require 'test_helper'

class WfMailAlertsControllerTest < ActionController::TestCase
  setup do
    @wf_mail_alert = wf_mail_alerts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wf_mail_alerts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wf_mail_alert" do
    assert_difference('WfMailAlert.count') do
      post :create, :wf_mail_alert => @wf_mail_alert.attributes
    end

    assert_redirected_to wf_mail_alert_path(assigns(:wf_mail_alert))
  end

  test "should show wf_mail_alert" do
    get :show, :id => @wf_mail_alert.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @wf_mail_alert.to_param
    assert_response :success
  end

  test "should update wf_mail_alert" do
    put :update, :id => @wf_mail_alert.to_param, :wf_mail_alert => @wf_mail_alert.attributes
    assert_redirected_to wf_mail_alert_path(assigns(:wf_mail_alert))
  end

  test "should destroy wf_mail_alert" do
    assert_difference('WfMailAlert.count', -1) do
      delete :destroy, :id => @wf_mail_alert.to_param
    end

    assert_redirected_to wf_mail_alerts_path
  end
end
