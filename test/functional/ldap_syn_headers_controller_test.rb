require 'test_helper'

class LdapSynHeadersControllerTest < ActionController::TestCase
  setup do
    @ldap_syn_header = ldap_syn_headers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ldap_syn_headers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ldap_syn_header" do
    assert_difference('LdapSynHeader.count') do
      post :create, :ldap_syn_header => @ldap_syn_header.attributes
    end

    assert_redirected_to ldap_syn_header_path(assigns(:ldap_syn_header))
  end

  test "should show ldap_syn_header" do
    get :show, :id => @ldap_syn_header.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ldap_syn_header.to_param
    assert_response :success
  end

  test "should update ldap_syn_header" do
    put :update, :id => @ldap_syn_header.to_param, :ldap_syn_header => @ldap_syn_header.attributes
    assert_redirected_to ldap_syn_header_path(assigns(:ldap_syn_header))
  end

  test "should destroy ldap_syn_header" do
    assert_difference('LdapSynHeader.count', -1) do
      delete :destroy, :id => @ldap_syn_header.to_param
    end

    assert_redirected_to ldap_syn_headers_path
  end
end
