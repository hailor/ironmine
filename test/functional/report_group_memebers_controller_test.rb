require 'test_helper'

class ReportGroupMemebersControllerTest < ActionController::TestCase
  setup do
    @report_group_memeber = report_group_memebers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:report_group_memebers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create report_group_memeber" do
    assert_difference('ReportGroupMemeber.count') do
      post :create, :report_group_memeber => @report_group_memeber.attributes
    end

    assert_redirected_to report_group_memeber_path(assigns(:report_group_memeber))
  end

  test "should show report_group_memeber" do
    get :show, :id => @report_group_memeber.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @report_group_memeber.to_param
    assert_response :success
  end

  test "should update report_group_memeber" do
    put :update, :id => @report_group_memeber.to_param, :report_group_memeber => @report_group_memeber.attributes
    assert_redirected_to report_group_memeber_path(assigns(:report_group_memeber))
  end

  test "should destroy report_group_memeber" do
    assert_difference('ReportGroupMemeber.count', -1) do
      delete :destroy, :id => @report_group_memeber.to_param
    end

    assert_redirected_to report_group_memebers_path
  end
end
