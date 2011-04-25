require 'test_helper'

class WfSettingsControllerTest < ActionController::TestCase
  setup do
    @wf_setting = wf_settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wf_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wf_setting" do
    assert_difference('WfSetting.count') do
      post :create, :wf_setting => @wf_setting.attributes
    end

    assert_redirected_to wf_setting_path(assigns(:wf_setting))
  end

  test "should show wf_setting" do
    get :show, :id => @wf_setting.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @wf_setting.to_param
    assert_response :success
  end

  test "should update wf_setting" do
    put :update, :id => @wf_setting.to_param, :wf_setting => @wf_setting.attributes
    assert_redirected_to wf_setting_path(assigns(:wf_setting))
  end

  test "should destroy wf_setting" do
    assert_difference('WfSetting.count', -1) do
      delete :destroy, :id => @wf_setting.to_param
    end

    assert_redirected_to wf_settings_path
  end
end
