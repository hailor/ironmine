require 'test_helper'

class LdapAuthHeadersControllerTest < ActionController::TestCase
  setup do
    @ldap_auth_header = ldap_auth_headers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ldap_auth_headers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ldap_auth_header" do
    assert_difference('LdapAuthHeader.count') do
      post :create, :ldap_auth_header => @ldap_auth_header.attributes
    end

    assert_redirected_to ldap_auth_header_path(assigns(:ldap_auth_header))
  end

  test "should show ldap_auth_header" do
    get :show, :id => @ldap_auth_header.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ldap_auth_header.to_param
    assert_response :success
  end

  test "should update ldap_auth_header" do
    put :update, :id => @ldap_auth_header.to_param, :ldap_auth_header => @ldap_auth_header.attributes
    assert_redirected_to ldap_auth_header_path(assigns(:ldap_auth_header))
  end

  test "should destroy ldap_auth_header" do
    assert_difference('LdapAuthHeader.count', -1) do
      delete :destroy, :id => @ldap_auth_header.to_param
    end

    assert_redirected_to ldap_auth_headers_path
  end
end
