require 'test_helper'

class LdapSourcesControllerTest < ActionController::TestCase
  setup do
    @ldap_source = ldap_sources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ldap_sources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ldap_source" do
    assert_difference('LdapSource.count') do
      post :create, :ldap_source => @ldap_source.attributes
    end

    assert_redirected_to ldap_source_path(assigns(:ldap_source))
  end

  test "should show ldap_source" do
    get :show, :id => @ldap_source.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ldap_source.to_param
    assert_response :success
  end

  test "should update ldap_source" do
    put :update, :id => @ldap_source.to_param, :ldap_source => @ldap_source.attributes
    assert_redirected_to ldap_source_path(assigns(:ldap_source))
  end

  test "should destroy ldap_source" do
    assert_difference('LdapSource.count', -1) do
      delete :destroy, :id => @ldap_source.to_param
    end

    assert_redirected_to ldap_sources_path
  end
end
