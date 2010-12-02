require 'test_helper'

class LookupTypesControllerTest < ActionController::TestCase
  setup do
    @lookup_type = lookup_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lookup_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lookup_type" do
    assert_difference('LookupType.count') do
      post :create, :lookup_type => @lookup_type.attributes
    end

    assert_redirected_to lookup_type_path(assigns(:lookup_type))
  end

  test "should show lookup_type" do
    get :show, :id => @lookup_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @lookup_type.to_param
    assert_response :success
  end

  test "should update lookup_type" do
    put :update, :id => @lookup_type.to_param, :lookup_type => @lookup_type.attributes
    assert_redirected_to lookup_type_path(assigns(:lookup_type))
  end

  test "should destroy lookup_type" do
    assert_difference('LookupType.count', -1) do
      delete :destroy, :id => @lookup_type.to_param
    end

    assert_redirected_to lookup_types_path
  end
end
