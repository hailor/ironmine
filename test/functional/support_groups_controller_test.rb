require 'test_helper'

class SupportGroupsControllerTest < ActionController::TestCase
  setup do
    @support_group = support_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:support_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create support_group" do
    assert_difference('SupportGroup.count') do
      post :create, :support_group => @support_group.attributes
    end

    assert_redirected_to support_group_path(assigns(:support_group))
  end

  test "should show support_group" do
    get :show, :id => @support_group.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @support_group.to_param
    assert_response :success
  end

  test "should update support_group" do
    put :update, :id => @support_group.to_param, :support_group => @support_group.attributes
    assert_redirected_to support_group_path(assigns(:support_group))
  end

  test "should destroy support_group" do
    assert_difference('SupportGroup.count', -1) do
      delete :destroy, :id => @support_group.to_param
    end

    assert_redirected_to support_groups_path
  end
end
