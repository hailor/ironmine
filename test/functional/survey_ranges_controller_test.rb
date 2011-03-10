require 'test_helper'

class SurveyRangesControllerTest < ActionController::TestCase
  setup do
    @survey_range = survey_ranges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:survey_ranges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create survey_range" do
    assert_difference('SurveyRange.count') do
      post :create, :survey_range => @survey_range.attributes
    end

    assert_redirected_to survey_range_path(assigns(:survey_range))
  end

  test "should show survey_range" do
    get :show, :id => @survey_range.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @survey_range.to_param
    assert_response :success
  end

  test "should update survey_range" do
    put :update, :id => @survey_range.to_param, :survey_range => @survey_range.attributes
    assert_redirected_to survey_range_path(assigns(:survey_range))
  end

  test "should destroy survey_range" do
    assert_difference('SurveyRange.count', -1) do
      delete :destroy, :id => @survey_range.to_param
    end

    assert_redirected_to survey_ranges_path
  end
end
