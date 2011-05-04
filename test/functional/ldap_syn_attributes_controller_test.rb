require 'test_helper'

class LdapSynAttributesControllerTest < ActionController::TestCase
  setup do
    @ldap_syn_attribute = ldap_syn_attributes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ldap_syn_attributes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ldap_syn_attribute" do
    assert_difference('LdapSynAttribute.count') do
      post :create, :ldap_syn_attribute => @ldap_syn_attribute.attributes
    end

    assert_redirected_to ldap_syn_attribute_path(assigns(:ldap_syn_attribute))
  end

  test "should show ldap_syn_attribute" do
    get :show, :id => @ldap_syn_attribute.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ldap_syn_attribute.to_param
    assert_response :success
  end

  test "should update ldap_syn_attribute" do
    put :update, :id => @ldap_syn_attribute.to_param, :ldap_syn_attribute => @ldap_syn_attribute.attributes
    assert_redirected_to ldap_syn_attribute_path(assigns(:ldap_syn_attribute))
  end

  test "should destroy ldap_syn_attribute" do
    assert_difference('LdapSynAttribute.count', -1) do
      delete :destroy, :id => @ldap_syn_attribute.to_param
    end

    assert_redirected_to ldap_syn_attributes_path
  end
end
