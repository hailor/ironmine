require 'test_helper'

class SurveySubjectsControllerTest < ActionController::TestCase
  setup do
    @survey_subject = survey_subjects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:survey_subjects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create survey_subject" do
    assert_difference('SurveySubject.count') do
      post :create, :survey_subject => @survey_subject.attributes
    end

    assert_redirected_to survey_subject_path(assigns(:survey_subject))
  end

  test "should show survey_subject" do
    get :show, :id => @survey_subject.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @survey_subject.to_param
    assert_response :success
  end

  test "should update survey_subject" do
    put :update, :id => @survey_subject.to_param, :survey_subject => @survey_subject.attributes
    assert_redirected_to survey_subject_path(assigns(:survey_subject))
  end

  test "should destroy survey_subject" do
    assert_difference('SurveySubject.count', -1) do
      delete :destroy, :id => @survey_subject.to_param
    end

    assert_redirected_to survey_subjects_path
  end
end
