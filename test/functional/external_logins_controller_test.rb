require 'test_helper'

class ExternalLoginsControllerTest < ActionController::TestCase
  setup do
    @external_login = external_logins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:external_logins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create external_login" do
    assert_difference('ExternalLogin.count') do
      post :create, :external_login => @external_login.attributes
    end

    assert_redirected_to external_login_path(assigns(:external_login))
  end

  test "should show external_login" do
    get :show, :id => @external_login.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @external_login.to_param
    assert_response :success
  end

  test "should update external_login" do
    put :update, :id => @external_login.to_param, :external_login => @external_login.attributes
    assert_redirected_to external_login_path(assigns(:external_login))
  end

  test "should destroy external_login" do
    assert_difference('ExternalLogin.count', -1) do
      delete :destroy, :id => @external_login.to_param
    end

    assert_redirected_to external_logins_path
  end
end
