require 'test_helper'

class GlobalSettingsControllerTest < ActionController::TestCase
  setup do
    @global_setting = global_settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:global_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create global_setting" do
    assert_difference('GlobalSetting.count') do
      post :create, :global_setting => @global_setting.attributes
    end

    assert_redirected_to global_setting_path(assigns(:global_setting))
  end

  test "should show global_setting" do
    get :show, :id => @global_setting.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @global_setting.to_param
    assert_response :success
  end

  test "should update global_setting" do
    put :update, :id => @global_setting.to_param, :global_setting => @global_setting.attributes
    assert_redirected_to global_setting_path(assigns(:global_setting))
  end

  test "should destroy global_setting" do
    assert_difference('GlobalSetting.count', -1) do
      delete :destroy, :id => @global_setting.to_param
    end

    assert_redirected_to global_settings_path
  end
end
