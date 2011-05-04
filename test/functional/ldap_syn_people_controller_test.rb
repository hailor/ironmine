require 'test_helper'

class LdapSynPeopleControllerTest < ActionController::TestCase
  setup do
    @ldap_syn_person = ldap_syn_people(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ldap_syn_people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ldap_syn_person" do
    assert_difference('LdapSynPerson.count') do
      post :create, :ldap_syn_person => @ldap_syn_person.attributes
    end

    assert_redirected_to ldap_syn_person_path(assigns(:ldap_syn_person))
  end

  test "should show ldap_syn_person" do
    get :show, :id => @ldap_syn_person.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ldap_syn_person.to_param
    assert_response :success
  end

  test "should update ldap_syn_person" do
    put :update, :id => @ldap_syn_person.to_param, :ldap_syn_person => @ldap_syn_person.attributes
    assert_redirected_to ldap_syn_person_path(assigns(:ldap_syn_person))
  end

  test "should destroy ldap_syn_person" do
    assert_difference('LdapSynPerson.count', -1) do
      delete :destroy, :id => @ldap_syn_person.to_param
    end

    assert_redirected_to ldap_syn_people_path
  end
end
