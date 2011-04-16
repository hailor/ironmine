require 'test_helper'

class ListOfValuesControllerTest < ActionController::TestCase
  setup do
    @list_of_value = list_of_values(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:list_of_values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create list_of_value" do
    assert_difference('ListOfValue.count') do
      post :create, :list_of_value => @list_of_value.attributes
    end

    assert_redirected_to list_of_value_path(assigns(:list_of_value))
  end

  test "should show list_of_value" do
    get :show, :id => @list_of_value.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @list_of_value.to_param
    assert_response :success
  end

  test "should update list_of_value" do
    put :update, :id => @list_of_value.to_param, :list_of_value => @list_of_value.attributes
    assert_redirected_to list_of_value_path(assigns(:list_of_value))
  end

  test "should destroy list_of_value" do
    assert_difference('ListOfValue.count', -1) do
      delete :destroy, :id => @list_of_value.to_param
    end

    assert_redirected_to list_of_values_path
  end
end
