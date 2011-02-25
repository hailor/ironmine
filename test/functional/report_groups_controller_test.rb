require 'test_helper'

class ReportGroupsControllerTest < ActionController::TestCase
  setup do
    @report_group = report_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:report_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create report_group" do
    assert_difference('ReportGroup.count') do
      post :create, :report_group => @report_group.attributes
    end

    assert_redirected_to report_group_path(assigns(:report_group))
  end

  test "should show report_group" do
    get :show, :id => @report_group.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @report_group.to_param
    assert_response :success
  end

  test "should update report_group" do
    put :update, :id => @report_group.to_param, :report_group => @report_group.attributes
    assert_redirected_to report_group_path(assigns(:report_group))
  end

  test "should destroy report_group" do
    assert_difference('ReportGroup.count', -1) do
      delete :destroy, :id => @report_group.to_param
    end

    assert_redirected_to report_groups_path
  end
end
