require 'test_helper'

class LdapAuthAttributesControllerTest < ActionController::TestCase
  setup do
    @ldap_auth_attribute = ldap_auth_attributes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ldap_auth_attributes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ldap_auth_attribute" do
    assert_difference('LdapAuthAttribute.count') do
      post :create, :ldap_auth_attribute => @ldap_auth_attribute.attributes
    end

    assert_redirected_to ldap_auth_attribute_path(assigns(:ldap_auth_attribute))
  end

  test "should show ldap_auth_attribute" do
    get :show, :id => @ldap_auth_attribute.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ldap_auth_attribute.to_param
    assert_response :success
  end

  test "should update ldap_auth_attribute" do
    put :update, :id => @ldap_auth_attribute.to_param, :ldap_auth_attribute => @ldap_auth_attribute.attributes
    assert_redirected_to ldap_auth_attribute_path(assigns(:ldap_auth_attribute))
  end

  test "should destroy ldap_auth_attribute" do
    assert_difference('LdapAuthAttribute.count', -1) do
      delete :destroy, :id => @ldap_auth_attribute.to_param
    end

    assert_redirected_to ldap_auth_attributes_path
  end
end
