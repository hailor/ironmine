require 'test_helper'

class SiteGroupsControllerTest < ActionController::TestCase
  setup do
    @site_group = site_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:site_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create site_group" do
    assert_difference('SiteGroup.count') do
      post :create, :site_group => @site_group.attributes
    end

    assert_redirected_to site_group_path(assigns(:site_group))
  end

  test "should show site_group" do
    get :show, :id => @site_group.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @site_group.to_param
    assert_response :success
  end

  test "should update site_group" do
    put :update, :id => @site_group.to_param, :site_group => @site_group.attributes
    assert_redirected_to site_group_path(assigns(:site_group))
  end

  test "should destroy site_group" do
    assert_difference('SiteGroup.count', -1) do
      delete :destroy, :id => @site_group.to_param
    end

    assert_redirected_to site_groups_path
  end
end
